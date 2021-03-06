//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3013.pso /Fcshaderdump19/SM3013.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AnisoMap;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   float3 HairTint;
//   sampler2D LayerMap;
//   float4 LightData[16];
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
//   EyePosition     const_1       1
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
//   LightData[8]       const_17       1
//   LightData[9]       const_18       1
//   LightData[10]       const_19       1
//   LightData[11]       const_20       1
//   LightData[12]       const_21       1
//   LightData[13]       const_22       1
//   LightData[14]       const_23       1
//   LightData[15]       const_24       1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   ShadowMap       texture_2       1
//   ShadowMask      texture_3       1
//   AnisoMap        texture_4       1
//   LayerMap        texture_5       1
//

    const float4 const_4 = {-0.05, 0, 0.7, 8};
    const int4 const_7 = {-1, -2, 0, 2};
    const int4 const_8 = {-2, -3, -4, 5};
    const int4 const_25 = {-4, -5, -6, 6};
    const int4 const_26 = {-8, -9, -10, 0};
    const int4 const_27 = {-6, -7, -8, 7};
    const int4 const_28 = {-10, -11, -12, 0};
    const int4 const_29 = {2, -14, -15, 0};
    const float4 const_30 = {0.3, 0.2, 3, 4};
    const float4 const_31 = {-0.5, 0, 1, -1};
    const int4 const_32 = {-12, -13, -14, 0};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float2 IN.color_0 : COLOR0;			// partial precision
    float3 IN.texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 IN.texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float3 IN.texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float3 IN.texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 IN.texcoord_1 : TEXCOORD1;			// partial precision
    float4 IN.texcoord_7 : TEXCOORD7_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    sampler2D ShadowMask;
    sampler2D AnisoMap;
    sampler2D LayerMap;
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r1.xyz - 0.5;			// partial precision
    r0.xyz = 2 * r0.xyz;			// partial precision
    r5.xyz = normalize(r0.xyz);			// partial precision
    r0.xyz = r5.xyz * 0.5;			// partial precision
    r0.w = r0.z + 1;			// partial precision
    r1.xyz = r0.xyz + const_31.yyz;			// partial precision
    r0.w = dot(r0.xyw, r1.xyz);			// partial precision
    r0.w = 1.0 / sqrt(r0.w);			// partial precision
    r0.xyz = r1.xyz * r0.w;			// partial precision
    r0.w = r0.x - 0.05;			// partial precision
    r1.xyz = r0.xyz + const_4.xyy;			// partial precision
    r6.xyz = const_31.xyz;
    r4.w = (ToggleNumLights.x <= 0.0 ? r6.y : r6.z);
    r0.w = dot(r0.wyz, r1.xyz);			// partial precision
    r3.xyz = EyePosition.xyz - IN.texcoord_6.xyz;			// partial precision
    r10.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r0.w = 1.0 / sqrt(r0.w);			// partial precision
    r2.z = dot(r10.xyz, r3.xyz);			// partial precision
    r4.z = dot(r10.xyz, LightData[1].xyz);			// partial precision
    r12.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r4.x = dot(r12.xyz, LightData[1].xyz);			// partial precision
    r11.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r2.x = dot(r12.xyz, r3.xyz);			// partial precision
    r2.y = dot(r11.xyz, r3.xyz);			// partial precision
    r9.xyz = normalize(r2.xyz);			// partial precision
    r4.y = dot(r11.xyz, LightData[1].xyz);			// partial precision
    r8.xyz = r1.xyz * r0.w;			// partial precision
    r2.xyz = r4.xyz + r9.xyz;
    r3.x = dot(r0.xyz, r4.xyz);			// partial precision
    r1.xyz = normalize(r2.xyz);			// partial precision
    r2.y = dot(r8.xyz, r1.xyz);			// partial precision
    r3.y = dot(r0.xyz, r1.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r2.x = dot(r8.xyz, r4.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r2.xy);			// partial precision
    if_ne 0, r4.w
      r1.xyz = r6.x + HairTint.rgb;			// partial precision
      r1.xyz = (IN.color_0.g * r1.xyz) - -0.5;			// partial precision
      r0.w = r3.w * 0.7;			// partial precision
      r1.xyz = 2 * r1.xyz;			// partial precision
      r1.xyz = (r2.w * r1.xyz) + r0.w;			// partial precision
      r0.w = max(r4.z, 0);			// partial precision
      r1.xyz = r1.xyz * LightData[0].xyz;			// partial precision
      r4.w = dot(r5.xyz, r4.xyz);			// partial precision
      r1.xyz = r0.w * r1.xyz;			// partial precision
      r2.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      r3.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r3.xyz = r3.xyz - 1;			// partial precision
      r0.w = max(r4.w, 0);			// partial precision
      r3.xyz = (r2.x * r3.xyz) + 1;			// partial precision
      r2.xyz = r0.w * LightData[0].xyz;			// partial precision
      r1.xyz = r1.xyz * r3.xyz;			// partial precision
      r4.xyz = r3.xyz * r2.xyz;			// partial precision
      r0.w = 1;
    else
      r0.w = 0;
      r4.xyz = r0.w;			// partial precision
      r1.xyz = r0.w;			// partial precision
    endif
    r13.x = 2 * r0.w;
    r13.yz = r13.x + const_7.xy;
    r2.xyz = r13.x + const_7.zxy;
    r14.xyz = (r2.xyz >= 0.0 ? r2.xyz : -r13.xyz);
    r2.xyz = (r14.x <= 0.0 ? LightData[1].xyz : r6.y);
    r2.w = 8;			// partial precision
    r2.w = r2.w - ToggleNumLights.x;			// partial precision
    r2.xyz = (r14.y <= 0.0 ? LightData[2].xyz : r2.xyz);
    r3.y = min(ToggleNumLights.y, r2.w);			// partial precision
    r2.xyz = (r14.z <= 0.0 ? LightData[3].xyz : r2.xyz);
    r2.w = (r3.y >= 0.0 ? 0 : 1);
    r15.xyz = r2.xyz - IN.texcoord_6.xyz;
    r3.z = frac(r3.y);			// partial precision
    r2.x = dot(r12.xyz, r15.xyz);
    r2.y = dot(r11.xyz, r15.xyz);
    r2.z = dot(r10.xyz, r15.xyz);
    r3.w = (r3.z <= 0.0 ? 0 : 1);
    r7.xyz = normalize(r2.xyz);			// partial precision
    r2.z = r3.y - r3.z;			// partial precision
    r3.xyz = r9.xyz + r7.xyz;			// partial precision
    r4.w = (r2.w * r3.w) + r2.z;
    r2.xyz = normalize(r3.xyz);			// partial precision
    r5.w = (r4.w <= 0.0 ? 0 : 1);
    r16.y = dot(r8.xyz, r2.xyz);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, r2.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r16.x = dot(r8.xyz, r7.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r16.xy);			// partial precision
    if_ne 0, r5.w
      r2.z = dot(r15.xyz, r15.xyz);	// normalize + length
      r2.y = (r14.x <= 0.0 ? LightData[1].w : r6.y);			// partial precision
      r5.w = dot(r5.xyz, r7.xyz);			// partial precision
      r2.y = (r14.y <= 0.0 ? LightData[2].w : r2.y);			// partial precision
      r2.y = (r14.z <= 0.0 ? LightData[3].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * 0.7;			// partial precision
      r3.w = 1.0 - (r2.z * r2.z);			// partial precision
      r2.xyz = r13.x + const_7.zxy;
      r13.xyz = (r2.x == 0.0 ? LightData[0].xyz : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint.rgb;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[1].xyz : r13.xyz);			// partial precision
      r3.xyz = (IN.color_0.g * r3.xyz) - -0.5;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[2].xyz : r13.xyz);			// partial precision
      r13.xyz = (0.3 * r3.xyz) + 0.2;			// partial precision
      r3.xyz = r3.w * r2.xyz;			// partial precision
      r13.xyz = (r2.w * r13.xyz) + r6.w;			// partial precision
      r3.xyz = r3.xyz * r13.xyz;			// partial precision
      r2.w = max(r7.z, 0);			// partial precision
      r1.xyz = (r2.w * r3.xyz) + r1.xyz;			// partial precision
      r3.w = r5.w * r3.w;			// partial precision
      r2.w = max(r3.w, 0);			// partial precision
      r5.w = r0.w + 1;
      r4.xyz = (r2.w * r2.xyz) + r4.xyz;			// partial precision
    else
      r5.w = r0.w;
    endif
    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_8.xyz;
    r2.xyz = (r13.x == 0.0 ? LightData[3].xyz : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[4].xyz : r2.xyz);
    r2.xyz = (r13.z == 0.0 ? LightData[5].xyz : r2.xyz);
    r14.xyz = r2.xyz - IN.texcoord_6.xyz;
    r2.x = dot(r12.xyz, r14.xyz);
    r2.y = dot(r11.xyz, r14.xyz);
    r2.z = dot(r10.xyz, r14.xyz);
    r7.xyz = normalize(r2.xyz);			// partial precision
    r3.xyz = r9.xyz + r7.xyz;			// partial precision
    r2.xyz = normalize(r3.xyz);			// partial precision
    r15.y = dot(r8.xyz, r2.xyz);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, r2.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    if_lt 1, r4.w
      r2.z = dot(r14.xyz, r14.xyz);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[3].w : r6.y);			// partial precision
      r0.w = dot(r5.xyz, r7.xyz);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[4].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[5].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * 0.7;			// partial precision
      r3.w = 1.0 - (r2.z * r2.z);			// partial precision
      r2.xyz = r7.w + const_8.xyz;
      r13.xyz = (r2.x == 0.0 ? LightData[2].xyz : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint.rgb;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[3].xyz : r13.xyz);			// partial precision
      r3.xyz = (IN.color_0.g * r3.xyz) - -0.5;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[4].xyz : r13.xyz);			// partial precision
      r13.xyz = (0.3 * r3.xyz) + 0.2;			// partial precision
      r3.xyz = r3.w * r2.xyz;			// partial precision
      r13.xyz = (r2.w * r13.xyz) + r6.w;			// partial precision
      r3.xyz = r3.xyz * r13.xyz;			// partial precision
      r2.w = max(r7.z, 0);			// partial precision
      r1.xyz = (r2.w * r3.xyz) + r1.xyz;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, 0);			// partial precision
      r5.w = r5.w + 1;
      r4.xyz = (r0.w * r2.xyz) + r4.xyz;			// partial precision
    endif
    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_25.xyz;
    r2.xyz = (r13.x == 0.0 ? LightData[5].xyz : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[6].xyz : r2.xyz);
    r2.xyz = (r13.z == 0.0 ? LightData[7].xyz : r2.xyz);
    r14.xyz = r2.xyz - IN.texcoord_6.xyz;
    r2.x = dot(r12.xyz, r14.xyz);
    r2.y = dot(r11.xyz, r14.xyz);
    r2.z = dot(r10.xyz, r14.xyz);
    r7.xyz = normalize(r2.xyz);			// partial precision
    r3.xyz = r9.xyz + r7.xyz;			// partial precision
    r2.xyz = normalize(r3.xyz);			// partial precision
    r15.y = dot(r8.xyz, r2.xyz);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, r2.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    if_lt 2, r4.w
      r2.z = dot(r14.xyz, r14.xyz);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[5].w : r6.y);			// partial precision
      r0.w = dot(r5.xyz, r7.xyz);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[6].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[7].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * 0.7;			// partial precision
      r3.w = 1.0 - (r2.z * r2.z);			// partial precision
      r2.xyz = r7.w + const_25.xyz;
      r13.xyz = (r2.x == 0.0 ? LightData[4].xyz : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint.rgb;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[5].xyz : r13.xyz);			// partial precision
      r3.xyz = (IN.color_0.g * r3.xyz) - -0.5;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[6].xyz : r13.xyz);			// partial precision
      r13.xyz = (0.3 * r3.xyz) + 0.2;			// partial precision
      r3.xyz = r3.w * r2.xyz;			// partial precision
      r13.xyz = (r2.w * r13.xyz) + r6.w;			// partial precision
      r3.xyz = r3.xyz * r13.xyz;			// partial precision
      r2.w = max(r7.z, 0);			// partial precision
      r1.xyz = (r2.w * r3.xyz) + r1.xyz;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, 0);			// partial precision
      r5.w = r5.w + 1;
      r4.xyz = (r0.w * r2.xyz) + r4.xyz;			// partial precision
    endif
    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_27.xyz;
    r2.xyz = (r13.x == 0.0 ? LightData[7].xyz : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[8].xyz : r2.xyz);
    r2.xyz = (r13.z == 0.0 ? LightData[9].xyz : r2.xyz);
    r14.xyz = r2.xyz - IN.texcoord_6.xyz;
    r2.x = dot(r12.xyz, r14.xyz);
    r2.y = dot(r11.xyz, r14.xyz);
    r2.z = dot(r10.xyz, r14.xyz);
    r7.xyz = normalize(r2.xyz);			// partial precision
    r3.xyz = r9.xyz + r7.xyz;			// partial precision
    r2.xyz = normalize(r3.xyz);			// partial precision
    r15.y = dot(r8.xyz, r2.xyz);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, r2.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    if_lt 3, r4.w
      r2.z = dot(r14.xyz, r14.xyz);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[7].w : r6.y);			// partial precision
      r0.w = dot(r5.xyz, r7.xyz);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[8].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[9].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * 0.7;			// partial precision
      r3.w = 1.0 - (r2.z * r2.z);			// partial precision
      r2.xyz = r7.w + const_27.xyz;
      r13.xyz = (r2.x == 0.0 ? LightData[6].xyz : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint.rgb;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[7].xyz : r13.xyz);			// partial precision
      r3.xyz = (IN.color_0.g * r3.xyz) - -0.5;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[8].xyz : r13.xyz);			// partial precision
      r13.xyz = (0.3 * r3.xyz) + 0.2;			// partial precision
      r3.xyz = r3.w * r2.xyz;			// partial precision
      r13.xyz = (r2.w * r13.xyz) + r6.w;			// partial precision
      r3.xyz = r3.xyz * r13.xyz;			// partial precision
      r2.w = max(r7.z, 0);			// partial precision
      r1.xyz = (r2.w * r3.xyz) + r1.xyz;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, 0);			// partial precision
      r5.w = r5.w + 1;
      r4.xyz = (r0.w * r2.xyz) + r4.xyz;			// partial precision
    endif
    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_26.xyz;
    r2.xyz = (r13.x == 0.0 ? LightData[9].xyz : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[10].xyz : r2.xyz);
    r2.xyz = (r13.z == 0.0 ? LightData[11].xyz : r2.xyz);
    r14.xyz = r2.xyz - IN.texcoord_6.xyz;
    r2.x = dot(r12.xyz, r14.xyz);
    r2.y = dot(r11.xyz, r14.xyz);
    r2.z = dot(r10.xyz, r14.xyz);
    r7.xyz = normalize(r2.xyz);			// partial precision
    r3.xyz = r9.xyz + r7.xyz;			// partial precision
    r2.xyz = normalize(r3.xyz);			// partial precision
    r15.y = dot(r8.xyz, r2.xyz);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, r2.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    if_lt 4, r4.w
      r2.z = dot(r14.xyz, r14.xyz);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[9].w : r6.y);			// partial precision
      r0.w = dot(r5.xyz, r7.xyz);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[10].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[11].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * 0.7;			// partial precision
      r3.w = 1.0 - (r2.z * r2.z);			// partial precision
      r2.xyz = r7.w + const_26.xyz;
      r13.xyz = (r2.x == 0.0 ? LightData[8].xyz : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint.rgb;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[9].xyz : r13.xyz);			// partial precision
      r3.xyz = (IN.color_0.g * r3.xyz) - -0.5;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[10].xyz : r13.xyz);			// partial precision
      r13.xyz = (0.3 * r3.xyz) + 0.2;			// partial precision
      r3.xyz = r3.w * r2.xyz;			// partial precision
      r13.xyz = (r2.w * r13.xyz) + r6.w;			// partial precision
      r3.xyz = r3.xyz * r13.xyz;			// partial precision
      r2.w = max(r7.z, 0);			// partial precision
      r1.xyz = (r2.w * r3.xyz) + r1.xyz;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, 0);			// partial precision
      r5.w = r5.w + 1;
      r4.xyz = (r0.w * r2.xyz) + r4.xyz;			// partial precision
    endif
    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_28.xyz;
    r2.xyz = (r13.x == 0.0 ? LightData[11].xyz : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[12].xyz : r2.xyz);
    r2.xyz = (r13.z == 0.0 ? LightData[13].xyz : r2.xyz);
    r14.xyz = r2.xyz - IN.texcoord_6.xyz;
    r2.x = dot(r12.xyz, r14.xyz);
    r2.y = dot(r11.xyz, r14.xyz);
    r2.z = dot(r10.xyz, r14.xyz);
    r7.xyz = normalize(r2.xyz);			// partial precision
    r3.xyz = r9.xyz + r7.xyz;			// partial precision
    r2.xyz = normalize(r3.xyz);			// partial precision
    r15.y = dot(r8.xyz, r2.xyz);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, r2.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    if_lt 5, r4.w
      r2.z = dot(r14.xyz, r14.xyz);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[11].w : r6.y);			// partial precision
      r0.w = dot(r5.xyz, r7.xyz);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[12].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[13].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * 0.7;			// partial precision
      r3.w = 1.0 - (r2.z * r2.z);			// partial precision
      r2.xyz = r7.w + const_28.xyz;
      r13.xyz = (r2.x == 0.0 ? LightData[10].xyz : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint.rgb;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[11].xyz : r13.xyz);			// partial precision
      r3.xyz = (IN.color_0.g * r3.xyz) - -0.5;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[12].xyz : r13.xyz);			// partial precision
      r13.xyz = (0.3 * r3.xyz) + 0.2;			// partial precision
      r3.xyz = r3.w * r2.xyz;			// partial precision
      r13.xyz = (r2.w * r13.xyz) + r6.w;			// partial precision
      r3.xyz = r3.xyz * r13.xyz;			// partial precision
      r2.w = max(r7.z, 0);			// partial precision
      r1.xyz = (r2.w * r3.xyz) + r1.xyz;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, 0);			// partial precision
      r5.w = r5.w + 1;
      r4.xyz = (r0.w * r2.xyz) + r4.xyz;			// partial precision
    endif
    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_32.xyz;
    r2.xyz = (r13.x == 0.0 ? LightData[13].xyz : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[14].xyz : r2.xyz);
    r2.xyz = (r13.z == 0.0 ? LightData[15].xyz : r2.xyz);
    r14.xyz = r2.xyz - IN.texcoord_6.xyz;
    r2.x = dot(r12.xyz, r14.xyz);
    r2.y = dot(r11.xyz, r14.xyz);
    r2.z = dot(r10.xyz, r14.xyz);
    r7.xyz = normalize(r2.xyz);			// partial precision
    r3.xyz = r9.xyz + r7.xyz;			// partial precision
    r2.xyz = normalize(r3.xyz);			// partial precision
    r15.y = dot(r8.xyz, r2.xyz);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, r2.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    if_lt 6, r4.w
      r2.z = dot(r14.xyz, r14.xyz);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[13].w : r6.y);			// partial precision
      r0.w = dot(r5.xyz, r7.xyz);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[14].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[15].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * 0.7;			// partial precision
      r3.w = 1.0 - (r2.z * r2.z);			// partial precision
      r2.xyz = r7.w + const_32.xyz;
      r13.xyz = (r2.x == 0.0 ? LightData[12].xyz : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint.rgb;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[13].xyz : r13.xyz);			// partial precision
      r3.xyz = (IN.color_0.g * r3.xyz) - -0.5;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[14].xyz : r13.xyz);			// partial precision
      r13.xyz = (0.3 * r3.xyz) + 0.2;			// partial precision
      r3.xyz = r3.w * r2.xyz;			// partial precision
      r13.xyz = (r2.w * r13.xyz) + r6.w;			// partial precision
      r3.xyz = r3.xyz * r13.xyz;			// partial precision
      r2.w = max(r7.z, 0);			// partial precision
      r1.xyz = (r2.w * r3.xyz) + r1.xyz;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, 0);			// partial precision
      r5.w = r5.w + 1;
      r4.xyz = (r0.w * r2.xyz) + r4.xyz;			// partial precision
    endif
    r7.xyz = LightData[15].xyz - IN.texcoord_6.xyz;
    r2.x = dot(r12.xyz, r7.xyz);
    r2.y = dot(r11.xyz, r7.xyz);
    r2.z = dot(r10.xyz, r7.xyz);
    r3.xyz = normalize(r2.xyz);			// partial precision
    r9.xyz = r9.xyz + r3.xyz;			// partial precision
    r2.xyz = normalize(r9.xyz);			// partial precision
    r9.y = dot(r8.xyz, r2.xyz);			// partial precision
    r2.y = dot(r0.xyz, r2.xyz);			// partial precision
    r2.x = dot(r0.xyz, r3.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r2.xy);			// partial precision
    r9.x = dot(r8.xyz, r3.xyz);			// partial precision
    r0.xyzw = tex2D(AnisoMap, r9.xy);			// partial precision
    if_lt 7, r4.w
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r0.z = 1.0 / sqrt(r0.z);
      r0.z = 1.0 / r0.z;
      r0.y = 1.0 / LightData[15].w;
      r3.w = dot(r5.xyz, r3.xyz);			// partial precision
      r0.z = saturate(r0.z * r0.y);
      r4.w = 1.0 - (r0.z * r0.z);			// partial precision
      r2.w = r2.w * 0.7;			// partial precision
      r3.xy = (2 * r5.w) + const_29.yz;
      r2.xyz = r6.x + HairTint.rgb;			// partial precision
      r0.xyz = (r3.x == 0.0 ? LightData[14].xyz : r6.y);			// partial precision
      r2.xyz = (IN.color_0.g * r2.xyz) - -0.5;			// partial precision
      r0.xyz = (r3.y == 0.0 ? LightData[15].xyz : r0.xyz);			// partial precision
      r5.xyz = (0.3 * r2.xyz) + 0.2;			// partial precision
      r2.xyz = r4.w * r0.xyz;			// partial precision
      r5.xyz = (r0.w * r5.xyz) + r2.w;			// partial precision
      r2.xyz = r2.xyz * r5.xyz;			// partial precision
      r3.w = r3.w * r4.w;			// partial precision
      r2.w = max(r3.z, 0);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r2.w * r2.xyz) + r1.xyz;			// partial precision
      r4.xyz = (r0.w * r0.xyz) + r4.xyz;			// partial precision
    endif
    r0.xyz = r6.x + HairTint.rgb;			// partial precision
    r0.xyz = (IN.color_0.g * r0.xyz) - -0.5;			// partial precision
    r3.xyz = r1.xyz * IN.color_0.g;			// partial precision
    r5.xyz = 2 * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r2.xyzw = tex2D(LayerMap, IN.texcoord_0.xy);			// partial precision
    r1.xyz = lerp(r0.xyz, r2.xyz, r2.w);			// partial precision
    r0.y = r6.z - ToggleADTS.x;			// partial precision
    r1.xyz = r5.xyz * r1.xyz;			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor.rgb) + r0.y;			// partial precision
    r0.xyz = r4.xyz + r0.xyz;			// partial precision
    r2.xyz = r1.w * r3.xyz;			// partial precision
    r1.xyz = (r1.xyz * r0.xyz) + r2.xyz;			// partial precision
    r0.xyz = IN.texcoord_7.xyz - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 501 instruction slots used (23 texture, 478 arithmetic)
