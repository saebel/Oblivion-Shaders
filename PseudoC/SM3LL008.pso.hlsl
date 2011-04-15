//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL008.pso /Fcshaderdump19/SM3LL008.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D GlowMap;
//   float4 LightData[8];
//   float3 MatAlpha;
//   float3 MatEmit;
//   sampler2D NormalMap;
//   float4 ToggleADTS;
//   float4 ToggleNumLights;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    const_0       1
//   MatAlpha        const_3       1
//   MatEmit         const_4       1
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
//   GlowMap         texture_6       1
//

    const float4 const_1 = {-0.5, 0, 1, 4};
    const int4 const_2 = {2, -4, -5, -6};
    const int4 const_7 = {2, -6, -7, 0};
    const int4 const_8 = {-1, -2, 0, 2};
    const int4 const_17 = {2, -2, -3, -4};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float3 IN.color_0 : COLOR0;			// partial precision
    float3 IN.texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 IN.texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float3 IN.texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float3 IN.texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 IN.texcoord_7 : TEXCOORD7_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D GlowMap;
    r2.yzw = const_1.yzw;
    r0.w = r2.w - ToggleNumLights.x;			// partial precision
    r1.x = min(ToggleNumLights.y, r0.w);			// partial precision
    r1.w = frac(r1.x);			// partial precision
    r1.z = (r1.x >= 0.0 ? 0 : 1);
    r1.y = (r1.w <= 0.0 ? 0 : 1);
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyz = 2 * r0.xyz;			// partial precision
    r4.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r3.xyz = normalize(r0.xyz);			// partial precision
    r0.x = dot(r4.xyz, LightData[1].xyz);			// partial precision
    r6.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r5.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r0.y = dot(r6.xyz, LightData[1].xyz);			// partial precision
    r0.z = dot(r5.xyz, LightData[1].xyz);			// partial precision
    r0.w = r1.x - r1.w;			// partial precision
    r1.w = dot(r3.xyz, r0.xyz);			// partial precision
    r2.w = (r1.z * r1.y) + r0.w;
    r0.z = max(r1.w, 0);			// partial precision
    r0.w = 1;
    r0.xyz = r0.z * LightData[0].xyz;			// partial precision
    r0.xyzw = (ToggleNumLights.x <= 0.0 ? r2.y : r0.xyzw);
    r1.w = (r2.w <= 0.0 ? 0 : 1);
    if_ne 0, r1.w
      r7.x = 2 * r0.w;
      r7.yz = r7.x + const_8.xy;
      r1.xyz = r7.x + const_8.zxy;
      r7.xyz = (r1.xyz >= 0.0 ? r1.xyz : -r7.xyz);
      r1.xyzw = (r7.x <= 0.0 ? LightData[1].xyzw : r2.y);
      r1.xyzw = (r7.y <= 0.0 ? LightData[2].xyzw : r1.xyzw);
      r1.xyzw = (r7.z <= 0.0 ? LightData[3].xyzw : r1.xyzw);
      r8.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r2.x = 1.0 / sqrt(r1.z);
      r1.xyz = (r7.x <= 0.0 ? LightData[0].xyz : r2.y);			// partial precision
      r2.x = 1.0 / r2.x;
      r1.w = 1.0 / r1.w;			// partial precision
      r9.x = dot(r4.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r2.x = saturate(r2.x * r1.w);
      r8.xyz = normalize(r9.xyz);			// partial precision
      r1.w = dot(r3.xyz, r8.xyz);			// partial precision
      r2.x = 1.0 - (r2.x * r2.x);			// partial precision
      r1.xyz = (r7.y <= 0.0 ? LightData[1].xyz : r1.xyz);			// partial precision
      r2.x = r1.w * r2.x;			// partial precision
      r1.xyz = (r7.z <= 0.0 ? LightData[2].xyz : r1.xyz);			// partial precision
      r1.w = max(r2.x, 0);			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r0.w = r0.w + 1;
    endif
    if_lt 1, r2.w
      r7.xyz = (2 * r0.w) + const_17.yzw;
      r1.xyzw = (r7.x == 0.0 ? LightData[3].xyzw : r2.y);
      r1.xyzw = (r7.y == 0.0 ? LightData[4].xyzw : r1.xyzw);
      r1.xyzw = (r7.z == 0.0 ? LightData[5].xyzw : r1.xyzw);
      r8.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r2.x = 1.0 / sqrt(r1.z);
      r1.xyz = (r7.x == 0.0 ? LightData[2].xyz : r2.y);			// partial precision
      r2.x = 1.0 / r2.x;
      r1.w = 1.0 / r1.w;			// partial precision
      r9.x = dot(r4.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r2.x = saturate(r2.x * r1.w);
      r8.xyz = normalize(r9.xyz);			// partial precision
      r1.w = dot(r3.xyz, r8.xyz);			// partial precision
      r2.x = 1.0 - (r2.x * r2.x);			// partial precision
      r1.xyz = (r7.y == 0.0 ? LightData[3].xyz : r1.xyz);			// partial precision
      r2.x = r1.w * r2.x;			// partial precision
      r1.xyz = (r7.z == 0.0 ? LightData[4].xyz : r1.xyz);			// partial precision
      r1.w = max(r2.x, 0);			// partial precision
      r1.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r1.w = r0.w + 1;
    else
      r1.xyz = r0.xyz;			// partial precision
      r1.w = r0.w;
    endif
    if_lt 2, r2.w
      r7.xyz = (2 * r1.w) + const_2.yzw;
      r0.xyzw = (r7.x == 0.0 ? LightData[5].xyzw : r2.y);
      r0.xyzw = (r7.y == 0.0 ? LightData[6].xyzw : r0.xyzw);
      r0.xyzw = (r7.z == 0.0 ? LightData[7].xyzw : r0.xyzw);
      r8.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r8.xyz, r8.xyz);	// normalize + length
      r2.x = 1.0 / sqrt(r0.z);
      r0.xyz = (r7.x == 0.0 ? LightData[4].xyz : r2.y);			// partial precision
      r2.x = 1.0 / r2.x;
      r0.w = 1.0 / r0.w;			// partial precision
      r9.x = dot(r4.xyz, r8.xyz);
      r9.y = dot(r6.xyz, r8.xyz);
      r9.z = dot(r5.xyz, r8.xyz);
      r2.x = saturate(r2.x * r0.w);
      r8.xyz = normalize(r9.xyz);			// partial precision
      r0.w = dot(r3.xyz, r8.xyz);			// partial precision
      r2.x = 1.0 - (r2.x * r2.x);			// partial precision
      r0.xyz = (r7.y == 0.0 ? LightData[5].xyz : r0.xyz);			// partial precision
      r2.x = r0.w * r2.x;			// partial precision
      r0.xyz = (r7.z == 0.0 ? LightData[6].xyz : r0.xyz);			// partial precision
      r0.w = max(r2.x, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 3, r2.w
      r0.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
      r4.x = dot(r4.xyz, r0.xyz);
      r4.y = dot(r6.xyz, r0.xyz);
      r4.z = dot(r5.xyz, r0.xyz);
      r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
      r0.xyz = normalize(r4.xyz);			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r2.w = 1.0 / r0.w;
      r2.x = 1.0 / LightData[7].w;
      r0.w = dot(r3.xyz, r0.xyz);			// partial precision
      r0.z = saturate(r2.w * r2.x);
      r0.z = 1.0 - (r0.z * r0.z);			// partial precision
      r3.xy = (2 * r1.w) + const_7.yz;
      r1.w = r0.w * r0.z;			// partial precision
      r0.xyz = (r3.x == 0.0 ? LightData[6].xyz : r2.y);			// partial precision
      r0.w = max(r1.w, 0);			// partial precision
      r0.xyz = (r3.y == 0.0 ? LightData[7].xyz : r0.xyz);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
    endif
    r1.w = r2.z - ToggleADTS.x;			// partial precision
    r0.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);			// partial precision
    r2.xyz = MatEmit.rgb;			// partial precision
    r0.xyz = (r0.xyz * r2.xyz) + AmbientColor.rgb;			// partial precision
    r0.xyz = (ToggleADTS.x * r0.xyz) + r1.w;			// partial precision
    r1.xyz = r1.xyz + r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz * IN.color_0.rgb;			// partial precision
    r1.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = IN.texcoord_7.xyz - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 153 instruction slots used (3 texture, 150 arithmetic)
