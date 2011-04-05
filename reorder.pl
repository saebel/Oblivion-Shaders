#!/bin/perl

my @prolog = ();
my @shader = ();
my @consts = ();
my @instrc = ();
my @oustrc = ();
my @epilog = ();
my $lnp = 0;
my $lnb = 0;
my $lne = 0;
my $body = 0;
my $step = 0;
my $type = 0;
my $parm = 0;
my $hasPI = 0;
my $hasSIN = 0;
my $convPI = 0;		# [0,1] -> [-PI,+PI]
my $convWV = 0;		# [0,1] -> [-1,+1]
my $convRN = 0;		# [-1,+1] -> [0,1]
my $debug_usage = 0;
my $debug_subst = 0;
my $debug_sorts = 0;

# first pass (reordering) --------------------------------------------------------
foreach $line (<STDIN>) {
	# do line-by-line processing.

	# if the script believed we start entering the code-block, this is -1
	# there asn't been found anything against this assumption, so we mark as
	# being inside the code-block, this is 1
	if ($body < 0) {
		$body = 1;
	}

#    PS_OUTPUT OUT;	-> enter
#    const ...		-> shift enter
#    return OUT;	-> leave

	# switch
	# this file came from a vertex shader binary
	if ($line =~ /.vso.dis/) {
		$type = 0;
	}
	# this file came from a pixel shader binary
	if ($line =~ /.pso.dis/) {
		$type = 1;
	}

	if ($line =~ /PI/) {
		$hasPI = 1;
	}
	if ($line =~ /SINCOSCONST/) {
		$hasSIN = 1;
	}

	# new HLSL -------------------------------------------------------------
	if ($line =~ /[VP]S_OUTPUT OUT/) {
		$body = -1;
	}
	if ($line =~ /return OUT/) {
		$body = 2;
	}

	# old PseudoC ----------------------------------------------------------
	# const lines don't move, they are always at the top
	# we put them in the const-array, not in the body
	if ($line =~ /const /) {
		$body = -1;

		if (1) {
			push(@consts, $line);
			next;
		}
	}
	# variable declarations don't move, they are always part of the input structure
	# we put them in the io-array, not in the body
	if ($line =~ /^ +(float|int)[1234]? /) {
		$body = -1;

		# input structure variable
		if ($line =~ /IN..*:/) {
			$line =~ s/IN.//s;
			push(@instrc, $line);
			next;
		}
		# output structure variable
		if ($line =~ /OUT..*:/) {
			$line =~ s/OUT.//s;
			push(@oustrc, $line);
			next;
		}

		# anonymous IN variable (old shader-models)
		if ($line =~ /:[ A-Z0-9]+/) {
			$line =~ s/IN.//s;
			push(@instrc, $line);
			next;
		}
	}

	# try to detect the code-block ----------------------------------------------------------
	# all lines inside the code-block/body can be rearranged/reordered
	# if the script believes we start entering the code-block, this is -1
	if ($body <= 0) {
		# comment-line, they are always outside the code-block
		if ($line =~ /^\/\/ */) {
			$body = 0;

			# Registers-line, isolate them to print them without comments
			if ($line =~ /Registers:/) {
				$parm = 0;
			}

			if ($parm && (($line =~ /;/) || ($line =~ /^\/\/$/))) {
				$line =~ s/^\/\/ *//s;
			}

			# Parameters-line, isolate them to print them as they were
			if ($line =~ /Parameters:/) {
				$parm = 1;
			}
		}
	}
	# we're inside the code-block and detected the terminating comment
	if ($body == 1) {
		if ($line =~ /^\/\/ */) {
			$body = 2;
		}
	}

	# prolog line
	if ($body <= 0) {
		$prolog[$lnp++] = $line;
	}

	# code-block line
	if ($body == 1) {
		# line with only spaces ...
		if ($line =~ /^ *$/) {
			next;
		}
		# redundant declaration, is already in the Registers:-block
		if ($line =~ /sampler/) {
			next;
		}

		# ps1.0 artifact
		$line =~ s/^  \+ /    /;

		# loop through all lines preceding the current one and
		# look if we can move the line somewhere more up
		if ($lnb > 0) {
			$l = $lnb;
			$p = $lnb;
			while (--$p >= 0) {
				# get the assignments of both lines, current and previous
				$prev = $shader[$p];
				$prev =~ m/([a-zINOUT0-9_.]+) = /;
				$pras = $1;
				$phit = $1;
				$line =~ m/([a-zINOUT0-9_.]+) = /;
				$lias = $1;
				$lhit = $1;

				# we can not trace dependencies across if/else-bocks
				if (($prev =~ /endif/) ||
				    ($prev =~ /else/) ||
				    ($prev =~ /if_/)) {
					last;
				}

				if (($line =~ /endif/) ||
				    ($line =~ /else/) ||
				    ($line =~ /if_/)) {
					last;
				}

				# extend the variable-check to include all masked accesses
				if ($pras =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					# r0.x -> r0|r0.xyzw|r0.yzx|...
					$pras = "$1.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
					$pran = "$1([^.])";
				}
				else {
					# r0 -> r0|r0.xyzw
					$pras = "$pras.([a-z]*)([^a-zINOUT0-9_.]*)";
					$pran = "$pras([^.])";
				}

				if ($lias =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					# r0.x -> r0|r0.xyzw|r0.yzx|...
					$lias = "($1).([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
					$lian = "$1([^.])";
				}
				else {
					# r0 -> r0|r0.xyzw
					$lias = "$lias.([a-z]*)([^a-zINOUT0-9_.]*)";
					$lian = "$pras([^.])";
				}

			#	print "------------------------------------------------------------\n";
			#	print "check:\n";
			#	print $prev;
			#	print "    ";
			#	print $pras;
			#	print "\n";
			#	print $line;
			#	print "    ";
			#	print $lias;
			#	print "\n";
# [^a-zINOUT0-9_]
# [^a-zINOUT0-9_]

				# writes to the output-structure can always move around
				if (!($pras =~ /^ *OUT/)) {
					# check for reassignment or dependency (barrier)
					if (($line =~ /(.*)$pras(.*) = /) || ($line =~ /(.*)$pran(.*) = /) ||
					    ($line =~ / = (.*)$pras(.*)/) || ($line =~ / = (.*)$pran(.*)/)) {
					    	last;
					}
				}

				# writes to the output-structure can always move around
				if (!($lias =~ /^ *OUT/)) {
					# check for reassignment or dependency (barrier)
					if (($prev =~ /(.*)$lias(.*) = /) || ($prev =~ /(.*)$lian(.*) = /) ||
					    ($prev =~ / = (.*)$lias(.*)/) || ($prev =~ / = (.*)$lian(.*)/)) {
					    	last;
					}
				}

			#	print "movable:\n";
			#	print $prev;
			#	print $line;

				$l = $p;
			#	print "$lnb to $l\n";
			}

			# insert the reordered line at the new top-most position
			# instead the end
			if ($l != $lnb) {
			#	print "$lnb to $l\n";

				$ll = $lnb;
				while ($ll > $l) {
					$shader[$ll] = $shader[$ll - 1];
					$ll--;
				}
				$shader[$l] = $line; $lnb++;

			#	print "############################################################\n";
			#	print @shader;
			#	print "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
			#	print $line;
			#	print "############################################################\n";

				$step++;
				if ($step >= 15) {
				#	exit;
				}
			}
			else {
				$shader[$lnb++] = $line;
			}
		}
		else {
			$shader[$lnb++] = $line;
		}
	}

	# epilog line
	if ($body == 2) {
		$epilog[$lne++] = $line;
	}
}

