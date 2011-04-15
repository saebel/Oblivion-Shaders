#!/bin/bash

SED=sed
SFLAGS=

for hlsl in PseudoC/*.hlsl; do
  fle=`basename ${hlsl}`
  fle=`stripext ${fle}`
  fle=`stripext ${fle}`

  if [ $hlsl = PseudoC/$fle.vso.hlsl ]; then
    if [ ! -f PseudoHLSL/$fle.v.hlsl ] || [ ! -s PseudoHLSL/$fle.v.hlsl ] || [ reorder.pl -nt PseudoHLSL/$fle.v.hlsl ] || [ PseudoC/$fle.vso.hlsl -nt PseudoHLSL/$fle.v.hlsl ]; then
      echo redo $hlsl
      rm -f PseudoHLSL/$fle.v.hlsl
      ./reorder.pl <PseudoC/$fle.vso.hlsl >PseudoHLSL/$fle.v.hlsl
    fi
  fi

  if [ $hlsl = PseudoC/$fle.pso.hlsl ]; then
    if [ ! -f PseudoHLSL/$fle.p.hlsl ] || [ ! -s PseudoHLSL/$fle.p.hlsl ] || [ reorder.pl -nt PseudoHLSL/$fle.p.hlsl ] || [ PseudoC/$fle.pso.hlsl -nt PseudoHLSL/$fle.p.hlsl ]; then
      echo redo $hlsl
      rm -f PseudoHLSL/$fle.p.hlsl
      ./reorder.pl <PseudoC/$fle.pso.hlsl >PseudoHLSL/$fle.p.hlsl
    fi
  fi
done
