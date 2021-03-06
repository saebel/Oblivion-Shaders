//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2022.vso /Fcshaderdump19/GRASS2022.vso.dis
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
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r0.xyzw = frac(InstanceData[0 + offset.w]);
    r1.xyz = r0.xyz - 0.5;
    r2.xyz = r0.w * IN.color_0.rgb;
    r0.xyz = 2 * r1.xyz;
    r3.x = (2 * r1.y) - r0.z;
    r1.x = dot(DiffuseDir.xyz, r0.xyz);
    r0.w = max(r1.x, 0);
    r1.xyz = abs(r0.xyz);
    r2.w = min(r0.w, 1);
    r1.xyzw = (r1.yzxz >= r1.xxyy ? 1.0 : 0.0);
    r4.xy = r1.yw * r1.xz;
    r3.yz = r0.x * const_8.zw;
    r0.w = -r0.y;
    r3.z = r4.y * r3.z;
    r3.xy = (r4.y * r3.xy) + r0.wx;
    r1.yz = (r0.zy * const_8.zw) - r3.yz;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r1.x = -r3.x;
    r1.w = r0.w * (1.0 / 17);
    r1.xyz = (r4.x * r1.xyz) + r3.xyz;
    r1.w = frac(r1.w);
    r5.xyz = normalize(r1.xyz);
    r1.w = r1.w - 0.5;
    r3.xyz = r0.yzx * r5.zxy;
    r1.x = 2 * r1.w;
    r4.xyz = (r5.yzx * r0.zxy) - r3.xyz;
    r1.w = 1.0 - (r1.x * r1.x);
    r1.w = 1.0 / sqrt(r1.w);
    r1.yz = const_3.yz;
    r3.w = r1.y * InstanceData[0 + offset.w].w;
    r1.w = 1.0 / r1.w;
    r3.xyz = (r3.w * ScaleMask.xyz) + r1.z;
    r3.xyz = r3.xyz * IN.position.xyz;
    r1.z = 0;
    r6.x = WindData.w;
    r0.w = (r0.w * (1.0 / 128)) + r6.x;
    r6.x = dot(r1.wxz, r3.xyz);
    r1.y = -r1.w;
    r0.w = (r0.w * (1.0 / (PI * 2))) + 0.5;
    r3.x = dot(r1.xyz, r3.xyz);
    r0.w = frac(r0.w);
    r1.xyz = r5.xyz * r6.x;
    r0.w = (r0.w * PI * 2) - PI;
    r4.xyz = (r3.x * r4.xyz) + r1.xyz;
    r1.y = sin(r0.w);
    r1.w = r1.y * WindData.z;
    r0.w = IN.color_0.a * IN.color_0.a;
    r0.xyz = (r3.z * r0.xyz) + r4.xyz;
    r0.w = r1.w * r0.w;
    r0.xy = (r0.w * WindData.xy) + r0.xy;
    r1.xyz = r0.xyz + InstanceData[0 + offset.w];
    r1.w = IN.position.w;
    r2.xyz = r2.xyz * r2.w;
    r0.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, r1.xyzw);
    r2.xyz = r2.xyz * DiffuseColor.rgb;
    r3.x = dot(r0.xyz, r0.xyz);	// normalize + length
    OUT.texcoord_5.xyz = r2.xyz * AddlParams.x;
    r2.w = 1.0 / sqrt(r3.x);
    r0.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    r1.w = 1.0 / r2.w;
    r1.w = FogParam.x - r1.w;
    r2.w = dot(r0.xyzw, r0.xyzw);	// normalize + length
    r3.w = 1.0 / FogParam.y;
    r2.w = 1.0 / sqrt(r2.w);
    r1.w = r1.w * r3.w;
    r2.w = 1.0 / r2.w;
    r1.xy = r2.w - AlphaParam.xz;
    r2.x = 1.0 / AlphaParam.y;
    r2.y = 1.0 / AlphaParam.w;
    r1.w = max(r1.w, 0);
    r1.xy = r1.xy * r2.xy;
    r1.w = min(r1.w, 1);
    r1.xy = max(r1.xy, 0);
    OUT.color_0.a = 1 - r1.w;
    r1.xy = min(r1.xy, 1);
    OUT.position.xyzw = r0.xyzw;
    r0.w = 1 - r1.y;
    OUT.texcoord_5.w = r1.x * r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    OUT.color_0.rgb = FogColor.rgb;

// approximately 95 instruction slots used
