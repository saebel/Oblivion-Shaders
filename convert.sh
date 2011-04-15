#!/bin/bash

SED=sed
SFLAGS=

for dis in Disassembly/*.dis; do
  fle=`basename ${dis}`
  fle=`stripext ${fle}`

  if [ ! -f PseudoC/$fle.dis ] || [ ! -s PseudoC/$fle.dis ] || [ arrays.sh -nt PseudoC/$fle.dis ] || [ Disassembly/$fle.dis -nt PseudoC/$fle.dis ]; then
  echo prepare $dis
  rm -f PseudoC/$fle.version

    ./arrays.sh Disassembly/$fle.dis PseudoC/$fle.dis

  $SED $SFLAGS -e '/    \([pvs]\+\)_\([0-9]\+\)_\([x0-9]\+\)/!d'			\
	       -e 's/    \([vs]\+\)_\([2]\+\)_\([x]\+\)/VERSION=\1_\2_a/'		\
	       -e 's/    \([ps]\+\)_\([2]\+\)_\([x]\+\)/VERSION=\1_\2_b/'		\
	       -e 's/    \([pvs]\+\)_\([0-9]\+\)_\([0-9]\+\)/VERSION=\1_\2_\3/'		<PseudoC/$fle.dis >PseudoC/$fle.version
  fi

  if [ ! -f PseudoC/$fle.hlsl ] || [ ! -s PseudoC/$fle.hlsl ] || [ convert.sed -nt PseudoC/$fle.hlsl ] || [ PseudoC/$fle.dis -nt PseudoC/$fle.hlsl ] || [ subst.sed -nt PseudoC/$fle.hlsl ]; then
  echo redo $dis
  rm -f PseudoC/$fle.hlsl PseudoC/$fle.hlsl.tmp PseudoC/$fle.hlsl.sed

  $SED $SFLAGS -f convert.sed								<PseudoC/$fle.dis >PseudoC/$fle.hlsl.tmp

  $SED $SFLAGS -e '/input_\([0-9]\+\) : \([A-Z]\+\)\([0-9]\?\).*;/!d'			\
	       -e 's/.*input_\([0-9]\+\) : \([A-Z]\+\)\([0-9]\+\)_centroid;.*/s\/input_\1\\\([^0-9]\\\+\\\)\/IN.\L\2_\3\\ 1\/g/g'	\
	       -e 's/.*input_\([0-9]\+\) : \([A-Z]\+\)\([0-9]\+\);.*/s\/input_\1\\\([^0-9]\\\+\\\)\/IN.\L\2_\3\\ 1\/g/g'	\
	       -e 's/.*input_\([0-9]\+\) : \([A-Z]\+\);.*/s\/input_\1\\\([^0-9]\\\+\\\)\/IN.\L\2\\ 1\/g/g'			\
	       -e 's/ 1/1/g'								<PseudoC/$fle.hlsl.tmp | sort -r  >PseudoC/$fle.hlsl.sed
  $SED $SFLAGS -e '/output_\([0-9]\+\) : \([A-Z]\+\)\([0-9]\?\);/!d'			\
	       -e 's/.*output_\([0-9]\+\) : \([A-Z]\+\)\([0-9]\+\);.*/s\/output_\1\\\([^0-9]\\\+\\\)\/OUT.\L\2_\3\\ 1\/g/g'	\
	       -e 's/.*output_\([0-9]\+\) : \([A-Z]\+\);.*/s\/output_\1\\\([^0-9]\\\+\\\)\/OUT.\L\2\\ 1\/g/g'			\
	       -e 's/ 1/1/g'								<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed

  # correct cube-mapping
  $SED $SFLAGS -e '/samplerCUBE \([a-zA-Z0-9]\+\);/!d'					\
	       -e 's/.*samplerCUBE \([a-zA-Z0-9]\+\);.*/s\/tex2D(\1\/texCUBE(\1\/g/g'	\
	       -e 's/ 1/1/g'								<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed

  # substitute local constants
  $SED $SFLAGS -e '/const \([a-zA-Z0-9]\+\) const_\([0-9]\+\) = {.*,.*};/!d'		\
	       -e 's/.*const_\([0-9]\+\) = {\([^,]\+\), .*};/s\/const_\1.x\\\([^a-z]\\\+\\\)\/\2\\;1\/g/g'	\
	       -e 's/;1/1/g'								\
	       -e 's/ \/ / \\\/ /g'							<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed
  $SED $SFLAGS -e '/const \([a-zA-Z0-9]\+\) const_\([0-9]\+\) = {.*,.*,.*};/!d'		\
	       -e 's/.*const_\([0-9]\+\) = {[^,]\+, \([^,]\+\), .*};/s\/const_\1.y\\\([^a-z]\\\+\\\)\/\2\\;1\/g/g'	\
	       -e 's/;1/1/g'								\
	       -e 's/ \/ / \\\/ /g'							<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed
  $SED $SFLAGS -e '/const \([a-zA-Z0-9]\+\) const_\([0-9]\+\) = {.*,.*,.*,.*};/!d'	\
	       -e 's/.*const_\([0-9]\+\) = {[^,]\+, [^,]\+, \([^,]\+\), .*};/s\/const_\1.z\\\([^a-z]\\\+\\\)\/\2\\;1\/g/g'	\
	       -e 's/;1/1/g'								\
	       -e 's/ \/ / \\\/ /g'							<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed
  $SED $SFLAGS -e '/const \([a-zA-Z0-9]\+\) const_\([0-9]\+\) = {.*,.*,.*,.*};/!d'	\
	       -e 's/.*const_\([0-9]\+\) = {[^,]\+, [^,]\+, [^,]\+, \([^,]\+\)};/s\/const_\1.w\\\([^a-z]\\\+\\\)\/\2\\;1\/g/g'	\
	       -e 's/;1/1/g'								\
	       -e 's/ \/ / \\\/ /g'							<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed

  # substitute global constants
  # //   float3 LightColor[3];
  $SED $SFLAGS -e '/^\/\/ \+[][a-zA-Z0-9_]\+ \+[][a-zA-Z0-9_]\+ \+[14]8\?/!d'		\
	       -e 's/^\/\/ \+\([][a-zA-Z0-9_]\+\) \+\([][a-zA-Z0-9_]\+\) \+[14]8\?.*/\/^\\\/\\\/\/!s\/\2\\\([^a-z0-9:]\\\+\\\)\/\1\\ 1\/g/g'	\
	       -e 's/\[\([0-9]\+\)\]/\\\[\1\\\]/g'					\
	       -e 's/ 1/1/g'								<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed
  $SED $SFLAGS -e '/\/\/   float.* \([a-zA-Z0-9]\+\)\([][]\+\)\([0-9]\+\)\([][]\+\);/!d'			\
	       -e 's/.* \([a-zA-Z0-9]\+\)\([][0-9]\+\);/s\/\1\\\([^][]\\\)\/\1\\\[0\\\]\\;1\/g/g'	\
	       -e 's/;1/1/g'								\
	       -e 's/ \/ / \\\/ /g'							<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed
  $SED $SFLAGS -e '/\/\/   float.* \([a-zA-Z0-9]\+\);/!d'				\
	       -e 's/.* \([a-zA-Z0-9]\+\);/s\/\1\\\[0\\\]\/\1\/g/g'			\
	       -e 's/;1/1/g'								\
	       -e 's/ \/ / \\\/ /g'							<PseudoC/$fle.hlsl.tmp | sort -r >>PseudoC/$fle.hlsl.sed

  $SED $SFLAGS -f PseudoC/$fle.hlsl.sed							<PseudoC/$fle.hlsl.tmp |	\
  $SED $SFLAGS -f PseudoC/$fle.hlsl.sed							|	\
  $SED $SFLAGS -f subst.sed								|	\
  $SED $SFLAGS -f subst.sed								>PseudoC/$fle.hlsl

  fi

# rm -f PseudoC/$fle.hlsl.sed PseudoC/$fle.hlsl.tmp
  rm -f PseudoC/$fle.hlsl.tmp
done
