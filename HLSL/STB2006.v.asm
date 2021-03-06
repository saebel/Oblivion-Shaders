//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_2_0 HLSL/STB2006.v.hlsl /FcHLSL/STB2006.v.asm
//
//
// Parameters:
//
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   float4 LightPosition[3];
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
//   LightPosition  c20      2
//   FogColor       c22      1
//   FogParam       c23      1
//   LightDirection c24      1
//

    vs_2_0
    def c25, 1, 0, 0.5, 0
    dcl_position v0
    dcl_tangent v1
    dcl_binormal v2
    dcl_normal v3
    dcl_texcoord v4
    dcl_blendindices v5
    dp3 r2.x, v1, c24
    frc r0.w, v5.y
    dp3 r2.y, v2, c24
    add r0.w, -r0.w, v5.y
    dp3 r2.z, v3, c24
    mova a0.w, r0.w
    dp4 r0.x, c0[a0.w], v0
    dp4 r0.y, c1[a0.w], v0
    dp4 r0.z, c2[a0.w], v0
    dp4 r0.w, c3[a0.w], v0
    dp3 r1.x, r2, r2
    add r0, r0, -v0
    rsq r2.w, r1.x
    mov r1, v0
    mad r1, v5.x, r0, r1
    mul oT1.xyz, r2, r2.w
    add r0.xyz, -r1, c21
    nrm r2.xyz, r0
    dp4 r0.x, c16, r1
    dp4 r0.y, c17, r1
    dp4 r0.z, c18, r1
    dp3 oT4.x, v1, r2
    dp3 r3.x, r0, r0
    dp3 oT4.y, v2, r2
    rsq r0.w, r3.x
    dp3 oT4.z, v3, r2
    rcp r0.w, r0.w
    add r0.w, -r0.w, c23.x
    rcp r2.w, c23.y
    mad oD0, v5.z, c25.xxxy, c25.yyyx
    mul r2.w, r0.w, r2.w
    dp4 r0.w, c19, r1
    max r1.w, r2.w, c25.y
    mov oPos, r0
    min r0.w, r1.w, c25.x
    add oD1.w, -r0.w, c25.x
    mov oD1.xyz, c22
    mov oT0.xy, v4
    mov oT4.w, c25.z

// approximately 41 instruction slots used
