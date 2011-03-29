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

foreach $line (<STDIN>) {
	if ($body < 0) {
		$body = 1;
	}

#    PS_OUTPUT OUT;	-> enter
#    const ...		-> shift enter
#    return OUT;	-> leave

	# switch
	if ($line =~ /.vso.dis/) {
		$type = 0;
	}
	if ($line =~ /.pso.dis/) {
		$type = 1;
	}

	# new HLSL -------------------------------------------------------------
	if ($line =~ /[VP]S_OUTPUT OUT/) {
		$body = -1;
	}
	if ($line =~ /return OUT/) {
		$body = 2;
	}

	# old PseudoC ----------------------------------------------------------
	if ($line =~ /const /) {
		$body = -1;

		if (1) {
			push(@consts, $line);
			next;
		}
	}
	if ($line =~ /^ +(float|int)[1234]? /) {
		$body = -1;

		if ($line =~ /IN..*:/) {
			$line =~ s/IN.//s;
			push(@instrc, $line);
			next;
		}
		if ($line =~ /OUT..*:/) {
			$line =~ s/OUT.//s;
			push(@oustrc, $line);
			next;
		}
		# anonymous IN
		if ($line =~ /:[ A-Z0-9]+/) {
			$line =~ s/IN.//s;
			push(@instrc, $line);
			next;
		}
	}

	if ($body <= 0) {
		if ($line =~ /^\/\/ */) {
			$body = 0;

			if ($line =~ /Registers:/) {
				$parm = 0;
			}

			if ($parm) {
				$line =~ s/^\/\/ *//s;
			}

			if ($line =~ /Parameters:/) {
				$parm = 1;
			}
		}
	}
	if ($body == 1) {
		if ($line =~ /^\/\/ */) {
			$body = 2;
		}
	}

	# do line-by-line processing.
	if ($body <= 0) {
		$prolog[$lnp++] = $line;
	}
	if ($body == 1) {
		# line with only spaces ...
		if ($line =~ /^ *$/) {
			next;
		}
		# redundancy
		if ($line =~ /sampler/) {
			next;
		}

		if ($lnb > 0) {
			$l = $lnb;
			$p = $lnb;
			while (--$p >= 0) {
				$prev = $shader[$p];
				$prev =~ m/([a-zINOUT0-9_.]+) = /;
				$pras = $1;
				$phit = $1;
				$line =~ m/([a-zINOUT0-9_.]+) = /;
				$lias = $1;
				$lhit = $1;

				if ($pras =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					$pras = "$1(.[a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_]*)";
				}
				else {
					$pras = "$pras(.[a-z]*)?";
				}

				if ($lias =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					$lias = "$1(.[a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_]*)";
				}
				else {
					$lias = "$lias(.[a-z]*)?";
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

				if (!($pras =~ /^OUT/)) {
					if (($line =~ /(.*)$pras(.*) = /) ||
					    ($line =~ / = (.*)$pras(.*)/)) {
					    	last;
					}
				}

				if (!($lias =~ /^OUT/)) {
					if (($prev =~ /(.*)$lias(.*) = /) ||
					    ($prev =~ / = (.*)$lias(.*)/)) {
					    	last;
					}
				}

			#	print "movable:\n";
			#	print $prev;
			#	print $line;

				$l = $p;
			#	print "$lnb to $l\n";
			}

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
	if ($body == 2) {
		$epilog[$lne++] = $line;
	}
}

# second pass (sorting) --------------------------------------------------------
my @sorted = @shader;
$shader = ();
$lnb = 0;

foreach (@sorted) {
	$line = $_;

		if ($lnb > 0) {
			$l = $lnb;
			$p = $lnb;
			while (--$p >= 0) {
				$prev = $shader[$p];
				$prev =~ m/([a-zINOUT0-9_.]+) = /;
				$pras = $1;
				$phit = $1;
				$line =~ m/([a-zINOUT0-9_.]+) = /;
				$lias = $1;
				$lhit = $1;

				if ($pras =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					$pras = "$1(.[a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_]*)";
				}
				else {
					$pras = "$pras(.[a-z]*)?";
				}

				if ($lias =~ m/([a-zINOUT0-9_]+).([a-z]+)/) {
					$lias = "$1(.[a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_]*)";
				}
				else {
					$lias = "$lias(.[a-z]*)?";
				}

				if (!($pras =~ /^OUT/)) {
					if (($line =~ /(.*)$pras(.*) = /) ||
					    ($line =~ / = (.*)$pras(.*)/)) {
					    	last;
					}
				}

				if (!($lias =~ /^OUT/)) {
					if (($prev =~ /(.*)$lias(.*) = /) ||
					    ($prev =~ / = (.*)$lias(.*)/)) {
					    	last;
					}
				}

			#	if ($phit gt $lhit) {
				if ($prev lt $line) {
					last;
				}

				$l = $p;
			}

			if ($l != $lnb) {
				$ll = $lnb;
				while ($ll > $l) {
					$shader[$ll] = $shader[$ll - 1];
					$ll--;
				}
				$shader[$l] = $line; $lnb++;
			}
			else {
				$shader[$lnb++] = $line;
			}
		}
		else {
			$shader[$lnb++] = $line;
		}
}

print @prolog;
print "\n";

if ($type == 0) {
	print "\n";
	print "// Structures:\n";
	print "\n";
	print "struct VS_INPUT {\n";
	print @instrc;
	print "};\n";
	print "\n";
	print "struct VS_OUTPUT {\n";
	print @oustrc;
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
	print "};\n";
	print "\n";
	print "struct PS_OUTPUT {\n";
	print @oustrc;
	print "};\n";
	print "\n";
	print "// Code:\n";
	print "\n";
	print "PS_OUTPUT main(VS_OUTPUT IN) {\n";
	print "    PS_OUTPUT OUT;\n";
	print "\n";
}

print @consts;
print "\n";
print @shader;

print "\n";
print "    return OUT;\n";
print "};\n";
print "\n";

print @epilog;
