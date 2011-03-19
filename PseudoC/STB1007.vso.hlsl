//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1007.vso /Fcshaderdump19/STB1007.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 LightDirection[3];
//   row_major float4x4 ModelViewProj;
//   float4 WindMatrices[16];
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
//   EyePosition    EyePosition      1
//   WindMatrices[00]  WindMatrices[00]      1
//   WindMatrices[01]  WindMatrices[01]      1
//   WindMatrices[02]  WindMatrices[02]      1
//   WindMatrices[03]  WindMatrices[03]      1
//   WindMatrices[04]  WindMatrices[04]      1
//   WindMatrices[05]  WindMatrices[05]      1
//   WindMatrices[06]  WindMatrices[06]      1
//   WindMatrices[07]  WindMatrices[07]      1
//   WindMatrices[08]  WindMatrices[08]      1
//   WindMatrices[09]  WindMatrices[09]      1
//   WindMatrices[10]  WindMatrices[10]      1
//   WindMatrices[11]  WindMatrices[11]      1
//   WindMatrices[12]  WindMatrices[12]      1
//   WindMatrices[13]  WindMatrices[13]      1
//   WindMatrices[14]  WindMatrices[14]      1
//   WindMatrices[15]  WindMatrices[15]      1
//

    const_4 = {0.5, 0, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    dcl_blendindices input_5
    a0.x = input_5.y;
    r0.x = (WindMatrices[00][a0.x].x * input_0.x) + (WindMatrices[00][a0.x].y * input_0.y) + (WindMatrices[00][a0.x].z * input_0.z) + (WindMatrices[00][a0.x].w * input_0.w);
    r0.y = (WindMatrices[01][a0.x].x * input_0.x) + (WindMatrices[01][a0.x].y * input_0.y) + (WindMatrices[01][a0.x].z * input_0.z) + (WindMatrices[01][a0.x].w * input_0.w);
    r0.z = (WindMatrices[02][a0.x].x * input_0.x) + (WindMatrices[02][a0.x].y * input_0.y) + (WindMatrices[02][a0.x].z * input_0.z) + (WindMatrices[02][a0.x].w * input_0.w);
    r0.w = (WindMatrices[03][a0.x].x * input_0.x) + (WindMatrices[03][a0.x].y * input_0.y) + (WindMatrices[03][a0.x].z * input_0.z) + (WindMatrices[03][a0.x].w * input_0.w);
    r0 = r0 - input_0;
    r1 = input_0;
    r0 = (input_5.x * r0) + r1;
    r1.xyz = EyePosition - r0;
    r2.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r1.w = 1.0 / sqrt(r2.x);
    r1.xyz = (r1.w * r1) + LightDirection;
    position.x = (ModelViewProj[0].x * r0.x) + (ModelViewProj[0].y * r0.y) + (ModelViewProj[0].z * r0.z) + (ModelViewProj[0].w * r0.w);
    r2.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    position.y = (ModelViewProj[1].x * r0.x) + (ModelViewProj[1].y * r0.y) + (ModelViewProj[1].z * r0.z) + (ModelViewProj[1].w * r0.w);
    r1.w = 1.0 / sqrt(r2.x);
    position.z = (ModelViewProj[2].x * r0.x) + (ModelViewProj[2].y * r0.y) + (ModelViewProj[2].z * r0.z) + (ModelViewProj[2].w * r0.w);
    r1.xyz = r1 * r1.w;
    position.w = (ModelViewProj[3].x * r0.x) + (ModelViewProj[3].y * r0.y) + (ModelViewProj[3].z * r0.z) + (ModelViewProj[3].w * r0.w);
    r0.x = (input_1.x * r1.x) + (input_1.y * r1.y) + (input_1.z * r1.z);
    r0.y = (input_2.x * r1.x) + (input_2.y * r1.y) + (input_2.z * r1.z);
    r0.z = (input_3.x * r1.x) + (input_3.y * r1.y) + (input_3.z * r1.z);
    texcoord_1.xyz = (const_4.x * r0) + const_4.x;
    texcoord_0.xy = input_4;

// approximately 24 instruction slots used