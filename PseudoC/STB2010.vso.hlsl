//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2010.vso /Fcshaderdump19/STB2010.vso.dis
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
//   LightPosition[0]  LightPosition[0]      1
//   LightPosition[1]  LightPosition[1]      1
//   FogParam       FogParam      1
//   FogColor       FogColor      1
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

    const_4 = {0.5, 0, 1, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    dcl_blendindices input_5
    r0.w = input_5.y - floor(input_5.y);
    r0.w = input_5.y - r0.w;
    mova a0.w, r0.w
    r0.x = (WindMatrices[00][a0.w].x * input_0.x) + (WindMatrices[00][a0.w].y * input_0.y) + (WindMatrices[00][a0.w].z * input_0.z) + (WindMatrices[00][a0.w].w * input_0.w);
    r0.y = (WindMatrices[01][a0.w].x * input_0.x) + (WindMatrices[01][a0.w].y * input_0.y) + (WindMatrices[01][a0.w].z * input_0.z) + (WindMatrices[01][a0.w].w * input_0.w);
    r0.z = (WindMatrices[02][a0.w].x * input_0.x) + (WindMatrices[02][a0.w].y * input_0.y) + (WindMatrices[02][a0.w].z * input_0.z) + (WindMatrices[02][a0.w].w * input_0.w);
    r0.w = (WindMatrices[03][a0.w].x * input_0.x) + (WindMatrices[03][a0.w].y * input_0.y) + (WindMatrices[03][a0.w].z * input_0.z) + (WindMatrices[03][a0.w].w * input_0.w);
    r0 = r0 - input_0;
    r1 = input_0;
    r0 = (input_5.x * r0) + r1;
    position.w = (ModelViewProj[3].x * r0.x) + (ModelViewProj[3].y * r0.y) + (ModelViewProj[3].z * r0.z) + (ModelViewProj[3].w * r0.w);
    r1.xyz = EyePosition - r0;
    r3.x = (input_1.x * LightDirection.x) + (input_1.y * LightDirection.y) + (input_1.z * LightDirection.z);
    r2.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r3.y = (input_2.x * LightDirection.x) + (input_2.y * LightDirection.y) + (input_2.z * LightDirection.z);
    r1.w = 1.0 / sqrt(r2.x);
    r3.z = (input_3.x * LightDirection.x) + (input_3.y * LightDirection.y) + (input_3.z * LightDirection.z);
    r2.xyz = (r1.w * r1) + LightDirection;
    r4.xyz = norm(r2);
    r2.x = (input_1.x * r4.x) + (input_1.y * r4.y) + (input_1.z * r4.z);
    r2.y = (input_2.x * r4.x) + (input_2.y * r4.y) + (input_2.z * r4.z);
    r2.z = (input_3.x * r4.x) + (input_3.y * r4.y) + (input_3.z * r4.z);
    r4.xyz = norm(r3);
    texcoord_1.xyz = r4;
    r3.x = (r2.x * r2.x) + (r2.y * r2.y) + (r2.z * r2.z);
    r2.w = 1.0 / sqrt(r3.x);
    r3.xyz = LightPosition[1] - r0;
    texcoord_3.xyz = r2 * r2.w;
    r2.xyz = norm(r3);
    texcoord_2.x = (input_1.x * r2.x) + (input_1.y * r2.y) + (input_1.z * r2.z);
    texcoord_2.y = (input_2.x * r2.x) + (input_2.y * r2.y) + (input_2.z * r2.z);
    texcoord_2.z = (input_3.x * r2.x) + (input_3.y * r2.y) + (input_3.z * r2.z);
    r2.xyz = (r1.w * r1) + r2;
    r1.w = 1.0 / LightPosition[1].w;
    r1.x = (ModelViewProj[0].x * r0.x) + (ModelViewProj[0].y * r0.y) + (ModelViewProj[0].z * r0.z) + (ModelViewProj[0].w * r0.w);
    r1.y = (ModelViewProj[1].x * r0.x) + (ModelViewProj[1].y * r0.y) + (ModelViewProj[1].z * r0.z) + (ModelViewProj[1].w * r0.w);
    r1.z = (ModelViewProj[2].x * r0.x) + (ModelViewProj[2].y * r0.y) + (ModelViewProj[2].z * r0.z) + (ModelViewProj[2].w * r0.w);
    r0.xyz = r3 * r1.w;
    r3.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    texcoord_5.xyz = (const_4.x * r0) + const_4.x;
    r0.w = 1.0 / sqrt(r3.x);
    r0.xyz = norm(r2);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    texcoord_4.x = (input_1.x * r0.x) + (input_1.y * r0.y) + (input_1.z * r0.z);
    r0.w = r0.w * r1.w;
    texcoord_4.y = (input_2.x * r0.x) + (input_2.y * r0.y) + (input_2.z * r0.z);
    r0.w = (r0.w >= const_4.y ? r0.w : const_4.y);
    texcoord_4.z = (input_3.x * r0.x) + (input_3.y * r0.y) + (input_3.z * r0.z);
    r0.w = (r0.w < const_4.z ? r0.w : const_4.z);
    position.xyz = r1;
    color_1.w = const_4.z - r0.w;
    texcoord_0.xy = input_4;
    texcoord_5.w = const_4.x;
    color_0 = (input_5.z * const_4.zzzy) - const_4.yyyz;
    color_1.xyz = FogColor;

// approximately 65 instruction slots used