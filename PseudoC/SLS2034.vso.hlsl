//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2034.vso /Fcshaderdump19/SLS2034.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 EyePosition;
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
//   EyePosition         EyePosition      1
//   ShadowProj[0]       ShadowProj[0]      1
//   ShadowProj[1]       ShadowProj[1]      1
//   ShadowProj[2]       ShadowProj[2]      1
//   ShadowProj[3]       ShadowProj[3]      1
//   ShadowProjData      ShadowProjData      1
//   ShadowProjTransform ShadowProjTransform      1
//   Bones               SkinModelViewProj[3]2     54
//

    const_0 = {1, 765.01001, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    dcl_blendweight input_5
    dcl_blendindices input_6
    r0 = input_6.zyxw * const_0.y;
    r0 = r0 - floor(r0);
    r2.x = (input_5.x * const_0.x.x) + (input_5.y * const_0.x.y) + (input_5.z * const_0.x.z);
    r1 = (input_6.zyxw * const_0.y) - r0;
    r0 = (input_0.xyzx * const_0.xxxz) - const_0.zzzx;
    mova a0, r1
    r1.w = const_0.x - r2.x;
    r1.x = (SkinModelViewProj[3]2[a0.y].x * r0.x) + (SkinModelViewProj[3]2[a0.y].y * r0.y) + (SkinModelViewProj[3]2[a0.y].z * r0.z) + (SkinModelViewProj[3]2[a0.y].w * r0.w);
    r1.y = (SkinModelViewProj[3]3[a0.y].x * r0.x) + (SkinModelViewProj[3]3[a0.y].y * r0.y) + (SkinModelViewProj[3]3[a0.y].z * r0.z) + (SkinModelViewProj[3]3[a0.y].w * r0.w);
    r1.z = (SkinModelViewProj[3]4[a0.y].x * r0.x) + (SkinModelViewProj[3]4[a0.y].y * r0.y) + (SkinModelViewProj[3]4[a0.y].z * r0.z) + (SkinModelViewProj[3]4[a0.y].w * r0.w);
    r2.xyz = r1 * input_5.y;
    r1.x = (SkinModelViewProj[3]2[a0.x].x * r0.x) + (SkinModelViewProj[3]2[a0.x].y * r0.y) + (SkinModelViewProj[3]2[a0.x].z * r0.z) + (SkinModelViewProj[3]2[a0.x].w * r0.w);
    r1.y = (SkinModelViewProj[3]3[a0.x].x * r0.x) + (SkinModelViewProj[3]3[a0.x].y * r0.y) + (SkinModelViewProj[3]3[a0.x].z * r0.z) + (SkinModelViewProj[3]3[a0.x].w * r0.w);
    r1.z = (SkinModelViewProj[3]4[a0.x].x * r0.x) + (SkinModelViewProj[3]4[a0.x].y * r0.y) + (SkinModelViewProj[3]4[a0.x].z * r0.z) + (SkinModelViewProj[3]4[a0.x].w * r0.w);
    r2.xyz = (input_5.x * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.z].x * r0.x) + (SkinModelViewProj[3]2[a0.z].y * r0.y) + (SkinModelViewProj[3]2[a0.z].z * r0.z) + (SkinModelViewProj[3]2[a0.z].w * r0.w);
    r1.y = (SkinModelViewProj[3]3[a0.z].x * r0.x) + (SkinModelViewProj[3]3[a0.z].y * r0.y) + (SkinModelViewProj[3]3[a0.z].z * r0.z) + (SkinModelViewProj[3]3[a0.z].w * r0.w);
    r1.z = (SkinModelViewProj[3]4[a0.z].x * r0.x) + (SkinModelViewProj[3]4[a0.z].y * r0.y) + (SkinModelViewProj[3]4[a0.z].z * r0.z) + (SkinModelViewProj[3]4[a0.z].w * r0.w);
    r2.xyz = (input_5.z * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.w].x * r0.x) + (SkinModelViewProj[3]2[a0.w].y * r0.y) + (SkinModelViewProj[3]2[a0.w].z * r0.z) + (SkinModelViewProj[3]2[a0.w].w * r0.w);
    r1.y = (SkinModelViewProj[3]3[a0.w].x * r0.x) + (SkinModelViewProj[3]3[a0.w].y * r0.y) + (SkinModelViewProj[3]3[a0.w].z * r0.z) + (SkinModelViewProj[3]3[a0.w].w * r0.w);
    r1.z = (SkinModelViewProj[3]4[a0.w].x * r0.x) + (SkinModelViewProj[3]4[a0.w].y * r0.y) + (SkinModelViewProj[3]4[a0.w].z * r0.z) + (SkinModelViewProj[3]4[a0.w].w * r0.w);
    r0.xyz = (r1.w * r1) + r2;
    r0.w = const_0.x;
    position.x = (SkinModelViewProj[0].x * r0.x) + (SkinModelViewProj[0].y * r0.y) + (SkinModelViewProj[0].z * r0.z) + (SkinModelViewProj[0].w * r0.w);
    position.y = (SkinModelViewProj[1].x * r0.x) + (SkinModelViewProj[1].y * r0.y) + (SkinModelViewProj[1].z * r0.z) + (SkinModelViewProj[1].w * r0.w);
    position.z = (SkinModelViewProj[2].x * r0.x) + (SkinModelViewProj[2].y * r0.y) + (SkinModelViewProj[2].z * r0.z) + (SkinModelViewProj[2].w * r0.w);
    position.w = (SkinModelViewProj[3].x * r0.x) + (SkinModelViewProj[3].y * r0.y) + (SkinModelViewProj[3].z * r0.z) + (SkinModelViewProj[3].w * r0.w);
    r1.x = (SkinModelViewProj[3]2[a0.y].x * input_1.x) + (SkinModelViewProj[3]2[a0.y].y * input_1.y) + (SkinModelViewProj[3]2[a0.y].z * input_1.z);
    r1.y = (SkinModelViewProj[3]3[a0.y].x * input_1.x) + (SkinModelViewProj[3]3[a0.y].y * input_1.y) + (SkinModelViewProj[3]3[a0.y].z * input_1.z);
    r1.z = (SkinModelViewProj[3]4[a0.y].x * input_1.x) + (SkinModelViewProj[3]4[a0.y].y * input_1.y) + (SkinModelViewProj[3]4[a0.y].z * input_1.z);
    r2.xyz = r1 * input_5.y;
    r1.x = (SkinModelViewProj[3]2[a0.x].x * input_1.x) + (SkinModelViewProj[3]2[a0.x].y * input_1.y) + (SkinModelViewProj[3]2[a0.x].z * input_1.z);
    r1.y = (SkinModelViewProj[3]3[a0.x].x * input_1.x) + (SkinModelViewProj[3]3[a0.x].y * input_1.y) + (SkinModelViewProj[3]3[a0.x].z * input_1.z);
    r1.z = (SkinModelViewProj[3]4[a0.x].x * input_1.x) + (SkinModelViewProj[3]4[a0.x].y * input_1.y) + (SkinModelViewProj[3]4[a0.x].z * input_1.z);
    r2.xyz = (input_5.x * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.z].x * input_1.x) + (SkinModelViewProj[3]2[a0.z].y * input_1.y) + (SkinModelViewProj[3]2[a0.z].z * input_1.z);
    r1.y = (SkinModelViewProj[3]3[a0.z].x * input_1.x) + (SkinModelViewProj[3]3[a0.z].y * input_1.y) + (SkinModelViewProj[3]3[a0.z].z * input_1.z);
    r1.z = (SkinModelViewProj[3]4[a0.z].x * input_1.x) + (SkinModelViewProj[3]4[a0.z].y * input_1.y) + (SkinModelViewProj[3]4[a0.z].z * input_1.z);
    r2.xyz = (input_5.z * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.w].x * input_1.x) + (SkinModelViewProj[3]2[a0.w].y * input_1.y) + (SkinModelViewProj[3]2[a0.w].z * input_1.z);
    r1.y = (SkinModelViewProj[3]3[a0.w].x * input_1.x) + (SkinModelViewProj[3]3[a0.w].y * input_1.y) + (SkinModelViewProj[3]3[a0.w].z * input_1.z);
    r1.z = (SkinModelViewProj[3]4[a0.w].x * input_1.x) + (SkinModelViewProj[3]4[a0.w].y * input_1.y) + (SkinModelViewProj[3]4[a0.w].z * input_1.z);
    r3.xyz = (r1.w * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.y].x * input_2.x) + (SkinModelViewProj[3]2[a0.y].y * input_2.y) + (SkinModelViewProj[3]2[a0.y].z * input_2.z);
    r1.y = (SkinModelViewProj[3]3[a0.y].x * input_2.x) + (SkinModelViewProj[3]3[a0.y].y * input_2.y) + (SkinModelViewProj[3]3[a0.y].z * input_2.z);
    r1.z = (SkinModelViewProj[3]4[a0.y].x * input_2.x) + (SkinModelViewProj[3]4[a0.y].y * input_2.y) + (SkinModelViewProj[3]4[a0.y].z * input_2.z);
    r2.xyz = r1 * input_5.y;
    r1.x = (SkinModelViewProj[3]2[a0.x].x * input_2.x) + (SkinModelViewProj[3]2[a0.x].y * input_2.y) + (SkinModelViewProj[3]2[a0.x].z * input_2.z);
    r1.y = (SkinModelViewProj[3]3[a0.x].x * input_2.x) + (SkinModelViewProj[3]3[a0.x].y * input_2.y) + (SkinModelViewProj[3]3[a0.x].z * input_2.z);
    r1.z = (SkinModelViewProj[3]4[a0.x].x * input_2.x) + (SkinModelViewProj[3]4[a0.x].y * input_2.y) + (SkinModelViewProj[3]4[a0.x].z * input_2.z);
    r2.xyz = (input_5.x * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.z].x * input_2.x) + (SkinModelViewProj[3]2[a0.z].y * input_2.y) + (SkinModelViewProj[3]2[a0.z].z * input_2.z);
    r1.y = (SkinModelViewProj[3]3[a0.z].x * input_2.x) + (SkinModelViewProj[3]3[a0.z].y * input_2.y) + (SkinModelViewProj[3]3[a0.z].z * input_2.z);
    r1.z = (SkinModelViewProj[3]4[a0.z].x * input_2.x) + (SkinModelViewProj[3]4[a0.z].y * input_2.y) + (SkinModelViewProj[3]4[a0.z].z * input_2.z);
    r2.xyz = (input_5.z * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.w].x * input_2.x) + (SkinModelViewProj[3]2[a0.w].y * input_2.y) + (SkinModelViewProj[3]2[a0.w].z * input_2.z);
    r1.y = (SkinModelViewProj[3]3[a0.w].x * input_2.x) + (SkinModelViewProj[3]3[a0.w].y * input_2.y) + (SkinModelViewProj[3]3[a0.w].z * input_2.z);
    r1.z = (SkinModelViewProj[3]4[a0.w].x * input_2.x) + (SkinModelViewProj[3]4[a0.w].y * input_2.y) + (SkinModelViewProj[3]4[a0.w].z * input_2.z);
    r4.xyz = norm(r3);
    r1.xyz = (r1.w * r1) + r2;
    r5.x = (r4.x * LightDirection[0].x) + (r4.y * LightDirection[0].y) + (r4.z * LightDirection[0].z);
    r3.xyz = norm(r1);
    r5.y = (r3.x * LightDirection[0].x) + (r3.y * LightDirection[0].y) + (r3.z * LightDirection[0].z);
    r1.x = (SkinModelViewProj[3]2[a0.y].x * input_3.x) + (SkinModelViewProj[3]2[a0.y].y * input_3.y) + (SkinModelViewProj[3]2[a0.y].z * input_3.z);
    r1.y = (SkinModelViewProj[3]3[a0.y].x * input_3.x) + (SkinModelViewProj[3]3[a0.y].y * input_3.y) + (SkinModelViewProj[3]3[a0.y].z * input_3.z);
    r1.z = (SkinModelViewProj[3]4[a0.y].x * input_3.x) + (SkinModelViewProj[3]4[a0.y].y * input_3.y) + (SkinModelViewProj[3]4[a0.y].z * input_3.z);
    r2.xyz = r1 * input_5.y;
    r1.x = (SkinModelViewProj[3]2[a0.x].x * input_3.x) + (SkinModelViewProj[3]2[a0.x].y * input_3.y) + (SkinModelViewProj[3]2[a0.x].z * input_3.z);
    r1.y = (SkinModelViewProj[3]3[a0.x].x * input_3.x) + (SkinModelViewProj[3]3[a0.x].y * input_3.y) + (SkinModelViewProj[3]3[a0.x].z * input_3.z);
    r1.z = (SkinModelViewProj[3]4[a0.x].x * input_3.x) + (SkinModelViewProj[3]4[a0.x].y * input_3.y) + (SkinModelViewProj[3]4[a0.x].z * input_3.z);
    r2.xyz = (input_5.x * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.z].x * input_3.x) + (SkinModelViewProj[3]2[a0.z].y * input_3.y) + (SkinModelViewProj[3]2[a0.z].z * input_3.z);
    r1.y = (SkinModelViewProj[3]3[a0.z].x * input_3.x) + (SkinModelViewProj[3]3[a0.z].y * input_3.y) + (SkinModelViewProj[3]3[a0.z].z * input_3.z);
    r1.z = (SkinModelViewProj[3]4[a0.z].x * input_3.x) + (SkinModelViewProj[3]4[a0.z].y * input_3.y) + (SkinModelViewProj[3]4[a0.z].z * input_3.z);
    r2.xyz = (input_5.z * r1) + r2;
    r1.x = (SkinModelViewProj[3]2[a0.w].x * input_3.x) + (SkinModelViewProj[3]2[a0.w].y * input_3.y) + (SkinModelViewProj[3]2[a0.w].z * input_3.z);
    r1.y = (SkinModelViewProj[3]3[a0.w].x * input_3.x) + (SkinModelViewProj[3]3[a0.w].y * input_3.y) + (SkinModelViewProj[3]3[a0.w].z * input_3.z);
    r1.z = (SkinModelViewProj[3]4[a0.w].x * input_3.x) + (SkinModelViewProj[3]4[a0.w].y * input_3.y) + (SkinModelViewProj[3]4[a0.w].z * input_3.z);
    r6.xyz = (r1.w * r1) + r2;
    r2.xyz = EyePosition - r0;
    r1.xyz = norm(r6);
    r6.x = (r2.x * r2.x) + (r2.y * r2.y) + (r2.z * r2.z);
    r5.z = (r1.x * LightDirection[0].x) + (r1.y * LightDirection[0].y) + (r1.z * LightDirection[0].z);
    r1.w = 1.0 / sqrt(r6.x);
    r6.xyz = (r1.w * r2) + LightDirection[0];
    r2.xyz = norm(r6);
    r6.xyz = norm(r5);
    texcoord_1.xyz = r6;
    texcoord_3.x = (r4.x * r2.x) + (r4.y * r2.y) + (r4.z * r2.z);
    texcoord_3.y = (r3.x * r2.x) + (r3.y * r2.y) + (r3.z * r2.z);
    r3.x = (ShadowProj[0].x * r0.x) + (ShadowProj[0].y * r0.y) + (ShadowProj[0].z * r0.z) + (ShadowProj[0].w * r0.w);
    r3.y = (ShadowProj[1].x * r0.x) + (ShadowProj[1].y * r0.y) + (ShadowProj[1].z * r0.z) + (ShadowProj[1].w * r0.w);
    r0.w = (ShadowProj[3].x * r0.x) + (ShadowProj[3].y * r0.y) + (ShadowProj[3].z * r0.z) + (ShadowProj[3].w * r0.w);
    texcoord_3.z = (r1.x * r2.x) + (r1.y * r2.y) + (r1.z * r2.z);
    r1.xy = (r0.w * ShadowProjTransform) - r3;
    r0.xy = r3 - ShadowProjData;
    r2.y = r0.w * ShadowProjTransform.w;
    r1.w = 1.0 / r2.y;
    r0.w = 1.0 / ShadowProjData.w;
    texcoord_6.xy = r1 * r1.w;
    texcoord_6.z = r0.x * r0.w;
    texcoord_6.w = (r0.y * -r0.w) - const_0.x;
    texcoord_0.xy = input_4;

// approximately 114 instruction slots used