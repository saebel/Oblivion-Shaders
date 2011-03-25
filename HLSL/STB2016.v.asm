//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_2_0 HLSL/STB2016.v.hlsl /FcHLSL/STB2016.v.asm
//
//
// Parameters:
//
//   float4 EyePosition;
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
//   EyePosition   c20      1
//   LightPosition c21      1
//

    vs_2_0
    def c22, 0.5, 0, 0, 0
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
    add r3.xyz, -r0, c21
    add r0.xyz, -r0, c20
    rcp r0.w, c21.w
    mul r1.xyz, r3, r0.w
    dp3 r4.x, r0, r0
    nrm r2.xyz, r3
    rsq r0.w, r4.x
    mad oT5.xyz, r1, c22.x, c22.x
    mad r0.xyz, r0, r0.w, r2
    nrm r1.xyz, r0
    dp3 r0.x, v1, r2
    dp3 r0.y, v2, r2
    dp3 r0.z, v3, r2
    dp3 oT3.x, v1, r1
    dp3 oT3.y, v2, r1
    dp3 oT3.z, v3, r1
    nrm r1.xyz, r0
    mov oT1.xyz, r1
    mov oT0.xy, v4
    mov oT5.w, c22.x

// approximately 40 instruction slots used
