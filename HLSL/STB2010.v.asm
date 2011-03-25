//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_2_0 HLSL/STB2010.v.hlsl /FcHLSL/STB2010.v.asm
//
//
// Parameters:
//
//   float4 EyePosition;
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
//   EyePosition    c22      1
//   FogColor       c23      1
//   FogParam       c24      1
//   LightDirection c25      1
//

    vs_2_0
    def c26, 0.5, 0, 1, 0
    dcl_position v0
    dcl_tangent v1
    dcl_binormal v2
    dcl_normal v3
    dcl_texcoord v4
    dcl_blendindices v5
    dp3 r1.x, v1, c25
    dp3 r1.y, v2, c25
    frc r0.w, v5.y
    dp3 r1.z, v3, c25
    add r0.w, -r0.w, v5.y
    mova a0.w, r0.w
    dp4 r0.x, c0[a0.w], v0
    dp4 r0.y, c1[a0.w], v0
    dp4 r0.z, c2[a0.w], v0
    dp4 r0.w, c3[a0.w], v0
    add r0, r0, -v0
    nrm r5.xyz, r1
    mov oT1.xyz, r5
    mov r1, v0
    mad r1, v5.x, r0, r1
    rcp r0.w, c21.w
    add r3.xyz, -r1, c21
    mul r0.xyz, r0.w, r3
    nrm r2.xyz, r3
    mad oT5.xyz, r0, c26.x, c26.x
    add r0.xyz, -r1, c22
    dp3 oT2.x, v1, r2
    dp3 r3.x, r0, r0
    dp3 oT2.y, v2, r2
    rsq r0.w, r3.x
    dp3 oT2.z, v3, r2
    mad r3.xyz, r0, r0.w, r2
    mad r0.xyz, r0, r0.w, c25
    nrm r2.xyz, r3
    dp3 oT4.x, v1, r2
    dp3 oT4.y, v2, r2
    dp3 oT4.z, v3, r2
    nrm r3.xyz, r0
    dp3 r2.x, v1, r3
    dp4 r0.x, c16, r1
    dp4 r0.y, c17, r1
    dp4 r0.z, c18, r1
    dp3 r2.y, v2, r3
    dp3 r4.x, r0, r0
    dp3 r2.z, v3, r3
    rsq r0.w, r4.x
    rcp r0.w, r0.w
    add r0.w, -r0.w, c24.x
    rcp r3.w, c24.y
    mul r0.w, r0.w, r3.w
    nrm r5.xyz, r2
    mov oT3.xyz, r5
    max r2.w, r0.w, c26.y
    dp4 r0.w, c19, r1
    min r1.w, r2.w, c26.z
    mov oPos, r0
    add oD1.w, -r1.w, c26.z
    mov oD0.xyz, v5.z
    mov oD1.xyz, c23
    mov oT0.xy, v4
    mov oT5.w, c26.x

// approximately 66 instruction slots used
