//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_2_0 HLSL/STB2012.v.hlsl /FcHLSL/STB2012.v.asm
//
//
// Parameters:
//
//   float4 LightPosition[3];
//   row_major float4x4 ModelViewProj;
//   float4 WindMatrices[16];
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WindMatrices  c0      16
//   ModelViewProj c16      4
//   LightPosition c20      3
//

    vs_2_0
    def c23, 0.5, 0, 0, 0
    dcl_position v0
    dcl_tangent v1
    dcl_binormal v2
    dcl_normal v3
    dcl_texcoord v4
    dcl_blendindices v5
    frc r0.w, v5.y
    add r0.w, -r0.w, v5.y
    mova a0.w, r0.w
    dp4 r0.x, c0[a0.w], v0
    dp4 r0.y, c1[a0.w], v0
    dp4 r0.z, c2[a0.w], v0
    dp4 r0.w, c3[a0.w], v0
    add r0, r0, -v0
    mov r1, v0
    mad r0, v5.x, r0, r1
    dp4 oPos.x, c16, r0
    dp4 oPos.y, c17, r0
    dp4 oPos.z, c18, r0
    dp4 oPos.w, c19, r0
    add r2.xyz, -r0, c21
    add r3.xyz, -r0, c22
    rcp r0.w, c21.w
    mul r0.xyz, r2, r0.w
    nrm r1.xyz, r2
    mad oT4.xyz, r0, c23.x, c23.x
    rcp r0.w, c22.w
    mul r2.xyz, r3, r0.w
    nrm r0.xyz, r3
    mad oT5.xyz, r2, c23.x, c23.x
    dp3 oT2.x, v1, r1
    dp3 oT2.y, v2, r1
    dp3 oT2.z, v3, r1
    dp3 oT3.x, v1, r0
    dp3 oT3.y, v2, r0
    dp3 oT3.z, v3, r0
    mov oT0.xy, v4
    mov oT4.w, c23.x
    mov oT5.w, c23.x

// approximately 37 instruction slots used
