//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL012.pso /Fcshaderdump19/SM3LL012.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 HairTint;
//   sampler2D LayerMap;
//   float4 LightData[8];
//   float3 MatAlpha;
//   sampler2D NormalMap;
//   sampler2D ShadowMap;
//   sampler2D ShadowMask;
//   float4 ToggleADTS;
//   float4 ToggleNumLights;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    const_0       1
//   HairTint        const_2       1
//   MatAlpha        const_3       1
//   ToggleADTS      const_5       1
//   ToggleNumLights const_6       1
//   LightData[0]       const_9        1
//   LightData[1]       const_10        1
//   LightData[2]       const_11        1
//   LightData[3]       const_12        1
//   LightData[4]       const_13        1
//   LightData[5]       const_14        1
//   LightData[6]       const_15        1
//   LightData[7]       const_16        1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   ShadowMap       texture_2       1
//   ShadowMask      texture_3       1
//   LayerMap        texture_5       1
//

    const float4 const_1 = {-0.5, 0, 1, -1};
    const int4 const_4 = {4, -1, -2, 0};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -4, -5, -6};
    const int4 const_17 = {2, -6, -7, 0};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float2 IN.color_0 : COLOR0;			// partial precision
    float3 input_2 : TEXCOORD3_centroid;			// partial precision
    float3 input_3 : TEXCOORD4_centroid;			// partial precision
    float3 input_4 : TEXCOORD5_centroid;			// partial precision
    float3 input_5 : TEXCOORD6_centroid;			// partial precision
    float4 IN.texcoord_1 : TEXCOORD1;			// partial precision
    float4 input_7 : TEXCOORD7_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    sampler2D ShadowMask;
    sampler2D LayerMap;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyz = 2 * r0.xyz;			// partial precision
    r4.xyz = normalize(r0.xyz);			// partial precision
    r3.xyz = const_1.xyz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r3.z : r3.y);
    r7.xyz = normalize(IN.input_2.xyz);			// partial precision
    r6.xyz = normalize(IN.input_3.xyz);			// partial precision
    r5.xyz = normalize(IN.input_4.xyz);			// partial precision
    if_ne 0, r0.w
      r0.x = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r0.y = dot(r6.xyz, LightData[1].xyz);			// partial precision
      r0.z = dot(r5.xyz, LightData[1].xyz);			// partial precision
      r0.w = dot(r4.xyz, r0.xyz);			// partial precision
      r2.w = max(r0.w, 0);			// partial precision
      r0.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      r1.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r1.xyz = r1.xyz - 1;			// partial precision
      r1.xyz = (r0.x * r1.xyz) + 1;			// partial precision
      r0.xyz = r2.w * LightData[0].xyz;			// partial precision
      r2.xyz = r1.xyz * r0.xyz;			// partial precision
      r1.w = 1;
    else
      r0.w = 0;
      r2.xyz = r0.w;			// partial precision
      r1.w = r0.w;
    endif
    r0.w = 4;			// partial precision
    r1.z = r0.w - ToggleNumLights.x;			// partial precision
    r0.x = min(ToggleNumLights.y, r1.z);			// partial precision
    r0.w = (r0.x >= 0.0 ? 1 : 0);
    r0.y = frac(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? 1 : 0);
    r0.y = r0.x - r0.y;			// partial precision
    r2.w = (r0.w * r0.z) + r0.y;
    r0.w = (r2.w <= 0.0 ? 1 : 0);
    if_ne 0, r0.w
      r1.x = 2 * r1.w;
      r1.yz = r1.x + const_4.yz;
      r0.xyz = r1.x + const_4.wyz;
      r1.xyz = (r0.xyz >= 0.0 ? -r1.xyz : r0.xyz);
      r0.xyzw = (r1.x <= 0.0 ? r3.y : LightData[1].xyzw);
      r0.xyzw = (r1.y <= 0.0 ? r0.xyzw : LightData[2].xyzw);
      r0.xyzw = (r1.z <= 0.0 ? r0.xyzw : LightData[3].xyzw);
      r8.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x <= 0.0 ? r3.y : LightData[0].xyz);			// partial precision
      r1.x = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r9.x = dot(r7.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r1.x = saturate(r1.x * r0.w);
      r8.xyz = normalize(r9.xyz);			// partial precision
      r0.w = dot(r4.xyz, r8.xyz);			// partial precision
      r1.x = 1.0 - (r1.x * r1.x);			// partial precision
      r0.xyz = (r1.y <= 0.0 ? r0.xyz : LightData[1].xyz);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z <= 0.0 ? r0.xyz : LightData[2].xyz);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r2.xyz = (r0.w * r0.xyz) + r2.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 1, r2.w
      r1.xyz = (2 * r1.w) + const_7.yzw;
      r0.xyzw = (r1.x == 0.0 ? LightData[3].xyzw : r3.y);
      r0.xyzw = (r1.y == 0.0 ? LightData[4].xyzw : r0.xyzw);
      r0.xyzw = (r1.z == 0.0 ? LightData[5].xyzw : r0.xyzw);
      r8.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[2].xyz : r3.y);			// partial precision
      r1.x = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r9.x = dot(r7.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r1.x = saturate(r1.x * r0.w);
      r8.xyz = normalize(r9.xyz);			// partial precision
      r0.w = dot(r4.xyz, r8.xyz);			// partial precision
      r1.x = 1.0 - (r1.x * r1.x);			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[3].xyz : r0.xyz);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[4].xyz : r0.xyz);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r2.xyz = (r0.w * r0.xyz) + r2.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 2, r2.w
      r1.xyz = (2 * r1.w) + const_8.yzw;
      r0.xyzw = (r1.x == 0.0 ? LightData[5].xyzw : r3.y);
      r0.xyzw = (r1.y == 0.0 ? LightData[6].xyzw : r0.xyzw);
      r0.xyzw = (r1.z == 0.0 ? LightData[7].xyzw : r0.xyzw);
      r8.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[4].xyz : r3.y);			// partial precision
      r1.x = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r9.x = dot(r7.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r1.x = saturate(r1.x * r0.w);
      r8.xyz = normalize(r9.xyz);			// partial precision
      r0.w = dot(r4.xyz, r8.xyz);			// partial precision
      r1.x = 1.0 - (r1.x * r1.x);			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[5].xyz : r0.xyz);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[6].xyz : r0.xyz);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r2.xyz = (r0.w * r0.xyz) + r2.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 3, r2.w
      r0.xyz = LightData[7].xyz - IN.input_5.xyz;
      r1.x = dot(r7.xyz, r0.xyz);
      r1.y = dot(r6.xyz, r0.xyz);
      r1.z = dot(r5.xyz, r0.xyz);
      r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
      r0.xyz = normalize(r1.xyz);			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r1.z = 1.0 / r0.w;
      r1.y = 1.0 / LightData[7].w;
      r0.w = dot(r4.xyz, r0.xyz);			// partial precision
      r0.z = saturate(r1.z * r1.y);
      r0.z = 1.0 - (r0.z * r0.z);			// partial precision
      r1.xy = (2 * r1.w) + const_17.yz;
      r1.w = r0.w * r0.z;			// partial precision
      r0.xyz = (r1.x == 0.0 ? LightData[6].xyz : r3.y);			// partial precision
      r0.w = max(r1.w, 0);			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[7].xyz : r0.xyz);			// partial precision
      r2.xyz = (r0.w * r0.xyz) + r2.xyz;			// partial precision
    endif
    r0.xyz = r3.x + HairTint.rgb;			// partial precision
    r0.xyz = (IN.color_0.g * r0.xyz) - -0.5;			// partial precision
    r4.xyz = 2 * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r1.xyzw = tex2D(LayerMap, IN.texcoord_0.xy);			// partial precision
    r2.w = r3.z - ToggleADTS.x;			// partial precision
    r3.xyz = lerp(r1.xyz, r0.xyz, r1.w);			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor.rgb) + r2.w;			// partial precision
    r1.xyz = r4.xyz * r3.xyz;			// partial precision
    r0.xyz = r2.xyz + r0.xyz;			// partial precision
    r1.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = IN.input_7.xyz - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.input_7.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 166 instruction slots used (5 texture, 161 arithmetic)
