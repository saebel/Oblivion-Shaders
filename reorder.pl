#!/usr/bin/perl

select(STDERR);
$| = 1;
select(STDOUT); # default
$| = 1;

my @prolog = ();
my @defins = ();
my @shader = ();
my @consts = ();
my @instrc = ();
my @oustrc = ();
my @epilog = ();
my %identi = ();
my %ialias = ();
my $lnp = 0;
my $lnb = 0;
my $lne = 0;
my $body = 0;
my $step = 0;
my $class = "";
my $type = 0;
my $parm = 0;
my $sclr = 0;		# scalar conversion counter
my $stex = 0;		# scalar texture conversion counter
my $hasOUT = 0;
my $hasPI = 0;
my $hasSIN = 0;
my $hasLIT = 0;		# shade
my $hasWGT = 0;		# weight/sqr
my $hasREFL = 0;	# envreflect
my $hasUV = 0;		# uvtile
my $hasCNV = 0;		# compress/expand/...
my $hasTSM = 0;		# tangent space matrix
my $convPI = 0;		# [0,1] -> [-PI,+PI]
my $convWV = 0;		# [0,1] -> [-1,+1]
my $convRN = 0;		# [-1,+1] -> [0,1]
my $lastpass = 0;
my $debug_usage = 0;
my $debug_subst = 0;
my $debug_scalr = 0;
my $debug_sorts = 0;

# replace a string without using RegExp.
sub str_replace {
	my $replace_this = shift;
	my $with_this  = shift;
	my $string   = shift;

	my $length = length($string);
	my $target = length($replace_this);

	for(my $i=0; $i<$length - $target + 1; $i++) {
		if(substr($string,$i,$target) eq $replace_this) {
			$string = substr($string,0,$i) . $with_this . substr($string,$i+$target);
			return $string; #Comment this if you what a global replace
		}
	}
	return $string;
}

sub str_optimize {
	my ($prev) = @_;

	# static patterns --------------------------------------------------
#	$pmatch = /(\((?:[^\(\)]++|(?1))*\))/;
#	$fmatch = /([a-z]*\((?:[^\(\)]++|(?1))*\))/;
#	$amatch = /([a-z]*\((?:[^\(\)]++|(?1))*\)|[^()]*)/;
#	$xmatch = /([^(),;]*\((?:[^\(\)]++|(?1))*\)[^(),;]*|[^(),;]+)/;

#	# simplifications --------------------------------------------------
#	# case "(a + b) * (1 / c)" -> "(a + b) / (c)"
#	$prev =~ s/ = \(([^;]*)\) \* \(1\.0 \/ ([^;]*)\);/ = ($1) \/ ($2);/s;
#	# case "((r0.w / 17) / 128)" -> "(r0.w / (17 * 128))"
#	$prev =~ s/ = ([^;]*) \* \(1\.0 \/ ([^;]*)\);/ = $1 \/ $2/s;
#	# case "(1\.0 / sqrt(r5.y + r5.x)) * r1.xy"
#	$prev =~ s/ = \(\(1\.0 \/ sqrt\(([^;]*)\)\) \* ([^;]*)\) \+ ([^;]*);/ = ($2 \/ sqrt($1)) + $3;/s;
#	# case "(1\.0 / length(r5....)) * r1.xy"
#	$prev =~ s/ = \(\(1\.0 \/ length\(([^;]*)\)\) \* ([^;]*)\) \+ ([^;]*);/ = ($2 \/ length($1)) + $3;/s;

# match balanced parenthesis:
#(\((?:[^\(\)]++|(?1))*\))

	if ($prev =~ /1\.0/) {
#(1.0 / doubleVisParams.w) * doubleVisParams.z;
#r1.w ==     r5.w = saturate(r1.w * (1.0 / (IN.texcoord_2.w * 0.5)));
#r1.w ==     r5.w = saturate( / r1.w(1.0 / (IN.texcoord_2.w * 0.5)));
#(1.0 / length(IN.texcoord_6.xyz - IN.texcoord_2.xyz)) * (IN.texcoord_2.w * 0.5)
#1.0 / ((IN.texcoord_2.w * 0.5) / length(IN.texcoord_6.xyz - IN.texcoord_2.xyz))
#(1.0 / q1.x) / LightPosition[0].w
#q11.x = (1.0 / length(IN.texcoord_6.xyz)) * pow(abs(shades(q3.xyz, normalize(IN.texcoord_3.xyz))), Toggles.z);
		$prev =~ s/\(1\.0 \/ ([^()]+)\) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))/$2 \/ $1/s;
		$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \* \(1\.0 \/ ([^()]+)\)/$1 \/ $2/s;
		$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \* -\(1\.0 \/ ([^()]+)\)/$1 \/ -$2/s;
		$prev =~ s/\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))/$2 \/ $1/s;
		$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \* \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/$1 \/ $2/s;
		$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \* -\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/$1 \/ -$2/s;

		# case "(1.0 / (PI * 2)) * r1.w" -> "r1.w / (PI * 2)"
