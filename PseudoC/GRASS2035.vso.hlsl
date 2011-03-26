//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2035.vso /Fcshaderdump19/GRASS2035.vso.dis
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
//   float4 LightPosition;
//   row_major float4x4 ModelViewProj;
//   float3 ScaleMask;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//   float4 WindData;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   DiffuseDir          const_0       1
//   DiffuseColor        const_1       1
//   ScaleMask           const_2       1
//   LightPosition       const_3       1
//   WindData            const_4       1
//   AlphaParam          const_5       1
//   AmbientColor        const_6       1
//   AddlParams          const_7       1
//   ShadowProjData      const_8       1
//   ModelViewProj[0]       const_9        1
//   ModelViewProj[1]       const_10        1
//   ModelViewProj[2]       const_11        1
//   ModelViewProj[3]       const_12        1
//   ShadowProjTransform const_13      1
//   FogColor            const_14      1
//   FogParam            const_15      1
//   InstanceData[0]        const_20       1
//   InstanceData[1]        const_21       1
//

    const float4 const_16 = {-0.5, 0.01, 1, (1.0 / 17)};
    const int4 const_17 = {0, 2, -1, 1};
    const float4 const_18 = {(1.0 / 128), (1.0 / (PI * 2)), 0.5, 0};
    const float4 const_19 = {PI * 2, -PI, 0, 0};
    const float4 const_22 = {D3DSINCOSCONST1};
    const float4 const_23 = {D3DSINCOSCONST2};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r1 = frac(InstanceData[0 + offset.w]);
    r1.xyz = r1 + -0.5;
    r0.xyz = r1 + r1;
    r2.xyz = abs(r0);
    r1.x = (2 * r1.y) - r0.z;
    r2 = (r2.yzxz >= r2.xxyy ? 1.0 : 0.0);
    r4.xy = r2.ywzw * r2.xzzw;
    r1.yz = r0.x * const_17.xzww;
    r0.w = -r0.y;
    r2.z = r4.y * r1.z;
    r2.xy = (r4.y * r1) + r0.wxzw;
    r3.xyz = r1.w * IN.color_0;
    r1.yz = (r0.xzyw * const_17.xzww) - r2;
    r1.x = -r2.x;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r1.xyz = (r4.x * r1) + r2;
    r1.w = r0.w * (1.0 / 17);
    r5.xyz = normalize(r1);
    r1.w = frac(r1.w);
    r2.xyz = r0.yzxw * r5.zxyw;
    r2.w = r1.w + -0.5;
    r1.yz = const_16;
    r1.w = r1.y * InstanceData[0 + offset.w].w;
    r1.x = r2.w + r2.w;
    r4.xyz = (r1.w * ScaleMask) + r1.z;
    r1.w = (r1.x * -r1.x) + 1;
    r6.xyz = r4 * IN.position;
    r1.w = 1.0 / sqrt(r1.w);
    r1.w = 1.0 / r1.w;
    r1.z = 0;
    r4.xyz = (r5.yzxw * r0.zxyw) - r2;
    r2.x = dot(r1.wxzw, r6);
    r7.x = WindData.w;
    r0.w = (r0.w * (1.0 / 128)) + r7.x;
    r2.xyz = r5 * r2.x;
    r1.y = -r1.w;
    r0.w = (r0.w * (1.0 / (PI * 2))) + 0.5;
    r8.x = dot(r1.wxzw, IN.normal);
    r0.w = frac(r0.w);
    r6.x = dot(r1, r6);
    r0.w = (r0.w * PI * 2) + -PI;
    r7.xyz = (r6.x * r4) + r2;
    r2.y = sin(r0.w);
    r1.w = r2.y * WindData.z;
    r0.w = IN.color_0.a * IN.color_0.w;
    r2.xyz = (r6.z * r0) + r7;
    r0.w = r1.w * r0.w;
    r2.xy = (r0.w * WindData) + r2;
    r6.x = dot(r1, IN.normal);
    r1.xyz = r2 + InstanceData[0 + offset.w];
    r2.xy = r1 + ShadowProjTransform;
    r0.w = 1.0 / ShadowProjTransform.w;
    OUT.texcoord_2.xy = r2 * r0.w;
    r2.xyz = r5 * r8.x;
    r5.xy = r1 - ShadowProjData;
    r2.xyz = (r6.x * r4) + r2;
    r0.w = 1.0 / ShadowProjData.w;
    r0.xyz = (IN.normal.z * r0) + r2;
    OUT.texcoord_3.x = r5.x * r0.w;
    r0.x = dot(DiffuseDir, r0);
    OUT.texcoord_3.y = (r5.y * -r0.w) + 1;
    r0.w = max(r0.x, 0);
    r0.w = min(r0.w, 1);
    r1.w = IN.position.w;
    r2.xyz = r3 * DiffuseColor;
    r0.x = dot(ModelViewProj[0], r1);
    r0.y = dot(ModelViewProj[1], r1);
    r0.z = dot(ModelViewProj[2], r1);
    r2.xyz = r0.w * r2;
    r3.x = dot(r0, r0);	// normalize + length
    OUT.texcoord_5.xyz = r2 * AddlParams.x;
    r2.w = 1.0 / sqrt(r3.x);
    r0.w = dot(ModelViewProj[3], r1);
    r1.w = 1.0 / r2.w;
    r1.xyz = LightPosition - r1;
    r1.w = FogParam.x - r1.w;
    r3.w = 1.0 / FogParam.y;
    r2.w = dot(r0, r0);	// normalize + length
    r1.w = r1.w * r3.w;
    r2.w = 1.0 / sqrt(r2.w);
    r1.w = max(r1.w, 0);
    r2.w = 1.0 / r2.w;
    r2.xy = r2.w - AlphaParam.xzzw;
    r3.x = 1.0 / AlphaParam.y;
    r3.y = 1.0 / AlphaParam.w;
    r1.w = min(r1.w, 1);
    r2.xy = r2 * r3;
    OUT.color_0.a = 1 - r1.w;
    r2.xy = max(r2, 0);
    OUT.position = r0;
    r0.xy = min(r2, 1);
    r1.w = 1 - r0.y;
    r0.w = 1.0 / LightPosition.w;
    OUT.texcoord_5.w = r0.x * r1.w;
    r0.xyz = r1 * r0.w;
    OUT.texcoord_1.xyz = (--0.5 * r0) - -0.5;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4 = AmbientColor;
    OUT.texcoord_1.w = --0.5;
    OUT.texcoord_3.z = ShadowProjData.z;
    OUT.color_0.rgb = FogColor;

// approximately 113 instruction slots used
