//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2034.vso /Fcshaderdump19/PAR2034.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float4 LightPosition[3];
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] ModelViewProj[0]       1
//   ModelViewProj[1] ModelViewProj[1]       1
//   ModelViewProj[2] ModelViewProj[2]       1
//   ModelViewProj[3] ModelViewProj[3]       1
//   LightPosition LightPosition      1
//   EyePosition   EyePosition      1
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
    r0.xyz = LightPosition - input_0;
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r2.xyz = norm(r0);
    r3.x = (input_1.x * r2.x) + (input_1.y * r2.y) + (input_1.z * r2.z);
    r3.y = (input_2.x * r2.x) + (input_2.y * r2.y) + (input_2.z * r2.z);
    r3.z = (input_3.x * r2.x) + (input_3.y * r2.y) + (input_3.z * r2.z);
    r1.xyz = EyePosition - input_0;
    r4.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r0.w = 1.0 / sqrt(r4.x);
    r4.xyz = norm(r3);
    texcoord_1.xyz = r4;
    r3.xyz = (r0.w * r1) + r2;
    r2.xyz = r1 * r0.w;
    r1.xyz = norm(r3);
    texcoord_3.x = (input_1.x * r1.x) + (input_1.y * r1.y) + (input_1.z * r1.z);
    texcoord_3.y = (input_2.x * r1.x) + (input_2.y * r1.y) + (input_2.z * r1.z);
    texcoord_3.z = (input_3.x * r1.x) + (input_3.y * r1.y) + (input_3.z * r1.z);
    r1.x = (input_1.x * r2.x) + (input_1.y * r2.y) + (input_1.z * r2.z);
    r1.y = (input_2.x * r2.x) + (input_2.y * r2.y) + (input_2.z * r2.z);
    r1.z = (input_3.x * r2.x) + (input_3.y * r2.y) + (input_3.z * r2.z);
    r1.w = 1.0 / LightPosition.w;
    r0.xyz = r0 * r1.w;
    r4.xyz = norm(r1);
    texcoord_7.xyz = r4;
    texcoord_5.xyz = (const_4.x * r0) + const_4.x;
    texcoord_0.xy = input_4;
    texcoord_5.w = const_4.x;

// approximately 38 instruction slots used
