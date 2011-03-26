//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2037.vso /Fcshaderdump19/GRASS2037.vso.dis
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
//   EyeVector     const_13      1
//   FogColor      const_14      1
//   FogParam      const_15      1
//   InstanceData[0]  const_20       1
//   InstanceData[1]  const_21       1
//

    const float4 const_3 = {-0.5, 0.01, 1, 0};
    const float4 const_8 = {(1.0 / 128), (1.0 / (PI * 2)), 0.5, 0};
    const float4 const_16 = {PI * 2, -PI, 0, 0};
    const float4 const_17 = {D3DSINCOSCONST1};
    const float4 const_18 = {D3DSINCOSCONST2};
    float4 IN.position : POSITION;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r0 = frac(InstanceData[0 + offset.w]);
    r4.xyz = r0.w * IN.color_0;
    r0.xyz = r0 + -0.5;
    r2.xyz = r0 + r0;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r0.x = dot(DiffuseDir, r2);
    r1.x = WindData.w;
    r0.w = (r0.w * (1.0 / 128)) + r1.x;
    r1.w = max(r0.x, 0);
    r0.w = (r0.w * (1.0 / (PI * 2))) + 0.5;
    r2.w = min(r1.w, 1);
    r0.w = frac(r0.w);
    r1.w = (r0.w * PI * 2) + -PI;
    r1.xy = EyeVector * EyeVector;
    r0.y = sin(r1.w);
    r0.w = r1.y + r1.x;
    r1.w = r0.y * WindData.z;
    r3.w = 1.0 / sqrt(r0.w);
    r0.w = IN.color_0.a * IN.color_0.w;
    r0.xy = r3.w * -EyeVector;
    r1.w = r1.w * r0.w;
    r3.xyw = r2.zyzz * r0.yxzx;
    r1.yz = const_3;
    r0.w = r1.y * InstanceData[0 + offset.w].w;
    r3.xy = -r3;
    r3.z = (r2.x * r0.y) + r3.y;
    r5.xyz = (r0.w * ScaleMask) + r1.z;
    r1.xyz = normalize(r3.xwzw);
    r3.xyz = r5 * IN.position;
    r0.z = r1.y;
    r0.w = r2.y;
    r0.y = dot(r0.zyww, r3);
    r0.w = r2.x;
    r0.z = r1.x;
    r2.xy = r1.z * const_3.zwzw;
    r0.x = dot(r0.zxww, r3);
    r0.z = dot(r2, r3);
    r0.xy = (r1.w * WindData) + r0;
    r1.xyz = r0 + InstanceData[0 + offset.w];
    r1.w = IN.position.w;
    r2.xyz = r4 * r2.w;
    r0.x = dot(ModelViewProj[0], r1);
    r0.y = dot(ModelViewProj[1], r1);
    r0.z = dot(ModelViewProj[2], r1);
    r2.xyz = r2 * DiffuseColor;
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
    r1.w = max(r1.w, 0);
    r1.xy = r1 * r2;
    r1.w = min(r1.w, 1);
    r1.xy = max(r1, 0);
    OUT.color_0.a = 1 - r1.w;
    r1.xy = min(r1, 1);
    OUT.position = r0;
    r0.w = 1 - r1.y;
    OUT.texcoord_5.w = r1.x * r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4 = AmbientColor;
    OUT.color_0.rgb = FogColor;

// approximately 83 instruction slots used