#r1.xyz * (1.0 / sqrt((((r0.z * 0.5) + 1) * r1.z) + ((r2.y * r1.y) + (r2.x * r1.x))))
#saturate((r0.w * (1.0 / 1600)) + 0.75)
		$prev =~ s/, \(1\.0 \/ ([^()]+)\) \* ([^();,]+)\)/, $2 \/ $1)/s;
		$prev =~ s/, \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \* ([^(),;]+)\)/, $2 \/ $1)/s;

		$prev =~ s/\(1\.0 \/ ([^()]+)\) \* ([^();,]+);/$2 \/ $1;/s;
		$prev =~ s/([^();,]+) \* \(1\.0 \/ ([^()]+)\)/$1 \/ $2/s;
		$prev =~ s/([^();,]+) \* -\(1\.0 \/ ([^()]+)\)/$1 \/ -$2/s;
		$prev =~ s/\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \* ([^(),;]+);/$2 \/ $1;/s;
		$prev =~ s/([^(),;]+) \* \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/$1 \/ $2/s;
		$prev =~ s/([^(),;]+) \* -\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/$1 \/ -$2/s;
		$prev =~ s/\(\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \* ([^(),;]+)\)/($2 \/ $1)/s;
		$prev =~ s/\(([^(),;]+) \* \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/($1 \/ $2)/s;
		$prev =~ s/\(([^(),;]+) \* -\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/($1 \/ -$2)/s;

		# case "r1.w * (1.0 / (PI * 2))" -> "r1.w / (PI * 2)"
		$prev =~ s/ = ([^()]+) \* \(1\.0 \/ (.*)\);/ = $1 \/ $2;/s;
		# case "r1.w * -(1.0 / 8192)" -> "r1.w / -8192"
		$prev =~ s/ = ([^()]+) \* -\(1\.0 \/ (.*)\);/ = $1 \/ -$2;/s;

		# case "(1.0 / x) * (1.0 / y)" -> "1.0 / (x * y)"
		$prev =~ s/\(1\.0 \/ ([^()]*)\) \* \(1\.0 \/ ([^()]*)\)/(1\.0 \/ ($1 * $2))/s;
		$prev =~ s/\(1\.0 \/ ([^()]*)\) \* \(1\.0 \/ (\((?:[^\(\)]++|(?1))*\))\)/(1\.0 \/ ($1 * $2))/s;

#    r2.xy = r2.xy * (1.0 / sqrt(r6.y + r6.x));
#    abs(dot(DecalProjection[1][2].xyz, r0.xyz)) * -(1.0 / 256)
		# case "1.0 / (a / b))"
		$prev =~ s/\(1\.0 \/ \(([^()]+) \/ ([^()]+)\)\)/($2 \/ $1)/s;
		$prev =~ s/\(1\.0 \/ \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ ([^()]+)\)\)/($2 \/ $1)/s;
		$prev =~ s/\(1\.0 \/ \(([^()]+) \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/($2 \/ $1)/s;
		$prev =~ s/\(1\.0 \/ \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/($2 \/ $1)/s;

		# case "(length(q6.xyz) / 1.0)" -> "length(q6.xyz)"
		$prev =~ s/\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ 1\.0\)/$1/s;
		$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ 1\.0/$1/s;

		# case "1.0 / (1.0 / ...)" -> "..."
		$prev =~ s/\(1\.0 \/ \(1\.0 \/ ([^()]+)\)\)/$1/s;
		$prev =~ s/\(1\.0 \/ \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/$1/s;
		$prev =~ s/1\.0 \/ \(1\.0 \/ ([^()]+)\)/$1/s;
		$prev =~ s/1\.0 \/ \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/$1/s;

		# case "(1.0 / ...) / (1.0 / ...)" -> "... / ..."
		$prev =~ s/\(1\.0 \/ ([^()]+)\) \/ \(1\.0 \/ ([^()]+)\)/$2 \/ $1/s;
		$prev =~ s/\(1\.0 \/ ([^()]+)\) \/ \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/$2 \/ $1/s;
		$prev =~ s/\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \/ \(1\.0 \/ ([^()]+)\)/$2 \/ $1/s;
		$prev =~ s/\(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \/ \(1\.0 \/ ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/$2 \/ $1/s;
	}

	# case "(1.0 / q1.x) / LightPosition[0].w"
	$prev =~ s/\(([^()]+) \/ ([^()]+)\) \/ ([^(),;]+);/$1 \/ ($2 * $3);/s;

	# case "1.0 * (a * b))"
#	$prev =~ s/\(([^()]+) \* \(([^()]+) \* ([^()]+)\)\)/($1 * $2 * $3)/s;
#	$prev =~ s/\(([^()]+) \* \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* ([^()]+)\)\)/($1 * $2 * $3)/s;
#	$prev =~ s/\(([^()]+) \* \(([^()]+) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/($1 * $2 * $3)/s;
#	$prev =~ s/\(([^()]+) \* \(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/($1 * $2 * $3)/s;

	# case "((...))" -> "(...)"
	$prev =~ s/\((\((?:[^\(\)]++|(?1))*\))\)/$1/s;
	$prev =~ s/\(\(([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/($1)/s;
	$prev =~ s/\(\(([a-z]*\((?:[^\(\)]++|(?1))*\))\) /($1 /s;
	$prev =~ s/ \(([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/ $1)/s;
	$prev =~ s/ \(([a-z]*\((?:[^\(\)]++|(?1))*\))\) / $1 /s;
	$prev =~ s/ \(([a-z]*\((?:[^\(\)]++|(?1))*\))\);/ $1;/s;
	$prev =~ s/ \(([a-z]*\((?:[^\(\)]++|(?1))*\))\),/ $1,/s;

	# case "- -0.5"
	$prev =~ s/- -([^;]*)/+ $1/g;
	# case "(2 * r0.xyz) - 1"
	$prev =~ s/\(2 \* ([a-zA-Z0-9_\.]+)\) - 1/2 * ($1 - 0.5)/g;
	# case "+ -(1.0 / 256)"
	$prev =~ s/\+ -([a-z]*\((?:[^\(\)]++|(?1))*\))/- $1/g;
	# case "(q8.x * 0.25)"
	$prev =~ s/\(([a-zA-Z0-9_\.]+) \* 0\.25\)/($1 \/ 4)/g;

	# case "-1 + VarAmounts.y"
	$prev =~ s/-([a-zA-Z0-9_\.]+) [+] ([a-zA-Z0-9_\.]+)/$2 - $1/g;
	# case "-(FresnelRI.x - 1)"
	# case "-(saturate(...) - 1)"
	$prev =~ s/-\(([^()]+) - ([^()]+)\)/$2 - $1/g;
	$prev =~ s/-\(([a-z]*\((?:[^\(\)]++|(?1))*\)) - ([^()]+)\)/$2 - $1/s;
	# case "-(r3.y + FresnelRI.x)"
	$prev =~ s/-\(([a-zA-Z0-9_\.]+) [+] ([a-zA-Z0-9_\.]+)\)/$2 - $1/g;
	# case "(r3.y / -r3.w) + 1"
	# case "(IN.texcoord_1.z / -IN.texcoord_2.w) + r4.x"
	$prev =~ s/\(([a-zA-Z0-9_\.]+) ([\/\*]) -([a-zA-Z0-9_\.]+)\) \+ ([a-zA-Z0-9_\.]+)/$4 - ($1 $2 $3)/g;
	$prev =~ s/\(-([a-zA-Z0-9_\.]+) ([\/\*]) ([a-zA-Z0-9_\.]+)\) \+ ([a-zA-Z0-9_\.]+)/$4 - ($1 $2 $3)/g;
	# case "(IN.texcoord_1.z * -IN.texcoord_2.w) + r4.x"

	if ($prev =~ /(sqrt|dot|length)/) {
		# intrinsics -------------------------------------------------------
		# case "1.0 / sqrt(dot(r0.xyzw, r0.xyzw))"
		$prev =~ s/1\.0 \/ sqrt\(dot\(([^();]*), \1\)\)/1\.0 \/ length($1)/s;
		$prev =~ s/1\.0 \/ sqrt\(dot\(([a-z]*\((?:[^\(\)]++|(?1))*\)), \1\)\)/1\.0 \/ length($1)/s;
		# case "sqrt(dot(r0.xyzw, r0.xyzw))"
		# case "sqrt(dot(r0.xy, r0.xy) + 0)" -> "length(r0.xy)"
		$prev =~ s/sqrt\(dot\(([^();]*), \1\)\)/length($1)/s;
		$prev =~ s/sqrt\(dot\(([a-z]*\((?:[^\(\)]++|(?1))*\)), \1\)\)/length($1)/s;
		$prev =~ s/sqrt\(dot\(([^();]*), \1\) \+ 0\)/length($1)/s;
		$prev =~ s/sqrt\(dot\(([a-z]*\((?:[^\(\)]++|(?1))*\)), \1\) \+ 0\)/length($1)/s;
		# case "r0 / length(r0.xyzw)" -> "normalize(r0)"
		# case "r2.xyz = r1.xyz / length(r1.xyz);"
		# case "r0.xyz / length(r0.xyz)"
		$prev =~ s/\(([^();]*) \/ length\(\1\)\)/normalize($1)/s;
		$prev =~ s/\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ length\(\1\)\)/normalize($1)/s;
		$prev =~ s/([^();]*) \/ length\(\1\)/normalize($1)/s;
		$prev =~ s/([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ length\(\1\)/normalize($1)/s;
	}

	# case "(r1.x * r2.y) - (r2.x * r1.y)"
	$prev =~ s/\(([^();]*)\.x \* ([^();]*)\.y\) - \(\2\.x \* \1\.y\)/determinant(float2x2($1.xy, $2.xy))/s;

	# -- two-op saturation
	# case "min(max(..., 0), 1)" -> "saturations(r0)"
	$prev =~ s/min\(max\(([^();]*), 0\), 1\)/saturate($1)/s;
	$prev =~ s/min\(max\(([^();]*\((?:[^\(\)]++|(?1))*\)[^();]*), 0\), 1\)/saturate($1)/s;
	$prev =~ s/max\(min\(([^();]*), 1\), 0\)/saturate($1)/s;
	$prev =~ s/max\(min\(([^();]*\((?:[^\(\)]++|(?1))*\)[^();]*), 1\), 0\)/saturate($1)/s;
	# case "saturate(1 - ...) - 1"
	$prev =~ s/saturate\(\(([^();]*)\)\)/saturate($1)/s;
	$prev =~ s/saturate\(1 - ([^();]*)\) - 1/1 - saturate($1)/s;
	$prev =~ s/saturate\(1 - ([a-z]*\((?:[^\(\)]++|(?1))*\))\) - 1/1 - saturate($1)/s;
	# case "tex2D(ShadowMap, saturate((q4.x * const_5.xy) + q3.xy))"
	$prev =~ s/tex2D\(([^();]*), saturate\(\(([^();]*)\) \+ ([a-zA-Z0-9_\.\-]+)\)\)/tex2D($1, saturate($3 + ($2)))/s;

	# case "r0.w = max(-r6.w, r6.w);"
	$prev =~ s/max\(-([^\-();]*), \1\)/abs($1)/s;

	# case "pow(2.0, ...)"
	$prev =~ s/pow\(2\.0, ([^()]*)\)/exptwo($1)/s;
	$prev =~ s/pow\(2\.0, ([a-z]*\((?:[^\(\)]++|(?1))*\))\)/exptwo($1)/s;

	# -- conditional move
	# case "lerp(r4.xyz, -r4.xyz, r1.xyz == 0 ? 1.0 : 0.0)"
	# case "lerp(r1.xyzw, r2.xyzw, r0.w <= 0.0 ? 1 : 0)"
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), ([^();,]+) 1\.0 : 0\.0\)/($3 $2 : $1)/s;
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), ([^();,]+) 0\.0 : 1\.0\)/($3 $1 : $2)/s;
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), ([^();,]+) 1 : 0\)/($3 $2 : $1)/s;
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), ([^();,]+) 0 : 1\)/($3 $1 : $2)/s;
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), \(([^();,]+) 1\.0 : 0\.0\)\)/($3 $2 : $1)/s;
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), \(([^();,]+) 0\.0 : 1\.0\)\)/($3 $1 : $2)/s;
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), \(([^();,]+) 1 : 0\)\)/($3 $2 : $1)/s;
	$prev =~ s/lerp\(([^();,]+), ([^();,]+), \(([^();,]+) 0 : 1\)\)/($3 $1 : $2)/s;

	# dot2
	# r6.xy = r2.xy * r2.xy;
	# r2.xy = r2.xy / sqrt(r6.y + r6.x);

	# case "offset.w = IN.texcoord_1.x - frac(IN.texcoord_1.x);"
	$prev =~ s/ = ([^;]*) - frac\(\1\);/ = $1;/s;
	$prev =~ s/ = \(([^();]*)\) - frac\(\1\);/ = $1;/s;
	# case "(IN.texcoord_0.x <= 0.0 ? (1 - IN.texcoord_0.x) : (IN.texcoord_0.x + 1))"
	$prev =~ s/\(([^()]+) <= 0\.0 \? \(1 - \1\) \: \(\1 \+ 1\)\)/(1 + abs($1))/s;
	# case "(IN.texcoord_0.x <= 0.0 ? (IN.texcoord_0.x + 1) : (1 - IN.texcoord_0.x))"
	$prev =~ s/\(([^()]+) <= 0\.0 \? \(\1 \+ 1\) \: \(1 - \1\)\)/(1 - abs($1))/s;

	# case "r1.w * (r1.w * r1.w) * (r1.w * r1.w)"
	$prev =~ s/([^();]*) \* \(\(\1 \* \1\) \* \(\1 \* \1\)\)/pow\($1, 5\)/;

	# case "(AlphaTestRef.x - r0.w) >= 0.0"
	$prev =~ s/\(([a-zA-Z0-9_\.\-]+) - ([a-zA-Z0-9_\.\-]+)\) >= 0\.0/$1 >= $2/;
	# case "(AlphaTestRef.x >= r0.w ? 1 : 0) * IN.texcoord_5.w"
	$prev =~ s/\(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 1 \: 0\) \* ([a-zA-Z0-9_\.\-]+)/($1 $2 $3 ? $4 : 0)/;
	$prev =~ s/\(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 0 \: 1\) \* ([a-zA-Z0-9_\.\-]+)/($1 $2 $3 ? 0 : $4)/;
	# case "((r6.w == 0 ? 1.0 : 0.0) * (2 * r5.w))"
	$prev =~ s/\(\(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 1\.0 \: 0\.0\) \* ([a-zA-Z0-9_\.\-]+)\)/($1 $2 $3 ? $4 : 0)/;
	$prev =~ s/\(\(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 0\.0 \: 1\.0\) \* ([a-zA-Z0-9_\.\-]+)\)/($1 $2 $3 ? 0 : $4)/;
	$prev =~ s/\(\(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 1\.0 \: 0\.0\) \* (\((?:[^\(\)]++|(?1))*\))\)/($1 $2 $3 ? $4 : 0)/;
	$prev =~ s/\(\(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 0\.0 \: 1\.0\) \* (\((?:[^\(\)]++|(?1))*\))\)/($1 $2 $3 ? 0 : $4)/;
	# case "((q8.x >= q1.x ? -q12.x : 0) + q12.x)"
	$prev =~ s/\(\(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? -([a-zA-Z0-9_\.\-]+) \: 0\) \+ \4\)/($1 $2 $3 ? 0 : $4)/;
	# case "(... * -q10.x) + q10.x"
	$prev =~ s/\(([^()]+) \* -([a-zA-Z0-9_\.\-]+)\) \+ \2/$2 - ($2 * $1)/;
	# case "q9.x * (r3.z < fVars2.x ? 1.0 : 0.0)"
	# case "q26.xy * (determinant(float2x2(q26.xy, q25.xy)) < 0 ? 1.0 : 0.0))"
	$prev =~ s/([a-zA-Z0-9_\.\-]+) \* \(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 1\.0 \: 0\.0\)/($2 $3 $4 ? $1 : 0)/;
	$prev =~ s/([a-zA-Z0-9_\.\-]+) \* \(([a-zA-Z0-9_\.\-]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 0\.0 \: 1\.0\)/($2 $3 $4 ? 0 : $1)/;
	$prev =~ s/([a-zA-Z0-9_\.\-]+) \* \(([^=<>]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 1\.0 \: 0\.0\)/($2 $3 $4 ? $1 : 0)/;
	$prev =~ s/([a-zA-Z0-9_\.\-]+) \* \(([^=<>]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? 0\.0 \: 1\.0\)/($2 $3 $4 ? 0 : $1)/;
	# case "(-2 * (... < 0 ? q26.xy : 0)) + q26.xy" => "((... < 0 ? -q26.xy : q26.xy))"
	$prev =~ s/\(-2 \* \(([^=<>]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? ([a-zA-Z0-9_\.\-]+) \: 0\)\) \+ \4/($1 $2 $3 ? -$4 : $4)/;
	# case "(q3.x == 0 ? (2 * pow(2.0, abs(q3.x))) : 0) - pow(2.0, abs(q3.x))"
	# case "(q3.x == 0 ? pow(2.0, abs(q3.x)) : -pow(2.0, abs(q3.x)))"
	$prev =~ s/\(([^=<>]+) ([=<>]+) ([a-zA-Z0-9_\.\-]+) \? \(2 \* ([^;]*)\) \: 0\) - \4/($1 $2 $3 ? $4 : -$4)/;
	# case "r0.w = (r0.w < -r0.w ? 1.0 : 0.0);"
	# check for negative
	$prev =~ s/\(([^=<>]+) < -\1 \? 1\.0 \: 0\.0\)/($1 < 0.0 ? 1 : 0)/;

	# case "(r0.w * r0.w) <= 0.0"
	$prev =~ s/\(([a-zA-Z0-9_\.\-]+) \* \1\) <= 0\.0/$1 == 0/;
	# case "(-q3.x >= q3.x ? 1.0 : 0.0)"
	$prev =~ s/-([a-zA-Z0-9_\.]+) >= \1/$1 == 0/;
	# step == Returns (x >= a) ? 1 : 0
	# case "r2.y + r2.y"
	$prev =~ s/([a-zA-Z0-9_\.\-]+) \+ \1/2 * $1/;

	# case "(sqrt(q6.x) <= 0.0 ? (1 - sqrt(q6.x)) : 1)"

	if (1) {
		# case "(r4.yzx * r0.zxy) - (r0.yzx * r4.zxy)"
		$prev =~ s/\(([a-zA-Z0-9_]+).yzx \* ([a-zA-Z0-9_]+).zxy\) - \(\2.yzx \* \1.zxy\)/cross($1.xyz, $2.xyz)/s;

		# case "(-(2 * dot(-q6.xyz, r0.xyz)) * r0.xyz) - q6.xyz" -> reflection
		# case "-q6.xyz - 2 * dot(-q6.xyz, r0.xyz) * r0.xyz" -> reflection
		# case "(-(2 * dot(-q5.xyz, r0.xyz)) * r0.xyz) - q5.xyz,"
		$prev =~ s/\(-\(2 \* dot\(-([^()]*), ([^()]*)\)\) \* \2\) - \1/reflect(-$1, $2)/s;
		$prev =~ s/\(-\(2 \* dot\(([^()]*), ([^()]*)\)\) \* \2\) - \1/reflect($1, $2)/s;

		# case "((2 * dot(q1.xyz, normalize(IN.texcoord_2.xyz))) * q1.xyz) - (normalize(IN.texcoord_2.xyz) * dot(q1.xyz, q1.xyz))"
		# case "((2 * dot(q3.xyz, q1.xyz)) * q3.xyz) - (q1.xyz * dot(q3.xyz, q3.xyz))"
		$_prev = $prev;
		$prev =~ s/\(\(2 \* dot\(([^()]*), ([^()]*)\)\) \* \1\) - \(\2 \* dot\(\1, \1\)\)/envreflect($1, $2)/s;
		if ($_prev ne $prev) {
			$hasREFL = 1;
		}
	}

	if (!($prev =~ / to /)) {
		# case "2 * (r0.xyz - 0.5)"
		if ($prev =~ /2 \* \(.* - 0\.5\)/) {
			$prev =~ s/ \(2 \* \(([^()]*) - 0\.5\)\)/ expand($1)/g;
			$prev =~ s/ \(2 \* \(([a-z]*\((?:[^\(\)]++|(?1))*\)) - 0\.5\)\)/ expand($1)/g;
			$prev =~ s/2 \* \(([^()]*) - 0\.5\)/expand($1)/g;
			$prev =~ s/2 \* \(([a-z]*\((?:[^\(\)]++|(?1))*\)) - 0\.5\)/expand($1)/g;
			$prev =~ s/$/$1\t\/\/ [0,1] to [-1,+1]/;

			$hasCNV = 1;
		}
		# case "(r0.xyz - 0.5) * 2"
		if ($prev =~ /\(.* - 0\.5\) \* 2/) {
			$prev =~ s/ \(\(([^()]*) - 0\.5\) \* 2\)/ expand($1)/g;
			$prev =~ s/ \(\(([a-z]*\((?:[^\(\)]++|(?1))*\)) - 0\.5\) \* 2\)/ expand($1)/g;
			$prev =~ s/\(([^()]*) - 0\.5\) \* 2/expand($1)/g;
			$prev =~ s/\(([a-z]*\((?:[^\(\)]++|(?1))*\)) - 0\.5\) \* 2/expand($1)/g;
			$prev =~ s/$/$1\t\/\/ [0,1] to [-1,+1]/;

			$hasCNV = 1;
		}
		# case "(0.5 * r0.xyz) + 0.5"
		if ($prev =~ /\(0\.5 \* (.*)\) \+ 0\.5/) {
			$prev =~ s/ \(\(0\.5 \* ([^()]*)\) \+ 0\.5\)/ compress($1)/g;
			$prev =~ s/ \(\(0\.5 \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \+ 0\.5\)/ compress($1)/g;
			$prev =~ s/\(0\.5 \* ([^()]*)\) \+ 0\.5/compress($1)/g;
			$prev =~ s/\(0\.5 \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\) \+ 0\.5/compress($1)/g;
			$prev =~ s/$/$1\t\/\/ [-1,+1] to [0,1]/;

			$hasCNV = 1;
		}
		# case "(r0.xyz * 0.5) + 0.5"
		if ($prev =~ /\((.*) \* 0\.5\) \+ 0\.5/) {
			$prev =~ s/ \(\(([^()]*) \* 0\.5\) \+ 0\.5\)/ compress($1)/g;
			$prev =~ s/ \(\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* 0\.5\) \+ 0\.5\)/ compress($1)/g;
			$prev =~ s/\(([^()]*) \* 0\.5\) \+ 0\.5/compress($1)/g;
			$prev =~ s/\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* 0\.5\) \+ 0\.5/compress($1)/g;
			$prev =~ s/$/$1\t\/\/ [-1,+1] to [0,1]/;

			$hasCNV = 1;
		}
		# case "(r0.w * 0.04) - 0.02"
		if ($prev =~ /\((.*) \* 0\.04\) - 0\.02/) {
			$prev =~ s/ \(\(([^()]*) \* 0\.04\) - 0\.02\)/ uvtile($1)/g;
			$prev =~ s/ \(\(([a-z]*\((?:[^\(\)]++|(?1))*\)) - 0\.04\) \+ 0\.02\)/ uvtile($1)/g;
			$prev =~ s/\(([^()]*) \* 0\.04\) - 0\.02/uvtile($1)/g;
			$prev =~ s/\(([a-z]*\((?:[^\(\)]++|(?1))*\)) - 0\.04\) \+ 0\.02/uvtile($1)/g;
			$prev =~ s/$/$1\t\/\/ [0,1] to [-0.02,+0.02]/;

			$hasUV = 1;
		}
		# case "(PI * 2 * (x)) - PI;"
		if ($prev =~ /\(PI \* 2 \* (.*)\) - PI/) {
			$prev =~ s/ \(\(PI \* 2 \* ([^()]*)\) - PI\)/ angler($1)/g;
			$prev =~ s/ \(\(PI \* 2 \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\) - PI\)/ angler($1)/g;
			$prev =~ s/\(PI \* 2 \* ([^()]*)\) - PI/angler($1)/g;
			$prev =~ s/\(PI \* 2 \* ([a-z]*\((?:[^\(\)]++|(?1))*\))\) - PI/angler($1)/g;
			$prev =~ s/$/$1\t\/\/ [0,1] to [-PI,PI]/;

			$hasCNV = 1;
		}
		# case "((x) * PI * 2) - PI;"
		if ($prev =~ /\((.*) \* PI \* 2\) - PI/) {
			$prev =~ s/ \(\(([^()]*) \* PI \* 2\) - PI\)/ angler($1)/g;
			$prev =~ s/ \(\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* PI \* 2\) - PI\)/ angler($1)/g;
			$prev =~ s/\(([^()]*) \* PI \* 2\) - PI/angler($1)/g;
			$prev =~ s/\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \* PI \* 2\) - PI/angler($1)/g;
			$prev =~ s/$/$1\t\/\/ [0,1] to [-PI,PI]/;

			$hasCNV = 1;
		}
		# case "((x) / (PI * 2)) - PI;"
		if ($prev =~ /\((.*) \/ \(PI \* 2\)\) \+ 0\.5/) {
			$prev =~ s/ \(\(([^()]*) \/ \(PI \* 2\)\) \+ 0\.5\)/ anglei($1)/g;
			$prev =~ s/ \(\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ \(PI \* 2\)\) \+ 0\.5\)/ anglei($1)/g;
			$prev =~ s/\(([^()]*) \/ \(PI \* 2\)\) \+ 0\.5/anglei($1)/g;
			$prev =~ s/\(([a-z]*\((?:[^\(\)]++|(?1))*\)) \/ \(PI \* 2\)\) \+ 0\.5/anglei($1)/g;
			$prev =~ s/$/$1\t\/\/ [-PI,PI] to [0,1]/;

			$hasCNV = 1;
		}
	}

	# case "angler(frac(anglei(r1.x * Time.x)))"
	if ($prev =~ /angler\(frac\(anglei\((.*)\)\)\)/) {
		$prev =~ s/angler\(frac\(anglei\(([^()]*)\)\)\)/fracr($1)/g;
		$prev =~ s/angler\(frac\(anglei(\((?:[^\(\)]++|(?1))*\))\)\)/fracr$1/g;
		$prev =~ s/angler\(frac\(anglei\(([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)\)/fracr($1)/g;

		$hasCNV = 1;
	}

	# case "max(dot(q0.xyz, normalize(IN.texcoord_3.xyz)), 0)"
	# case "saturate(dot(normalize(expand(r1.xyz)), IN.texcoord_1.xyz))"
	# case "saturate(dot(normalize(q4.xyz), r2.xyz))"
	if ($prev =~ /max\(dot\((.*), (.*)\), 0\)/) {
		$prev =~ s/max\(dot\(([^()]*), ([^()]*)\), 0\)/shade($1, $2)/g;
		$prev =~ s/max\(dot\(([a-z]*\((?:[^\(\)]++|(?1))*\)), ([^()]*)\), 0\)/shade($1, $2)/g;
		$prev =~ s/max\(dot\(([^()]*), ([a-z]*\((?:[^\(\)]++|(?1))*\))\), 0\)/shade($1, $2)/g;

		$hasLIT = 1;
	}

	if ($prev =~ /min\(shade\((.*), (.*)\), 1\)/) {
		$prev =~ s/min\(shade\(([^()]*), ([^()]*)\), 1\)/shades($1, $2)/g;
		$prev =~ s/min\(shade\(([a-z]*\((?:[^\(\)]++|(?1))*\)), ([^()]*)\), 1\)/shades($1, $2)/g;
		$prev =~ s/min\(shade\(([^()]*), ([a-z]*\((?:[^\(\)]++|(?1))*\))\), 1\)/shades($1, $2)/g;
		$prev =~ s/min\(shade\(([a-z]*\([a-z]*\((?:[^\(\)]++|(?1))*\)\)), ([^()]*)\), 1\)/shades($1, $2)/g;
		$prev =~ s/min\(shade\(([^()]*), ([a-z]*\([a-z]*\((?:[^\(\)]++|(?1))*\)\))\), 1\)/shades($1, $2)/g;

		$hasLIT = 1;
	}

	if ($prev =~ /saturate\(dot\((.*), (.*)\)\)/) {
		$prev =~ s/saturate\(dot\(([^()]*), ([^()]*)\)\)/shades($1, $2)/g;
		$prev =~ s/saturate\(dot\(([a-z]*\((?:[^\(\)]++|(?1))*\)), ([^()]*)\)\)/shades($1, $2)/g;
		$prev =~ s/saturate\(dot\(([^()]*), ([a-z]*\((?:[^\(\)]++|(?1))*\))\)\)/shades($1, $2)/g;
		$prev =~ s/saturate\(dot\(([a-z]*\([a-z]*\((?:[^\(\)]++|(?1))*\)\)), ([^()]*)\)\)/shades($1, $2)/g;
		$prev =~ s/saturate\(dot\(([^()]*), ([a-z]*\([a-z]*\((?:[^\(\)]++|(?1))*\)\))\)\)/shades($1, $2)/g;

		$hasLIT = 1;
	}

	if ($lastpass) {
		if ($prev =~ /dot\((.*), 1\)/) {
			$prev =~ s/dot\(([^()]*), 1\)/weight($1)/g;
			$prev =~ s/dot\(([a-z]*\((?:[^\(\)]++|(?1))*\)), 1\)/weight($1)/g;

			$hasWGT = 1;
		}

		if ($prev =~ /([^(),;]+) \* \1/) {
			$prev =~ s/ \(([^(),;]+) \* \1\) / sqr($1) /g;
			$prev =~ s/\(([^(),;]+) \* \1\)/(sqr($1))/g;
			$prev =~ s/, ([^(),;]+) \* \1\)/, sqr($1))/g;
			$prev =~ s/\(([^(),;]+) \* \1, /(sqr($1), /g;
			$prev =~ s/ = ([^(),;]+) \* \1;/ = sqr($1);/g;

		#	$prev =~ s/([^(),;]+) \* sqr\(sqr\(\1\)\)/hep($1)/g;

			$hasWGT = 1;
		}
	}

	# OUT.texcoord_2.xyzw = (IN.color_0.xyzx * const_4.xxxy) + const_4.yyyx;
	# OUT.color_0.rgba = (IN.blendindices.z * const_4.xxxy) + const_4.yyyx;
	# q1.xy = (const_3.xy * r0.xy) + const_6.xy;
	# OUT.color_0.zw = (PSRefractionPower.x * r0.xy) + r0.yx;
	# q0.xyz = (IN.position.xyx * const_0.xxy) + const_0.yyx;
#	if ($prev =~ / = \((.*) \* const_([0-9]+)\.([xyzw]+)\) \+ const_([0-9]+)\.([xyzw]+);/) {
#
#	}

	# IN.texcoord_1.xyzw = dot(const_1.xyz, LightColor[0].rgb);

	# r2.xyz = tex2D(ShadowMap, saturate((q3.x * const_4.xy) + q1.xy));
	# r3.xyz = tex2D(ShadowMap, saturate((q3.x * 0.01) + q1.xy));

	return $prev;
}

sub isMatrix
{
	my ($form, $name) = @_;

	foreach (@prolog) {
		if ($_ =~ /row_major $form $name;/) {
			return 1;
		}
	}

	foreach (@defins) {
		if ($_ =~ /#define\t$name\t$form/) {
			return 1;
		}
	}

	return 0;
}

print STDERR "start reading contents ...\r";

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
	if ($line =~ /\.vso\.dis/) {
		$type = 0;	}
	# this file came from a pixel shader binary
	if ($line =~ /\.pso\.dis/) {
		$type = 1;	}

	if ($line =~ /\.dis/) {
		if ($line =~ /HDR[0-9]+/) {
			$class = "hdr";	}
		if ($line =~ /HAIR[0-9]+/) {
			$class = "hair";	}
		if ($line =~ /PAR[0-9]+/) {
			$class = "parallax";	}
		if ($line =~ /SLS[0-9]+/) {
			$class = "simplelight";	}
		if ($line =~ /SM[0-9]+/) {
			$class = "shadermodel";	}
		if ($line =~ /STB[0-9]+/) {
			$class = "speedtree";	}
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

	# assignment
	if ($line =~ / +.* = .*;/) {
		$body = 1;
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
		if ($line =~ /IN\..*:/) {
			$line =~ s/IN\.//s;
			push(@instrc, $line);
			next;
		}
		# output structure variable
		if ($line =~ /OUT\..*:/) {
			$line =~ s/OUT\.//s;
			push(@oustrc, $line);
			next;
		}

		# anonymous IN variable (old shader-models)
		if ($line =~ /:[ A-Z0-9]+/) {
			$line =~ s/IN\.//s;
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

			if ($parm && (($line =~ /;/) || ($line =~ /^\/\/ *$/))) {
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

		# some texture corrections
		$line =~ s/\.xyzw = tex2D\(AttenuationMap/\.x = tex2D\(AttenuationMap/;
		$line =~ s/\.xyzw = tex2D\(ShadowMaskMap/\.x = tex2D\(ShadowMaskMap/;
		$line =~ s/\.xyzw = tex2D\(ShadowMask/\.x = tex2D\(ShadowMask/;
	#	$line =~ s/\.xyzw = tex2D\(AnisoMap/\.x = tex2D\(AnisoMap/;	# fluctuating usage
		$line =~ s/\.xyzw = tex2D\(ShadowMap/\.xyz = tex2D\(ShadowMap/;
		$line =~ s/\.xyzw = tex2D\(DetailMap/\.xyz = tex2D\(DetailMap/;
	#	$line =~ s/\.xyzw = tex2D\(GlowMap/\.xyz = tex2D\(GlowMap/;
		$line =~ s/\.xyzw = tex2Dproj\(ReflectionMap/\.xyz = tex2Dproj\(ReflectionMap/;
		$line =~ s/\.xyzw = tex2D\(DepthMap/\.x = tex2D\(DepthMap/;
		$line =~ s/\.xyzw = tex2D\(freqSamp/\.x = tex2D\(freqSamp/;

		$line =~ s/\.xyzw = tex2D\(AttMap,/\.x = tex2D\(AttMap,/;
		$line =~ s/\.xyzw = tex2D\(AttMapZ,/\.xyz = tex2D\(AttMapZ,/;
		$line =~ s/\.xyzw = tex2D\(AttMapXY,/\.xyz = tex2D\(AttMapXY,/;

		if (($class ne "hair") && ($class ne "parallax") && ($class ne "simplelight") && ($class ne "shadermodel") && ($class ne "speedtree")) {
			$line =~ s/\.xyzw = tex2D\(NormalMap/\.xyz = tex2D\(NormalMap/;
			$line =~ s/\.xyzw = texCUBE\(NormalCubeMap/\.xyz = texCUBE\(NormalCubeMap/;	}

		$line =~ s/\.xyzw = tex2D\(Src1/\.xyz = tex2D\(Src1/;
		if ($class eq "hdr") {
			$line =~ s/\.xyzw = tex2D\(Src0/\.xyz = tex2D\(Src0/;	}

		$line = str_optimize($line);

		# loop through all lines preceding the current one and
		# look if we can move the line somewhere more up
		if ($lnb > 0) {
			$l = $lnb;
			$p = $lnb;
			while (--$p >= 0) {
				# get the assignments of both lines, current and previous
				$prev = $shader[$p];
				$prev =~ m/([INOUT.]*[][a-z0-9_.]+) = /;
				$pras = $1;
				$phit = $1;
				$line =~ m/([INOUT.]*[][a-z0-9_.]+) = /;
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
				if ($pras =~ m/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/) {
					# r0.x -> r0|r0.xyzw|r0.yzx|...
					$pras = "$1\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
					$pran = "$1([^.])";
				}
				else {
					# r0 -> r0|r0.xyzw
					$pras = "$pras\.([a-z]*)([^a-zINOUT0-9_.]*)";
					$pran = "$pras([^.])";
				}

				if ($lias =~ m/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/) {
					# r0.x -> r0|r0.xyzw|r0.yzx|...
					$lias = "($1)\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
					$lian = "$1([^.])";
				}
				else {
					# r0 -> r0|r0.xyzw
					$lias = "$lias\.([a-z]*)([^a-zINOUT0-9_.]*)";
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

		# easier for the substitution
		if ($shader[$lnb - 1] =~ /(.*)OUT\.color_0\.rgba = r0\.xyzw;(.*)/s) {
			$shader[$lnb - 1] = $1 . "OUT\.color_0\.rgb = r0\.xyz;" . $2;
			$shader[$lnb++  ] = $1 . "OUT\.color_0\.a = r0\.w;" . $2;
    		}

		# easier for the substitution
		elsif ($shader[$lnb - 1] =~ /(.*)OUT\.output_0\.xyzw = r0\.xyzw;(.*)/s) {
			$shader[$lnb - 1] = $1 . "OUT\.output_0\.xyz = r0\.xyz;" . $2;
			$shader[$lnb++  ] = $1 . "OUT\.output_0\.w = r0\.w;" . $2;
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

	print STDERR "pass $pass line substitution ...                          \r";

	if (!$debug_subst && !$debug_scalr && $debug_sorts) {
		print STDERR "- pass $pass ----------------------------------------------------------------\n";
		if (1) {
			print STDERR @shader;
		}
		print STDERR "\n";
	}

# start of double-pass ------------------------------------------
$snb = scalar(@shader);
# @shader = ();
$lnb = 0;
$scl = 0;
$lvl = 0;
$cnd = 0;

for ($lnb = 0; $lnb < $snb; $lnb++) {
	$line = $shader[$lnb];

	if ($line eq "") {
		next;	}

	# OUT can't be substituted
	if ($line =~ /OUT.* = .*/) {
		next;	}
	# conditionals can't be substituted
	if ($line =~ /if_/) { $lvl = 1; $cnd = 1; next; }
	if ($line =~ /else/) { $lvl = 2; $cnd = 1; next; }
	if ($line =~ /endif/) { $lvl = 0; $cnd = 1; next; }

	if ($debug_subst || $debug_scalr) {
		print STDERR "- pass $pass ----------------------------------------------------------------\n";
		if (1) {
			print STDERR @shader;
		}
		print STDERR "\n";
	}

	print STDERR "pass $pass line $lnb substitution ...                          \r";

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

	if ($debug_usage) {
		print STDERR "  setup " . $lnb . ": ";
		print STDERR $line;
	}

	$cp = 0;
	$cu = 0;
	$up = 0;
	$uu = 0;
	$fp = 0;
	$fu = 0;
	$i = 0;
	$pvl = $lvl;
	$ivl = 0;
	$b = 0;
	$u = 0;
	$s = $snb;
	$p = $lnb;
	while ($p++ < $s) {
		$prev = $shader[$p];
		$prev =~ m/([INOUT.]*[][a-z0-9_.]+) = /;
		$pras = $1;
		$phit = $1;
		$line =~ m/([INOUT.]*[][a-z0-9_.]+) = /;
		$lias = $1;
		$lhit = $1;

		if ($debug_usage && ($p == ($lnb + 1))) {
			print STDERR "  match " . ($p - 1) . " ($lvl): ";
			print STDERR $line;
		}
		if ($debug_usage) {
			print STDERR "  against $p ($pvl): ";
			print STDERR $prev;
		}

		# we can look for substitutable fragments over conditions
		# if it occurs once, it occurs once :)
		if (($prev =~ /if_/)) { $pvl = 1; $cnd = 1; }
		if (($prev =~ /else/)) { $pvl = 2; $cnd = 1; $i = $b; }
		if (($prev =~ /endif/)) { $pvl = 0; $cnd = 1; $i = 0; }

		# we're crossing conditionals
		if ($pvl != $lvl) { $ivl = 1; }

		if (($prev =~ /endif/) ||
		    ($prev =~ /else/) ||
		    ($prev =~ /if_/)) {
		    	# conditional barrier
			if (!$cp) {
				$cp = $p;
				$cu = $u;
			}

			if ($prev =~ m/$lias/) {
				if ($debug_usage) {
					print STDERR "  bail out for conditional dependency $p ($pvl $b)\n";
				}

				$u = 0;
				last;
			}

		    	# reset bailout indicator
		   	$b = 0;
			next;
		}

		# skip rest of conditional
		if ($b) {
			next;	}

		# extend the variable-check to include all masked accesses
		# r0.x -> r0|r0.xyzw|r0.yzx|...
		if ($pras =~ m/([INOUT.]*[][a-z0-9_]+)\.([argbxyzw]+)/) {
			if (1) {
				@pw = split(//, $2);
			}

			# r0.x -> r0|r0.xyzw|r0.yzx|...
			$prax = "$1\.$2";
			$pras = "$1\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$pra1 = "($1)\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$pra2 = "($1)\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$pran = "$1([^.])";
		}
		else {
			# r0 -> r0|r0.xyzw
			$prax = "$pras";
			$pras = "$pras\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$pra1 = "$pras\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$pra2 = "$pras\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$pran = "$pras([^.])";
		}

		if ($lias =~ m/([INOUT.]*[][a-z0-9_]+)\.([argbxyzw]+)/) {
			# read/write-mask
			if (!$w) {
				@lw = split(//, $2);
			}

			$liax = "$1\.$2";
			$liau = "$1\.$2([^a-zINOUT0-9_.]*)";
			$lias = "($1)\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$lia1 = "($1)\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$lia2 = "($1)\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$lian = "$1([^.])";
		}
		else {
			$liax = "$lias";
			$liau = "$lias([^a-zINOUT0-9_.]*)";
			$lias = "$lias\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$lia1 = "$lias\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$lia2 = "$lias\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$lian = "$lias([^.])";

#			print "fault: ";
#			print $lias;
#			print "\n";

			$u = 0;
			last;
		}

		# is part of sub-mask, can't be scalar ---------------------------------------------
		# we detect all matches here, also swizzles
		# if there are multiple occurances like (r0.xyz * r0.zyx) it's all invalid
		# and can't be a scalar
		$stop = 0;
		$prex = $prev;
		$prex =~ m/ = (.*);/;
		$prex = $1;

		while ($prex =~ /$lia1/g) {
			if ("$1.$2" ne "$liax") {
				$st = 0;
				$sr = scalar(@lw);
				@br = split(//, $2);
				while (--$sr >= 0) {
					foreach (@br) {
						if ($lw[$sr] eq $_) {
							$st++;
						}
					}
				}

				if (!$st) {
					if ($debug_usage) {
						print STDERR "  skip over partial mask $p ($pvl $b)\n";
					}
				}
				else {
					if ($debug_usage) {
						print STDERR "  bail out for partial mask $p ($pvl $b)\n";
					}

					$u = 0;
					$stop = 1;
					last;
				}
			}
		}

		while ($prex =~ /$lia2/g) {
			if ("$1.$2" ne "$liax") {
				$st = 0;
				$sr = scalar(@lw);
				@br = split(//, $2);
				while (--$sr >= 0) {
					foreach (@br) {
						if ($lw[$sr] eq $_) {
							$st++;
						}
					}
				}

				if (!$st) {
					if ($debug_usage) {
						print STDERR "  skip over partial mask $p ($pvl $b)\n";
					}
				}
				else {
					if ($debug_usage) {
						print STDERR "  bail out for partial mask $p ($pvl $b)\n";
					}

					$u = 0;
					$stop = 1;
					last;
				}
			}
		}

		if ($stop) {
			last;	}

		# is read exactly as written -------------------------------------------------------
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

		# is part of sub-mask, can't be scalar ---------------------------------------------
		# no multiple matches in an asignment possible
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
					print STDERR "  bail out for partial write $p $2 (@lw pending) ($pvl $b)\n";
				}

				$w = 1;
			}
			else {
				# all written
				@lw = ();
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
					print STDERR "  bail out for partial write $p $2 (@lw unmodified) ($pvl $b)\n";
				}

				$w = 1;
			}
			else {
				# all written
				@lw = ();
			}
		}

		# all/part of it is overwritten ----------------------------------------------------
		if ((!$w || (scalar(@lw) == 0)) && ($prev =~ /(.*)$lias(.*) = /)) {
			if ($debug_usage) {
				print STDERR "  possible bail out for reassignment $p ($pvl $b $i)\n";
			}

			# while inside a conditinal we have to continue
			if ($ivl && ($pvl > 0)) {
				$b = 1;

				# this else and the preceeding if both invalidate
				if (($pvl == 2) && ($i == $b)) {
					if ($debug_usage) {
						print STDERR "  bail out for full conditional reassignment $p ($pvl $b)\n";
					}

					last;
				}

				next;
			}
			# while on base-level (or same level witout crossing) we can quit immediatly
			else {
				last;
			}
		}

		# TODO: match used register in the if_
		if (!($prev =~ / = /)) {
			next;	}

		# the next line makes an assignment to a variable used by the current line
		# this case is irrelevant for the usage-counter, in fact aborting here
		# will throw away the consecusive uses!
		if ($line =~ / = (.*)$pras(.*)/) {
			# partial writes happened, this is not the original value anymore!
			if ($w && (scalar(@lw) != 0)) {
				if ($debug_usage) {
					print STDERR "  bail out for write invalidation $p ($pvl $b)\n";
				}

				$u = 0;
				last;
			}

			if ($debug_usage) {
				print STDERR "  note barrier for read invalidation $p ($pvl $b)\n";
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
			print STDERR "  last used at $p (barriers at $fp and $cp)\n";
		}
	}

	if ($fp && (!$cp || ($fp < $cp))) {
		$p = $fp;
	#	$u = $fu;

		# we got a reorder-barrier, if there are no additional utilization after it
		# we can substitute (uses-before barrier == overall-uses)
		# otherwise not
		if ($fu != $uu) {
			if ($debug_usage) {
				print STDERR "  reorder barrier passed $fu uses in $fp != $uu uses in $up\n";
			}

			next;
		}
	}

	if ($cp && (!$fp || ($cp < $fp))) {
		$p = $cp;
	#	$u = $cu;

		# we got a conditional-barrier, if there are no additional utilization after it
		# we can substitute (uses-before barrier == overall-uses)
		# otherwise not
		if ($cu != $uu) {
			if ($debug_usage) {
				print STDERR "  conditional barrier passed $cu uses in $cp != $uu uses in $up\n";
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

	$len = 1;
	$dos = 0;
	$scl = "";
	if ($u == 1) {
		$dos = 1;
	}
	if ($u >= 2) {
		$dos = 1;
	}

	if ($dos) {
		$s = $p;
		$p = $lnb;

		$frst = $shader[$s];
		$prev = $shader[$p];
		$sbst = $prev;
		$lhit =~ m/([INOUT.]*[][a-z0-9_]+)\.([argbxyzw]+)/;
		$reg = $1;
		$msk = $2;
		$trg = $2;

		if ($prev eq "") {
			next;	}

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

	#	$prev =~ s/$reg\.$msk = /s$reg.$msk = /;
	#	$sbst =~ s/.*$reg\.$msk = ([a-z]+)\((.*)\);.*$/$1($2)/s;
	#	$sbst =~ s/.*$reg\.$msk = \((.*)\);.*$/($1)/s;
		$sbst =~ s/.*$reg\.$msk = (.*);.*$/$1/s;
	#	$sbst =~ s/^\(([^()]*)(\((?:[^\(\)]++|(?1))*\))([^()]*)\)$/$1$2$3/s;	# sloooooooow
	#	$sbst =~ s/^\(([^()]*)\)$/$1/s;
		$sbst =~ s/^\(([^)]*)([^()]*)([^(]*)\)$/$1$2$3/s;
	#	$sbst =~ s/^\((.*)\)$/$1/s;
		$cmnt =~ s/.*;(.*)/$1/;

		if ($u > 1) {
		#	if ($sbst =~ /[^a-zINOUT0-9_]*r[0-9]+[^a-zINOUT0-9_]*/) {
		#		$dos = 0;
		#	}

			# don't substitute twice if it's not a constant number
			# it doesn't really look better code-wise (PI is okay)
			if ($sbst =~ /[a-zA-HJ-OQ-Z]*/) {
				if ($debug_subst || $debug_scalr) {
					print STDERR "$reg.$msk";
					print STDERR " * $u";
				}

				# the form r0.w = 1.0 / r3.w;
				$test = $sbst;
				$us = ($test =~ s/([INOUT.]*[][a-z0-9_-]+)\.([xyzwrgba]+)/x/g);

				if ($us > 2) {
					if ($debug_subst || $debug_scalr) {
						print STDERR " == non-constant [$us regs]";
						print STDERR "\n";
					}

					$dos = 0;
					$scl = "q";
				}
				elsif ($us > 1) {
					# the form r1.xy = r2.xy * r2.xy;
					# the form r0.xy = r1.xy + r1.xy;
					if (($line =~ / = ([INOUT.]*[][a-z0-9_-]+)\.([xyzwrgba]+) [\*\+] \1;/) &&
					    ($sbst =~ /([INOUT.]*[][a-z0-9_-]+)\.([xyzwrgba]+) [\*\+] \1/)) {
						if ($debug_subst || $debug_scalr) {
							print STDERR " == non-constant [$us same reg]";
							print STDERR "\n";
						}
					}
					else {
						if ($debug_subst || $debug_scalr) {
							print STDERR " == non-constant [$us regs]";
							print STDERR "\n";
						}

						$dos = 0;
						$scl = "q";
					}
				}
				elsif ($us == 1) {
					# we have to wait a lot of passes to not produce this:
					#
					# a = 1 / length;
					# b = c / a;
					# d = e / a;
					if (($sbst =~ /^([^a-zA-Z]+)([INOUT.]+)([][a-zA-Z0-9_-]+)\.([xyzwrgba]+)$/)) {
						if ($debug_subst || $debug_scalr) {
							print STDERR " == singular input [$us regs]";
							print STDERR "\n";
						}
					}
					# delay this until the last pass for better source
					elsif (($sbst =~ /^1\.0 \/ length\(.*\)$/) && ($lastpass > 0)) {
						$len = 0;
						if ($debug_subst || $debug_scalr) {
							print STDERR " == singular register [$us regs]";
							print STDERR "\n";
						}
					}
					elsif (($sbst =~ /^([INOUT.]*[][a-zA-Z0-9_-]+)\.([xyzwrgba]+)$/)) {
						if ($debug_subst || $debug_scalr) {
							print STDERR " == singular register [$us regs]";
							print STDERR "\n";
						}
					}
					elsif (($u <= 2) && ($pass >= 4)) {
						if ($debug_subst || $debug_scalr) {
							print STDERR " == modified by constant [$us regs]";
							print STDERR "\n";
						}
					}
					else {
						if ($debug_subst || $debug_scalr) {
							print STDERR " == modified by constant [$us regs]";
							print STDERR "\n";
						}

						$dos = 0;
						$scl = "q";
					}
				}
				else {
					if ($debug_subst || $debug_scalr) {
						print STDERR " == constant";
						print STDERR "\n";
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

		$ln = ((length $frst =~ / = (.*);/) + (length $sbst));

		# don't double functions
		if ($line =~ /sqr\(sqr/) {
			$dos = 0;
			$scl = "q";
		}
		if ($line =~ /saturate\(saturate/) {
			$dos = 0;
			$scl = "q";
		}
		if ($line =~ /1 - saturate\(/) {
			$dos = 0;
			$scl = "q";
		}
		if ($line =~ /pow\(abs\(saturate\(dot\(/) {
			$dos = 0;
			$scl = "q";
		}
		if ($line =~ /pow\(abs\(shades\(reflect\(/) {
			$dos = 0;
			$scl = "q";
		}
		# don't substitute the matrix-variables, the vector is okay
		if ($frst =~ /mul\(float.x.\([^()]*$reg\.$msk[^()]*\), /) {
			$dos = 0;
			$scl = "q";
		}
		# delay substitutions into dot() until last pass
		if ($frst =~ /dot\([^()]*$reg\.$msk[^()]*\)/) { if ($pass < 6) {
			$dos = 0;
			$scl = "q";
		}}
		# don't substitute writes to IN
		if ($frst =~ /^ +IN\./) {
			$dos = 0;
			$scl = "q";
		}
		# don't substitute reads from tex
		if ($sbst =~ /tex(2D|CUBE|proj)/) {
			$dos = 0;
			$scl = "t";
		}
		# don't into muls
	#	if ($sbst =~ /mul\(/) {
		if ($sbst =~ /float[0-9]x[0-9]/) {
			$dos = 0;
			$scl = "m";
		}
		# don't create big offset-lines
		if (($ln > 40) && ($sbst =~ /offset/)) {
			$dos = 0;
			$scl = "q";
		}
		# don't substitute monsters
		if (($ln > 80)) {
		#	if (!(($frst =~ /Alpha/) || ($frst =~ /Fog/))) {
			$dos = 0;
			$scl = "q";
		}

		# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		if ($dos) {
			# copy, we may jump out
			my @copied = @shader;

			# ------------------------------------------------------
			if ($debug_subst) {
				print STDERR "$reg.$msk";
				print STDERR " * $u";
				print STDERR " == $sbst [$p to $s]";
				print STDERR "\n";
			}

			$pi = $p;
			$pt = 0;

			while ($p++ < $s) {
				$prev = $copied[$p];
				$lhit =~ m/([INOUT.]*[][a-z0-9_]+)\.([argbxyzw]+)/;
				$reg = $1;
				$msk = $2;

				if ($prev eq "") {
					next;	}

				# ----------------------------------------------
			   	$tt = 0;
			   	if ($prev =~ / = (.*)$reg\.$msk(.*)/) {
					if ($debug_subst) {
			   			print STDERR "$reg.$msk";
			   			print STDERR " == $prev";
			   		}

					$prev =~ m/(.*) = (.*);(.*)/s;
					$preva = $1;
					$prevb = $2;
					$prevc = $3;

					# may contain multiple forms multiple times
					if ($prevb =~ /$reg\.$msk/) {
						$prevx = $prevb;
						$prevb =~ s/([^a-zINOUT0-9_]|^)$reg\.$msk([^argbxyzw]|$)/$1placeholder$2/gs;

						# case "...(r0.w)..."
						if ($sbst =~ /^([a-z]+)\((.*)\)$/) {
							$prevb =~ s/placeholder/$sbst/g;
						}
						# case "... = 1.0;"
						if ($sbst =~ /^[e0-9.\-]+$/) {
							$prevb =~ s/placeholder/$sbst/g;
						}
						# case "... = r0.w;"
						if ($sbst =~ /^[^ ,()]+$/) {
							$prevb =~ s/placeholder/$sbst/g;
						}
						# case "... = r0.w;"
						if ($prevb =~ /^placeholder$/) {
							# protect the trigraph
							if ($sbst =~ /.*\?.*\:.*/) {
								$prevb = "(" . $sbst . ")";
							}
							else {
								$prevb = $sbst;
							}
						}
						# case "offset.w = ...(r0.w)"
						if ($prevb =~ /\(placeholder\)/) {
							$prevb =~ s/\(placeholder\)/($sbst)/g;
						}
						# case "offset.w = ...(r0.w, ...)"
						if ($prevb =~ /\(placeholder,/) {
							$prevb =~ s/\(placeholder,/($sbst,/g;
						}
						# case "offset.w = ...(..., r0.w)"
						if ($prevb =~ /, placeholder\)/) {
							$prevb =~ s/, placeholder\)/, $sbst)/g;
						}
						# case "offset.w = ...(..., r0.w, ...)"
						if ($prevb =~ /, placeholder, /) {
							$prevb =~ s/, placeholder, /, $sbst, /g;
						}
			#			# case "offset.w = (... ? ... : r0.w)"
			#			if ($prevb =~ /: placeholder\)/g) {
			#				$prevb =~ s/: placeholder\)/: $sbst)/g;
			#			}
			#			# case "offset.w = (... ? r0.w : ...)"
			#			if ($prevb =~ /\? placeholder :/g) {
			#				$prevb =~ s/\? placeholder :/? $sbst :/g;
			#			}

						$prevb =~ s/placeholder/($sbst)/g;
						$prevb =~ s/placeholder/($sbst)/g;
	#					$prevb =~ s/placeholder/ = $1s$reg\.$msk/;

						if ($prevx ne $prevb) {
			   				$pt++;
			   				$tt = 1;
						}
					}

					if ($tt) {
						# reunite the fragments
						$prev = $preva . " = " . $prevb . ";" . $prevc;

						if ($debug_subst) {
			   				print STDERR "$reg.$msk";
			   				print STDERR " == $prev";
			   			}

						# optimize
						$prev = str_optimize($prev);

						if ($debug_subst) {
			   				print STDERR "$reg.$msk";
			   				print STDERR " == $prev";
			   			}
			   		}
			   	}

				# well, no substitution means we don't need to do this ...
				if ($tt) {
					$prev =~ /(.*);/;
					if ($len && (length $1 > 120) && !($prev =~ /LightData\[/)) {
						$pt = 0;
						$scl = "q";
						# rename is okay

						if ($debug_subst) {
			   				print STDERR "$reg.$msk";
			   				print STDERR " == too long";
			   			}

						# hard bail out, restore original
						@copied = @shader;
						last;
					}

			#		# optimize
			#		if (!$lastpass) {
			#			$prev = str_optimize($prev);
			#		}

	#				$copied[$p] = $prev . $cmnt;
					$copied[$p] = $prev;
				}
			}

			# well, no substitution means we can't delete this ...
			if ($pt > 0) {
				# tell the system we still have found something
				if (1) {
					$proc++;	}

	#			$copied[$pi] = $prev;
				$copied[$pi] = "";
			}
# print "...\n";
# print "\n";
			@shader = @copied;
		}

		# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		# && !($reg =~ /^q[0-9]+$/s)
		# no if/else/endif crossing allowed
		if ($scl ne "") {
			$dim = length $msk;

			$cnt = 666;
			if ($scl eq "q") {
				$cnt = $sclr++;	}
			if ($scl eq "t") {
				$cnt = $sclr++;	}
			if ($scl eq "x") {
				$cnt = $sclr++;	}
			if ($scl eq "m") {
				$cnt = $sclr++;	}

			if ($dim == 1) {
				$trg = "x";	}
			elsif ($dim == 2) {
				$trg = "xy";	}
			elsif ($dim == 3) {
				$trg = "xyz";	}
			elsif ($dim == 4) {
				$trg = "xyzw";	}

			if ($prev =~ /EyePosition/  ) { $scl = "eye"; }
			if ($prev =~ /EyePos/  ) { $scl = "eye"; }
			if ($prev =~ /LightData/) { $scl = "l"; }
			if ($prev =~ /LightPosition/) { $scl = "lit"; }
			if ($prev =~ /ModelViewProj/) { $scl = "mdl"; }
			if ($prev =~ /WorldViewProj/) { $scl = "wld"; }
			if ($prev =~ /tex2D\(BaseMap/) { $scl = "texel"; }
			if ($prev =~ /tex2D\(NormalMap/) { $scl = "noxel"; }
			if ($prev =~ /texCUBE\(NormalCubeMap/) { $scl = "noxel"; }
			if ($prev =~ /tex2D\(DepthMap/) { $scl = "depth"; }
			if ($prev =~ /tex2D\(AttenuationMap/) { $scl = "att"; }
			if ($prev =~ /tex2D\(AttMap/) { $scl = "att"; }
			if ($prev =~ / \* 0\.04\) - 0\.02\)/) { $scl = "uv"; }
			if ($prev =~ /uvtile/) { $scl = "uv"; }

			if ($reg =~ /$scl[0-9]+/) {
				next;	}

			if ($debug_scalr) {
				print STDERR "$reg.$msk";
				print STDERR " * $u";
				print STDERR " == $scl$cnt.$dim";
				print STDERR "\n";
			}

			# ------------------------------------------------------
			$sbst = "$scl$cnt.$trg";

			$pi = $p;
			$pt = 0;

			while ($p++ < $s) {
				$prev = $shader[$p];
				$lhit =~ m/([INOUT.]*[][a-z0-9_]+)\.([argbxyzw]+)/;
				$reg = $1;
				$msk = $2;

				if ($prev eq "") {
					next;	}

				# ----------------------------------------------
			   	if ($prev =~ / = (.*)$reg\.$msk(.*)/) {
			   		$pt++;

					if ($debug_scalr) {
			   			print STDERR "$reg.$msk";
			   			print STDERR " == $prev";
			   		}

					$prev =~ m/(.*) = (.*);(.*)/s;
					$preva = $1;
					$prevb = $2;
					$prevc = $3;

					# may contain multiple forms multiple times
					if ($prevb =~ /$reg\.$msk/) {
						$prevb =~ s/([^a-zINOUT0-9_]|^)$reg\.$msk([^argbxyzw]|$)/$1placeholder$2/gs;

						$prevb =~ s/placeholder/$sbst/g;
					}

					# reunite the fragments
					$prev = $preva . " = " . $prevb . ";" . $prevc;

					# optimize
				#	$prev = str_optimize($prev);

					if ($debug_scalr) {
			   			print STDERR "$reg.$msk";
			   			print STDERR " == $prev";
			   		}

					# tell the system we still have found something
					if (($shader[$p] ne $prev) && (($pass & 2) || !$pass) && !$lastpass) {
						$proc++;	}

					$shader[$p] = $prev;
				}
			}

			# well, no substitution means we can't delete this ...
			if ($pt > 0) {
			   	if ($line =~ /(.*)$reg\.$msk(.*) = /) {

					if ($debug_scalr) {
			   			print STDERR "$reg.$msk";
			   			print STDERR " == $line";
			   		}

					$line =~ m/(.*) = (.*);(.*)/s;
					$linea = $1;
					$lineb = $2;
					$linec = $3;

					# may contain multiple forms multiple times
					if ($linea =~ /$reg\.$msk/) {
						$linea =~ s/([^a-zINOUT0-9_]|^)$reg\.$msk([^argbxyzw]|$)/$1placeholder$2/gs;

						$linea =~ s/placeholder/$sbst/g;
					}

					# reunite the fragments
					$line = $linea . " = " . $lineb . ";" . $linec;

					# optimize
				#	$line = str_optimize($line);

					if ($debug_scalr) {
			   			print STDERR "$reg.$msk";
			   			print STDERR " == $line";
			   		}

					# tell the system we still have found something
					if (($shader[$pi] ne $line) && (($pass & 2) || !$pass) && !$lastpass) {
						$proc++;	}

					$shader[$pi] = $line;
				}
			}
		}
	}
}

# print "-----------------------------------------------------------------\n";
# print @shader;

# third pass (substitutions) --------------------------------------------------------
if (!$proc && $lastpass) {
	$snb = scalar(@shader);
	$lnb = 0;

	for ($lnb = $snb - 1; $lnb >= 0; $lnb--) {
		$prev = $shader[$lnb];

		if ($prev =~ /^ *$/) {
			next;	}
		if (length $prev <= 2) {
			next;	}

		$prev = str_optimize($prev);

		# tell the system we still have found something
		if ($shader[$lnb] ne $prev) {
			$proc++;	}

		$shader[$lnb] = $prev;
	}
}

print STDERR "pass $pass sorting ...                          \r";

# third pass (sorting) --------------------------------------------------------
my @sorted = @shader;
@shader = ();
$snb = scalar(@sorted);
$lnb = 0;
$dir = ($pass & 1);

# print "count $snb\n";

for ($lnb = $snb - 1; $lnb >= 0; $lnb--) {
	if (!$dir) {
		$line = $sorted[             $lnb];	}
	else {
		$line = $sorted[($snb - 1) - $lnb];	}

	if ($line =~ /^ *$/) {
		next;	}
	if (length $line <= 2) {
		next;	}

	$s = scalar(@shader);
	$p = 0;

	if (!$dir) {
		$x = 0;		}
	else {
		$x = $s;	}

	while ($p < $s) {
		if (!$dir) {
			$prev = $shader[           $p];	}
		else {
			$prev = $shader[($s - 1) - $p];	}

		$prev =~ m/([INOUT.]*[][a-z0-9_.]+) = (.*);/;
		$pras = $1;
		$phit = $1;
		$psrt = $2;
		$line =~ m/([INOUT.]*[][a-z0-9_.]+) = (.*);/;
		$lias = $1;
		$lhit = $1;
		$lsrt = $2;

		if ($debug_sorts) {
		#	print "compare\n";
		#	print "   ";
		#	print $line;
		#	print "   ";
		#	print $prev;
		#	print " = ";
		}

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
		if ($pras =~ m/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/) {
			# r0.x -> r0|r0.xyzw|r0.yzx|...
			$pras = "$1\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$pran = "$1([^.])";
		}
		else {
			# r0 -> r0|r0.xyzw
			$pras = "$pras\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$pran = "$pras([^.])";
		}

		if ($lias =~ m/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/) {
			# r0.x -> r0|r0.xyzw|r0.yzx|...
			$lias = "($1)\.([a-z]*[$2]+[a-z]*)([^a-zINOUT0-9_.]*)";
			$lian = "$1([^.])";
		}
		else {
			# r0 -> r0|r0.xyzw
			$lias = "$lias\.([a-z]*)([^a-zINOUT0-9_.]*)";
			$lian = "$pras([^.])";
		}

		# check for reassignment or dependency (barrier)
		if (($line =~ /(.*)$pras(.*) = /) || ($line =~ /(.*)$pran(.*) = /) ||
		    ($line =~ / = (.*)$pras(.*)/) || ($line =~ / = (.*)$pran(.*)/)) {
		    	last;
		}

		# check for reassignment or dependency (barrier)
		if (($prev =~ /(.*)$lias(.*) = /) || ($prev =~ /(.*)$lian(.*) = /) ||
		    ($prev =~ / = (.*)$lias(.*)/) || ($prev =~ / = (.*)$lian(.*)/)) {
		    	last;
		}

		# do twice sorting (this means also twice as many passes)
		# that is because the sorting may block substitution, and we shuffle the
		# code-block a little to get that chance to
		# special sort OUT > r0
		# special sort IN < r0
	#	if ((!($prev =~ /^ *OUT/)) && ($line =~ /^ *OUT/)) {
	#		$x = $p + 1;
	#	#	next;
	#	}

		# create better sorting by sorting first without masks
		$llft = $lhit;
		$llft =~ s/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/$1/gs;
		$plft = $phit;
		$plft =~ s/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/$1/gs;

		$lrgt = $lsrt;
		$lrgt =~ s/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/$1/gs;
		$prgt = $psrt;
		$prgt =~ s/([INOUT.]*[][a-z0-9_]+)\.([a-z]+)/$1/gs;

		# hold OUT together
		if (($prev =~ /^ *OUT/) && ($line =~ /^ *OUT/)) {
			if ($lastpass) {
				if (!$dir) {
					if ($llft ge $plft) {
						$x = $p + 1;	}
					last;
				}
				else {
					if ($llft le $plft) {
						$x = ($s - 1) - $p;	}
					last;
				}

			#	if ($llft eq $plft) {
			#		if (!$dir) {
			#			$x = $p + 1;	}
			#		else {
			#			$x = ($s - 1) - $p;	}
                        #
			#		last;
			#	}
			}

			if (!$dir) {
				if ($line ge $prev) {
					$x = $p + 1;	}
			}
			else {
				if ($line le $prev) {
					$x = ($s - 1) - $p;	}
			}

			if (!$lastpass) {
				if ($llft eq $plft) {
					last;
				}
			}
		}

		elsif ($lastpass) {
			if ($lrgt eq $prgt) {
				if (!$dir) {
					$x = $p + 1;	}
				else {
					$x = ($s - 1) - $p;	}

				if (!($lastpass & 1)) {
					last;
				}
			}
			elsif ($lrgt gt $prgt) {
				if (!$dir) {
					$x = $p + 1;	}
				else {
					$x = ($s - 1) - $p;	}
			}
		}
		elsif ($pass >= 4) {
			if ($llft eq $plft) {
				if (!$dir) {
					$x = $p + 1;	}
				else {
					$x = ($s - 1) - $p;	}
			}
		}
		elsif ($pass >= 0) {
			if ($line ge $prev) {
				if (!$dir) {
					$x = $p + 1;	}
				else {
					$x = ($s - 1) - $p;	}
			}
		}

	#	if ($llft eq $plft) {
	#		if ($lhit gt $phit) {
	#			$x = $p + 1;
	#		}
	#	}

	#	elsif ($lastpass & 2) {
	#		# shuffle
	#	#	if ($line gt $prev) {
	#		if (($lgen gt $pgen) || (($lgen eq $pgen) && ($lsrt gt $psrt))) {
	#	#	if ($lgen gt $pgen) {
	#			if ($debug_sorts) {
	#				print "less\n";
	#			}
        #
	#			$x = $p;
	#			last;
	#		#	next;
	#		}
	#		else {
	#			if ($debug_sorts) {
	#				print "greater\n";
	#			}
	#		}
	#	}
	#	elsif ($lastpass) {
	#		# sort
	#	#	if ($line gt $prev) {
	#		if (($lgen gt $pgen) || (($lgen eq $pgen) && ($lsrt gt $psrt))) {
	#	#	if ($lgen gt $pgen) {
	#			if ($debug_sorts) {
	#				print "greater\n";
	#			}
        #
	#			$x = $p + 1;
	#		#	next;
	#		}
	#		else {
	#			if ($debug_sorts) {
	#				print "less\n";
	#			}
	#		}
	#	}
	#	elsif (($pass & 2) || !$pass) {
	#		# create better sorting by sorting first without registers
	#		# but do this only after the matrix-detectors are done (pass >= 4)
	#		$lgen = $line;
	#		$pgen = $prev;
        #
	#		# shuffle
	#	#	if ($line gt $prev) {
	#		if (($lgen gt $pgen) || (($lgen eq $pgen) && ($line gt $prev))) {
	#	#	if ($lsrt lt $psrt) {
	#			if ($debug_sorts) {
	#				print "less\n";
	#			}
        #
	#			$x = $p;
	#			last;
	#		#	next;
	#		}
	#		else {
	#			if ($debug_sorts) {
	#				print "greater\n";
	#			}
	#		}
	#	}
	#	else {
	#		# create better sorting by sorting first without registers
	#		# but do this only after the matrix-detectors are done (pass >= 4)
	#		$lgen = $line;
	#		$pgen = $prev;
        #
	#		# sort
	#	#	if ($line gt $prev) {
	#		if (($lgen gt $pgen) || (($lgen eq $pgen) && ($line gt $prev))) {
	#	#	if ($lsrt lt $psrt) {
	#			if ($debug_sorts) {
	#				print "greater\n";
	#			}
        #
	#			$x = $p + 1;
	#		#	next;
	#		}
	#		else {
	#			if ($debug_sorts) {
	#				print "less\n";
	#			}
	#		}
	#	}

		$p++;
	}

# print "-----------------------------------------------------------------\n";
# print "move line $lnb to $p\n";

	if (!$dir) {
		$s = scalar(@shader);

		while (--$s >= $x) {
			$shader[$s + 1] = $shader[$s];
		}

		$shader[$x] = $line;
	}
	else {
		$s = scalar(@shader);

		while (--$s >= $x) {
			$shader[$s + 1] = $shader[$s];
		}

		$shader[$x] = $line;
	}
}

# print @shader;
# print "\n";

# print "-----------------------------------------------------------------";

	# OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
	# OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
	# OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
	# OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
	#
	# r0.w = dot(IN.texcoord_5.xyzw, r1.xyzw);
	# r0.z = dot(IN.texcoord_4.xyzw, r1.xyzw);
	# r0.y = dot(IN.texcoord_3.xyzw, r1.xyzw);
	# r0.x = dot(IN.texcoord_2.xyzw, r1.xyzw);
	#
	# =>
	#
	# OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
	if ($pass >= 0) {

	$s = scalar(@shader);
	while (--$s >= 3) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];
		$line2 = $shader[$s - 2];
		$line3 = $shader[$s - 3];

		if ($line3 =~ /([INOUT.]*[][a-z0-9_]+)\.w = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyzw, ([][a-zA-Z0-9_]+)\.xyzw\);/) {
			$w = $2; $v = $1; $m = $3;
		if ($line2 =~ /$v\.x = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyzw, $m\.xyzw\);/) {
			$x = $1;
		if ($line1 =~ /$v\.y = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyzw, $m\.xyzw\);/) {
			$y = $1;
		if ($line0 =~ /$v\.z = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyzw, $m\.xyzw\);/) {
			$z = $1;
			$line0 =~ /^( +)/;

			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "";
			$shader[$s - 3] = "$1$v.xyzw = mul(float4x4($x.xyzw, $y.xyzw, $z.xyzw, $w.xyzw), $m.xyzw);\n";
		}}}}

		if ($line3 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0\]\.xyzw, (.*)\.xyzw\);/) {
		if ($line2 =~ /($1)\.y = dot\(($2)\[1\]\.xyzw, ($3)\.xyzw\);/) {
		if ($line1 =~ /($1)\.z = dot\(($2)\[2\]\.xyzw, ($3)\.xyzw\);/) {
		if ($line0 =~ /($1)\.w = dot\(($2)\[3\]\.xyzw, ($3)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "";

			if (isMatrix("float4x4", $2)) {
				$shader[$s - 3] = "    $1.xyzw = mul($2, $3.xyzw);\n";	}
			else {
				$shader[$s - 3] = "    $1.xyzw = mul(float4x4($2\[0\].xyzw, $2\[1\].xyzw, $2\[2\].xyzw, $2\[3\].xyzw), $3.xyzw);\n";	}
		}}}}

		if ($line3 =~ /([INOUT.]*[][a-z0-9_]+)\.w = dot\((.*)\[3\]\.xyzw, (.*)\.xyzw\);/) {
		if ($line2 =~ /($1)\.x = dot\(($2)\[0\]\.xyzw, ($3)\.xyzw\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[1\]\.xyzw, ($3)\.xyzw\);/) {
		if ($line0 =~ /($1)\.z = dot\(($2)\[2\]\.xyzw, ($3)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "";

			if (isMatrix("float4x4", $2)) {
				$shader[$s - 3] = "    $1.xyzw = mul($2, $3.xyzw);\n";	}
			else {
				$shader[$s - 3] = "    $1.xyzw = mul(float4x4($2\[0\].xyzw, $2\[1\].xyzw, $2\[2\].xyzw, $2\[3\].xyzw), $3.xyzw);\n"; }
		}}}}

		if ($line3 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0 [+] (.*)\]\.xyzw, (.*)\.xyzw\);/) {
		if ($line2 =~ /($1)\.y = dot\(($2)\[1 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
		if ($line1 =~ /($1)\.z = dot\(($2)\[2 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
		if ($line0 =~ /($1)\.w = dot\(($2)\[3 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "";
			$shader[$s - 3] = "    $1.xyzw = mul(float4x4($2\[0 + $3\].xyzw, $2\[1 + $3\].xyzw, $2\[2 + $3\].xyzw, $2\[3 + $3\].xyzw), $4.xyzw);\n";
		}}}}

		if ($line3 =~ /([INOUT.]*[][a-z0-9_]+)\.w = dot\((.*)\[3 [+] (.*)\]\.xyzw, (.*)\.xyzw\);/) {
		if ($line2 =~ /($1)\.x = dot\(($2)\[0 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[1 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
		if ($line0 =~ /($1)\.z = dot\(($2)\[2 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "";
			$shader[$s - 3] = "    $1.xyzw = mul(float4x4($2\[0 + $3\].xyzw, $2\[1 + $3\].xyzw, $2\[2 + $3\].xyzw, $2\[3 + $3\].xyzw), $4.xyzw);\n";
		}}}}
	}
	}

	# r9.z = dot(r5.xyz, r8.xyz);
	# r9.y = dot(r6.xyz, r8.xyz);
	# r9.x = dot(r4.xyz, r8.xyz);
	# r0.x = dot(r4.xyz, LightData[1].xyz);
	# r0.y = dot(r7.xyz, LightData[1].xyz);
	# r0.z = dot(r6.xyz, LightData[1].xyz);
	# r1.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
	# r1.z = dot(IN.normal.xyz, LightDirection[0].xyz);
	# r1.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
	# OUT.texcoord_1.x = dot(q22.xyz, SkinToCubeSpace[0].xyz);
	# OUT.texcoord_1.z = dot(q3.xyz, SkinToCubeSpace[0].xyz);
	# OUT.texcoord_1.y = dot(q2.xyz, SkinToCubeSpace[0].xyz);
	# r1.x = dot(Bones[0 + offset.y], r0.xyzw);
	# r1.y = dot(Bones[1 + offset.y], r0.xyzw);
	# r1.z = dot(Bones[2 + offset.y], r0.xyzw);
	# r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
	# r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
	# r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
	# r10.y = dot(r7.xyz, r1.xyz);
	# r10.z = dot(r6.xyz, r1.xyz);
	# r10.x = dot(r4.xyz, r1.xyz);
	# r5.y = dot(q8.xyz, IN.texcoord_3.xyz);
	# r5.x = dot(q8.xyz, IN.texcoord_2.xyz);
	# q9.x = dot(q8.xyz, IN.texcoord_1.xyz);

	#
	# =>
	#
	# r9.xyz = mul(float3x3(r4.xyz, r6.xyz, r5.xyz), r8.xyz);
	if ($pass >= 2) {

	$s = scalar(@shader);
	while (--$s >= 2) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];
		$line2 = $shader[$s - 2];

		if ($line2 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyz, ([][a-zA-Z0-9_]+)\.xyz\);/) {
			$x = $2; $v = $1; $m = $3;
		if ($line1 =~ /$v\.y = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyz, $m\.xyz\);/) {
			$y = $1;
		if ($line0 =~ /$v\.z = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyz, $m\.xyz\);/) {
			$z = $1;
			$line0 =~ /^( +)/;

			$shader[$s - 0] = "";
			$shader[$s - 1] = "";

			if (($x eq "IN.tangent") && ($y eq "IN.binormal") && ($z eq "IN.normal")) {
				$shader[$s - 2] = "$1$v.xyz = mul(TanSpaceProj, $m.xyz);\n"; $hasTSM = 1;	}
		#	elsif (isMatrix("float3x3", "TanSpaceProj")) {
		#		$shader[$s - 2] = "$1$v.xyz = mul(TanSpaceProj, $m.xyz);\n";	}
			else {
				$shader[$s - 2] = "$1$v.xyz = mul(float3x3($x.xyz, $y.xyz, $z.xyz), $m.xyz);\n";	}
		}}}

		if ($line2 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyz, ([][a-zA-Z0-9_]+)\[([0-9]+)\]\.xyz\);/) {
			$x = $2; $v = $1; $m = $3; $n = $4;
		if ($line1 =~ /$v\.y = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyz, $m\[$n\]\.xyz\);/) {
			$y = $1;
		if ($line0 =~ /$v\.z = dot\(([INOUT.]*[][a-zA-Z0-9_]+)\.xyz, $m\[$n\]\.xyz\);/) {
			$z = $1;
			$line0 =~ /^( +)/;

			$shader[$s - 0] = "";
			$shader[$s - 1] = "";

			if (($x eq "IN.tangent") && ($y eq "IN.binormal") && ($z eq "IN.normal")) {
				$shader[$s - 2] = "$1$v.xyz = mul(TanSpaceProj, $m\[$n\].xyz);\n"; $hasTSM = 1;	}
			else {
				$shader[$s - 2] = "$1$v.xyz = mul(float3x3($x.xyz, $y.xyz, $z.xyz), $m\[$n\].xyz);\n";	}
		}}}

		if ($line2 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0\]\.xyz, ([INOUT.]*[][a-z0-9_]+)\.xyz\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[1\]\.xyz, ($3)\.xyz\);/) {
		if ($line0 =~ /($1)\.z = dot\(($2)\[2\]\.xyz, ($3)\.xyz\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";

			if (isMatrix("float3x3", $2)) {
				$shader[$s - 2] = "    $1.xyz = mul($2, $3.xyz);\n";	}
			else {
				$shader[$s - 2] = "    $1.xyz = mul(float3x3($2\[0\].xyz, $2\[1\].xyz, $2\[2\].xyz), $3.xyz);\n";	}
		}}}

		if ($line2 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0\]\.xyzw, ([INOUT.]*[][a-z0-9_]+)\.xyzw\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[1\]\.xyzw, ($3)\.xyzw\);/) {
		if ($line0 =~ /($1)\.z = dot\(($2)\[2\]\.xyzw, ($3)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "    $1.xyz = mul(float3x4($2\[0\].xyzw, $2\[1\].xyzw, $2\[2\].xyzw), $3.xyzw);\n";
		}}}

		if ($line2 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0 [+] (.*)\]\.xyz, ([INOUT.]*[][a-z0-9_]+)\.xyz\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[1 [+] ($3)\]\.xyz, ($4)\.xyz\);/) {
		if ($line0 =~ /($1)\.z = dot\(($2)\[2 [+] ($3)\]\.xyz, ($4)\.xyz\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "    $1.xyz = mul(float3x3($2\[0 + $3\].xyz, $2\[1 + $3\].xyz, $2\[2 + $3\].xyz), $4.xyz);\n";
		}}}

		if ($line2 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0 [+] (.*)\]\.xyzw, ([INOUT.]*[][a-z0-9_]+)\.xyzw\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[1 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
		if ($line0 =~ /($1)\.z = dot\(($2)\[2 [+] ($3)\]\.xyzw, ($4)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "    $1.xyz = mul(float3x4($2\[0 + $3\].xyzw, $2\[1 + $3\].xyzw, $2\[2 + $3\].xyzw), $4.xyzw);\n";
		}}}
	}
	}

	# r2.x = 1.0 / abs(r2.x);
	# r2.y = 1.0 / abs(r2.y);
	# r2.z = 1.0 / abs(r2.z);
	# r0.z = DecalProjection[0][2].w;
	# r0.y = DecalProjection[0][1].w;
	# r0.x = DecalProjection[0][0].w;
	#
	# =>
	#
	# r2.xyz = 1.0 / abs(r2.xyz);
	if ($pass >= 2) {

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

		if ($line0 =~ /([][a-zINOUT0-9_]+)\.x = ([INOUT.]*[][a-zA-Z0-9_]+)\.w;/) {
			$x = $2; $v = $1;
		if ($line1 =~ /$v\.y = ([INOUT.]*[][a-zA-Z0-9_]+)\.w;/) {
			$y = $1;
		if ($line2 =~ /$v\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.w;/) {
			$z = $1;

			$shader[$s - 0] = "";
			$shader[$s - 1] = "";
			$shader[$s - 2] = "    $v.xyz = float3($x.w, $y.w, $z.w);\n";
		}}}
	}
	}

	# r1.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
	# r1.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
	# r1.y = dot(DecalProjection[0][1].xyz, q44.xyz);
	# r1.x = dot(DecalProjection[0][0].xyz, q44.xyz);
	#
	# =>
	#
	# r1.xy = mul(ModelViewProj, r0.xyzw);
	if ($pass >= 4) {

	$s = scalar(@shader);
	while (--$s >= 1) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];

		if ($line1 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0\]\.xyzw, ([INOUT.]*[][a-z0-9_]+)\.xyzw\);/) {
		if ($line0 =~ /($1)\.y = dot\(($2)\[1\]\.xyzw, ($3)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = mul(float2x4($2\[0\].xyzw, $2\[1\].xyzw), $3.xyzw);\n";
		}}

		if ($line1 =~ /([INOUT.]*[][a-z0-9_]+)\.z = dot\((.*)\[2\]\.xyzw, ([INOUT.]*[][a-z0-9_]+)\.xyzw\);/) {
		if ($line0 =~ /($1)\.w = dot\(($2)\[3\]\.xyzw, ($3)\.xyzw\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.zw = mul(float2x4($2\[2\].xyzw, $2\[3\].xyzw), $3.xyzw);\n";
		}}

		if ($line0 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[0\]\.xyz, ([INOUT.]*[][a-z0-9_]+)\.xyz\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[1\]\.xyz, ($3)\.xyz\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = mul(float2x3($2\[0\].xyz, $2\[1\].xyz), $3.xyz);\n";
		}}

		if ($line0 =~ /([INOUT.]*[][a-z0-9_]+)\.x = dot\((.*)\[([0-9]+)\]\[0\]\.xyz, ([INOUT.]*[][a-z0-9_]+)\.xyz\);/) {
		if ($line1 =~ /($1)\.y = dot\(($2)\[($3)\]\[1\]\.xyz, ($4)\.xyz\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = mul(float2x3($2\[$3\]\[0\].xyz, $2\[$3\]\[1\].xyz), $4.xyz);\n";
		}}
	}
	}

	# OUT.texcoord_6.z = r0.x * r0.w;
	# OUT.texcoord_6.w = (r0.y * -r0.w) + 1;
	#
	# OUT.texcoord_7.z = r2.x / ShadowProjData.w;
	# OUT.texcoord_7.w = 1 - (r2.y / ShadowProjData.w);
	#
	# =>
	#
	# OUT.texcoord_6.zw = (r0.xy * r0.w) * float2(1, -1) + float2(0, 1);

	$s = scalar(@shader);
	while (--$s >= 2) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];
		$line2 = $shader[$s - 2];

		if ($line1 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \* ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line0 =~ /($1)\.w = \(($2)\.y \* -($3)\.($4)\) [+] 1;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.zw = ($2.xy * $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}

		if ($line0 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \* ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line2 =~ /($1)\.w = \(($2)\.y \* -($3)\.($4)\) [+] 1;/) {
			$shader[$s - 0] = "";
			$shader[$s - 2] = "    $1.zw = ($2.xy * $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}

		if ($line1 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \* ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line0 =~ /($1)\.w = 1 - \(($2)\.y \* -($3)\.($4)\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.zw = ($2.xy * $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}

		if ($line0 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \* ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line2 =~ /($1)\.w = 1 - \(($2)\.y \* -($3)\.($4)\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 2] = "    $1.zw = ($2.xy * $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}

		# ------------------------
		if ($line1 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \/ ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line0 =~ /($1)\.w = \(($2)\.y \/ -($3)\.($4)\) [+] 1;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.zw = ($2.xy * $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}

		if ($line1 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \/ ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line0 =~ /($1)\.w = 1 - \(($2)\.y \/ ($3)\.($4)\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.zw = ($2.xy * $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}

		if ($line0 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \/ ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line2 =~ /($1)\.w = \(($2)\.y \/ -($3)\.($4)\) [+] 1;/) {
			$shader[$s - 0] = "";
			$shader[$s - 2] = "    $1.zw = ($2.xy / $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}

		if ($line0 =~ /([INOUT.]*[][a-zA-Z0-9_]+)\.z = ([INOUT.]*[][a-zA-Z0-9_]+)\.x \/ ([INOUT.]*[][a-zA-Z0-9_]+)\.([xyzw]);/) {
		if ($line2 =~ /($1)\.w = 1 - \(($2)\.y \/ ($3)\.($4)\);/) {
			$shader[$s - 0] = "";
			$shader[$s - 2] = "    $1.zw = ($2.xy / $3.$4) * float2(1, -1) + float2(0, 1);\n";
		}}
	}

	# r2.x = 1.0 / AlphaParam.y;
	# r2.y = 1.0 / AlphaParam.w;
	#
	# =>
	#
	# r2.xy = 1.0 / AlphaParam.yw;

	# r0.x = (PSDecalOffsets.y * r0.x) + PSDecalOffsets.x;
	# r0.y = (PSDecalOffsets.w * r0.y) + PSDecalOffsets.z;
	#
	# =>
	#
	# r0.xy = (PSDecalOffsets.yw * r0.xy) + PSDecalOffsets.xz;

	# r0.x = IN.texcoord_1.z;
	# r0.y = IN.texcoord_1.w;

	# r4.x = IN.texcoord_7.z + Scroll.x;
	# r4.y = IN.texcoord_7.w + Scroll.y;

	# r1.y = r4.y;
	# r5.x = r4.x;

	$s = scalar(@shader);
	while (--$s >= 1) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];

		if ($line1 =~ /([][a-zINOUT0-9_]+)\.x = 1\.0 \/ AlphaParam\.y;/) {
		if ($line0 =~ /($1)\.y = 1\.0 \/ AlphaParam\.w;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = 1.0 / AlphaParam.yw;\n";
		}}

		if ($line1 =~ /([][a-zINOUT0-9_]+)\.x = \(PSDecalOffsets.y \* \1\.x\) \+ PSDecalOffsets\.x;/) {
		if ($line0 =~ /($1)\.y = \(PSDecalOffsets.w \* \1\.y\) \+ PSDecalOffsets\.z;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = (PSDecalOffsets.yw * $1.xy) + PSDecalOffsets.xz;\n";
		}}

		if ($line1 =~ /([][a-zINOUT0-9_]+)\.x = ([INOUT.]*[][a-z0-9_]+)\.z;/) {
		if ($line0 =~ /($1)\.y = ($2)\.w;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = $2.zw;\n";
		}}

		if ($line1 =~ /([][a-zINOUT0-9_]+)\.x = ([INOUT.]*[][a-z0-9_]+)\.z \+ ([INOUT.]*[][a-zA-Z0-9_]+)\.x;/) {
		if ($line0 =~ /($1)\.y = ($2)\.w \+ ($3)\.y;/) {
			$shader[$s - 0] = "";
			$shader[$s - 1] = "    $1.xy = $2.zw + $3.xy;\n";
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
	# r0.xy = EyeVector.xy * EyeVector.xy;
	# r2.w = 1.0 / sqrt(r0.y + r0.x);
	#
	# =>
	#
	# r2.xy = normalize(r2.xy);

	$s = scalar(@shader);
	while (--$s >= 1) {
		$line0 = $shader[$s - 0];
		$line1 = $shader[$s - 1];

		# these conversions ARE dangerous!
		if (($line1 =~ /([][a-zINOUT0-9_]+)\.xy = ([][a-zA-Z0-9_]+)\.xy \* \2\.xy;/) ||
		    ($line1 =~ /([][a-zINOUT0-9_]+)\.xy = sqr\(([][a-zA-Z0-9_]+)\.xy\);/)) {
			$a = $1; $b = $2;
			# simple ones ------------------------------------
			if ($line0 =~ /([][a-zINOUT0-9_]+)\.w = 1\.0 \/ sqrt\(($a)\.y [+] ($a)\.x\);/) {
				$shader[$s - 0] = "";
				$shader[$s - 1] = "    $1.w = 1.0 / length($b.xy);\n";
			}
			elsif ($line0 =~ /($b)\.xy = ($b)\.xy \/ sqrt\(($a)\.y [+] ($a)\.x\);/) {
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
				$shader[$s - 0] =~ s/ShadowProjData\.x - sqrt\(($a)\.y [+] ($a)\.x\)/ShadowProjData\.x - length\($b\.xy\)/;
			}
		}
	}

# $snb = scalar(@shader);
# print "result $snb\n";
# print "sorted\n";

# end of double-pass --------------------------------------------
	# we haven't found anything
	if (($pass >= 6) && ($pass & 1)) {
		if (!$proc) {
			if ($lastpass <= 1) {
				$lastpass++;
			}
			else {
				last;
			}
		}
	}

# print "$proc -----------------------------------------------------------------\n";
# print @shader;
}

print STDERR "finishing ...                          \r";

my %_cnst = ();

$bse = "";
$snb = scalar(@shader);
$lnb = 0;
for ($lnb = 0; $lnb < $snb; $lnb++) {
	$line = $shader[$lnb];

	# conds ------------------------------------------------------------
	$line =~ s/( +)if_ne (.*), (.*)/\n$1if ($2 != $3) {/;
	$line =~ s/( +)if_lt (.*), (.*)/\n$1if ($2 != $3) {/;
	$line =~ s/( +)else/$1}\n$1else {/;
	$line =~ s/endif/}\n/;

	# notes ------------------------------------------------------------
	if ($line =~ /mul\(float3x3\(([^()]*)\.xyz, ([^()]*)\.xyz, ([^()]*)\.xyz\), EyePosition.xyz - IN\.([^()]*)\.xyz\);/) {
		$line =~ s/mul\((.*), EyePosition\.xyz - IN\.([^()]*)\.xyz\);/mul\(TanSpaceProj, EyePosition.xyz - IN.$2.xyz\);/;

		push(@defins, "#define\tTanSpaceProj\t$1\n");
	}

	if ($line =~ /mul\(float3x3\(([^()]*)\.xyz, ([^()]*)\.xyz, ([^()]*)\.xyz\), LightData([^()]*)\.xyz\);/) {
		$line =~ s/mul\((.*), LightData([^()]*)\.xyz\);/mul\(TanSpaceProj, LightData$2.xyz\);/;

		push(@defins, "#define\tTanSpaceProj\t$1\n");
	}

#	# case "2 * (r0.xyz - 0.5)"
#	if ($line =~ /2 \* \(.* - 0\.5\)/) {
#		if (!($line =~ / to /)) {
#			$line =~ s/$/$1\t\/\/ [0,1] to [-1,+1]/;
#		}
#	}
#	# case "(r0.xyz - 0.5) * 2"
#	if ($line =~ /\(.* - 0\.5\) \* 2/) {
#		if (!($line =~ / to /)) {
#			$line =~ s/$/$1\t\/\/ [0,1] to [-1,+1]/;
#		}
#	}
#	# case "(0.5 * r0.xyz) + 0.5"
#	if ($line =~ /\(0\.5 \* (.*)\) \+ 0\.5/) {
#		if (!($line =~ / to /)) {
#			$line =~ s/$/$1\t\/\/ [-1,+1] to [0,1]/;
#		}
#	}
#	# case "(r0.xyz * 0.5) + 0.5"
#	if ($line =~ /\((.*) \* 0\.5\) \+ 0\.5/) {
#		if (!($line =~ / to /)) {
#			$line =~ s/$/$1\t\/\/ [-1,+1] to [0,1]/;
#		}
#	}
#	# case "(r0.w * 0.04) - 0.02"
#	if ($line =~ /\((.*) \* 0\.04\) - 0\.02/) {
#		if (!($line =~ / to /)) {
#			$line =~ s/$/$1\t\/\/ [-1,+1] to [0,1]/;
#		}
#	}
#	# case "(PI * 2 * (x)) - PI;"
#	if ($line =~ /\(PI \* 2 \* (.*)\) - PI/) {
#		if (!($line =~ / to /)) {
#			$line =~ s/$/$1\t\/\/ [0,1] to [-PI,PI]/;
#		}
#	}
#	# case "((x) * PI * 2) - PI;"
#	if ($line =~ /\((.*) \* PI \* 2\) - PI/) {
#		if (!($line =~ / to /)) {
#			$line =~ s/$/$1\t\/\/ [0,1] to [-PI,PI]/;
#		}
#	}

	# case "max(dot(q0.xyz, normalize(IN.texcoord_3.xyz)), 0)"
	# case "saturate(dot(normalize(expand(r1.xyz)), IN.texcoord_1.xyz))"
	# case "saturate(dot(normalize(q4.xyz), r2.xyz))"
#	if ($line =~ /max\(dot\((.*), (.*)\), 0\)/) {
#	}
#
#	if ($line =~ /saturate\(dot\((.*), (.*)\)\)/) {
#	}
#
#	if ($line =~ /dot\((.*), 1\)/) {
#	}
#
#	if ($line =~ /envreflect/) {
#	}

	# case "sqrt(1.0 - (r1.x * r1.x))"
	if (($line =~ /sqrt\(1.0 - \((.*) \* \1\)\)/) ||
	    ($line =~ /sqrt\(1.0 - sqr\((.*)\)\)/)) {
		if (!($line =~ /arc/)) {
			$line =~ s/$/\t\/\/ arcsin = 1 \/ sqrt(1 - x²)/;
		}
	}

	# case "((...))" -> "(...)"
	$line =~ s/exptwo/exp2/sg;
#	$line =~ s/\((\((?:[^\(\)]++|(?1))*\))\)/$1/s;
#	$line =~ s/ \(([a-z]*\((?:[^\(\)]++|(?1))*\))\)/ $1/s;

	# constants ------------------------------------------------------------
	# eliminate constants which aren't used anymore
	while ($line =~ /(const_[0-9]+)[^0-9]/g) {
		$cnst = $1;
		if (!$_cnst{$cnst}) {
			foreach (@consts) {
				$chk = $_;
				if ($chk =~ /$cnst[^0-9]/) {
					$_cnst{$cnst} = $chk;
				}
			}
		}
	}

	# identifiers ------------------------------------------------------------
	if ($line =~ /tex2D\(([a-zA-Z0-9]+), (.*)\)/) {
		$tmap = $1;
		$coor = $2;
		if ($coor =~ /IN\.([a-zA-Z0-9_]+)\.[xyzw]/) {
			$coor = $1;

			if ($tmap && $coor) {
				if ($tmap eq "Src0") {
					$ialias{$tmap} = "ScreenSpace";
					$identi{$coor} = "ScreenOffset";
				}
				elsif ($tmap eq "Src1") {
					$ialias{$tmap} = "OverlaySpace";
					$identi{$coor} = "OverlayOffset";
				}

				elsif ($tmap eq "BaseMap") {
					$identi{$coor} = "BaseUV";
				}
				elsif ($tmap eq "DiffuseMap") {	if (!$identi{$coor} || ($identi{$coor} eq "NormalUV")) {	$identi{$coor} = "DiffuseUV";	}}
				elsif ($tmap eq "GlowMap") {	if (!$identi{$coor} || ($identi{$coor} eq "NormalUV")) {	$identi{$coor} = "GlowUV";	}}
				elsif ($tmap eq "AnisoMap") {	if (!$identi{$coor} || ($identi{$coor} eq "NormalUV")) {	$identi{$coor} = "AnisoUV";	}}
				elsif ($tmap eq "LayerMap") {	if (!$identi{$coor} || ($identi{$coor} eq "NormalUV")) {	$identi{$coor} = "LayerUV";	}}
				elsif ($tmap eq "HeightMap") {	if (!$identi{$coor}) {	$identi{$coor} = "HeightUV";	}}
				elsif ($tmap eq "NormalMap") {	if (!$identi{$coor}) {	$identi{$coor} = "NormalUV";	}}

				elsif ($tmap eq "FaceGenMap") {
					$identi{$coor} = "FaceUV";
				}
				elsif ($tmap eq "FaceGenMap0") {	if (!$identi{$coor}) {	$identi{$coor} = "Face0UV";	}}
				elsif ($tmap eq "FaceGenMap1") {	if (!$identi{$coor}) {	$identi{$coor} = "Face1UV";	}}
				elsif ($tmap eq "FaceGenMap2") {	if (!$identi{$coor}) {	$identi{$coor} = "Face2UV";	}}

			#	elsif (($tmap eq "ShadowMask") || ($tmap eq "ShadowMaskMap") || ($tmap eq "ShadowMap")) {
			#		$identi{$coor} = "ShadowUV";
			#	}
				elsif ($tmap eq "SourceTexture") {
					$identi{$coor} = "SourceUV";
				}
				elsif ($tmap eq "TexMap") {
					$identi{$coor} = "TexUV";
				}
				elsif ($tmap eq "TexMapBlend") {
					$identi{$coor} = "TexBlendUV";
				}
				elsif ($tmap eq "DecalMap") {
					$coor =~ /(_[0-9]+)/;
					$identi{$coor} = "DecalUV" . $1;
				}
				elsif ($tmap eq "Decal2Map") {
					$coor =~ /(_[0-9]+)/;
					$identi{$coor} = "Decal2UV" . $1;
				}
			#	elsif (($tmap eq "AttMap")) {
			#	elsif (($tmap eq "AttenuationMap")) {
			#		$identi{$coor} = "AttenuationUV";
			#	}
			}
		}
	}

	$shader[$lnb] = $line;
}

# last pass (OUT and r0-9) --------------------------------------------------------

my %_regs = ();
my %_ins = ();
my %_outs = ();

foreach (@shader) {
	$line = $_;

	$line =~ m/([INOUT.]*[][a-z0-9_.]+) = /;
	$lias = $1;
	$lhit = $1;

	if ($lias =~ /OUT./) {
		$hasOUT = 1;	}
	if ($lias =~ /([ INOUT.]*)([][a-z0-9_]+)([.argbxyzw]*)/g) {
		$key = $1 . $2;
		$deg = $3;
		$grd = 0;
		if ($deg =~ /([rx]+)/) {	if ($grd < 1) { $grd = 1; }	}
		if ($deg =~ /([gy]+)/) {	if ($grd < 2) { $grd = 2; }	}
		if ($deg =~ /([bz]+)/) {	if ($grd < 3) { $grd = 3; }	}
		if ($deg =~ /([aw]+)/) {	if ($grd < 4) { $grd = 4; }	}
		if ($deg eq "") {		if ($grd < 4) { $grd = 4; }	}

#input_0
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

	while ($line =~ /IN.([][a-z0-9_]+)([.argbxyzw]*)/g) {
		$key = "IN." . $1;
		$deg = $2;
		$grd = 0;
		if ($deg =~ /([rx]+)/) {	if ($grd < 1) { $grd = 1; }	}
		if ($deg =~ /([gy]+)/) {	if ($grd < 2) { $grd = 2; }	}
		if ($deg =~ /([bz]+)/) {	if ($grd < 3) { $grd = 3; }	}
		if ($deg =~ /([aw]+)/) {	if ($grd < 4) { $grd = 4; }	}
		if ($deg eq "") {		if ($grd < 4) { $grd = 4; }	}

		if ($key =~ /([IN]+)/) {
#    r0.xyzw = IN.input_0.xyzw;
			if (!$_ins{$key}) {		$_ins{$key} = $grd;	}
			elsif ($_ins{$key} < $grd) {	$_ins{$key} = $grd;	}
		}
	}
}

my @cns = ();
my @regs = ();
my @ins = ();
my @outs = ();

$r = 0;
foreach $key (sort keys %_cnst) {
	$cn = $_cnst{$key};
	$cns[$r++] = $cn;
}

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
	$nam =~ s/color_([0-9]+)/color_\1 : COLOR\1/s;
	$nam =~ s/input_([0-9]+)/input_\1 : COLOR\1/s;
	$nam =~ s/depth/depth : DEPTH\1/s;
	$nam =~ s/texcoord_([0-9]+)/texcoord_\1 : TEXCOORD\1/s;

	# check against shader-debug info structure (no doubles)
	$in = "float" . $grd . " " . $nam . ";";
	if (grep {$_ =~ /$nam/} @instrc) {
		next;	}

	if ($grd == 1) {
		$out = "float " . $nam . ";";
		if (grep {$_ =~ /$in/} @instrc) {
			next;	}
	}

	$ins[$r++] = "    " . $in . "\n";
}

$o = 0;
foreach $key (sort keys %_outs) {
	$grd = $_outs{$key};
	$nam = $key;
	$nam =~ s/OUT.//;
	$nam =~ s/position/position : POSITION/;
	$nam =~ s/color_([0-9]+)/color_\1 : COLOR\1/s;
	$nam =~ s/input_([0-9]+)/input_\1 : COLOR\1/s;
	$nam =~ s/depth/depth : DEPTH\1/s;
	$nam =~ s/texcoord_([0-9]+)/texcoord_\1 : TEXCOORD\1/s;

	# check against shader-debug info structure (no doubles)
	$out = "float" . $grd . " " . $nam . ";";
	if (grep {$_ =~ /$nam/} @oustrc) {
		next;	}

	if ($grd == 1) {
		$out = "float " . $nam . ";";
		if (grep {$_ =~ /$out/} @oustrc) {
			next;	}
	}

	$outs[$r++] = "    " . $out . "\n";
}

# last pass (IN and const) --------------------------------------------------------

foreach $key (sort keys %identi) {
	$snb = scalar(@shader);
	$lnb = 0;
	for ($lnb = 0; $lnb < $snb; $lnb++) {
		$line = $shader[$lnb];

		$line =~ s/$key/$identi{$key}/g;

		$shader[$lnb] = $line;
	}

	$snb = scalar(@instrc);
	$lnb = 0;
	for ($lnb = 0; $lnb < $snb; $lnb++) {
		$line = $instrc[$lnb];

		$line =~ s/$key/$identi{$key}/g;

		$instrc[$lnb] = $line;
	}

	$snb = scalar(@ins);
	$lnb = 0;
	for ($lnb = 0; $lnb < $snb; $lnb++) {
		$line = $ins[$lnb];

		$line =~ s/$key/$identi{$key}/g;

		$ins[$lnb] = $line;
	}
}

foreach $key (sort keys %ialias) {
	$snb = scalar(@shader);
	$lnb = 0;
	for ($lnb = 0; $lnb < $snb; $lnb++) {
		$line = $shader[$lnb];

		$line =~ s/$key/$ialias{$key}/g;

		$shader[$lnb] = $line;
	}

	$snb = scalar(@prolog);
	$lnb = 0;
	for ($lnb = 0; $lnb < $snb; $lnb++) {
		$line = $prolog[$lnb];

		if ($line =~ /Parameters:/) {
			$line = "#define\t" . $ialias{$key} . "\t" . $key . "\n" . $line;
		}
		else {
			$line =~ s/$key/$ialias{$key}/g;
		}

		$prolog[$lnb] = $line;
	}
}

foreach (@defins) {
	$def = $_;
	$def =~ /^#define\t([a-zA-Z0-9]*)\t(.*)$/;
	$key = $1;
	$sbs = $2;

	$snb = scalar(@shader);
	$lnb = 0;
	for ($lnb = 0; $lnb < $snb; $lnb++) {
		$line = $shader[$lnb];

		$line = str_replace($sbs, $key, $line);

		$shader[$lnb] = $line;
	}
}

# last pass (specific registers) --------------------------------

my %_regp = ();

$snb = scalar(@prolog);
$lnb = 0;
for ($lnb = 0; $lnb < $snb; $lnb++) {
	$line = $prolog[$lnb];

	#//   ReflectionMap   texture_0       1
	if ($line =~ /\/\/ +([a-zA-Z0-9]+) +texture_([0-9]+) +[14]/) {
		$_regp{$1} = " : register(s$2)";
	}
	#//   Scroll          const_0       1
	if ($line =~ /\/\/ +([a-zA-Z0-9]+) +const_([0-9]+) +[14]/) {
		$_regp{$1} = " : register(c$2)";
	}
	#//   ModelViewProj[0]          const_0       1
	if ($line =~ /\/\/ +([a-zA-Z0-9]+)\[0\] +const_([0-9]+) +[14]/) {
		$_regp{$1} = " : register(c$2)";
	}
	#//   DecalProjection[0][0]          const_40       1
	if ($line =~ /\/\/ +([a-zA-Z0-9]+)\[0\]\[0\] +const_([0-9]+) +[14]/) {
		$_regp{$1} = " : register(c$2)";
	}

	$prolog[$lnb] = $line;
}

foreach $key (sort keys %_regp) {
	$snb = scalar(@prolog);
	$lnb = 0;
	for ($lnb = 0; $lnb < $snb; $lnb++) {
		$line = $prolog[$lnb];

		if ($line =~ /$key;/) {
			$line =~ s/$key/$key$_regp{$key}/g;
		}
		if ($line =~ /$key\[([0-9]+)\];/) {
			$line =~ s/$key\[([0-9]+)\]/$key\[$1\]$_regp{$key}/g;
		}
		if ($line =~ /$key\[([0-9]+)\]\[([0-9]+)\];/) {
			$line =~ s/$key\[([0-9]+)\]\[([0-9]+)\]/$key\[$1\]\[$2\]$_regp{$key}/g;
		}

		$prolog[$lnb] = $line;
	}
}

# output --------------------------------------------------------
print @prolog;
print "\n";

if ($type == 0) {
	print "// Structures:\n";
	print "\n";
	print "struct VS_INPUT {\n";
	if (scalar(@instrc) > 0) {
		print @instrc;	}
	if (scalar(@ins) > 0) {
		print @ins;	}
	if ($hasTSM) {
		print "\n#define\tTanSpaceProj\tfloat3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)\n";	}
	print "};\n";
	print "\n";
	print "struct VS_OUTPUT {\n";
	if (scalar(@oustrc) > 0) {
		print @oustrc;	}
	if (scalar(@outs) > 0) {
		print @outs;	}
	if (!$hasOUT) {
		print "    float4 output_0 : COLOR0;\n";	}
	print "};\n";
	print "\n";
	print "// Code:\n";
	print "\n";
	print "VS_OUTPUT main(VS_INPUT IN) {\n";
	print "    VS_OUTPUT OUT;\n";
	print "\n";
}

if ($type == 1) {
	print "// Structures:\n";
	print "\n";
	print "struct VS_OUTPUT {\n";
	if (scalar(@instrc) > 0) {
		print @instrc;	}
	if (scalar(@ins) > 0) {
		print @ins;	}
	if ($hasTSM) {
		print "\n#define\tTanSpaceProj\tfloat3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)\n";	}
	print "};\n";
	print "\n";
	print "struct PS_OUTPUT {\n";
	if (scalar(@oustrc) > 0) {
		print @oustrc;	}
	if (scalar(@outs) > 0) {
		print @outs;	}
	if (!$hasOUT) {
		print "    float4 output_0 : COLOR0;\n";	}
	print "};\n";
	print "\n";
	print "// Code:\n";
	print "\n";
	print "PS_OUTPUT main(VS_OUTPUT IN) {\n";
	print "    PS_OUTPUT OUT;\n";
	print "\n";
}

# defs
if ($hasPI || $hasSIN || $hasCNV || $hasUV || $hasLIT || $hasWGT || $hasREFL) {
	if ($hasSIN) {
		print "#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668\n";
		print "#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5\n";
	}

	if ($hasPI) {
		print "#define	PI			3.14159274\n";	}
	if ($hasCNV && $hasPI) {
		print "#define	anglei(v)		(((v) + PI) / (2 * PI))\n";
		print "#define	angler(v)		(((v) * (2 * PI)) - PI)\n";
		print "#define	fracr(v)		angler(frac(anglei(v)))\t\/\/ signed modulo % PI\n";	}
	if ($hasCNV) {
		print "#define	expand(v)		(((v) - 0.5) / 0.5)\n";
		print "#define	compress(v)		(((v) * 0.5) + 0.5)\n";	}

	if ($hasUV) {
		print "#define	uvtile(w)		(((w) * 0.04) - 0.02)\n";	}
	if ($hasLIT) {
		print "#define	shade(n, l)		max(dot(n, l), 0)\n";
		print "#define	shades(n, l)		saturate(dot(n, l))\n";	}
	if ($hasWGT) {
		print "#define	weight(v)		dot(v, 1)\n";
		print "#define	sqr(v)			((v) * (v))\n";	}
	if ($hasREFL) {
		print "#define	envreflect(i, n)	((2 * dot(i, n)) * (i)) - ((n) * dot(i, i))\n";	}

	print "\n";
}

if (scalar(@cns) > 0) {
	print @cns;
	print "\n";	}
if (scalar(@regs) > 0) {
	print @regs;
	print "\n";	}

if (scalar(@defins) > 0) {
	print @defins;
	print "\n";	}

print @shader;

if (!$hasOUT) {
	print "    OUT.output_0.xyzw = r0.xyzw;\n";
}

print "\n";

print "    return OUT;\n";
print "};\n";
print "\n";

print @epilog;
