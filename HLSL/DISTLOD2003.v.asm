//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_2_0 HLSL/DISTLOD2003.v.hlsl /FcHLSL/DISTLOD2003.v.asm
//
//
// Parameters:
//
//   float4 AlphaParam;
//   float4 AmbientColor;
//   float3 DiffuseColor;
//   float3 DiffuseDir;
//   float4 EyeDir;
//   float4 EyePos;
//   float4 FogColor;
//   float4 FogParam;
//   float4 InstanceData[2];
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj c0       4
//   InstanceData  c4       2
//   AlphaParam    c6       1
//   AmbientColor  c7       1
//   DiffuseColor  c8       1
//   DiffuseDir    c9       1
//   EyeDir        c10      1
//   EyePos        c11      1
//   FogColor      c12      1
//   FogParam      c13      1
//

    vs_2_0
    def c14, -1, 0, 1, -0.5
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_texcoord1 v3
    mov r0.xy, c14
    mul r0.xyz, r0.xxyw, c10.xyxw
    dp3 r0.x, r0, r0
    rsq r1.y, r0.x
    mul r0.xy, r1.y, -c10
    mov r0.z, -r0.y
    mul r1.xzw, r0.yyxy, c14.xyzx
    dp4 r0.w, r0.zzxz, r1
    rsq r2.w, r0.w
    mul r0.yzw, r0.y, c14.xzxx
    mul r1.xy, r1.xzzw, r2.w
    mov r0.x, r1.y
    dp4 r1.x, r1.xzwx, v0
    frc r1.w, v3.x
    dp4 r1.y, r0, v0
    add r0.w, -r1.w, v3.x
    mov r1.z, v0.z
    mova a0.w, r0.w
    mad r1.xyz, c4[a0.w].w, r1, c4[a0.w]
    mov r1.w, v0.w
    dp4 r0.x, c0, r1
    dp4 r0.y, c1, r1
    dp4 r0.z, c2, r1
    dp4 r0.w, c3, r1
    dp4 r1.w, r0, r0
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    add r1.w, -r1.w, c13.x
    rcp r2.w, c13.y
    mul r1.w, r1.w, r2.w
    max r1.w, r1.w, c14.y
    mov oPos, r0
    min r0.w, r1.w, c14.z
    add oD0.w, -r0.w, c14.z
    mov r0, c11
    add r1, r0, -c4[a0.w]
    frc r0, c4[a0.w]
    dp4 r1.w, r1, r1
    add r1.xyz, r0, c14.w
    rsq r1.w, r1.w
    mul r0.xyz, r0.w, v1
    rcp r0.w, r1.w
    add r0.w, -r0.w, c6.x
    rcp r1.w, c6.y
    add r1.xyz, r1, r1
    mad r0.w, r0.w, -r1.w, c14.z
    dp3 r1.x, c9, r1
    max r0.w, r0.w, c14.y
    mul r1.xyz, r0, r1.x
    min r0.w, r0.w, c14.z
    add r1.w, -r0.w, c14.z
    slt r0.w, c6.x, v0.w
    mov r0.xyz, c8
    mad oT4.xyz, r0, r1, c7
    mad oT5.w, r0.w, -r1.w, c14.z
    mov oD0.xyz, c12
    mov oT0.xy, v2
    mov oT4.w, c14.z
    mov oT5.xyz, c14.y

// approximately 59 instruction slots used
