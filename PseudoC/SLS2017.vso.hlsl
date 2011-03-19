//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2017.vso /Fcshaderdump19/SLS2017.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   float4 LightPosition[3];
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
//   LightPosition       ModelViewProj[1]6      2
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

    const_4 = {0.5, 1, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r2.x = (input_1.x * LightDirection[0].x) + (input_1.y * LightDirection[0].y) + (input_1.z * LightDirection[0].z);
    r1.xyz = EyePosition - input_0;
    r2.y = (input_2.x * LightDirection[0].x) + (input_2.y * LightDirection[0].y) + (input_2.z * LightDirection[0].z);
    r0.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r2.z = (input_3.x * LightDirection[0].x) + (input_3.y * LightDirection[0].y) + (input_3.z * LightDirection[0].z);
    r0.w = 1.0 / sqrt(r0.x);
    r0.x = (r2.x * r2.x) + (r2.y * r2.y) + (r2.z * r2.z);
    r3.xyz = (r0.w * r1) + LightDirection[0];
    r1.w = 1.0 / sqrt(r0.x);
    r0.xyz = norm(r3);
    texcoord_1.xyz = r2 * r1.w;
    r3.x = (input_1.x * r0.x) + (input_1.y * r0.y) + (input_1.z * r0.z);
    r3.y = (input_2.x * r0.x) + (input_2.y * r0.y) + (input_2.z * r0.z);
    r3.z = (input_3.x * r0.x) + (input_3.y * r0.y) + (input_3.z * r0.z);
    r2.x = (r3.x * r3.x) + (r3.y * r3.y) + (r3.z * r3.z);
    r0.xyz = ModelViewProj[1]7 - input_0;
    r1.w = 1.0 / sqrt(r2.x);
    r2.xyz = norm(r0);
    texcoord_3.xyz = r3 * r1.w;
    texcoord_2.x = (input_1.x * r2.x) + (input_1.y * r2.y) + (input_1.z * r2.z);
    texcoord_2.y = (input_2.x * r2.x) + (input_2.y * r2.y) + (input_2.z * r2.z);
    texcoord_2.z = (input_3.x * r2.x) + (input_3.y * r2.y) + (input_3.z * r2.z);
    r2.xyz = (r0.w * r1) + r2;
    r0.w = 1.0 / ModelViewProj[1]7.w;
    r1.xyz = r0 * r0.w;
    r0.xyz = norm(r2);
    texcoord_5.xyz = (const_4.x * r1) + const_4.x;
    texcoord_4.x = (input_1.x * r0.x) + (input_1.y * r0.y) + (input_1.z * r0.z);
    texcoord_4.y = (input_2.x * r0.x) + (input_2.y * r0.y) + (input_2.z * r0.z);
    r0.w = (ShadowProj[3].x * input_0.x) + (ShadowProj[3].y * input_0.y) + (ShadowProj[3].z * input_0.z) + (ShadowProj[3].w * input_0.w);
    texcoord_4.z = (input_3.x * r0.x) + (input_3.y * r0.y) + (input_3.z * r0.z);
    r0.y = r0.w * ShadowProjTransform.w;
    r1.w = 1.0 / r0.y;
    r1.x = (ShadowProj[0].x * input_0.x) + (ShadowProj[0].y * input_0.y) + (ShadowProj[0].z * input_0.z) + (ShadowProj[0].w * input_0.w);
    r1.y = (ShadowProj[1].x * input_0.x) + (ShadowProj[1].y * input_0.y) + (ShadowProj[1].z * input_0.z) + (ShadowProj[1].w * input_0.w);
    r0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    r0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r2.xy = (r0.w * ShadowProjTransform) - r1;
    r3.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r1.xy = r1 - ShadowProjData;
    r0.w = 1.0 / sqrt(r3.x);
    texcoord_7.xy = r1.w * r2;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = r0.w * r2.w;
    texcoord_7.z = r1.x * r1.w;
    r0.w = (r0.w >= const_4.z ? r0.w : const_4.z);
    texcoord_7.w = (r1.y * -r1.w) - const_4.y;
    r0.w = (r0.w < const_4.y ? r0.w : const_4.y);
    position.xyz = r0;
    color_1.w = const_4.y - r0.w;
    texcoord_0.xy = input_4;
    texcoord_5.w = const_4.x;
    color_0 = input_5;
    color_1.xyz = FogColor;

// approximately 65 instruction slots used
