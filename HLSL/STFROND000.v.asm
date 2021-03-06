//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_1_1 HLSL/STFROND000.v.hlsl /FcHLSL/STFROND000.v.asm
//
//
// Parameters:
//
//   float4 AmbientColor;
//   float4 DiffColor;
//   float4 LightVector;
//   row_major float4x4 ModelViewProj;
//   float SunDimmer;
//   float4 WindMatrices[16];
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WindMatrices  c0      16
//   ModelViewProj c16      4
//   AmbientColor  c20      1
//   DiffColor     c21      1
//   LightVector   c22      1
//   SunDimmer     c23      1
//

    vs_1_1
    def c24, 0, 1, 0, 0
    dcl_position v0
    dcl_normal v1
    dcl_texcoord v2
    dcl_color v3
    dcl_blendindices v4
    mov a0.x, v4.y
    dp4 r0.x, c0[a0.x], v0
    dp4 r0.y, c1[a0.x], v0
    dp4 r0.z, c2[a0.x], v0
    dp4 r0.w, c3[a0.x], v0
    add r0, r0, -v0
    mov r1, v0
    mad r0, v4.x, r0, r1
    dp3 r1.x, v1, c22
    dp4 oPos.x, c16, r0
    max r1.w, r1.x, c24.x
    dp4 oPos.y, c17, r0
    min r1.w, r1.w, c24.y
    dp4 oPos.z, c18, r0
    mul r1.xyz, r1.w, c21
    dp4 oPos.w, c19, r0
    mov r0.w, c23.x
    mad r0.xyz, r0.w, r1, c20
    mul oT1.xyz, r0, v3
    mov oT0.xy, v2

// approximately 20 instruction slots used
