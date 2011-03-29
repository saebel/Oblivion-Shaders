//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2029.vso /Fcshaderdump19/GRASS2029.vso.dis
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

    const float4 const_3 = {0.01, 1, (1.0 / 17), -0.5};
    const float4 const_16 = {0, (1.0 / 128), (1.0 / (PI * 2)), 0.5};
    const float4 const_17 = {PI * 2, -PI, 0, 0};
    const float4 const_18 = {D3DSINCOSCONST1};
    const float4 const_19 = {D3DSINCOSCONST2};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r0.z = (1.0 / 128);
    r1.w = (r0.w * r0.z) + WindData.w;
    r1.w = (r1.w * (1.0 / (PI * 2))) + 0.5;
    r1.w = frac(r1.w);
    r2.w = (r1.w * PI * 2) + -PI;
    r1.w = r0.w * (1.0 / 17);
    r0.y = sin(r2.w);
    r2.w = r0.y * WindData.z;
    r0.w = frac(r1.w);
    r1.w = IN.color_0.a * IN.color_0.a;
    r3.w = r0.w + -0.5;
    r0.xy = const_3.xy;
    r0.w = r0.x * InstanceData[0 + offset.w].w;
    r0.x = r3.w + r3.w;
    r1.xyz = (r0.w * ScaleMask) + r0.y;
    r0.w = (r0.x * -r0.x) + 1;
    r1.xyz = r1.xyz * IN.position;
    r0.w = 1.0 / sqrt(r0.w);
    r0.w = 1.0 / r0.w;
    r0.z = 0;
    r1.w = r2.w * r1.w;
    r3.y = dot(r0.wxzw.xyz, r1.xyz);
    r0.y = -r0.w;
    r2.y = dot(r0.wxzw.xyz, IN.normal.xyz);
    r3.x = dot(r0.xyz, r1.xyz);
    r2.x = dot(r0.xyz, IN.normal.xyz);
    r0.z = r1.z;
    r0.xy = (r1.w * WindData.xy) + r3.xy;
    r1.xyz = r0.xyz + InstanceData[0 + offset.w];
    r1.w = frac(InstanceData[0 + offset.w].w);
    r0.xy = r1.xy + ShadowProjTransform.xy;
    r0.w = 1.0 / ShadowProjTransform.w;
    OUT.texcoord_2.xy = r0.xy * r0.w;
    r0.xy = r1.xy - ShadowProjData.xy;
    r0.w = 1.0 / ShadowProjData.w;
    r2.z = IN.normal.z;
    OUT.texcoord_3.x = r0.x * r0.w;
    r0.x = dot(DiffuseDir.xyz, r2.xyz);
    OUT.texcoord_3.y = (r0.y * -r0.w) + 1;
    r0.w = max(r0.x, 0);
    r0.w = min(r0.w, 1);
    r0.xyz = r1.w * IN.color_0;
    r0.xyz = r0.xyz * DiffuseColor.rgb;
    r1.w = IN.position.w;
    r2.xyz = r0.w * r0.xyz;
    r0.x = dot(ModelViewProj[0].xyzw, r1.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, r1.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, r1.xyzw);
    OUT.texcoord_5.xyz = r2.xyz * AddlParams.x;
    r2.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.w = dot(ModelViewProj[3].xyzw, r1.xyzw);
    r1.w = 1.0 / sqrt(r2.x);
    r1.w = 1.0 / r1.w;
    r2.w = dot(r0.xyzw, r0.xyzw);	// normalize + length
    r1.w = FogParam.x - r1.w;
    r3.w = 1.0 / sqrt(r2.w);
    r2.w = 1.0 / FogParam.y;
    r3.w = 1.0 / r3.w;
    r1.xy = r3.w - AlphaParam.xzzw;
    r2.x = 1.0 / AlphaParam.y;
    r2.y = 1.0 / AlphaParam.w;
    r1.w = r1.w * r2.w;
    r1.xy = r1.xy * r2.xy;
    r1.w = max(r1.w, 0);
    r1.xy = max(r1.xy, 0);
    r1.w = min(r1.w, 1);
    r1.xy = min(r1.xy, 1);
    OUT.color_0.a = 1 - r1.w;
    r1.w = 1 - r1.y;
    OUT.position.xyzw = r0.xyzw;
    OUT.texcoord_5.w = r1.x * r1.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4.xyzw = AmbientColor.rgba;
    OUT.texcoord_3.z = ShadowProjData.z;
    OUT.color_0.rgb = FogColor.rgb;

// approximately 86 instruction slots used
