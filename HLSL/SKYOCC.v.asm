//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_3_0 HLSL/SKYOCC.v.hlsl /FcHLSL/SKYOCC.v.asm
//
//
// Parameters:
//
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj c0       4
//

    vs_3_0
    dcl_position v0
    dcl_position o0
    dp4 r0.x, c0, v0
    dp4 r0.y, c1, v0
    dp4 r0.z, c3, v0
    mov o0, r0.xyzz

// approximately 4 instruction slots used
