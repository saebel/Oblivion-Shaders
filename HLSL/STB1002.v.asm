//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_1_1 HLSL/STB1002.v.hlsl /FcHLSL/STB1002.v.asm
//
//
// Parameters:
//
//   float3 LightDirection[3];
//   row_major float4x4 ModelViewProj;
//   float4 WindMatrices[16];
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   WindMatrices   c0      16
//   ModelViewProj  c16      4
//   LightDirection c20      1
//

    vs_1_1
    def c21, 0.5, 1, 0, 0
    dcl_position v0
    dcl_tangent v1
    dcl_binormal v2
    dcl_normal v3
    dcl_texcoord v4
    dcl_blendindices v5
    mov a0.x, v5.y
    dp4 r0.x, c0[a0.x], v0
    dp4 r0.y, c1[a0.x], v0
    dp4 r0.z, c2[a0.x], v0
    dp4 r0.w, c3[a0.x], v0
    add r0, r0, -v0
    mov r1, v0
    mad r0, v5.x, r0, r1
    dp4 oPos.x, c16, r0
    dp4 oPos.y, c17, r0
    dp4 oPos.z, c18, r0
    dp3 r1.x, v1, c20
    dp3 r1.y, v2, c20
    dp3 r1.z, v3, c20
    dp4 oPos.w, c19, r0
    mad oT3.xyz, r1, c21.x, c21.x
    mad oD0, v5.z, c21.yyyz, c21.zzzy
    mov oT0.xy, v4
    mov oT1.xy, v4
    mov oT2.xy, v4

// approximately 20 instruction slots used
