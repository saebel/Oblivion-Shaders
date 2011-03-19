//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2011.vso /Fcshaderdump19/SLS2011.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  ModelViewProj[0]       1
//   ModelViewProj[1]  ModelViewProj[1]       1
//   ModelViewProj[2]  ModelViewProj[2]       1
//   ModelViewProj[3]  ModelViewProj[3]       1
//   LightDirection LightDirection      1
//   FogParam       FogParam      1
//   FogColor       FogColor      1
//   EyePosition    EyePosition      1
//

    const_4 = {0, 1, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r1.x = (input_1.x * LightDirection.x) + (input_1.y * LightDirection.y) + (input_1.z * LightDirection.z);
    r1.y = (input_2.x * LightDirection.x) + (input_2.y * LightDirection.y) + (input_2.z * LightDirection.z);
    r0.xyz = EyePosition - input_0;
    r1.z = (input_3.x * LightDirection.x) + (input_3.y * LightDirection.y) + (input_3.z * LightDirection.z);
    r3.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r1.w = 1.0 / sqrt(r3.x);
    r0.xyz = (r1.w * r0) + LightDirection;
    r4.xyz = norm(r1);
    texcoord_1.xyz = r4;
    r2.xyz = norm(r0);
    r1.x = (input_1.x * r2.x) + (input_1.y * r2.y) + (input_1.z * r2.z);
    r0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    r0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r1.y = (input_2.x * r2.x) + (input_2.y * r2.y) + (input_2.z * r2.z);
    r3.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r1.z = (input_3.x * r2.x) + (input_3.y * r2.y) + (input_3.z * r2.z);
    r0.w = 1.0 / sqrt(r3.x);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    r0.w = r0.w * r2.w;
    r4.xyz = norm(r1);
    texcoord_3.xyz = r4;
    r0.w = (r0.w >= const_4.x ? r0.w : const_4.x);
    position.xyz = r0;
    r0.w = (r0.w < const_4.y ? r0.w : const_4.y);
    color_1.w = const_4.y - r0.w;
    texcoord_0.xy = input_4;
    color_0 = input_5;
    color_1.xyz = FogColor;

// approximately 38 instruction slots used
