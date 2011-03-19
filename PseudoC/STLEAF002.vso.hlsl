//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STLEAF002.vso /Fcshaderdump19/STLEAF002.vso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   float4 BillboardRight;
//   float4 BillboardUp;
//   float4 DiffColor;
//   float4 DiffColorPt;
//   float4 LeafBase[48];
//   float4 LeafLighting;
//   float4 LightPos;
//   float4 LightVector;
//   row_major float4x4 ModelViewProj;
//   float4 RockParams;
//   float4 RustleParams;
//   float SunDimmer;
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
//   AmbientColor   AmbientColor       1
//   DiffColor      DiffColor       1
//   DiffColorPt    DiffColorPt       1
//   SunDimmer      SunDimmer      1
//   LightVector    LightVector      1
//   LightPos       LightPos      1
//   BillboardRight BillboardRight      1
//   BillboardUp    BillboardUp      1
//   RockParams     RockParams      1
//   RustleParams   RustleParams      1
//   LeafLighting   LeafLighting      1
//   WindMatrices   ModelViewProj[1]8     16
//   LeafBase       ModelViewProj[3]4     48
//

    def const_4, 6.28318548, -3.14159274, -2.52398507e-007, 2.47609005e-005
    const_8 = {0.020833334, 0.499999553, 0.25, -0.00138883968};
    const_9 = {0.159154937, 0.25, 0.5, 0};
    const_82 = {0.0416666418, -0.5, 1, 0};
    position input_0;
    normal input_1;
    texcoord input_2;
    dcl_blendindices input_3
    r0.w = const_8.x;
    r1.w = (input_3.z * r0.w) - RockParams.y;
    r2.w = (r1.w * const_8.y) - const_8.z;
    r6.y = pow(2.0, r2.w);	// partial precision
    r1.w = r6.y;
    r1.w = (r1.w * const_4.x) - const_4.y;
    r1.w = r1.w * r1.w;
    r2.w = (input_3.z * r0.w) - RustleParams.y;
    r0.w = (r1.w * const_4.z) - const_4.w;
    r3.w = (r2.w * const_8.y) - const_8.z;
    r2.w = (r1.w * r0.w) - const_8.w;
    r6.y = pow(2.0, r3.w);	// partial precision
    r0.w = r6.y;
    r2.w = (r1.w * r2.w) - const_82.x;
    r0.w = (r0.w * const_4.x) - const_4.y;
    r2.w = (r1.w * r2.w) - const_82.y;
    r0.w = r0.w * r0.w;
    r2.w = (r1.w * r2.w) - const_82.z;
    r1.w = (r0.w * const_4.z) - const_4.w;
    r2.w = r2.w * RockParams.z;
    r1.w = (r0.w * r1.w) - const_8.w;
    r2.w = r2.w * RockParams.x;
    r1.w = (r0.w * r1.w) - const_82.x;
    r1.xy = (r2.w * const_9.x) - const_9.yzzw;
    r1.w = (r0.w * r1.w) - const_82.y;
    r0.xy = r1 - floor(r1);
    r0.w = (r0.w * r1.w) - const_82.z;
    r0.xy = (const_4.x * r0) + const_4.y;
    r0.w = r0.w * RustleParams.z;
    r0.xy = r0 * r0;
    r0.w = r0.w * RustleParams.x;
    r1.xy = (const_4.z * r0) + const_4.w;
    r3.xy = (r0.w * const_9.x) - const_9.yzzw;
    r1.xy = (r1 * r0) + const_8.w;
    r2.xy = r3 - floor(r3);
    r1.xy = (r1 * r0) + const_82.x;
    r2.xy = (const_4.x * r2) + const_4.y;
    r1.xy = (r1 * r0) + const_82.y;
    r2.xy = r2 * r2;
    r0.xw = (r0.yyzx * r1.yyzx) - const_82.z;
    r1.xy = (const_4.z * r2) + const_4.w;
    r0.y = -r0.w;
    r1.xy = (r1 * r2) + const_8.w;
    r0.z = const_82.w;
    r3.xy = (r1 * r2) + const_82.x;
    a0.x = input_3.z;
    r1 = input_3.w * ModelViewProj[3]4[a0.x];
    r3.xy = (r3 * r2) + const_82.y;
    r5.x = (r0.zxyw.x * r1.x) + (r0.zxyw.y * r1.y) + (r0.zxyw.z * r1.z);
    r3.xw = (r2.yyzx * r3.yyzx) - const_82.z;
    r3.y = -r3.w;
    r3.z = const_82.w;
    r4.x = (r0.zwxw.x * r1.x) + (r0.zwxw.y * r1.y) + (r0.zwxw.z * r1.z);
    r2.x = (r3.x * BillboardRight.x) + (r3.y * BillboardRight.y) + (r3.z * BillboardRight.z);
    r0.x = (r3.x * BillboardUp.x) + (r3.y * BillboardUp.y) + (r3.z * BillboardUp.z);
    r2.y = (r3.wxzw.x * BillboardRight.x) + (r3.wxzw.y * BillboardRight.y) + (r3.wxzw.z * BillboardRight.z);
    r0.y = (r3.wxzw.x * BillboardUp.x) + (r3.wxzw.y * BillboardUp.y) + (r3.wxzw.z * BillboardUp.z);
    r2.zw = BillboardRight;
    r2 = r5.x * r2;
    r0.zw = BillboardUp;
    r0 = (r4.x * r0) - r2;
    r2 = r0 - input_0;
    a0.x = input_3.y;
    r0.x = (ModelViewProj[1]8[a0.x].x * r2.x) + (ModelViewProj[1]8[a0.x].y * r2.y) + (ModelViewProj[1]8[a0.x].z * r2.z) + (ModelViewProj[1]8[a0.x].w * r2.w);
    r0.y = (ModelViewProj[1]9[a0.x].x * r2.x) + (ModelViewProj[1]9[a0.x].y * r2.y) + (ModelViewProj[1]9[a0.x].z * r2.z) + (ModelViewProj[1]9[a0.x].w * r2.w);
    r0.z = (ModelViewProj[2]0[a0.x].x * r2.x) + (ModelViewProj[2]0[a0.x].y * r2.y) + (ModelViewProj[2]0[a0.x].z * r2.z) + (ModelViewProj[2]0[a0.x].w * r2.w);
    r0.w = (ModelViewProj[2]1[a0.x].x * r2.x) + (ModelViewProj[2]1[a0.x].y * r2.y) + (ModelViewProj[2]1[a0.x].z * r2.z) + (ModelViewProj[2]1[a0.x].w * r2.w);
    r0 = r0 - r2;
    r0 = (input_3.x * r0) + r2;
    position.x = (ModelViewProj[0].x * r0.x) + (ModelViewProj[0].y * r0.y) + (ModelViewProj[0].z * r0.z) + (ModelViewProj[0].w * r0.w);
    position.y = (ModelViewProj[1].x * r0.x) + (ModelViewProj[1].y * r0.y) + (ModelViewProj[1].z * r0.z) + (ModelViewProj[1].w * r0.w);
    r1.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z) + (r1.w * r1.w);
    position.z = (ModelViewProj[2].x * r0.x) + (ModelViewProj[2].y * r0.y) + (ModelViewProj[2].z * r0.z) + (ModelViewProj[2].w * r0.w);
    r1.w = 1.0 / sqrt(r1.w);
    position.w = (ModelViewProj[3].x * r0.x) + (ModelViewProj[3].y * r0.y) + (ModelViewProj[3].z * r0.z) + (ModelViewProj[3].w * r0.w);
    r2.xyz = r1 * r1.w;
    r1.xyz = LightPos - r0;
    r0.xyz = (LeafLighting.y * r2) + input_1;
    r3.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r2.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r1.w = 1.0 / sqrt(r3.x);
    r0.w = 1.0 / sqrt(r2.x);
    r0.xyz = r0 * r1.w;
    r1.xyz = r1 * r0.w;
    r1.w = 1.0 / r0.w;
    r2.x = (r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z);
    r1.x = (r0.x * LightVector.x) + (r0.y * LightVector.y) + (r0.z * LightVector.z);
    r0.w = (r2.x >= const_82.w ? r2.x : const_82.w);
    r0.w = (r0.w < const_82.z ? r0.w : const_82.z);
    r2.w = 1.0 / LightPos.w;
    r0 = r0.w * DiffColorPt;
    r1.w = r1.w * r2.w;
    r2.w = (r1.w >= const_82.w ? r1.w : const_82.w);
    r1.w = (r1.x >= const_82.w ? r1.x : const_82.w);
    r2.w = (r2.w < const_82.z ? r2.w : const_82.z);
    r1.w = (r1.w < const_82.z ? r1.w : const_82.z);
    r2.w = (r2.w * -r2.w) - const_82.z;
    r1 = r1.w * DiffColor;
    r3.w = SunDimmer.x;
    r1 = (r3.w * r1) + AmbientColor;
    r6.y = pow(2.0, input_3.z);	// partial precision
    r3.w = r6.y;
    r1.xyz = r1 * r3.w;
    texcoord_1 = (r2.w * r0) + r1;
    texcoord_0.xy = input_2;

// approximately 109 instruction slots used
