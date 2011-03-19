//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2003.vso /Fcshaderdump19/SKIN2003.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   row_major float4x4 ShadowProj;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//   row_major float4x4 SkinModelViewProj;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   SkinModelViewProj[0]   SkinModelViewProj[0]       1
//   SkinModelViewProj[1]   SkinModelViewProj[1]       1
//   SkinModelViewProj[2]   SkinModelViewProj[2]       1
//   SkinModelViewProj[3]   SkinModelViewProj[3]       1
//   LightDirection[0]   LightDirection[0]      1
//   LightDirection[1]   LightDirection[1]      1
//   LightDirection[2]   LightDirection[2]      1
//   FogParam            FogParam      1
//   FogColor            FogColor      1
//   EyePosition         EyePosition      1
//   ShadowProj[0]       ShadowProj[0]      1
//   ShadowProj[1]       ShadowProj[1]      1
//   ShadowProj[2]       ShadowProj[2]      1
//   ShadowProj[3]       ShadowProj[3]      1
//   ShadowProjData      ShadowProjData      1
//   ShadowProjTransform ShadowProjTransform      1
//   Bones[0]               Bones[0]     17
//   Bones[1]               Bones[1]     17
//   Bones[2]               Bones[2]     17
//

    const_0 = {1, 765.01001, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    dcl_blendweight input_6
    dcl_blendindices input_7
    r0 = input_7.zyxw * const_0.y;
    r0 = r0 - floor(r0);
    r2.x = (input_6.x * const_0.x.x) + (input_6.y * const_0.x.y) + (input_6.z * const_0.x.z);
    r1 = (input_7.zyxw * const_0.y) - r0;
    r0 = (input_0.xyzx * const_0.xxxz) - const_0.zzzx;
    mova a0, r1
    r1.w = const_0.x - r2.x;
    r1.x = (Bones[0][a0.y].x * r0.x) + (Bones[0][a0.y].y * r0.y) + (Bones[0][a0.y].z * r0.z) + (Bones[0][a0.y].w * r0.w);
    r1.y = (Bones[1][a0.y].x * r0.x) + (Bones[1][a0.y].y * r0.y) + (Bones[1][a0.y].z * r0.z) + (Bones[1][a0.y].w * r0.w);
    r1.z = (Bones[2][a0.y].x * r0.x) + (Bones[2][a0.y].y * r0.y) + (Bones[2][a0.y].z * r0.z) + (Bones[2][a0.y].w * r0.w);
    r2.xyz = r1 * input_6.y;
    r1.x = (Bones[0][a0.x].x * r0.x) + (Bones[0][a0.x].y * r0.y) + (Bones[0][a0.x].z * r0.z) + (Bones[0][a0.x].w * r0.w);
    r1.y = (Bones[1][a0.x].x * r0.x) + (Bones[1][a0.x].y * r0.y) + (Bones[1][a0.x].z * r0.z) + (Bones[1][a0.x].w * r0.w);
    r1.z = (Bones[2][a0.x].x * r0.x) + (Bones[2][a0.x].y * r0.y) + (Bones[2][a0.x].z * r0.z) + (Bones[2][a0.x].w * r0.w);
    r2.xyz = (input_6.x * r1) + r2;
    r1.x = (Bones[0][a0.z].x * r0.x) + (Bones[0][a0.z].y * r0.y) + (Bones[0][a0.z].z * r0.z) + (Bones[0][a0.z].w * r0.w);
    r1.y = (Bones[1][a0.z].x * r0.x) + (Bones[1][a0.z].y * r0.y) + (Bones[1][a0.z].z * r0.z) + (Bones[1][a0.z].w * r0.w);
    r1.z = (Bones[2][a0.z].x * r0.x) + (Bones[2][a0.z].y * r0.y) + (Bones[2][a0.z].z * r0.z) + (Bones[2][a0.z].w * r0.w);
    r2.xyz = (input_6.z * r1) + r2;
    r1.x = (Bones[0][a0.w].x * r0.x) + (Bones[0][a0.w].y * r0.y) + (Bones[0][a0.w].z * r0.z) + (Bones[0][a0.w].w * r0.w);
    r1.y = (Bones[1][a0.w].x * r0.x) + (Bones[1][a0.w].y * r0.y) + (Bones[1][a0.w].z * r0.z) + (Bones[1][a0.w].w * r0.w);
    r1.z = (Bones[2][a0.w].x * r0.x) + (Bones[2][a0.w].y * r0.y) + (Bones[2][a0.w].z * r0.z) + (Bones[2][a0.w].w * r0.w);
    r0.xyz = (r1.w * r1) + r2;
    r0.w = const_0.x;
    r1.x = (Bones[0][a0.y].x * input_1.x) + (Bones[0][a0.y].y * input_1.y) + (Bones[0][a0.y].z * input_1.z);
    r1.y = (Bones[1][a0.y].x * input_1.x) + (Bones[1][a0.y].y * input_1.y) + (Bones[1][a0.y].z * input_1.z);
    r1.z = (Bones[2][a0.y].x * input_1.x) + (Bones[2][a0.y].y * input_1.y) + (Bones[2][a0.y].z * input_1.z);
    r2.xyz = r1 * input_6.y;
    r1.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r1.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r1.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r2.xyz = (input_6.x * r1) + r2;
    r1.x = (Bones[0][a0.z].x * input_1.x) + (Bones[0][a0.z].y * input_1.y) + (Bones[0][a0.z].z * input_1.z);
    r1.y = (Bones[1][a0.z].x * input_1.x) + (Bones[1][a0.z].y * input_1.y) + (Bones[1][a0.z].z * input_1.z);
    r1.z = (Bones[2][a0.z].x * input_1.x) + (Bones[2][a0.z].y * input_1.y) + (Bones[2][a0.z].z * input_1.z);
    r2.xyz = (input_6.z * r1) + r2;
    r1.x = (Bones[0][a0.w].x * input_1.x) + (Bones[0][a0.w].y * input_1.y) + (Bones[0][a0.w].z * input_1.z);
    r1.y = (Bones[1][a0.w].x * input_1.x) + (Bones[1][a0.w].y * input_1.y) + (Bones[1][a0.w].z * input_1.z);
    r1.z = (Bones[2][a0.w].x * input_1.x) + (Bones[2][a0.w].y * input_1.y) + (Bones[2][a0.w].z * input_1.z);
    position.w = (SkinModelViewProj[3].x * r0.x) + (SkinModelViewProj[3].y * r0.y) + (SkinModelViewProj[3].z * r0.z) + (SkinModelViewProj[3].w * r0.w);
    r2.xyz = (r1.w * r1) + r2;
    r1.xyz = norm(r2);
    r2.x = (Bones[0][a0.y].x * input_2.x) + (Bones[0][a0.y].y * input_2.y) + (Bones[0][a0.y].z * input_2.z);
    r2.y = (Bones[1][a0.y].x * input_2.x) + (Bones[1][a0.y].y * input_2.y) + (Bones[1][a0.y].z * input_2.z);
    r2.z = (Bones[2][a0.y].x * input_2.x) + (Bones[2][a0.y].y * input_2.y) + (Bones[2][a0.y].z * input_2.z);
    r3.xyz = r2 * input_6.y;
    r2.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r2.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r2.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r3.xyz = (input_6.x * r2) + r3;
    r2.x = (Bones[0][a0.z].x * input_2.x) + (Bones[0][a0.z].y * input_2.y) + (Bones[0][a0.z].z * input_2.z);
    r2.y = (Bones[1][a0.z].x * input_2.x) + (Bones[1][a0.z].y * input_2.y) + (Bones[1][a0.z].z * input_2.z);
    r2.z = (Bones[2][a0.z].x * input_2.x) + (Bones[2][a0.z].y * input_2.y) + (Bones[2][a0.z].z * input_2.z);
    r4.xyz = (input_6.z * r2) + r3;
    r3.x = (Bones[0][a0.w].x * input_2.x) + (Bones[0][a0.w].y * input_2.y) + (Bones[0][a0.w].z * input_2.z);
    r3.y = (Bones[1][a0.w].x * input_2.x) + (Bones[1][a0.w].y * input_2.y) + (Bones[1][a0.w].z * input_2.z);
    r3.z = (Bones[2][a0.w].x * input_2.x) + (Bones[2][a0.w].y * input_2.y) + (Bones[2][a0.w].z * input_2.z);
    r2.x = (r1.x * LightDirection[0].x) + (r1.y * LightDirection[0].y) + (r1.z * LightDirection[0].z);
    r3.xyz = (r1.w * r3) + r4;
    r5.xyz = norm(r3);
    r3.x = (Bones[0][a0.y].x * input_3.x) + (Bones[0][a0.y].y * input_3.y) + (Bones[0][a0.y].z * input_3.z);
    r3.y = (Bones[1][a0.y].x * input_3.x) + (Bones[1][a0.y].y * input_3.y) + (Bones[1][a0.y].z * input_3.z);
    r3.z = (Bones[2][a0.y].x * input_3.x) + (Bones[2][a0.y].y * input_3.y) + (Bones[2][a0.y].z * input_3.z);
    r4.xyz = r3 * input_6.y;
    r3.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r3.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r3.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r4.xyz = (input_6.x * r3) + r4;
    r3.x = (Bones[0][a0.z].x * input_3.x) + (Bones[0][a0.z].y * input_3.y) + (Bones[0][a0.z].z * input_3.z);
    r3.y = (Bones[1][a0.z].x * input_3.x) + (Bones[1][a0.z].y * input_3.y) + (Bones[1][a0.z].z * input_3.z);
    r3.z = (Bones[2][a0.z].x * input_3.x) + (Bones[2][a0.z].y * input_3.y) + (Bones[2][a0.z].z * input_3.z);
    r4.xyz = (input_6.z * r3) + r4;
    r3.x = (Bones[0][a0.w].x * input_3.x) + (Bones[0][a0.w].y * input_3.y) + (Bones[0][a0.w].z * input_3.z);
    r3.y = (Bones[1][a0.w].x * input_3.x) + (Bones[1][a0.w].y * input_3.y) + (Bones[1][a0.w].z * input_3.z);
    r3.z = (Bones[2][a0.w].x * input_3.x) + (Bones[2][a0.w].y * input_3.y) + (Bones[2][a0.w].z * input_3.z);
    r2.y = (r5.x * LightDirection[0].x) + (r5.y * LightDirection[0].y) + (r5.z * LightDirection[0].z);
    r4.xyz = (r1.w * r3) + r4;
    r3.xyz = norm(r4);
    r6.xyz = EyePosition - r0;
    r2.z = (r3.x * LightDirection[0].x) + (r3.y * LightDirection[0].y) + (r3.z * LightDirection[0].z);
    r4.xyz = norm(r6);
    r1.x = (r1.x * r4.x) + (r1.y * r4.y) + (r1.z * r4.z);
    r1.y = (r5.x * r4.x) + (r5.y * r4.y) + (r5.z * r4.z);
    r1.z = (r3.x * r4.x) + (r3.y * r4.y) + (r3.z * r4.z);
    r5.xyz = norm(r2);
    texcoord_1.xyz = r5;
    r5.xyz = norm(r1);
    texcoord_6.xyz = r5;
    r1.x = (ShadowProj[0].x * r0.x) + (ShadowProj[0].y * r0.y) + (ShadowProj[0].z * r0.z) + (ShadowProj[0].w * r0.w);
    r1.y = (ShadowProj[1].x * r0.x) + (ShadowProj[1].y * r0.y) + (ShadowProj[1].z * r0.z) + (ShadowProj[1].w * r0.w);
    r1.w = (ShadowProj[3].x * r0.x) + (ShadowProj[3].y * r0.y) + (ShadowProj[3].z * r0.z) + (ShadowProj[3].w * r0.w);
    r3.xy = (r1.w * ShadowProjTransform) - r1;
    r2.xy = r1 - ShadowProjData;
    r4.y = r1.w * ShadowProjTransform.w;
    r1.x = (SkinModelViewProj[0].x * r0.x) + (SkinModelViewProj[0].y * r0.y) + (SkinModelViewProj[0].z * r0.z) + (SkinModelViewProj[0].w * r0.w);
    r1.y = (SkinModelViewProj[1].x * r0.x) + (SkinModelViewProj[1].y * r0.y) + (SkinModelViewProj[1].z * r0.z) + (SkinModelViewProj[1].w * r0.w);
    r1.z = (SkinModelViewProj[2].x * r0.x) + (SkinModelViewProj[2].y * r0.y) + (SkinModelViewProj[2].z * r0.z) + (SkinModelViewProj[2].w * r0.w);
    r0.w = 1.0 / r4.y;
    r0.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    texcoord_7.xy = r3 * r0.w;
    r0.w = 1.0 / sqrt(r0.x);
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    texcoord_7.z = r2.x * r1.w;
    r0.w = r0.w * r2.w;
    texcoord_7.w = (r2.y * -r1.w) - const_0.x;
    r0.w = (r0.w >= const_0.z ? r0.w : const_0.z);
    position.xyz = r1;
    r0.w = (r0.w < const_0.x ? r0.w : const_0.x);
    color_1.w = const_0.x - r0.w;
    texcoord_0.xy = input_4;
    color_0 = input_5;
    color_1.xyz = FogColor;

// approximately 127 instruction slots used
