//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2039.vso /Fcshaderdump19/GRASS2039.vso.dis
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
//   float4 LightPosition;
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
//   LightPosition const_3       1
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

    const float4 const_8 = {-0.5, 0.01, 1, 0};
    const float4 const_16 = {(1.0 / 128), (1.0 / (PI * 2)), 0.5, 0};
    const float4 const_17 = {PI * 2, -PI, 0, 0};
    const float4 const_18 = {D3DSINCOSCONST1};
    const float4 const_19 = {D3DSINCOSCONST2};
    float4 IN.position : POSITION;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r0.xyzw = frac(InstanceData[0 + offset.w]);
    r1.xyz = r0.xyz - 0.5;
    r0.xyz = r0.w * IN.color_0.rgb;
    r2.xyz = 2 * r1.xyz;
    r1.x = dot(DiffuseDir.xyz, r2.xyz);
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r1.w = max(r1.x, 0);
    r1.x = WindData.w;
    r0.w = (r0.w * (1.0 / 128)) + r1.x;
    r1.w = min(r1.w, 1);
    r0.w = (r0.w * (1.0 / (PI * 2))) + 0.5;
    r4.xyz = r0.xyz * r1.w;
    r0.w = frac(r0.w);
    r1.w = (r0.w * PI * 2) - PI;
    r1.xy = EyeVector.xy * EyeVector.xy;
    r0.y = sin(r1.w);
    r0.w = r1.y + r1.x;
    r1.w = r0.y * WindData.z;
    r2.w = 1.0 / sqrt(r0.w);
    r0.w = IN.color_0.a * IN.color_0.a;
    r0.xy = r2.w * -EyeVector.xy;
    r1.w = r1.w * r0.w;
    r3.xyw = r2.zyz * r0.yxx;
    r1.yz = const_8.yz;
    r0.w = r1.y * InstanceData[0 + offset.w].w;
    r3.xy = -r3.xy;
    r3.z = (r2.x * r0.y) + r3.y;
    r5.xyz = (r0.w * ScaleMask.xyz) + r1.z;
    r1.xyz = normalize(r3.xwz);
    r3.xyz = r5.xyz * IN.position.xyz;
    r0.z = r1.y;
    r0.w = r2.y;
    r0.y = dot(r0.zyw, r3.xyz);
    r0.w = r2.x;
    r0.z = r1.x;
    r2.xy = r1.z * const_8.zw;
    r0.x = dot(r0.zxw, r3.xyz);
    r0.z = dot(r2.xyz, r3.xyz);
    r0.xy = (r1.w * WindData.xy) + r0.xy;
    r1.xyz = r0.xyz + InstanceData[0 + offset.w];
    r1.w = IN.position.w;
    r2.xyz = r4.xyz * DiffuseColor.rgb;
    r0.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, r1.xyzw);
    OUT.texcoord_5.xyz = r2.xyz * AddlParams.x;
    r2.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    r1.w = 1.0 / sqrt(r2.x);
    r1.xyz = LightPosition.xyz - r1.xyz;
    r1.w = 1.0 / r1.w;
    r1.w = FogParam.x - r1.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = r1.w * r2.w;
    r2.w = dot(r0.xyzw, r0.xyzw);	// normalize + length
    r1.w = max(r1.w, 0);
    r2.w = 1.0 / sqrt(r2.w);
    r1.w = min(r1.w, 1);
    r2.w = 1.0 / r2.w;
    r2.xy = r2.w - AlphaParam.xz;
    r3.x = 1.0 / AlphaParam.y;
    r3.y = 1.0 / AlphaParam.w;
    OUT.color_0.a = 1 - r1.w;
    r2.xy = r2.xy * r3.xy;
    OUT.position.xyzw = r0.xyzw;
    r0.xy = max(r2.xy, 0);
    r2.xy = min(r0.xy, 1);
    r1.w = 1.0 / LightPosition.w;
    r0.w = 1 - r2.y;
    r0.xyz = r1.xyz * r1.w;
    OUT.texcoord_5.w = r2.x * r0.w;
    OUT.texcoord_1.xyz = (0.5 * r0.xyz) - -0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    OUT.texcoord_1.w = 0.5;
    OUT.color_0.rgb = FogColor.rgb;

// approximately 88 instruction slots used
