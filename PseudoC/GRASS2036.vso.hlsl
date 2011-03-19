//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2036.vso /Fcshaderdump19/GRASS2036.vso.dis
//
//
// Parameters:
//
//   float4 AddlParams;
//   float4 AlphaParam;
//   float4 AmbientColor;
//   float3 DiffuseColor;
//   float3 DiffuseDir;
//   float4 EyeVector;
//   float4 FogColor;
//   float4 FogParam;
//   float4 InstanceData[2];
//   row_major float4x4 ModelViewProj;
//   float3 ScaleMask;
//   float4 WindData;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   DiffuseDir    DiffuseDir       1
//   DiffuseColor  DiffuseColor       1
//   ScaleMask     ScaleMask       1
//   WindData      WindData       1
//   AlphaParam    AlphaParam       1
//   AmbientColor  AmbientColor       1
//   AddlParams    AddlParams       1
//   ModelViewProj[0] ModelViewProj[0]       1
//   ModelViewProj[1] ModelViewProj[1]      1
//   ModelViewProj[2] ModelViewProj[2]      1
//   ModelViewProj[3] ModelViewProj[3]      1
//   EyeVector     EyeVector      1
//   FogColor      FogColor      1
//   FogParam      FogParam      1
//   InstanceData[0]  InstanceData[0]      1
//   InstanceData[1]  InstanceData[1]      1
//

    const_3 = {-0.5, 0.00999999978, 1, 0};
    const_8 = {-1, 1, 0.0078125, 0};
    DiffuseColor6 = {0.159154937, 0.5, 6.28318548, -3.14159274};
    def DiffuseColor7, -1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
    DiffuseColor8 = {-0.020833334, -0.125, 1, 0.5};
    position input_0;
    color input_1;
    texcoord input_2;
    texcoord_1 input_3;
    r0.w = input_3.x - floor(input_3.x);
    r0.w = input_3.x - r0.w;
    mova a0.w, r0.w
    r0 = InstanceData[0][a0.w] - floor(InstanceData[0][a0.w]);
    r0.xyz = r0 - const_3.x;
    r2.xyz = r0.w * input_1;
    r0.xyz = r0 - r0;
    r0.x = (DiffuseDir.x * r0.x) + (DiffuseDir.y * r0.y) + (DiffuseDir.z * r0.z);
    r0.w = InstanceData[0][a0.w].y - InstanceData[0][a0.w].x;
    r1.w = (r0.x >= const_3.w ? r0.x : const_3.w);
    r0.y = const_8.z;
    r0.w = (r0.w * r0.y) - WindData.w;
    r2.w = (r1.w < const_3.z ? r1.w : const_3.z);
    r0.w = (r0.w * DiffuseColor6.x) - DiffuseColor6.y;
    r0.w = r0.w - floor(r0.w);
    r0.xy = EyeVector * EyeVector;
    r3.w = (r0.w * DiffuseColor6.z) - DiffuseColor6.w;
    r1.w = r0.y - r0.x;
    sincos r0.y, r3.w, DiffuseColor7, DiffuseColor8
    r0.w = 1.0 / sqrt(r1.w);
    r3.w = r0.y * WindData.z;
    r1.xz = r0.w * -EyeVector.xyyw;
    r0.w = input_1.w * input_1.w;
    r1.yw = r1.z * -const_3.xzzw;
    r3.w = r3.w * r0.w;
    r0.xyz = r1.zxww * const_8.xyyw;
    r3.yz = const_3;
    r0.w = r3.y * InstanceData[0][a0.w].w;
    r1.x = (r1.yxww.x * r0.x) + (r1.yxww.y * r0.y) + (r1.yxww.z * r0.z);
    r3.xyz = (r0.w * ScaleMask) - r3.z;
    r0.w = 1.0 / sqrt(r1.x);
    r3.xyz = r3 * input_0;
    r1.xy = r0 * r0.w;
    r0.w = r1.x;
    r1.y = (r1.yzww.x * r3.x) + (r1.yzww.y * r3.y) + (r1.yzww.z * r3.z);
    r1.x = (r0.wyzw.x * r3.x) + (r0.wyzw.y * r3.y) + (r0.wyzw.z * r3.z);
    r0.z = r3.z;
    r0.xy = (r3.w * WindData) + r1;
    r1.xyz = r0 - InstanceData[0][a0.w];
    r1.w = input_0.w;
    r2.xyz = r2 * r2.w;
    r0.x = (ModelViewProj[0].x * r1.x) + (ModelViewProj[0].y * r1.y) + (ModelViewProj[0].z * r1.z) + (ModelViewProj[0].w * r1.w);
    r0.y = (ModelViewProj[1].x * r1.x) + (ModelViewProj[1].y * r1.y) + (ModelViewProj[1].z * r1.z) + (ModelViewProj[1].w * r1.w);
    r0.z = (ModelViewProj[2].x * r1.x) + (ModelViewProj[2].y * r1.y) + (ModelViewProj[2].z * r1.z) + (ModelViewProj[2].w * r1.w);
    r2.xyz = r2 * DiffuseColor;
    r3.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    texcoord_5.xyz = r2 * AddlParams.x;
    r2.w = 1.0 / sqrt(r3.x);
    r0.w = (ModelViewProj[3].x * r1.x) + (ModelViewProj[3].y * r1.y) + (ModelViewProj[3].z * r1.z) + (ModelViewProj[3].w * r1.w);
    r1.w = 1.0 / r2.w;
    r1.w = FogParam.x - r1.w;
    r2.w = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z) + (r0.w * r0.w);
    r3.w = 1.0 / FogParam.y;
    r2.w = 1.0 / sqrt(r2.w);
    r1.w = r1.w * r3.w;
    r2.w = 1.0 / r2.w;
    r1.xy = r2.w - AlphaParam.xzzw;
    r2.x = 1.0 / AlphaParam.y;
    r2.y = 1.0 / AlphaParam.w;
    r1.w = (r1.w >= const_3.w ? r1.w : const_3.w);
    r1.xy = r1 * r2;
    r1.w = (r1.w < const_3.z ? r1.w : const_3.z);
    r1.xy = (r1 >= const_3.w ? r1 : const_3.w);
    color_0.w = const_3.z - r1.w;
    r1.xy = (r1 < const_3.z ? r1 : const_3.z);
    position = r0;
    r0.w = const_3.z - r1.y;
    texcoord_5.w = r1.x * r0.w;
    texcoord_0.xy = input_2;
    texcoord_4 = AmbientColor;
    color_0.xyz = FogColor;

// approximately 78 instruction slots used