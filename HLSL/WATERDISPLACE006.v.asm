//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_2_0 HLSL/WATERDISPLACE006.v.hlsl /FcHLSL/WATERDISPLACE006.v.asm
//
//
// Parameters:
//
//   float4 texRatio0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   texRatio0    c0       1
//

    vs_2_0
    dcl_position v0
    dcl_texcoord v1
    mad oT0.xy, v1, c0, c0.zwzw
    mov oPos, v0

// approximately 2 instruction slots used
