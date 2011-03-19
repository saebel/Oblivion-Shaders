//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S016.vso /Fcshaderdump19/SLS1S016.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float3 LightDirection[3];
//   float4 LightPosition[3];
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
//   LightPosition     SkinModelViewProj[0]6      2
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
    dcl_blendweight input_5
    dcl_blendindices input_6
    r2.x = (input_5.x * const_0.x.x) + (input_5.y * const_0.x.y) + (input_5.z * const_0.x.z);
    r1 = (input_0.xyzx * const_0.xxxz) - const_0.zzzx;
    r0 = input_6.zyxw * const_0.y;
    r2.w = const_0.x - r2.x;
    a0.x = r0.y;
    r2.x = (Bones[0][a0.x].x * r1.x) + (Bones[0][a0.x].y * r1.y) + (Bones[0][a0.x].z * r1.z) + (Bones[0][a0.x].w * r1.w);
    r2.y = (Bones[1][a0.x].x * r1.x) + (Bones[1][a0.x].y * r1.y) + (Bones[1][a0.x].z * r1.z) + (Bones[1][a0.x].w * r1.w);
    r2.z = (Bones[2][a0.x].x * r1.x) + (Bones[2][a0.x].y * r1.y) + (Bones[2][a0.x].z * r1.z) + (Bones[2][a0.x].w * r1.w);
    r3.xyz = r2 * input_5.y;
    a0.x = r0.x;
    r2.x = (Bones[0][a0.x].x * r1.x) + (Bones[0][a0.x].y * r1.y) + (Bones[0][a0.x].z * r1.z) + (Bones[0][a0.x].w * r1.w);
    r2.y = (Bones[1][a0.x].x * r1.x) + (Bones[1][a0.x].y * r1.y) + (Bones[1][a0.x].z * r1.z) + (Bones[1][a0.x].w * r1.w);
    r2.z = (Bones[2][a0.x].x * r1.x) + (Bones[2][a0.x].y * r1.y) + (Bones[2][a0.x].z * r1.z) + (Bones[2][a0.x].w * r1.w);
    r3.xyz = (input_5.x * r2) + r3;
    a0.x = r0.z;
    r2.x = (Bones[0][a0.x].x * r1.x) + (Bones[0][a0.x].y * r1.y) + (Bones[0][a0.x].z * r1.z) + (Bones[0][a0.x].w * r1.w);
    r2.y = (Bones[1][a0.x].x * r1.x) + (Bones[1][a0.x].y * r1.y) + (Bones[1][a0.x].z * r1.z) + (Bones[1][a0.x].w * r1.w);
    r2.z = (Bones[2][a0.x].x * r1.x) + (Bones[2][a0.x].y * r1.y) + (Bones[2][a0.x].z * r1.z) + (Bones[2][a0.x].w * r1.w);
    r3.xyz = (input_5.z * r2) + r3;
    a0.x = r0.w;
    r2.x = (Bones[0][a0.x].x * r1.x) + (Bones[0][a0.x].y * r1.y) + (Bones[0][a0.x].z * r1.z) + (Bones[0][a0.x].w * r1.w);
    r2.y = (Bones[1][a0.x].x * r1.x) + (Bones[1][a0.x].y * r1.y) + (Bones[1][a0.x].z * r1.z) + (Bones[1][a0.x].w * r1.w);
    r2.z = (Bones[2][a0.x].x * r1.x) + (Bones[2][a0.x].y * r1.y) + (Bones[2][a0.x].z * r1.z) + (Bones[2][a0.x].w * r1.w);
    r1.w = const_0.x;
    r1.xyz = (r2.w * r2) + r3;
    position.x = (SkinModelViewProj[0].x * r1.x) + (SkinModelViewProj[0].y * r1.y) + (SkinModelViewProj[0].z * r1.z) + (SkinModelViewProj[0].w * r1.w);
    position.y = (SkinModelViewProj[1].x * r1.x) + (SkinModelViewProj[1].y * r1.y) + (SkinModelViewProj[1].z * r1.z) + (SkinModelViewProj[1].w * r1.w);
    position.z = (SkinModelViewProj[2].x * r1.x) + (SkinModelViewProj[2].y * r1.y) + (SkinModelViewProj[2].z * r1.z) + (SkinModelViewProj[2].w * r1.w);
    a0.x = r0.y;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r3.xyz = r2 * input_5.y;
    a0.x = r0.x;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r3.xyz = (input_5.x * r2) + r3;
    a0.x = r0.z;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r3.xyz = (input_5.z * r2) + r3;
    a0.x = r0.w;
    r2.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r2.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r2.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    position.w = (SkinModelViewProj[3].x * r1.x) + (SkinModelViewProj[3].y * r1.y) + (SkinModelViewProj[3].z * r1.z) + (SkinModelViewProj[3].w * r1.w);
    r4.xyz = (r2.w * r2) + r3;
    r1.xyz = SkinModelViewProj[0]7 - r1;
    r2.x = (r4.x * r4.x) + (r4.y * r4.y) + (r4.z * r4.z);
    r1.w = 1.0 / sqrt(r2.x);
    a0.x = r0.y;
    r2.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r2.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r2.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r3.xyz = r2 * input_5.y;
    a0.x = r0.x;
    r2.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r2.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r2.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r3.xyz = (input_5.x * r2) + r3;
    a0.x = r0.z;
    r2.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r2.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r2.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r3.xyz = (input_5.z * r2) + r3;
    a0.x = r0.w;
    r2.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r2.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r2.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r4.xyz = r4 * r1.w;
    r3.xyz = (r2.w * r2) + r3;
    r5.x = (r4.x * LightDirection.x) + (r4.y * LightDirection.y) + (r4.z * LightDirection.z);
    r2.x = (r3.x * r3.x) + (r3.y * r3.y) + (r3.z * r3.z);
    r1.w = 1.0 / sqrt(r2.x);
    a0.x = r0.y;
    r2.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r2.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r2.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r6.xyz = r2 * input_5.y;
    a0.x = r0.x;
    r2.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r2.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r2.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r2.xyz = (input_5.x * r2) + r6;
    a0.x = r0.z;
    r0.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r0.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r0.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r2.xyz = (input_5.z * r0) + r2;
    a0.x = r0.w;
    r0.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r0.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r0.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r3.xyz = r3 * r1.w;
    r0.xyz = (r2.w * r0) + r2;
    r5.y = (r3.x * LightDirection.x) + (r3.y * LightDirection.y) + (r3.z * LightDirection.z);
    r2.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r0.w = 1.0 / sqrt(r2.x);
    r2.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r0.xyz = r0 * r0.w;
    r0.w = 1.0 / sqrt(r2.x);
    r5.z = (r0.x * LightDirection.x) + (r0.y * LightDirection.y) + (r0.z * LightDirection.z);
    r2.xyz = r1 * r0.w;
    color_0.xyz = (const_0.w * r5) + const_0.w;
    texcoord_3.x = (r4.x * r2.x) + (r4.y * r2.y) + (r4.z * r2.z);
    texcoord_3.y = (r3.x * r2.x) + (r3.y * r2.y) + (r3.z * r2.z);
    r0.w = 1.0 / SkinModelViewProj[0]7.w;
    texcoord_3.z = (r0.x * r2.x) + (r0.y * r2.y) + (r0.z * r2.z);
    r0.xyz = r1 * r0.w;
    texcoord_1.xy = (const_0.w * r0) + const_0.w;
    texcoord_2.x = (r0.z * const_0.w) - const_0.w;
    texcoord_0.xy = input_4;
    texcoord_2.y = const_0.w;

// approximately 115 instruction slots used
