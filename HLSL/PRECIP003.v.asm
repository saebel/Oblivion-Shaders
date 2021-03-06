//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_3_0 HLSL/PRECIP003.v.hlsl /FcHLSL/PRECIP003.v.asm
//
//
// Parameters:
//
//   float3 CameraUp;
//   float3 EyePosition;
//   float3 MaxPos;
//   float3 MinPos;
//   float3 Params;
//   float3 Velocity;
//   row_major float4x4 WorldViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WorldViewProj c0       4
//   CameraUp      c4       1
//   EyePosition   c5       1
//   MaxPos        c6       1
//   MinPos        c7       1
//   Params        c8       1
//   Velocity      c9       1
//

    vs_3_0
    def c10, 0, 0.159154937, 0.5, 1
    def c11, 6.28318548, -3.14159274, -0.5, 0
    def c12, -1, 0, 1, 0
    dcl_position v0
    dcl_texcoord v1
    dcl_texcoord1 v2
    dcl_position o0
    dcl_color o1
    dcl_texcoord o2.xy
    mov r0.w, c8.x
    mad r0.xyz, r0.w, c9, v2
    mov r3.xyz, c6
    add r1.xyz, r3, -c7
    add r0.xyz, r0, -c7
    rcp r2.x, r1.x
    rcp r2.y, r1.y
    rcp r2.z, r1.z
    mul r0.xyz, r0, r2
    frc r0.xyz, r0_abs
    mad r0.w, c8.z, c8.x, v2.x
    mul r0.xyz, r1, r0
    mad r0.w, r0.w, c10.y, c10.z
    add r4.xyz, r0_abs, c7
    add r0.xyz, -r0_abs, c6
    mov r1.w, c10.x
    slt r1.w, r1.w, c9.x
    frc r0.w, r0.w
    lrp r2.xyz, r1.w, r0, r4
    mad r1.w, r0.w, c11.x, c11.y
    add r4.xyz, r2, -c5
    sincos r0.xy, r1.w
    nrm r5.xyz, -r4
    mul r6.xyz, r0.xxyw, c10.wxww
    mul r4.xyz, r5.yzxw, c4.zxyw
    dp3 r0.w, r6, v0
    mad r4.xyz, c4.yzxw, r5.zxyw, -r4
    mul r6.xyz, r5, v0.y
    nrm r5.xyz, r4
    mul r4.xyz, r0.yxyw, c12
    mad r0.xyz, r0.w, r5, r6
    dp3 r0.w, r4, v0
    mad r3.xyz, r1_abs, c11.z, r3
    rcp r1.x, r1_abs.x
    rcp r1.y, r1_abs.y
    rcp r1.z, r1_abs.z
    add r3.xyz, -r2, r3
    mad r0.xyz, r0.w, c4, r0
    mul r1.xyz, r1, r3
    add r0.xyz, r2, r0
    dp3 r0.w, r1, r1
    dp3 o0.x, c0, r0
    rsq r0.w, r0.w
    dp3 o0.y, c1, r0
    rcp r0.w, r0.w
    dp3 o0.z, c2, r0
    add r0.w, -r0.w, c10.w
    dp3 o0.w, c3, r0
    mul o1.w, r0.w, r0.w
    mov o1.xyz, c10.w
    mov o2.xy, v1

// approximately 57 instruction slots used
