//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_1_1 HLSL/STB1008.v.hlsl /FcHLSL/STB1008.v.asm
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

    vs_1_1
    def c22, 0.5, 0, 0, 0
    dcl_position v0
    dcl_normal v1
    dcl_texcoord v2
    dcl_tangent v3
    dcl_binormal v4
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
    dp4 oPos.w, c19, r0
    mov r2.xyz, v1
    dp3 r1.x, v3, r2
    dp3 r1.y, v4, r2
    dp3 r1.z, v1, v1
    mad oD0.xyz, r1, c22.x, c22.x
    add r1.xyz, -r0, c21
    add r0.xyz, -r0, c20
    dp3 r2.x, r1, r1
    rsq r0.w, r2.x
    dp3 r3.x, r0, r0
    mul r2.xyz, r1, r0.w
    rsq r0.w, r3.x
    mov oT0.xy, v2
    mad r0.xyz, r0, r0.w, r2
    rcp r0.w, c21.w
    dp3 r2.x, r0, r0
    mul r1.xyz, r1, r0.w
    rsq r0.w, r2.x
    mad r1.xyz, r1, c22.x, c22.x
    mul r0.xzw, r0.xyzy, r0.w
    mov oT1.xy, r1
    dp3 r0.y, v3.xzyw, r0.xzww
    dp3 r0.x, v4.xzyw, r0.yzww
    mov r1.w, c22.x
    dp3 r0.w, v1.yxzw, r0
    mov oT2.xy, r1.zwzw
    mov oT3.xyz, r0.yxww

// approximately 39 instruction slots used