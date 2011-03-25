#!/bin/bash

oldPATH=$PATH

# new optimizing compiler
# FXC="fxc /O3 /Gec"

# old compiler comparable to the one Bethesda used
PATH=/cygdrive/k/ReSources/Windows/SDKs/DirectX\ 9c\ \(MicroSoft\)/Utilities/:$PATH
FXC=fxc

for hlsl in HLSL/STB1001*.hlsl; do
  fle=`basename ${hlsl}`
  fle=`stripext ${fle}`
  fle=`stripext ${fle}`

  # ------------------------------------------------------------------
  if [ $hlsl = HLSL/$fle.v.hlsl ]; then
    VERSION=vs_3_0
    if [ -f PseudoC/$fle.vso.version ]; then
      source PseudoC/$fle.vso.version
    fi

    echo Vertex Shader \($VERSION\): $hlsl
    rm -f "HLSL/$fle.v.asm" "HLSL/$fle.v.log" "HLSL/$fle.v.dif"
    $FXC /T${VERSION} HLSL/$fle.v.hlsl /FcHLSL/$fle.v.asm 2>HLSL/$fle.v.log 1>compile.log
    if [ -f HLSL/$fle.v.asm ]; then
      diff -iEbwB Disassembly/$fle.vso.dis HLSL/$fle.v.asm >HLSL/$fle.v.dif
    fi
    cat HLSL/$fle.v.log
  fi

  # ------------------------------------------------------------------
  if [ $hlsl = HLSL/$fle.p.hlsl ]; then
    VERSION=ps_3_0
    if [ -f PseudoC/$fle.pso.version ]; then
      source PseudoC/$fle.pso.version
    fi

    echo Pixel \ Shader \($VERSION\): $hlsl
    rm -f "HLSL/$fle.p.asm" "HLSL/$fle.p.log" "HLSL/$fle.p.dif"
    $FXC /T${VERSION} HLSL/$fle.p.hlsl /FcHLSL/$fle.p.asm 2>HLSL/$fle.p.log 1>compile.log
    if [ -f HLSL/$fle.p.asm ]; then
      diff -iEbwB Disassembly/$fle.pso.dis HLSL/$fle.p.asm >HLSL/$fle.p.dif
    fi
    cat HLSL/$fle.p.log
  fi
done

PATH=$oldPATH
