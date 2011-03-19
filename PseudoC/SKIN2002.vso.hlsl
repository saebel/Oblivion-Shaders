//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2002.vso /Fcshaderdump19/SKIN2002.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   row_major float4x4 ModelViewProj;
//   row_major float4x4 ShadowProj;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   ModelViewProj[0]    ModelViewProj[0]       1
//   ModelViewProj[1]    ModelViewProj[1]       1
//   ModelViewProj[2]    ModelViewProj[2]       1
//   ModelViewProj[3]    ModelViewProj[3]       1
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
//

    const_4 = {1, 0, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r0.x = (input_1.x * LightDirection[0].x) + (input_1.y * LightDirection[0].y) + (input_1.z * LightDirection[0].z);
    r0.y = (input_2.x * LightDirection[0].x) + (input_2.y * LightDirection[0].y) + (input_2.z * LightDirection[0].z);
    r0.z = (input_3.x * LightDirection[0].x) + (input_3.y * LightDirection[0].y) + (input_3.z * LightDirection[0].z);
    r1.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r2.xyz = EyePosition - input_0;
    r0.w = 1.0 / sqrt(r1.x);
    r1.xyz = norm(r2);
    texcoord_1.xyz = r0 * r0.w;
    r0.x = (input_1.x * r1.x) + (input_1.y * r1.y) + (input_1.z * r1.z);
    r0.y = (input_2.x * r1.x) + (input_2.y * r1.y) + (input_2.z * r1.z);
    r0.z = (input_3.x * r1.x) + (input_3.y * r1.y) + (input_3.z * r1.z);
    r1.w = (ShadowProj[3].x * input_0.x) + (ShadowProj[3].y * input_0.y) + (ShadowProj[3].z * input_0.z) + (ShadowProj[3].w * input_0.w);
    r1.y = r1.w * ShadowProjTransform.w;
    r4.xyz = norm(r0);
    texcoord_6.xyz = r4;
    r0.w = 1.0 / r1.y;
    r1.x = (ShadowProj[0].x * input_0.x) + (ShadowProj[0].y * input_0.y) + (ShadowProj[0].z * input_0.z) + (ShadowProj[0].w * input_0.w);
    r1.y = (ShadowProj[1].x * input_0.x) + (ShadowProj[1].y * input_0.y) + (ShadowProj[1].z * input_0.z) + (ShadowProj[1].w * input_0.w);
    r2.xy = (r1.w * ShadowProjTransform) - r1;
    r0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    r0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r1.xy = r1 - ShadowProjData;
    r3.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    texcoord_7.xy = r0.w * r2;
    r0.w = 1.0 / sqrt(r3.x);
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    texcoord_7.z = r1.x * r1.w;
    r0.w = r0.w * r2.w;
    texcoord_7.w = (r1.y * -r1.w) - const_4.x;
    r0.w = (r0.w >= const_4.y ? r0.w : const_4.y);
    position.xyz = r0;
    r0.w = (r0.w < const_4.x ? r0.w : const_4.x);
    color_1.w = const_4.x - r0.w;
    texcoord_0.xy = input_4;
    color_0 = input_5;
    color_1.xyz = FogColor;

// approximately 45 instruction slots used
