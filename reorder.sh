#!/bin/bash

SED=sed
SFLAGS=

for hlsl in PseudoC/*.hlsl; do
  echo $hlsl
  fle=`basename ${hlsl}`
  fle=`stripext ${fle}`
  fle=`stripext ${fle}`

  if [ $hlsl = PseudoC/$fle.vso.hlsl ]; then
#   if [ ! -f PseudoHLSL/$fle.v.hlsl ]; then
      reorder.pl <PseudoC/$fle.vso.hlsl >PseudoHLSL/$fle.v.hlsl
#   fi
  fi

  if [ $hlsl = PseudoC/$fle.pso.hlsl ]; then
#   if [ ! -f PseudoHLSL/$fle.p.hlsl ]; then
      reorder.pl <PseudoC/$fle.pso.hlsl >PseudoHLSL/$fle.p.hlsl
#   fi
  fi
done
