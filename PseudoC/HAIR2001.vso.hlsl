//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2001.vso /Fcshaderdump19/HAIR2001.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 LightColor[3];
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
//   LightColor[0]     LightColor[0]      1
//   LightColor[1]     LightColor[1]      1
//   EyePosition    EyePosition      1
//

    const_4 = {0, 1, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    position.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    position.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    position.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r0.xyz = EyePosition - input_0;
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r1.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r2.x = (input_1.x * LightDirection.x) + (input_1.y * LightDirection.y) + (input_1.z * LightDirection.z);
    r1.w = 1.0 / sqrt(r1.x);
    r2.y = (input_2.x * LightDirection.x) + (input_2.y * LightDirection.y) + (input_2.z * LightDirection.z);
    r1.xyz = (r1.w * r0) + LightDirection;
    r2.z = (input_3.x * LightDirection.x) + (input_3.y * LightDirection.y) + (input_3.z * LightDirection.z);
    r3.xyz = norm(r1);
    r1.x = (input_1.x * r3.x) + (input_1.y * r3.y) + (input_1.z * r3.z);
    r1.y = (input_2.x * r3.x) + (input_2.y * r3.y) + (input_2.z * r3.z);
    r1.z = (input_3.x * r3.x) + (input_3.y * r3.y) + (input_3.z * r3.z);
    r3.xyz = norm(r2);
    texcoord_2.xyz = r3;
    r0.xyz = r0 * r1.w;
    r3.xyz = norm(r1);
    texcoord_3.xyz = r3;
    r1.x = (input_1.x * r0.x) + (input_1.y * r0.y) + (input_1.z * r0.z);
    r1.y = (input_2.x * r0.x) + (input_2.y * r0.y) + (input_2.z * r0.z);
    r1.z = (input_3.x * r0.x) + (input_3.y * r0.y) + (input_3.z * r0.z);
    r0.xyz = LightPosition[1] - input_0;
    r2.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r1.w = 1.0 / sqrt(r2.x);
    r0.w = 1.0 / r1.w;
    r2.w = 1.0 / LightPosition[1].w;
    r3.xyz = norm(r1);
    texcoord_1.xyz = r3;
    r0.w = r0.w * r2.w;
    r0.xyz = r0 * r1.w;
    r0.w = (r0.w >= const_4.x ? r0.w : const_4.x);
    r0.x = (input_3.x * r0.x) + (input_3.y * r0.y) + (input_3.z * r0.z);
    r0.w = (r0.w < const_4.y ? r0.w : const_4.y);
    r1.w = (r0.x >= const_4.x ? r0.x : const_4.x);
    r0.w = const_4.y - r0.w;
    r0.xyz = r1.w * LightColor[1];
    r0.w = r0.w * r0.w;
    color_0.xyz = r0 * r0.w;
    texcoord_0.xy = input_4;
    color_0.w = const_4.y;
    color_1 = input_5;

// approximately 51 instruction slots used