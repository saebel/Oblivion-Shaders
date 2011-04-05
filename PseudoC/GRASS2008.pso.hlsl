//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/GRASS2008.pso /Fcshaderdump19/GRASS2008.pso.dis
//
//
// Parameters:
//
//   float4 AlphaTestRef;
//   sampler2D DiffuseMap;
//   float4 LightData;
//   float4 PSLightColor;
//   sampler2D ShadowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor const_2        1
//   AlphaTestRef const_3       1
//   LightData    const_4       1
//   DiffuseMap   texture_0       1
//   ShadowMap    texture_1       1
//

    const float4 const_0 = {0, 1, 0.5, 0.001};
    const float4 const_1 = {0.5 + 0.01, 0.01, 0, 0};
    const float4 const_5 = {0.5 + 0.01, -0.01, 0, 0};
    const float4 const_6 = {0.5, -0.5, -0.00136718748, 0.5 + 0.01};
    const float4 const_7 = {0, 0.5, 0.125, 0.6};
    const float4 const_8 = {0.5 - 0.01, 0.01, 0, 0};
    const float4 const_9 = {0.5 - 0.01, -0.01, 0, 0};
    const float4 const_10 = {0.5, 0.5 + 0.01, 0, 0};
    const float4 const_11 = {0.5, 0.5 - 0.01, 0, 0};
    const float4 const_12 = {0.5 - 0.01, 0, 0, 0};
    const int4 const_13 = {1, 1, 1, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float4 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 IN.color_0 : COLOR0;
    sampler2D DiffuseMap;
    sampler2D ShadowMap;
    r1.w = 1.0 / IN.texcoord_1.w;			// partial precision
    r10.xy = r1.w * IN.texcoord_1.xy;			// partial precision
    r8.xy = saturate((const_6.xy * r10.xy) + 0.5);			// partial precision
    r1.xy = const_6.xy;
    r0.xy = (r1.xy * r10.xy) + const_7.xy;			// partial precision
    r7.xy = saturate(r0.xy + const_1.xy);			// partial precision
    r6.xy = saturate(r0.xy + const_8.xy);			// partial precision
    r5.xy = saturate(r0.xy + const_5.xy);			// partial precision
    r4.xy = saturate(r0.xy + const_9.xy);			// partial precision
    r3.xy = saturate((r1.xy * r10.xy) + const_10.xy);			// partial precision
    r2.xy = saturate((r1.xy * r10.xy) + const_11.xy);			// partial precision
    r0.z = r0.x + 0.5 + 0.01;			// partial precision
    r0.w = r0.x + 0.5 + 0.01;			// partial precision
    r1.x = saturate((r0.z >= 0.0 ? 0 : r0.w));			// partial precision
    r1.y = saturate((r0.y >= 0.0 ? 0 : r0.y));			// partial precision
    r10.w = (IN.texcoord_1.y * -r1.w) + 1;			// partial precision
    r0.xy = saturate(r0.xy + const_12.xy);			// partial precision
    r9.xyzw = tex2D(ShadowMap, r8.xy);			// partial precision
    r8.xyzw = tex2D(ShadowMap, r7.xy);			// partial precision
    r7.xyzw = tex2D(ShadowMap, r6.xy);			// partial precision
    r6.xyzw = tex2D(ShadowMap, r5.xy);			// partial precision
    r5.xyzw = tex2D(ShadowMap, r4.xy);			// partial precision
    r4.xyzw = tex2D(ShadowMap, r3.xy);			// partial precision
    r3.xyzw = tex2D(ShadowMap, r2.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r1.xy);			// partial precision
    r0.xyzw = tex2D(ShadowMap, r0.xy);			// partial precision
    r1.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);			// partial precision
    r0.w = (IN.texcoord_1.z * -0.001) + r9.x;			// partial precision
    r0.w = -0.00136718748 - r0.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? 1 : 0);			// partial precision
    r2.w = (IN.texcoord_1.z * -0.001) + r8.x;			// partial precision
    r2.w = -0.00136718748 - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r2.w;			// partial precision
    r2.w = (IN.texcoord_1.z * -0.001) + r7.x;			// partial precision
    r2.w = -0.00136718748 - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r2.w;			// partial precision
    r2.w = (IN.texcoord_1.z * -0.001) + r6.x;			// partial precision
    r2.w = -0.00136718748 - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r2.w;			// partial precision
    r2.w = (IN.texcoord_1.z * -0.001) + r5.x;			// partial precision
    r2.w = -0.00136718748 - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r2.w;			// partial precision
    r2.w = (IN.texcoord_1.z * -0.001) + r4.x;			// partial precision
    r2.w = -0.00136718748 - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r2.w;			// partial precision
    r2.w = (r10.x * 0.5) + 0.5;			// partial precision
    r3.w = (IN.texcoord_1.z * -0.001) + r3.x;			// partial precision
    r3.w = -0.00136718748 - r3.w;			// partial precision
    r3.w = (r3.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r3.w;			// partial precision
    r3.w = (IN.texcoord_1.z * -0.001) + r2.x;			// partial precision
    r3.w = -0.00136718748 - r3.w;			// partial precision
    r3.w = (r3.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r3.w;			// partial precision
    r3.w = (IN.texcoord_1.z * -0.001) + r0.x;			// partial precision
    r3.w = -0.00136718748 - r3.w;			// partial precision
    r3.w = (r3.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r3.w;			// partial precision
    r0.w = saturate(r0.w * 0.125);			// partial precision
    r0.w = r0.w - 1;			// partial precision
    r3.w = 1 - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? 0 : 1);			// partial precision
    r3.w = (r3.w >= 0.0 ? 0 : 1);			// partial precision
    r2.w = r2.w * r3.w;
    r4.w = (r10.w >= 0.0 ? 0 : 1);			// partial precision
    r3.w = (r10.w * -0.5) + 1;			// partial precision
    r2.w = r2.w * r4.w;
    r3.w = (r3.w >= 0.0 ? 0 : 1);			// partial precision
    r2.w = r2.w * r3.w;
    r3.w = (IN.texcoord_1.z >= 0.0 ? 0 : 1);			// partial precision
    r3.w = r2.w * r3.w;
    r2.yz = const_0.yz;
    r0.xyz = (PSLightColor.a * r0.w) + r2.y;			// partial precision
    r0.w = 1;			// partial precision
    r0.xyzw = (r3.w <= 0.0 ? r0.xyzw : const_13.xyzw);			// partial precision
    r4.w = min(r1.w, r0.w);			// partial precision
    r5.w = 1 - r0.x;			// partial precision
    r1.xyz = IN.texcoord_2.xyz - LightData.xyz;			// partial precision
    r6.w = r5.w * 0.6;			// partial precision
    r1.x = dot(r1.xyz, r1.xyz);	// normalize + length			// partial precision
    r2.w = 1.0 / sqrt(r1.x);			// partial precision
    r2.w = 1.0 / r2.w;			// partial precision
    r7.w = r2.z * LightData.w;			// partial precision
    r7.w = 1.0 / r7.w;			// partial precision
    r2.w = saturate(r2.w * r7.w);			// partial precision
    r1.xyz = (r6.w * -PSLightColor.rgb) + r2.y;			// partial precision
    r6.w = r2.w * r2.w;			// partial precision
    r1.w = AlphaTestRef.x - r1.w;			// partial precision
    r2.xyz = lerp(1, r1.xyz, r6.w);			// partial precision
    r1.xyz = lerp(1, r2.xyz, IN.color_0.a);			// partial precision
    r1.w = (r1.w >= 0.0 ? 1 : 0);			// partial precision
    r1.xyz = r1.xyz - 1;			// partial precision
    r2.w = r1.w * IN.texcoord_5.w;			// partial precision
    r1.w = min(r4.w, r5.w);			// partial precision
    r1.xyz = (r2.w * r1.xyz) + 1;			// partial precision
    r1.xyzw = (r3.w <= 0.0 ? r1.xyzw : r0.xyzw);			// partial precision
    r0.w = min(r1.w, r2.w);			// partial precision
    r0.xyz = r1.xyz;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 106 instruction slots used (10 texture, 96 arithmetic)
