//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S013.vso /Fcshaderdump19/SLS1S013.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   row_major float4x4 SkinModelViewProj;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] SkinModelViewProj[0]       1
//   SkinModelViewProj[1] SkinModelViewProj[1]       1
//   SkinModelViewProj[2] SkinModelViewProj[2]       1
//   SkinModelViewProj[3] SkinModelViewProj[3]       1
//   LightDirection    LightDirection      1
//   FogParam          FogParam      1
//   FogColor          FogColor      1
//   Bones[0]             Bones[0]     17
//   Bones[1]             Bones[1]     17
//   Bones[2]             Bones[2]     17
//

    const_0 = {1, 765.01001, 0, 0.5};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    dcl_blendweight input_6
    dcl_blendindices input_7
    r2.x = (input_6.x * const_0.x.x) + (input_6.y * const_0.x.y) + (input_6.z * const_0.x.z);
    r0 = (input_0.xyzx * const_0.xxxz) - const_0.zzzx;
    r1 = input_7.zyxw * const_0.y;
    r2.w = const_0.x - r2.x;
    a0.x = r1.y;
    r2.x = (Bones[0][a0.x].x * r0.x) + (Bones[0][a0.x].y * r0.y) + (Bones[0][a0.x].z * r0.z) + (Bones[0][a0.x].w * r0.w);
    r2.y = (Bones[1][a0.x].x * r0.x) + (Bones[1][a0.x].y * r0.y) + (Bones[1][a0.x].z * r0.z) + (Bones[1][a0.x].w * r0.w);
    r2.z = (Bones[2][a0.x].x * r0.x) + (Bones[2][a0.x].y * r0.y) + (Bones[2][a0.x].z * r0.z) + (Bones[2][a0.x].w * r0.w);
    r3.xyz = r2 * input_6.y;
    a0.x = r1.x;
    r2.x = (Bones[0][a0.x].x * r0.x) + (Bones[0][a0.x].y * r0.y) + (Bones[0][a0.x].z * r0.z) + (Bones[0][a0.x].w * r0.w);
    r2.y = (Bones[1][a0.x].x * r0.x) + (Bones[1][a0.x].y * r0.y) + (Bones[1][a0.x].z * r0.z) + (Bones[1][a0.x].w * r0.w);
    r2.z = (Bones[2][a0.x].x * r0.x) + (Bones[2][a0.x].y * r0.y) + (Bones[2][a0.x].z * r0.z) + (Bones[2][a0.x].w * r0.w);
    r3.xyz = (input_6.x * r2) + r3;
    a0.x = r1.z;
    r2.x = (Bones[0][a0.x].x * r0.x) + (Bones[0][a0.x].y * r0.y) + (Bones[0][a0.x].z * r0.z) + (Bones[0][a0.x].w * r0.w);
    r2.y = (Bones[1][a0.x].x * r0.x) + (Bones[1][a0.x].y * r0.y) + (Bones[1][a0.x].z * r0.z) + (Bones[1][a0.x].w * r0.w);
    r2.z = (Bones[2][a0.x].x * r0.x) + (Bones[2][a0.x].y * r0.y) + (Bones[2][a0.x].z * r0.z) + (Bones[2][a0.x].w * r0.w);
    r3.xyz = (input_6.z * r2) + r3;
    a0.x = r1.w;
    r2.x = (Bones[0][a0.x].x * r0.x) + (Bones[0][a0.x].y * r0.y) + (Bones[0][a0.x].z * r0.z) + (Bones[0][a0.x].w * r0.w);
    r2.y = (Bones[1][a0.x].x * r0.x) + (Bones[1][a0.x].y * r0.y) + (Bones[1][a0.x].z * r0.z) + (Bones[1][a0.x].w * r0.w);
    r2.z = (Bones[2][a0.x].x * r0.x) + (Bones[2][a0.x].y * r0.y) + (Bones[2][a0.x].z * r0.z) + (Bones[2][a0.x].w * r0.w);
    r0.w = const_0.x;
    r0.xyz = (r2.w * r2) + r3;
    position.w = (SkinModelViewProj[3].x * r0.x) + (SkinModelViewProj[3].y * r0.y) + (SkinModelViewProj[3].z * r0.z) + (SkinModelViewProj[3].w * r0.w);
    a0.x = r1.y;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r3.xyz = r2 * input_6.y;
    a0.x = r1.x;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r3.xyz = (input_6.x * r2) + r3;
    a0.x = r1.z;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r3.xyz = (input_6.z * r2) + r3;
    a0.x = r1.w;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r2.xyz = (r2.w * r2) + r3;
    a0.x = r1.y;
    r3.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r3.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r3.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r4.xyz = r3 * input_6.y;
    a0.x = r1.x;
    r3.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r3.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r3.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r4.xyz = (input_6.x * r3) + r4;
    a0.x = r1.z;
    r3.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r3.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r3.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r4.xyz = (input_6.z * r3) + r4;
    a0.x = r1.w;
    r3.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r3.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r3.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r5.x = (r2.x * r2.x) + (r2.y * r2.y) + (r2.z * r2.z);
    r3.xyz = (r2.w * r3) + r4;
    r3.w = 1.0 / sqrt(r5.x);
    r4.x = (r3.x * r3.x) + (r3.y * r3.y) + (r3.z * r3.z);
    r2.xyz = r2 * r3.w;
    r3.w = 1.0 / sqrt(r4.x);
    r2.x = (r2.x * LightDirection.x) + (r2.y * LightDirection.y) + (r2.z * LightDirection.z);
    r3.xyz = r3 * r3.w;
    r2.y = (r3.x * LightDirection.x) + (r3.y * LightDirection.y) + (r3.z * LightDirection.z);
    a0.x = r1.y;
    r3.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r3.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r3.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r4.xyz = r3 * input_6.y;
    a0.x = r1.x;
    r3.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r3.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r3.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r3.xyz = (input_6.x * r3) + r4;
    a0.x = r1.z;
    r1.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r1.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r1.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r3.xyz = (input_6.z * r1) + r3;
    a0.x = r1.w;
    r1.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r1.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r1.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r3.xyz = (r2.w * r1) + r3;
    r1.x = (SkinModelViewProj[0].x * r0.x) + (SkinModelViewProj[0].y * r0.y) + (SkinModelViewProj[0].z * r0.z) + (SkinModelViewProj[0].w * r0.w);
    r1.y = (SkinModelViewProj[1].x * r0.x) + (SkinModelViewProj[1].y * r0.y) + (SkinModelViewProj[1].z * r0.z) + (SkinModelViewProj[1].w * r0.w);
    r1.z = (SkinModelViewProj[2].x * r0.x) + (SkinModelViewProj[2].y * r0.y) + (SkinModelViewProj[2].z * r0.z) + (SkinModelViewProj[2].w * r0.w);
    r4.x = (r3.x * r3.x) + (r3.y * r3.y) + (r3.z * r3.z);
    r0.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r1.w = 1.0 / sqrt(r4.x);
    r0.w = 1.0 / sqrt(r0.x);
    r0.xyz = r3 * r1.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    r2.z = (r0.x * LightDirection.x) + (r0.y * LightDirection.y) + (r0.z * LightDirection.z);
    r0.w = r0.w * r1.w;
    texcoord_3.xyz = (const_0.w * r2) + const_0.w;
    r0.w = (r0.w >= const_0.z ? r0.w : const_0.z);
    position.xyz = r1;
    r0.w = (r0.w < const_0.x ? r0.w : const_0.x);
    color_1.w = const_0.x - r0.w;
    texcoord_0.xy = input_4;
    texcoord_1.xy = input_4;
    texcoord_2.xy = input_4;
    color_0 = input_5;
    color_1.xyz = FogColor;

// approximately 117 instruction slots used