# print @shader;

# second pass (scalar extraction) --------------------------------------------------------
for ($pass = 0; $pass < 32; $pass++) {
	$proc = 0;

# start of double-pass ------------------------------------------
$snb = scalar(@shader);
# @shader = ();
$lnb = 0;
$scl = 0;

for ($lnb = 0; $lnb < $snb; $lnb++) {
	$line = $shader[$lnb];

	if ($debug_subst) {
		print "- pass $pass ----------------------------------------------------------------\n";
		if (1) {
			print @shader;
		}
		print "\n";
	}

	#    r2.x = 1.0 / AlphaParam.y;
	#    r1.xy = r1.xy * r2.xy;
	#    r1.xy = max(r1.xy, 0);
	#    r1.xy = min(r1.xy, 1);
	#    r1.w = 1 - r1.y;
	#    OUT.texcoord_5.w = r1.x * r1.w;

	# TODO
	#    r2.x = 1.0 / AlphaParam.y;
	#    r2.y = 1.0 / AlphaParam.w;
	# =
	#    r2.xy = 1.0 / AlphaParam.yw;

	# partial write
	$w = 0;
	@lw = ();
	@pw = ();

	$up = 0;
	$uu = 0;
	$fp = 0;
	$fu = 0;
	$i = 0;
	$e = 0;
	$b = 0;
	$u = 0;
	$s = $snb;
	$p = $lnb;
	while ($p++ < $s) {
		$prev = $shader[$p];
		$prev =~ m/([a-zINOUT0-9_.]+) = /;
		$pras = $1;
		$phit = $1;
		$line =~ m/([a-zINOUT0-9_.]+) = /;
		$lias = $1;
		$lhit = $1;

		if ($debug_usage && ($p == ($lnb + 1))) {
			print "  match " . ($p - 1) . " ($e): ";
			print $line;
		}
		if ($debug_usage) {
			print "  against $p ($e): ";
			print $prev;
		}

		if ($prev eq "") {
			next;
		}

		# offset can't be substituted
		if ($line =~ /offset.* = /) {
			last;
		}

		if (($prev =~ /if_/)) {
			if ($e == -1) {
				if ($debug_usage) {
					print "  bail out for leaving+entering conditional $p ($e $b)\n";
				}

				$u = 0;
				last;
			}
		}

		if (($prev =~ /else/)) {
			if ($e == 0) {
				if ($debug_usage) {
					print "  bail out for leaving conditional $p ($e $b)\n";
				}

				$u = 0;
				last;
			}

			$i = $b;
		}

		if (($prev =~ /endif/)) {
			if ($e == 0) {
				$e = -1;
			}

			$i = $b;
		}

		# we can look for substituable fragments over conditions
		# if it occurs once, it occurs once :)
		if (($prev =~ /if_/)) { $e = 1; }
		if (($prev =~ /else/)) { $e = 2; }
		if (($prev =~ /endif/)) { if ($e >= 0) { $e = 0; }}

		if (($prev =~ /endif/) ||
		    ($prev =~ /else/) ||
		    ($prev =~ /if_/)) {
			if ($prev =~ m/$lias/) {
				if ($debug_usage) {
					print "  bail out for entering conditional $p ($e $b)\n";
				}

				$u = 0;
				last;
			}

		    	# reset bailout indicator
		   	$b = 0;
			next;
		}

		if (($line =~ /endif/) ||
		    ($line =~ /else/) ||
		    ($line =~ /if_/)) {
		    	# reset bailout indicator
		   	$b = 0;
			next;
		}

		if ($b) {
			next;
		}

		# extend the variable-check to include all masked accesses
		# r0.x -> r0|r0.xyzw|r0.yzx|...
		if ($pras =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
			if (1) {
				@pw = split(//, $2);
			}

			# r0.x -> r0|r0.xyzw|r0.yzx|...
			$prax = "$1.$2";
			$pras = "$1.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$pra1 = "($1).([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$pra2 = "($1).([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$pran = "$1([^.])";
		}
		else {
			# r0 -> r0|r0.xyzw
			$prax = "$pras";
			$pras = "$pras.([a-z]*)([^a-zINOUT0-9_.]*)";
			$pra1 = "$pras.([a-z]*)([^a-zINOUT0-9_.]*)";
			$pra2 = "$pras.([a-z]*)([^a-zINOUT0-9_.]*)";
			$pran = "$pras([^.])";
		}

		if ($lias =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
			# read/write-mask
			if (!$w) {
				@lw = split(//, $2);
			}

			$liax = "$1.$2";
			$liau = "$1.$2([^a-zINOUT0-9_.]*)";
			$lias = "($1).([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$lia1 = "($1).([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$lia2 = "($1).([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$lian = "$1([^.])";
		}
		else {
			$liax = "$lias";
			$liau = "$lias([^a-zINOUT0-9_.]*)";
			$lias = "$lias.([a-z]*)([^a-zINOUT0-9_.]*)";
			$lia1 = "$lias.([a-z]*)([^a-zINOUT0-9_.]*)";
			$lia2 = "$lias.([a-z]*)([^a-zINOUT0-9_.]*)";
			$lian = "$lias([^.])";

#			print "fault: ";
#			print $lias;
#			print "\n";

			$u = 0;
			last;
		}

		# is part of sub-mask, can't be scalar
		if ($prev =~ / = .*$lia1.*/) {
			if ("$1.$2" ne "$liax") {
				if ($debug_usage) {
					print "  bail out for partial mask $p ($e $b)\n";
				}

				$u = 0;
				last;
			}
		}

		elsif ($prev =~ / = .*$lia2.*/) {
			if ("$1.$2" ne "$liax") {
				if ($debug_usage) {
					print "  bail out for partial mask $p ($e $b)\n";
				}

				$u = 0;
				last;
			}
		}

		# is read exactly as written
		if ($prev =~ / = (.*)$liau(.*)/) {
			# count also number of multiple occurances (on the right-hand side!)
			$prev =~ m/ = (.*);/; $test = $1; $verf = $1;

			$us = ($test =~ s/$liau/x/g);
			if ($us == 2) {
				# case " = r1.w * r1.w;"
				# case " = r1.w + r1.w;"
				if (($verf eq $lhit . " * " . $lhit) ||
				    ($verf eq $lhit . " + " . $lhit)) {
				    	# TODO: may be a very complex term inside $lhit, then it becomes verrrry long
				#	$us = 1;
				}
			}

			$u = $u + $us;

			$up = $p;
			$uu = $u;

			# count just 1e per line
		#	$u++;
		}

		# is part of sub-mask, can't be scalar
		if ($prev =~ /.*$lia1.* = /) {
			if ("$1.$2" ne "$liax") {
				$sr = scalar(@lw);
				@br = split(//, $2);
				while (--$sr >= 0) {
					foreach (@br) {
						if ($lw[$sr] eq $_) {
							delete $lw[$sr];
						}
					}
				}

				if ($debug_usage) {
					print "  bail out for partial write $p $2 (@lw pending) ($e $b)\n";
				}

				$w = 1;
			}
		}

		elsif ($prev =~ /.*$lia2.* = /) {
			if ("$1.$2" ne "$liax") {
				$sr = scalar(@lw);
				@br = split(//, $2);
				while (--$sr >= 0) {
					foreach (@br) {
						if ($lw[$sr] eq $_) {
							delete $lw[$sr];
						}
					}
				}

				if ($debug_usage) {
					print "  bail out for partial write $p $2 (@lw unmodified) ($e $b)\n";
				}

				$w = 1;
			}
		}

		# all/part of it is overwritten
		if ((!$w || (scalar(@lw) == 0)) && ($prev =~ /(.*)$lias(.*) = /)) {
			if ($debug_usage) {
				print "  bail out for reassignment $p ($e $b $i)\n";
			}

			if ($e == 1) {
				$b = 1;
				next;
			}
			elsif (($e == 2) && ($i == 1)) {
				# if invalidates, else as well, we can stop here
				last;
			}
			elsif (($e == 2) && ($i == 0)) {
				# if doesn't invalidate, else does, unknown situation
				$b = 1;
				next;
			}
			else {
				last;
			}
		}

		# the next line makes an assignment to a variable used by the current line
		# this case is irrelevant for the usage-counter, in fact aborting here
		# will throw away the consecusive uses!
		if ($line =~ / = (.*)$pras(.*)/) {
			# partial writes happened, this is not the original value anymore!
			if ($w && (scalar(@lw) != 0)) {
				if ($debug_usage) {
					print "  bail out for write invalidation $p ($e $b)\n";
				}

				$u = 0;
				last;
			}

			if ($debug_usage) {
				print "  note barrier for read invalidation $p ($e $b)\n";
			}

			if (!$fp) {
				$fp = $p;
				$fu = $u;
			}
		}
	}

	if ($up) {
		$p = $up;
	#	$u = $uu;

		if ($debug_usage) {
			print "  last used at $p\n";
		}
	}

	if ($fp) {
		$p = $fp;
	#	$u = $fu;

		# we got a reorder-barrier, if there are no additional utilization after it
		# we can substitute (uses-before barrier == overall-uses)
		# otherwise not
		if ($fu != $uu) {
			if ($debug_usage) {
				print "  barrier passed $fu uses in $fp != $uu uses in $up\n";
			}

			next;
		}
	}

# print "check: ";
# print $lhit;
# print " - ";
# print $u;
# print " - ";
# print $p - $lnb;
# print "\n";

	$dos = 0;
	if ($u == 1) {
		$dos = 1;
	}
	if ($u >= 2) {
		$dos = 1;
	}

	if ($dos) {
		$s = $p;
		$p = $lnb;

		$prev = $shader[$p];
		$sbst = $prev;
		$lhit =~ m/([a-zINOUT0-9_]+).([a-zINOUT0-9_]+)/;
		$reg = $1;
		$msk = $2;

		if ($prev eq "") {
			next;
		}

		# we can look for substituable fragments over conditions
		# if it occurs once, it occurs once :)
		if (($prev =~ /endif/) ||
		    ($prev =~ /else/) ||
		    ($prev =~ /if_/)) {
			last;
		}

		if (($line =~ /endif/) ||
		    ($line =~ /else/) ||
		    ($line =~ /if_/)) {
			last;
		}

	#	$prev =~ s/$reg.$msk = /s$reg.$msk = /;
	#	$sbst =~ s/.*$reg.$msk = ([a-z]+)\((.*)\);.*$/$1($2)/s;
	#	$sbst =~ s/.*$reg.$msk = \((.*)\);.*$/($1)/s;
		$sbst =~ s/.*$reg.$msk = (.*);.*$/$1/s;
		$sbst =~ s/^\(([^()]*)\)$/$1/s;
		$cmnt =~ s/.*;(.*)/$1/;

		if ($u > 1) {
		#	if ($sbst =~ /[^a-zINOUT0-9_]*r[0-9]+[^a-zINOUT0-9_]*/) {
		#		$dos = 0;
		#	}

			# don't substitute twice if it's not a constant number
			# it doesn't really look better code-wise (PI is okay)
			if ($sbst =~ /[a-zA-HJ-OQ-Z]*/) {
				if ($debug_subst) {
					print "$reg.$msk";
					print " * $u";
				}

				# the form r0.w = 1.0 / r3.w;
				$test = $sbst;
				$us = ($test =~ s/([INOUT.]*[][a-z0-9_-]+).([xyzwrgba]+)/x/g);

				if ($us > 2) {
					if ($debug_subst) {
						print " == non-constant [$us regs]";
						print "\n";
					}

					$dos = 0;
				}
				elsif ($us > 1) {
					# the form r1.xy = r2.xy * r2.xy;
					# the form r0.xy = r1.xy + r1.xy;
					if (($line =~ / = ([INOUT.]*[][a-z0-9_-]+).([xyzwrgba]+) [\*\+] \1;/) &&
					    ($sbst =~ /([INOUT.]*[][a-z0-9_-]+).([xyzwrgba]+) [\*\+] \1/)) {
						if ($debug_subst) {
							print " == non-constant [$us same reg]";
							print "\n";
						}
					}
					else {
						if ($debug_subst) {
							print " == non-constant [$us regs]";
							print "\n";
						}

						$dos = 0;
					}
				}
				elsif ($us == 1) {
					if ($u <= 2) {
						if ($debug_subst) {
							print " == modified by constant [$us regs]";
							print "\n";
						}
					}
					else {
						if ($debug_subst) {
							print " == modified by constant [$us regs]";
							print "\n";
						}

						$dos = 0;
					}
				}
				else {
					if ($debug_subst) {
						print " == constant";
						print "\n";
					}
				}
			}
		}
		elsif ($u > 0) {
			$lone = $shader[$p + 1];

			# don't substitute tri-graphs
			if ($line =~ /(.*) = \1 .*\?.*\:.*/) {
				$dos = 0;	}
			if ($lone =~ /(.*) = \1 .*\?.*\:.*/) {
				$dos = 0;	}
		}

		# don't double functions
		if ($line =~ /saturate\(saturate/) {
			$dos = 0;	}

		# don't substitute monsters
		if (length $sbst > 80) {
			$dos = 0;	}

		if ($dos) {
			# ------------------------------------------------------
			if ($debug_subst) {
				print "$reg.$msk";
				print " * $u";
				print " == $sbst [$p to $s]";
				print "\n";
			}

			# tell the system we still have found something
			$proc++;
			$pi = $p;
			$pt = 0;

			while ($p++ < $s) {
				$prev = $shader[$p];
				$lhit =~ m/([a-zINOUT0-9_]+).([a-zINOUT0-9_]+)/;
				$reg = $1;
				$msk = $2;

				if ($prev eq "") {
					next;
				}

				# ----------------------------------------------
			   	$tt = 0;
			   	if ($prev =~ / = (.*)$reg.$msk(.*)/) {
			   		$tt = 1;
			   		$pt++;

					if ($debug_subst) {
			   			print "$reg.$msk";
			   			print " == $prev";
			   		}

					$prev =~ m/(.*) = (.*);(.*)/s;
					$preva = $1;
					$prevb = $2;
					$prevc = $3;

					# may contain multiple forms multiple times
					do {
						$pin = $prevb;

						# case "...(r0.w)..."
						if ($sbst =~ /^([a-z]+)\((.*)\)$/) {
							$prevb =~ s/$reg.$msk([^a-zINOUT0-9_]+)/$sbst$1/g;
							$prevb =~ s/$reg.$msk$/$sbst/g;
						}
						# case "... = 1.0;"
						elsif ($sbst =~ /^[e0-9.\-]+$/) {
							$prevb =~ s/$reg.$msk([^a-zINOUT0-9_]+)/$sbst$1/g;
							$prevb =~ s/$reg.$msk$/$sbst/g;
						}
						# case "... = r0.w;"
						elsif ($sbst =~ /^[^ ,()]+$/) {
							$prevb =~ s/$reg.$msk([^a-zINOUT0-9_]+)/$sbst$1/g;
							$prevb =~ s/$reg.$msk$/$sbst/g;
						}
						# case "... = r0.w;"
						elsif ($prevb =~ /^$reg.$msk$/) {
							$prevb = $sbst;
						}
						# case "offset.w = ...(r0.w)"
						elsif ($prevb =~ /\($reg.$msk\)/) {
							$prevb =~ s/\($reg.$msk\)/($sbst)/g;
						}
						# case "offset.w = ...(r0.w, ...)"
						elsif ($prevb =~ /\($reg.$msk,/) {
							$prevb =~ s/\($reg.$msk,/($sbst,/g;
						}
						# case "offset.w = ...(..., r0.w)"
						elsif ($prevb =~ /, $reg.$msk\)/) {
							$prevb =~ s/, $reg.$msk\)/, $sbst)/g;
						}
			#			# case "offset.w = (... ? ... : r0.w)"
			#			elsif ($prevb =~ /: $reg.$msk\)/g) {
			#				$prevb =~ s/: $reg.$msk\)/: $sbst)/g;
			#			}
			#			# case "offset.w = (... ? r0.w : ...)"
			#			elsif ($prevb =~ /\? $reg.$msk :/g) {
			#				$prevb =~ s/\? $reg.$msk :/? $sbst :/g;
			#			}
						else {
							$prevb =~ s/$reg.$msk([^a-zINOUT0-9_]+)/($sbst)$1/g;
							$prevb =~ s/$reg.$msk$/($sbst)/g;
	#						$prevb =~ s/$reg.$msk/ = $1s$reg.$msk/;
						}

					} while($pin != $prevb);

					$prev = $preva . " = " . $prevb . ";" . $prevc;
					# reunite the fragments
			   	}

				# static patterns --------------------------------------------------
				$pmatch = "(\((?:[^\(\)]++|(?1))*\))";
				$fmatch = "([a-z]*\((?:[^\(\)]++|(?1))*\))";
				$amatch = "([a-z]*\((?:[^\(\)]++|(?1))*\)|[^()]*)";

				# simplifications --------------------------------------------------
				# case "(a + b) * (1 / c)" -> "(a + b) / (c)"
				$prev =~ s/ = \(([^;]*)\) \* \(1\.0 \/ ([^;]*)\);/ = ($1) \/ ($2);/s;
				# case "((r0.w / 17) / 128)" -> "(r0.w / (17 * 128))"
	#			$prev =~ s/ = ([^;]*) \* \(1.0 \/ ([^;]*)\)/ = $1 \/ $2/s;
				# case "(1.0 / sqrt(r5.y + r5.x)) * r1.xy"
				$prev =~ s/ = \(\(1\.0 \/ sqrt\(([^;]*)\)\) \* ([^;]*)\) \+ ([^;]*);/ = ($2 \/ sqrt($1)) + $3;/s;
				# case "(1.0 / length(r5....)) * r1.xy"
				$prev =~ s/ = \(\(1\.0 \/ length\(([^;]*)\)\) \* ([^;]*)\) \+ ([^;]*);/ = ($2 \/ length($1)) + $3;/s;

# match balanced parenthesis:
#(\((?:[^\(\)]++|(?1))*\))
				# case "r1.w * (1.0 / (PI * 2))" -> "r1.w / (PI * 2)"
				$prev =~ s/([^()]+) \* \(1\.0 \/ ([^()]*)\)([^();]*)/\1 \/ \2\3/s;
				# case "r1.w * -(1.0 / 8192)" -> "r1.w / -8192"
				$prev =~ s/([^()]+) \* [-]\(1\.0 \/ ([^()]*)\)([^();]*)/\1 \/ -\2\3/s;
				# case "(1.0 / x) * (1.0 / y)" -> "1.0 / (x * y)"
				$prev =~ s/\(1\.0 \/ ([^()]*)\) \* \(1\.0 \/ ([^()]*)\)/(1.0 \/ (\1 * \2))/s;
				$prev =~ s/\(1\.0 \/ ([^()]*)\) \* \(1\.0 \/ (\((?:[^\(\)]++|(?1))*\))\)/(1.0 \/ (\1 * \2))/s;
				# case "(1.0 / (PI * 2)) * r1.w" -> "r1.w / (PI * 2)"
				$prev =~ s/\(1\.0 \/ ([^()]+)\) \* ([^();]+)/\2 \/ \1/s;
				$prev =~ s/([^();]+) \* \(1\.0 \/ ([^()]+)\)/\1 \/ \2/s;
				$prev =~ s/\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \* ([^();]+)/\2 \/ \1/s;
				$prev =~ s/([^();]+) \* \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/\1 \/ \2/s;
				$prev =~ s/\(1\.0 \/ ([^()]+)\) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))/\2 \/ \1/s;
				$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \* \(1\.0 \/ ([^()]+)\)/\1 \/ \2/s;
				$prev =~ s/\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))/\2 \/ \1/s;
				$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \* \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/\1 \/ \2/s;
#    r2.xy = r2.xy * (1.0 / sqrt(r6.y + r6.x));
				# case "1.0 / (a / b))"
				$prev =~ s/\(1\.0 \/ \(([^()]+) \/ ([^()]+)\)\)/(\2 \/ \1)/s;
				$prev =~ s/\(1\.0 \/ \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ ([^()]+)\)\)/(\2 \/ \1)/s;
				$prev =~ s/\(1\.0 \/ \(([^()]+) \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/(\2 \/ \1)/s;
				$prev =~ s/\(1\.0 \/ \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/(\2 \/ \1)/s;
				# case "1.0 * (a * b))"
			#	$prev =~ s/\(([^()]+) \* \(([^()]+) \* ([^()]+)\)\)/(\1 * \2 * \3)/s;
			#	$prev =~ s/\(([^()]+) \* \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* ([^()]+)\)\)/(\1 * \2 * \3)/s;
			#	$prev =~ s/\(([^()]+) \* \(([^()]+) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/(\1 * \2 * \3)/s;
			#	$prev =~ s/\(([^()]+) \* \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/(\1 * \2 * \3)/s;
#r1.w ==     r5.w = saturate(r1.w * (1.0 / (IN.texcoord_2.w * 0.5)));
#r1.w ==     r5.w = saturate( / r1.w(1.0 / (IN.texcoord_2.w * 0.5)));
#(1.0 / length(IN.texcoord_6.xyz - IN.texcoord_2.xyz)) * (IN.texcoord_2.w * 0.5)
#1.0 / ((IN.texcoord_2.w * 0.5) / length(IN.texcoord_6.xyz - IN.texcoord_2.xyz))

				# case "1.0 / (1.0 / ...)" -> "..."
				$prev =~ s/\(1.0 \/ \(1.0 \/ ([^()]+)\)\)/\1/s;
				$prev =~ s/\(1.0 \/ \(1.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/\1/s;
				$prev =~ s/1.0 \/ \(1.0 \/ ([^()]+)\)/\1/s;
				$prev =~ s/1.0 \/ \(1.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/\1/s;

				$prev =~ s/\((\((?:[^\(\)]++|(?1))*\))\)/\1/s;

				# case "- -0.5"
				$prev =~ s/- -([^;]*)/+ $1/g;

				# case "-1 + VarAmounts.y"
				$prev =~ s/-([a-zA-Z0-9_\.]+) [+] ([a-zA-Z0-9_\.]+)/$2 - $1/g;
				# case "-(FresnelRI.x - 1)"
				$prev =~ s/-\(([a-zA-Z0-9_\.]+) [-] ([a-zA-Z0-9_\.]+)\)/$2 - $1/g;
				# case "-(r3.y + FresnelRI.x)"
				$prev =~ s/-\(([a-zA-Z0-9_\.]+) [+] ([a-zA-Z0-9_\.]+)\)/$2 - $1/g;
				# case "(r3.y / -r3.w) + 1"
				$prev =~ s/\(([a-zA-Z0-9_\.]+) \/ -([a-zA-Z0-9_\.]+)\) \+ 1/1 - ($1 \/ $2)/g;
				$prev =~ s/\(-([a-zA-Z0-9_\.]+) \/ ([a-zA-Z0-9_\.]+)\) \+ 1/1 - ($1 \/ $2)/g;

				# intrinsics -------------------------------------------------------
				# case "1.0 / sqrt(dot(r0.xyzw, r0.xyzw))"
				$prev =~ s/1.0 \/ sqrt\(dot\(([^;]*), \1\)\)/1.0 \/ length(\1)/s;
				# case "sqrt(dot(r0.xyzw, r0.xyzw))"
				$prev =~ s/sqrt\(dot\(([^;]*), \1\)\)/length(\1)/s;
				# case "sqrt(dot(r0.xy, r0.xy) + 0)" -> "length(r0.xy)"
				$prev =~ s/sqrt\(dot\(([^;]*), \1\) [+] 0\)/length(\1)/s;
				# case "r0 / length(r0.xyzw)" -> "normalize(r0)"
				# case "r2.xyz = r1.xyz / length(r1.xyz);"
				# case "r0.xyz / length(r0.xyz)"
				$prev =~ s/\(([^;]*) \/ length\(\1\)\)/normalize(\1)/s;
				$prev =~ s/([^;]*) \/ length\(\1\)/normalize(\1)/s;
				# case "(r1.x * r2.y) - (r2.x * r1.y)"
				$prev =~ s/\(([^;]*)\.x [*] ([^;]*)\.y\) [-] \(\2\.x [*] \1\.y\)/determinant(float2x2(\1.xy, \2.xy))/s;

				# -- two-op saturation
				# case "min(max(..., 0), 1)" -> "saturations(r0)"
				$prev =~ s/min\(max\(([^;]*), 0\), 1\)/saturate(\1)/s;
				$prev =~ s/saturate\(\(([^();]*)\)\)/saturate(\1)/s;

				# case "r0.w = max(-r6.w, r6.w);"
				$prev =~ s/max\(-([^-;]*), \1\)/abs(\1)/s;
				# -- conditional move
				# case "lerp(r4.xyz, -r4.xyz, r1.xyz == 0 ? 1.0 : 0.0)"
				$prev =~ s/lerp\(([^;]*), ([^;]*), ([^;]*) 1\.0 : 0\.0\)/(\3 \1 : \2)/s;
				$prev =~ s/lerp\(([^;]*), ([^;]*), ([^;]*) 0\.0 : 1\.0\)/(\3 \2 : \3)/s;

				# dot2
				# r6.xy = r2.xy * r2.xy;
				# r2.xy = r2.xy / sqrt(r6.y + r6.x);

				# case "offset.w = IN.texcoord_1.x - frac(IN.texcoord_1.x);"
				$prev =~ s/ = ([^;]*) - frac\(\1\);/ = \1;/s;

				# case "r1.w * (r1.w * r1.w) * (r1.w * r1.w)"
				$prev =~ s/([^;]*) \* \(\(\1 \* \1\) \* \(\1 \* \1\)\)/pow\(\1, 5\)/;

				# notes ------------------------------------------------------------
				# case "2 * (r0.xyz - 0.5)"
				if ($prev =~ /2 [*] \(.* [-] 0\.5\)/) {
					if (!($prev =~ / to /)) {
						$prev =~ s/$/\1\t\/\/ [0,1] to [-1,+1]/;
					}
				}
				# case "(0.5 * r0.xyz) + 0.5"
				if ($prev =~ /\((0\.5) \* (.*)\) [+] \1/) {
					if (!($prev =~ / to /)) {
						$prev =~ s/$/\1\t\/\/ [-1,+1] to [0,1]/;
					}
				}
				# case "(r0.xyz * 0.5) + 0.5"
				if ($prev =~ /\((.*) \* (0\.5)\) [+] \2/) {
					if (!($prev =~ / to /)) {
						$prev =~ s/$/\1\t\/\/ [-1,+1] to [0,1]/;
					}
				}
				# case "sqrt(1.0 - (r1.x * r1.x))"
				if ($prev =~ /sqrt\(1.0 - \((.*) \* \1\)\)/) {
					if (!($prev =~ /arc/)) {
						$prev =~ s/$/\t\/\/ arcsin = 1 \/ sqrt(1 - x²)/;
					}
				}

	#			$prev =~ s/ = dot\((.*), $1\)/ = $1/;
	#			$prev =~ s/ = sqrt..dot.([a-zINOUT0-9_\.]+),$1.../length($1)/s;

				if ($tt) {
					if ($debug_subst) {
			   			print "$reg.$msk";
			   			print " == $prev";
			   		}
			   	}

	#			$shader[$p] = $prev . $cmnt;
				$shader[$p] = $prev;
			}

			# well, no substitution means we can't delete this ...
			if ($pt > 0) {
	#			$shader[$pi] = $prev;
				$shader[$pi] = "";
			}
# print "...\n";
# print "\n";
		}
	}
}

# print "-----------------------------------------------------------------\n";
# print @shader;

# third pass (sorting) --------------------------------------------------------
my @sorted = @shader;
@shader = ();
$snb = scalar(@sorted);
$lnb = 0;

# print "count $snb\n";

for ($lnb = $snb - 1; $lnb >= 0; $lnb--) {
	$line = $sorted[$lnb];

	if ($line =~ /^$/) {
		next;
	}

	$s = scalar(@shader);
	$p = 0;
	$x = 0;

	while ($p < $s) {
#foreach (@sorted) {
# up	$line = $_;
# up
# up		if ($lnb > 0) {
# up			$l = $lnb;
# up			$p = $lnb;
# up			while (--$p >= 0) {
				$prev = $shader[$p];
				$prev =~ m/([a-zINOUT0-9_.]+) = /;
				$pras = $1;
				$phit = $1;
				$line =~ m/([a-zINOUT0-9_.]+) = /;
				$lias = $1;
				$lhit = $1;

				if ($debug_sorts) {
					print "compare\n";
					print "   ";
					print $line;
					print "   ";
					print $prev;
					print " = ";
				}

				# we can not trace dependencies across if/else-bocks
				if (($prev =~ /endif/) ||
				    ($prev =~ /else/) ||
				    ($prev =~ /if_/)) {
					if ($debug_sorts) {
						print "stopped\n";
					}

					last;
				}

				if (($line =~ /endif/) ||
				    ($line =~ /else/) ||
				    ($line =~ /if_/)) {
					if ($debug_sorts) {
						print "stopped\n";
					}

					last;
				}

				# extend the variable-check to include all masked accesses
				if ($pras =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					# r0.x -> r0|r0.xyzw|r0.yzx|...
					$pras = "$1.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
					$pran = "$1([^.])";
				}
				else {
					# r0 -> r0|r0.xyzw
					$pras = "$pras.([a-z]*)([^a-zINOUT0-9_.]*)";
					$pran = "$pras([^.])";
				}

				if ($lias =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					# r0.x -> r0|r0.xyzw|r0.yzx|...
					$lias = "($1).([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
					$lian = "$1([^.])";
				}
				else {
					# r0 -> r0|r0.xyzw
					$lias = "$lias.([a-z]*)([^a-zINOUT0-9_.]*)";
					$lian = "$pras([^.])";
				}

				# writes to the output-structure can always move around
				if (!($pras =~ /^ *OUT/)) {
					# check for reassignment or dependency (barrier)
					if (($line =~ /(.*)$pras(.*) = /) || ($line =~ /(.*)$pran(.*) = /) ||
					    ($line =~ / = (.*)$pras(.*)/) || ($line =~ / = (.*)$pran(.*)/)) {
						if ($debug_sorts) {
							print "ended l\n";
						}

					    	last;
					}
				}

				# writes to the output-structure can always move around
				if (!($lias =~ /^ *OUT/)) {
					# check for reassignment or dependency (barrier)
					if (($prev =~ /(.*)$lias(.*) = /) || ($prev =~ /(.*)$lian(.*) = /) ||
					    ($prev =~ / = (.*)$lias(.*)/) || ($prev =~ / = (.*)$lian(.*)/)) {
						if ($debug_sorts) {
							print $lias . "p\n";
							print "ended p\n";
						}

					    	last;
					}
				}

				# do twice sorting (this means also twice as many passes)
				# that is because the sorting may block substitution, and we shuffle the
				# code-block a little to get that chance to
			#	if ($phit gt $lhit) {
				# special sort OUT > r0
				# special sort IN < r0
				if ((!($prev =~ /^ *OUT/)) && ($line =~ /^ *OUT/)) {
					if ($debug_sorts) {
						print "greater\n";
					}

					$x = $p + 1;
				#	next;
				}

				elsif (($pass & 2) || !$pass) {
					# shuffle
					if ($line gt $prev) {
						if ($debug_sorts) {
							print "less\n";
						}

						$x = $p;
						last;
					#	next;
					}
					else {
						if ($debug_sorts) {
							print "greater\n";
						}
					}
				}
				else {
					# sort
					if ($line gt $prev) {
						if ($debug_sorts) {
							print "greater\n";
						}

						$x = $p + 1;
					#	next;
					}
					else {
						if ($debug_sorts) {
							print "less\n";
						}
					}
				}

# up				$l = $p;
# up			}
# up
# up			if ($l != $lnb) {
# up				$ll = $lnb;
# up				while ($ll > $l) {
# up					$shader[$ll] = $shader[$ll - 1];
# up					$ll--;
# up				}
# up				$shader[$l] = $line; $lnb++;
# up			}
# up			else {
# up				$shader[$lnb++] = $line;
# up			}
# up		}
# up		else {
# up			$shader[$lnb++] = $line;
# up		}

		$p++;
	}

# print "-----------------------------------------------------------------\n";
# print "move line $lnb to $p\n";

	$s = scalar(@shader);
	while (--$s >= $x) {
# print "move line " . ($s + 1) . "from $s\n";
		$shader[$s + 1] = $shader[$s];
	}
	$shader[$x] = $line;

# print @shader;
# print "\n";

# print "-----------------------------------------------------------------";

	# r9.z = dot(r5.xyz, r8.xyz);
	# r9.y = dot(r6.xyz, r8.xyz);
	# r9.x = dot(r4.xyz, r8.xyz);
	#
	# =>
	#
	# r9.xyz = mul(float3x3(r4.xyz, r6.xyz, r5.xyz), r8.xyz);

#	$s = scalar(@shader);
#	while (--$s >= 2) {
#		$line0 = $shader[$s - 0];
#		$line1 = $shader[$s - 1];
#		$line2 = $shader[$s - 2];
#	#	$line3 = $shader[$s - 3];
#
#		if ($line0 =~ /([][a-zINOUT0-9_]+).x = dot\(([][a-zINOUT0-9_]+).xyz, ([][a-zINOUT0-9_]+).xyz\);/) {
#			$x = $2; $v = $1; $m = $3;
#		if ($line1 =~ /$v.y = dot\(([a-zINOUT0-9_]+).xyz, $m.xyz\);/) {
#			$y = $1;
#		if ($line2 =~ /$v.z = dot\(([a-zINOUT0-9_]+).xyz, $m.xyz\);/) {
#			$z = $1;
#
#			$shader[$s - 0] = "";
#			$shader[$s - 1] = "";
#			$shader[$s - 2] = "$v.xyz = mul(float3x3($x.xyz, $y.xyz, $z.xyz), $m.xyz);";
#		}}}
#		elsif ($line0 =~ /([][a-zINOUT0-9_]+).z = dot\(([][a-zINOUT0-9_]+).xyz, ([][a-zINOUT0-9_]+).xyz\);/) {
#			$z = $2; $v = $1; $m = $3;
#		if ($line1 =~ /$v.y = dot\(([][a-zINOUT0-9_]+).xyz, $m.xyz\);/) {
#			$y = $1;
#		if ($line2 =~ /$v.x = dot\(([][a-zINOUT0-9_]+).xyz, $m.xyz\);/) {
#			$x = $1;
#
#			$shader[$s - 0] = "";
#			$shader[$s - 1] = "";
#			$shader[$s - 2] = "$v.xyz = mul(float3x3($x.xyz, $y.xyz, $z.xyz), $m.xyz);";
#		}}}
#	}

	# r2.x = 1.0 / abs(r2.x);
	# r2.y = 1.0 / abs(r2.y);
	# r2.z = 1.0 / abs(r2.z);
	#
	# =>
	#
	# r2.xyz = 1.0 / abs(r2.xyz);

	$s = scalar(@shader);
	while (--$s >= 2) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];
		$line2 = $shader[$s - 2];

		if ($line2 =~ /([][a-zINOUT0-9_]+)\.x = 1\.0 \/ ([a-z]+)\(([][a-zINOUT0-9_]+)\.x\);/) {
		if ($line1 =~ /($1)\.y = 1\.0 \/ ($2)\(($3)\.y\);/) {
		if ($line0 =~ /($1)\.z = 1\.0 \/ ($2)\(($3)\.z\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "    $1.xyz = 1.0 / $2($3.xyz);\n";
		}}}

		if ($line2 =~ /([][a-zINOUT0-9_]+)\.x = 1\.0 \/ ([][a-zINOUT0-9_]+)\.x;/) {
		if ($line1 =~ /($1)\.y = 1\.0 \/ ($2)\.y;/) {
		if ($line0 =~ /($1)\.z = 1\.0 \/ ($2)\.z;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "    $1.xyz = 1.0 / $2.xyz;\n";
		}}}
	}

	# r2.x = 1.0 / AlphaParam.y;
	# r2.y = 1.0 / AlphaParam.w;
	#
	# =>
	#
	# r2.xy = 1.0 / AlphaParam.yw;

	$s = scalar(@shader);
	while (--$s >= 1) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];

		if ($line1 =~ /([][a-zINOUT0-9_]+)\.x = 1\.0 \/ AlphaParam\.y;/) {
		if ($line0 =~ /($1)\.y = 1\.0 \/ AlphaParam\.w;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = 1.0 / AlphaParam.yw;\n";
		}}
	}

	# r6.xy = r2.xy * r2.xy;
	# r2.xy = r2.xy / sqrt(r6.y + r6.x);
	#
	# r1.xy = r0.xy * r0.xy;
	# r1.xz = -r0.xy / sqrt(r1.y + r1.x);
	#
	# r0.xy = r0.xy * r0.xy;
	# r0.w = r0.y + r0.x;
	# r0.w = 1.0 / sqrt(r0.w);
	#
	# =>
	#
	# r2.xy = normalize(r2.xy);

	$s = scalar(@shader);
	while (--$s >= 1) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];

		if ($line1 =~ /([][a-zINOUT0-9_]+)\.xy = ([][a-zINOUT0-9_]+)\.xy [*] \2\.xy;/) {
			$a = $1; $b = $2;
			# simple ones ------------------------------------
			if ($line0 =~ /($b)\.xy = ($b)\.xy \/ sqrt\(($a)\.y [+] ($a)\.x\);/) {
				$shader[$s - 0] = "";
				$shader[$s - 1] = "    $b.xy = normalize($b.xy);\n";
			}
			elsif ($line0 =~ /($b)\.xy = \(($b)\.xy \/ sqrt\(($a)\.y [+] ($a)\.x\)\) [+] (.*);/) {
				$shader[$s - 0] = "";
				$shader[$s - 1] = "    $b.xy = normalize($b.xy) + $5;\n";
			}
			elsif ($line0 =~ /($a)\.xz = -($b)\.xy \/ sqrt\(($a)\.y [+] ($a)\.x\);/) {
				$shader[$s - 0] = "    $a.xz = normalize($b.xy);\n";
			#	$shader[$s - 1] = "";
			}
			# more complex ones ------------------------------------
			elsif ($line0 =~ /ShadowProjData\.x - sqrt\(($a)\.y [+] ($a)\.x\)/) {
				$shader[$s - 1] = "";
				$shader[$s - 0] =~ s/ShadowProjData\.x - sqrt\(($a)\.y [+] ($a)\.x\)/ShadowProjData\.x - length\($a\.xy\)/;
			}
		}
	}
}

# $snb = scalar(@shader);
# print "result $snb\n";
# print "sorted\n";

# end of double-pass --------------------------------------------
	# we haven't found anything
	if (($pass > 3) && ($pass & 1)) {
		if (!$proc) {
			last;
		}
	}

# print "$proc -----------------------------------------------------------------\n";
# print @shader;
}

$snb = scalar(@shader);
$lnb = 0;
for ($lnb = 0; $lnb < $snb; $lnb++) {
	$line = $shader[$lnb];

	# conds ------------------------------------------------------------
	$line =~ s/( +)if_ne (.*), (.*)/\n\1if (\2 != \3) {/;
	$line =~ s/( +)if_lt (.*), (.*)/\n\1if (\2 != \3) {/;
	$line =~ s/( +)else/\1}\n\1else {/;
	$line =~ s/endif/}\n/;

	$shader[$lnb] = $line;
}

# last pass (OUT and r0-9) --------------------------------------------------------

my %_regs = ();
my %_ins = ();
my %_outs = ();

foreach (@shader) {
	$line = $_;

	$line =~ m/([a-zINOUT0-9_.]+) = /;
	$lias = $1;
	$lhit = $1;

	if ($lias =~ /([ INOUT\.]*)([][a-z0-9_]+)([.argbxyzw]*)/g) {
		$key = $1 . $2;
		$deg = $3;
		$grd = 0;
		if ($deg =~ /([rx]+)/) {	if ($grd < 1) { $grd = 1; }	}
		if ($deg =~ /([gy]+)/) {	if ($grd < 2) { $grd = 2; }	}
		if ($deg =~ /([bz]+)/) {	if ($grd < 3) { $grd = 3; }	}
		if ($deg =~ /([aw]+)/) {	if ($grd < 4) { $grd = 4; }	}
		if ($deg eq "") {		if ($grd < 4) { $grd = 4; }	}

		if ($key =~ /([OUT]+)/) {
#    float4 texcoord_1 : TEXCOORD1;
			if (!$_outs{$key}) {		$_outs{$key} = $grd;	}
			elsif ($_outs{$key} < $grd) {	$_outs{$key} = $grd;	}
		}
		elsif ($key =~ /([IN]+)/) {
#    float4 texcoord_1 : TEXCOORD1;
			if (!$_ins{$key}) {		$_ins{$key} = $grd;	}
			elsif ($_ins{$key} < $grd) {	$_ins{$key} = $grd;	}
		}
		else {
#    float4 r0;
			if (!$_regs{$key}) {		$_regs{$key} = $grd;	}
			elsif ($_regs{$key} < $grd) {	$_regs{$key} = $grd;	}
		}
	}
}

my @regs = ();
my @ins = ();
my @outs = ();

$r = 0;
foreach $key (sort keys %_regs) {
	$reg = "    float" . $_regs{$key} . " " . $key . ";\n";
	$regs[$r++] = $reg;
}

$i = 0;
foreach $key (sort keys %_ins) {
	$grd = $_ins{$key};
	$nam = $key;
	$nam =~ s/IN.//;
	$nam =~ s/position/position : POSITION/;
	$nam =~ s/color_([0-9]+)/color_\1 : COLOR\1/;
	$nam =~ s/texcoord_([0-9]+)/texcoord_\1 : TEXCOORD\1/;

	# check against shader-debug info structure (no doubles)
	$in = "    float" . $grd . " " . $nam . ";\n";
	if (grep {$_ eq $in} @instrc) {
		next;
	}

	if ($grd == 1) {
		$out = "    float " . $nam . ";\n";
		if (grep {$_ eq $out} @oustrc) {
			next;
		}
	}

	$ins[$r++] = $in;
}

$o = 0;
foreach $key (sort keys %_outs) {
	$grd = $_outs{$key};
	$nam = $key;
	$nam =~ s/OUT.//;
	$nam =~ s/position/position : POSITION/;
	$nam =~ s/color_([0-9]+)/color_\1 : COLOR\1/;
	$nam =~ s/texcoord_([0-9]+)/texcoord_\1 : TEXCOORD\1/;

	# check against shader-debug info structure (no doubles)
	$out = "    float" . $grd . " " . $nam . ";\n";
	if (grep {$_ eq $out} @oustrc) {
		next;
	}

	if ($grd == 1) {
		$out = "    float " . $nam . ";\n";
		if (grep {$_ eq $out} @oustrc) {
			next;
		}
	}

	$outs[$r++] = $out;
}

# output --------------------------------------------------------
print @prolog;
print "\n";

if ($type == 0) {
	print "\n";
	print "// Structures:\n";
	print "\n";
	print "struct VS_INPUT {\n";
	print @instrc;
	print @ins;
	print "};\n";
	print "\n";
	print "struct VS_OUTPUT {\n";
	print @oustrc;
	print @outs;
	print "};\n";
	print "\n";
	print "// Code:\n";
	print "\n";
	print "VS_OUTPUT main(VS_INPUT IN) {\n";
	print "    VS_OUTPUT OUT;\n";
	print "\n";
}

if ($type == 1) {
	print "\n";
	print "// Structures:\n";
	print "\n";
	print "struct VS_OUTPUT {\n";
	print @instrc;
	print @ins;
	print "};\n";
	print "\n";
	print "struct PS_OUTPUT {\n";
	print @oustrc;
	print @outs;
	print "};\n";
	print "\n";
	print "// Code:\n";
	print "\n";
	print "PS_OUTPUT main(VS_OUTPUT IN) {\n";
	print "    PS_OUTPUT OUT;\n";
	print "\n";
}

# defs
if ($hasPI || $hasSIN) {
	if ($hasPI) {
		print "#define	PI	3.14159274\n";
	}

	if ($hasSIN) {
		print "#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668\n";
		print "#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5\n";
	}

	print "\n";
}

print @consts;
print "\n";
print @regs;
print "\n";
print @shader;

print "\n";
print "    return OUT;\n";
print "};\n";
print "\n";

print @epilog;
