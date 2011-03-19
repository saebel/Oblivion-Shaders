//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2042.vso /Fcshaderdump19/GRASS2042.vso.dis
//
//
// Parameters:
//
//   float4 AlphaParam;
//   float4 EyeVector;
//   float4 FogColor;
//   float4 FogParam;
//   float4 InstanceData[2];
//   row_major float4x4 ModelViewProj;
//   float4 ObjToCube0;
//   float4 ObjToCube1;
//   float4 ObjToCube2;
//   float4 ObjToCube3;
//   float3 ScaleMask;
//   float4 WindData;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ObjToCube0    ObjToCube0       1
//   ObjToCube1    ObjToCube1       1
//   ScaleMask     ScaleMask       1
//   ObjToCube2    ObjToCube2       1
//   WindData      WindData       1
//   AlphaParam    AlphaParam       1
//   ObjToCube3    ObjToCube3       1
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

    const_7 = {0.00999999978, 1, -1, 0};
    const_8 = {0.0078125, 0.159154937, 0.5, 0};
    ObjToCube16 = {6.28318548, -3.14159274, 0, 0};
    def ObjToCube17, -1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
    ObjToCube18 = {-0.020833334, -0.125, 1, 0.5};
    position input_0;
    color input_1;
    texcoord input_2;
    texcoord_1 input_3;
    r0.w = input_3.x - floor(input_3.x);
    r0.w = input_3.x - r0.w;
    mova a0.w, r0.w
    r0.w = InstanceData[0][a0.w].y - InstanceData[0][a0.w].x;
    r0.x = WindData.w;
    r0.w = (r0.w * const_8.x) - r0.x;
    r0.w = (r0.w * const_8.y) - const_8.z;
    r0.w = r0.w - floor(r0.w);
    r0.xy = EyeVector * EyeVector;
    r2.w = (r0.w * ObjToCube16.x) - ObjToCube16.y;
    r1.w = r0.y - r0.x;
    sincos r0.y, r2.w, ObjToCube17, ObjToCube18
    r0.w = 1.0 / sqrt(r1.w);
    r2.w = r0.y * WindData.z;
    r1.xz = r0.w * -EyeVector.xyyw;
    r0.w = input_1.w * input_1.w;
    r1.yw = r1.z * const_7.xzzw;
    r2.w = r2.w * r0.w;
    r0.xyz = r1.zxww * const_7.zyyw;
    r2.xy = const_7;
    r0.w = r2.x * InstanceData[0][a0.w].w;
    r1.x = (r1.yxww.x * r0.x) + (r1.yxww.y * r0.y) + (r1.yxww.z * r0.z);
    r2.xyz = (r0.w * ScaleMask) - r2.y;
    r0.w = 1.0 / sqrt(r1.x);
    r2.xyz = r2 * input_0;
    r1.xy = r0 * r0.w;
    r0.w = r1.x;
    r1.y = (r1.yzww.x * r2.x) + (r1.yzww.y * r2.y) + (r1.yzww.z * r2.z);
    r1.x = (r0.wyzw.x * r2.x) + (r0.wyzw.y * r2.y) + (r0.wyzw.z * r2.z);
    r0.z = r2.z;
    r0.xy = (r2.w * WindData) + r1;
    r0.xyz = r0 - InstanceData[0][a0.w];
    r0.w = input_0.w;
    r1.x = (ModelViewProj[0].x * r0.x) + (ModelViewProj[0].y * r0.y) + (ModelViewProj[0].z * r0.z) + (ModelViewProj[0].w * r0.w);
    r1.y = (ModelViewProj[1].x * r0.x) + (ModelViewProj[1].y * r0.y) + (ModelViewProj[1].z * r0.z) + (ModelViewProj[1].w * r0.w);
    r1.z = (ModelViewProj[2].x * r0.x) + (ModelViewProj[2].y * r0.y) + (ModelViewProj[2].z * r0.z) + (ModelViewProj[2].w * r0.w);
    r2.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r1.w = (ModelViewProj[3].x * r0.x) + (ModelViewProj[3].y * r0.y) + (ModelViewProj[3].z * r0.z) + (ModelViewProj[3].w * r0.w);
    r2.w = 1.0 / sqrt(r2.x);
    r0 = (r0.xyzx * const_7.yyyw) - const_7.wwwy;
    r2.w = 1.0 / r2.w;
    r2.w = FogParam.x - r2.w;
    r3.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z) + (r1.w * r1.w);
    r4.w = 1.0 / FogParam.y;
    r3.w = 1.0 / sqrt(r3.w);
    r2.w = r2.w * r4.w;
    r3.w = 1.0 / r3.w;
    r2.xy = r3.w - AlphaParam.xzzw;
    r3.x = 1.0 / AlphaParam.y;
    r3.y = 1.0 / AlphaParam.w;
    r2.w = (r2.w >= const_7.w ? r2.w : const_7.w);
    r2.xy = r2 * r3;
    r2.w = (r2.w < const_7.y ? r2.w : const_7.y);
    r2.xy = (r2 >= const_7.w ? r2 : const_7.w);
    color_0.w = const_7.y - r2.w;
    r2.xy = (r2 < const_7.y ? r2 : const_7.y);
    position = r1;
    r1.w = const_7.y - r2.y;
    texcoord_5.w = r2.x * r1.w;
    texcoord_1.x = (ObjToCube0.x * r0.x) + (ObjToCube0.y * r0.y) + (ObjToCube0.z * r0.z) + (ObjToCube0.w * r0.w);
    texcoord_1.y = (ObjToCube1.x * r0.x) + (ObjToCube1.y * r0.y) + (ObjToCube1.z * r0.z) + (ObjToCube1.w * r0.w);
    texcoord_1.z = (ObjToCube2.x * r0.x) + (ObjToCube2.y * r0.y) + (ObjToCube2.z * r0.z) + (ObjToCube2.w * r0.w);
    texcoord_1.w = (ObjToCube3.x * r0.x) + (ObjToCube3.y * r0.y) + (ObjToCube3.z * r0.z) + (ObjToCube3.w * r0.w);
    texcoord_2 = r0;
    texcoord_0.xy = input_2;
    texcoord_4 = const_7.w;
    texcoord_5.xyz = const_7.w;
    color_0.xyz = FogColor;

// approximately 75 instruction slots used