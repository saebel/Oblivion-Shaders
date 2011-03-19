//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2012.vso /Fcshaderdump19/SKIN2012.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 LightDirection[3];
//   float4 LightPosition[3];
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
//   LightPosition[0]  LightPosition[0]      1
//   LightPosition[1]  LightPosition[1]      1
//   LightPosition[2]  LightPosition[2]      1
//   EyePosition    EyePosition      1
//

    const_4 = {0.5, 0, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    position.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    position.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    position.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r1.x = (input_1.x * LightDirection.x) + (input_1.y * LightDirection.y) + (input_1.z * LightDirection.z);
    r1.y = (input_2.x * LightDirection.x) + (input_2.y * LightDirection.y) + (input_2.z * LightDirection.z);
    r1.z = (input_3.x * LightDirection.x) + (input_3.y * LightDirection.y) + (input_3.z * LightDirection.z);
    r0.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r2.xyz = EyePosition - input_0;
    r0.w = 1.0 / sqrt(r0.x);
    r0.xyz = norm(r2);
    texcoord_1.xyz = r1 * r0.w;
    r2.x = (input_1.x * r0.x) + (input_1.y * r0.y) + (input_1.z * r0.z);
    r2.y = (input_2.x * r0.x) + (input_2.y * r0.y) + (input_2.z * r0.z);
    r2.z = (input_3.x * r0.x) + (input_3.y * r0.y) + (input_3.z * r0.z);
    r0.x = (r2.x * r2.x) + (r2.y * r2.y) + (r2.z * r2.z);
    r1.xyz = LightPosition[1] - input_0;
    r0.w = 1.0 / sqrt(r0.x);
    r0.xyz = norm(r1);
    texcoord_7.xyz = r2 * r0.w;
    texcoord_2.x = (input_1.x * r0.x) + (input_1.y * r0.y) + (input_1.z * r0.z);
    texcoord_2.y = (input_2.x * r0.x) + (input_2.y * r0.y) + (input_2.z * r0.z);
    texcoord_2.z = (input_3.x * r0.x) + (input_3.y * r0.y) + (input_3.z * r0.z);
    r0.w = 1.0 / LightPosition[1].w;
    r0.xyz = LightPosition[2] - input_0;
    r2.xyz = r1 * r0.w;
    r1.xyz = norm(r0);
    texcoord_4.xyz = (const_4.x * r2) + const_4.x;
    texcoord_3.x = (input_1.x * r1.x) + (input_1.y * r1.y) + (input_1.z * r1.z);
    texcoord_3.y = (input_2.x * r1.x) + (input_2.y * r1.y) + (input_2.z * r1.z);
    r0.w = 1.0 / LightPosition[2].w;
    texcoord_3.z = (input_3.x * r1.x) + (input_3.y * r1.y) + (input_3.z * r1.z);
    r0.xyz = r0 * r0.w;
    texcoord_5.xyz = (const_4.x * r0) + const_4.x;
    texcoord_0.xy = input_4;
    texcoord_4.w = const_4.x;
    texcoord_5.w = const_4.x;

// approximately 43 instruction slots used
