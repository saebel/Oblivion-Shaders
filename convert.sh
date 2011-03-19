SED=sed
SFLAGS=

for dis in Disassembly/*.dis; do
  echo $dis
  fle=`basename ${dis}`
  fle=`stripext ${fle}`

  $SED $SFLAGS -f convert.sed <Disassembly/$fle.dis >PseudoC/$fle.hlsl.tmp
  $SED $SFLAGS -e '/^\/\/ \+[][a-zA-Z0-9_]\+ \+[][a-zA-Z0-9_]\+ \+17\?/!d'	\
	       -e 's/^\/\/ \+\([][a-zA-Z0-9_]\+\) \+\([][a-zA-Z0-9_]\+\) \+17\?/s\/\2\/\1\/g/g' <PseudoC/$fle.hlsl.tmp | sort -r >PseudoC/$fle.hlsl.sed
  $SED $SFLAGS -f PseudoC/$fle.hlsl.sed <PseudoC/$fle.hlsl.tmp >PseudoC/$fle.hlsl

  rm -f PseudoC/$fle.hlsl.sed PseudoC/$fle.hlsl.tmp
done
