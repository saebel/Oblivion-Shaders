//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2023.vso /Fcshaderdump19/GRASS2023.vso.dis
//
//
// Parameters:
//
//   float4 AddlParams;
//   float4 AlphaParam;
//   float4 AmbientColor;
//   float3 DiffuseColor;
//   float3 DiffuseDir;
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
//   DiffuseDir    const_0       1
//   DiffuseColor  const_1       1
//   ScaleMask     const_2       1
//   WindData      const_4       1
//   AlphaParam    const_5       1
//   AmbientColor  const_6       1
//   AddlParams    const_7       1
//   ModelViewProj[0] const_9        1
//   ModelViewProj[1] const_10        1
//   ModelViewProj[2] const_11        1
//   ModelViewProj[3] const_12        1
//   FogColor      const_14      1
//   FogParam      const_15      1
//   InstanceData[0]  const_20       1
//   InstanceData[1]  const_21       1
//

    const float4 const_3 = {-0.5, 0.01, 1, (1.0 / 17)};
    const int4 const_8 = {0, 2, -1, 1};
    const float4 const_13 = {(1.0 / 128), (1.0 / (PI * 2)), 0.5, 0};
    const float4 const_16 = {PI * 2, -PI, 0, 0};
    const float4 const_17 = {D3DSINCOSCONST1};
    const float4 const_18 = {D3DSINCOSCONST2};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = IN.texcoord_1.x - floor(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r2 = InstanceData[0 + offset.w] - floor(InstanceData[0 + offset.w]);
    r2.xyz = r2 + const_3.x;
    r0.xyz = r2 + r2;
    r1.xyz = abs(r0);
    r1 = (r1.yzxz >= r1.xxyy ? 1.0 : 0.0);
    r2.x = (const_8.y * r2.y) - r0.z;
    r3.xy = r1.ywzw * r1.xzzw;
    r0.w = -r0.y;
    r2.yz = r0.x * const_8.xzww;
    r2.xy = (r3.y * r2) + r0.wxzw;
    r2.z = r3.y * r2.z;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r1.yz = (r0.xzyw * const_8.xzww) - r2;
    r1.w = r0.w * const_3.w;
    r1.x = -r2.x;
    r1.w = r1.w - floor(r1.w);
    r1.xyz = (r3.x * r1) + r2;
    r1.w = r1.w + const_3.x;
    r5.xyz = normalize(r1);
    r1.x = r1.w + r1.w;
    r2.xyz = r0.yzxw * r5.zxyw;
    r1.w = (r1.x * -r1.x) + const_3.z;
    r4.xyz = (r5.yzxw * r0.zxyw) - r2;
    r1.w = 1.0 / sqrt(r1.w);
    r1.w = 1.0 / r1.w;
    r1.z = const_8.x;
    r2.x = dot(r1.wxzw, IN.normal);
    r1.y = -r1.w;
    r3.xyz = r5 * r2.x;
    r6.x = dot(r1, IN.normal);
    r2.xyz = r2.w * IN.color_0;
    r3.xyz = (r6.x * r4) + r3;
    r6.x = WindData.w;
    r2.w = (r0.w * const_13.x) + r6.x;
    r3.xyz = (IN.normal.z * r0) + r3;
    r3.x = dot(DiffuseDir, r3);
    r3.yz = const_3;
    r3.w = r3.y * InstanceData[0 + offset.w].w;
    r0.w = max(r3.x, const_8.x);
    r3.xyz = (r3.w * ScaleMask) + r3.z;
    r0.w = min(r0.w, const_3.z);
    r3.xyz = r3 * IN.position;
    r6.x = dot(r1.wxzw, r3);
    r1.w = (r2.w * const_13.y) + const_13.z;
    r3.x = dot(r1, r3);
    r1.w = r1.w - floor(r1.w);
    r1.xyz = r5 * r6.x;
    r2.w = (r1.w * const_16.x) + const_16.y;
    r4.xyz = (r3.x * r4) + r1;
    r1.y = sin(r2.w);
    r2.w = r1.y * WindData.z;
    r1.w = IN.color_0.a * IN.color_0.w;
    r0.xyz = (r3.z * r0) + r4;
    r1.w = r2.w * r1.w;
    r0.xy = (r1.w * WindData) + r0;
    r1.xyz = r0 + InstanceData[0 + offset.w];
    r1.w = IN.position.w;
    r2.xyz = r2 * DiffuseColor;
    r0.x = dot(ModelViewProj[0], r1);
    r0.y = dot(ModelViewProj[1], r1);
    r0.z = dot(ModelViewProj[2], r1);
    r2.xyz = r0.w * r2;
    r3.x = dot(r0, r0);	// normalize + length
    OUT.texcoord_5.xyz = r2 * AddlParams.x;
    r2.w = 1.0 / sqrt(r3.x);
    r0.w = dot(ModelViewProj[3], r1);
    r1.w = 1.0 / r2.w;
    r1.w = FogParam.x - r1.w;
    r2.w = dot(r0, r0);	// normalize + length
    r3.w = 1.0 / FogParam.y;
    r2.w = 1.0 / sqrt(r2.w);
    r1.w = r1.w * r3.w;
    r2.w = 1.0 / r2.w;
    r1.xy = r2.w - AlphaParam.xzzw;
    r2.x = 1.0 / AlphaParam.y;
    r2.y = 1.0 / AlphaParam.w;
    r1.w = max(r1.w, const_8.x);
    r1.xy = r1 * r2;
    r1.w = min(r1.w, const_3.z);
    r1.xy = max(r1, const_8.x);
    OUT.color_0.a = const_3.z - r1.w;
    r1.xy = min(r1, const_3.z);
    OUT.position = r0;
    r0.w = const_3.z - r1.y;
    OUT.texcoord_5.w = r1.x * r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4 = AmbientColor;
    OUT.color_0.rgb = FogColor;

// approximately 100 instruction slots used
