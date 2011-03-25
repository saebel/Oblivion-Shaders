//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL003.pso /Fcshaderdump19/SM3LL003.pso.dis
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
//   float4 LightData[8];
//   float3 MatAlpha;
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
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   AnisoMap        texture_4       1
//   LayerMap        texture_5       1
//

    const float4 const_4 = {-0.05, 0, 0.7, 4};
    const float4 const_7 = {-0.5, 0, 1, 0.5};
    const int4 const_8 = {2, -6, -7, 0};
    const float4 const_17 = {0.3, 0.2, 3, 0};
    const int4 const_18 = {-1, -2, 0, 2};
    const int4 const_19 = {-2, -3, -4, 0};
    const int4 const_20 = {-4, -5, -6, 0};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float2 IN.color_0 : COLOR0;			// partial precision
    float3 input_2 : TEXCOORD3_centroid;			// partial precision
    float3 input_3 : TEXCOORD4_centroid;			// partial precision
    float3 input_4 : TEXCOORD5_centroid;			// partial precision
    float3 input_5 : TEXCOORD6_centroid;			// partial precision
    float4 input_6 : TEXCOORD7_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D AnisoMap;
    sampler2D LayerMap;
    r1 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r1 + const_7.x;			// partial precision
    r0.xyz = r0 + r0;			// partial precision
    r5.xyz = normalize(r0);			// partial precision
    r0.xyz = r5 * const_7.w;			// partial precision
    r0.w = r0.z + const_7.z;			// partial precision
    r1.xyz = r0 + const_7.yyzw;			// partial precision
    r0.w = dot(r0.xyww, r1);			// partial precision
    r0.w = 1.0 / sqrt(r0.w);			// partial precision
    r0.xyz = r1 * r0.w;			// partial precision
    r0.w = r0.x + const_4.x;			// partial precision
    r1.xyz = r0 + const_4.xyyw;			// partial precision
    r6.xyz = const_7;
    r4.w = (ToggleNumLights.x <= 0.0 ? r6.z : r6.y);			// partial precision
    r0.w = dot(r0.wyzw, r1);			// partial precision
    r3.xyz = EyePosition - IN.input_5;			// partial precision
    r10.xyz = normalize(IN.input_4);			// partial precision
    r0.w = 1.0 / sqrt(r0.w);			// partial precision
    r2.z = dot(r10, r3);			// partial precision
    r4.z = dot(r10, LightData[1]);			// partial precision
    r12.xyz = normalize(IN.input_2);			// partial precision
    r4.x = dot(r12, LightData[1]);			// partial precision
    r11.xyz = normalize(IN.input_3);			// partial precision
    r2.x = dot(r12, r3);			// partial precision
    r2.y = dot(r11, r3);			// partial precision
    r9.xyz = normalize(r2);			// partial precision
    r4.y = dot(r11, LightData[1]);			// partial precision
    r8.xyz = r1 * r0.w;			// partial precision
    r2.xyz = r4 + r9;
    r3.x = dot(r0, r4);			// partial precision
    r1.xyz = normalize(r2);			// partial precision
    r2.y = dot(r8, r1);			// partial precision
    r3.y = dot(r0, r1);			// partial precision
    r3 = tex2D(AnisoMap, r3);			// partial precision
    r2.x = dot(r8, r4);			// partial precision
    r2 = tex2D(AnisoMap, r2);			// partial precision
    if_ne r4.w, -r4.w
      r1.xyz = r6.x + HairTint;			// partial precision
      r3.z = dot(r5, r4);			// partial precision
      r1.xyz = (IN.color_0.g * r1) + const_7.w;			// partial precision
      r0.w = r3.w * const_4.z;			// partial precision
      r1.xyz = r1 + r1;			// partial precision
      r2.z = max(r3.z, const_7.y);			// partial precision
      r1.xyz = (r2.w * r1) + r0.w;			// partial precision
      r0.w = max(r4.z, const_7.y);			// partial precision
      r1.xyz = r1 * LightData[0];			// partial precision
      r4.xyz = r2.z * LightData[0];			// partial precision
      r1.xyz = r0.w * r1;			// partial precision
      r0.w = const_7.z;			// partial precision
    else
      r0.w = const_7.y;
      r4.xyz = r0.w;			// partial precision
      r1.xyz = r0.w;			// partial precision
    endif
    r13.x = r0.w + r0.w;
    r13.yz = r13.x + const_18.xxyw;
    r2.xyz = r13.x + const_18.zxyw;
    r14.xyz = (r2 >= 0.0 ? -r13 : r2);
    r2.xyz = (r14.x <= 0.0 ? r6.y : LightData[1]);
    r2.w = const_4.w;			// partial precision
    r2.w = r2.w - ToggleNumLights.x;			// partial precision
    r2.xyz = (r14.y <= 0.0 ? r2 : LightData[2]);
    r3.y = min(ToggleNumLights.y, r2.w);			// partial precision
    r2.xyz = (r14.z <= 0.0 ? r2 : LightData[3]);
    r2.w = (r3.y >= 0.0 ? const_7.z : const_7.y);			// partial precision
    r15.xyz = r2 - IN.input_5;
    r3.z = r3.y - floor(r3.y);			// partial precision
    r2.x = dot(r12, r15);
    r2.y = dot(r11, r15);
    r2.z = dot(r10, r15);
    r3.w = (r3.z <= 0.0 ? const_7.z : const_7.y);			// partial precision
    r7.xyz = normalize(r2);			// partial precision
    r2.z = r3.y - r3.z;			// partial precision
    r3.xyz = r9 + r7;			// partial precision
    r4.w = (r2.w * r3.w) + r2.z;
    r2.xyz = normalize(r3);			// partial precision
    r5.w = (r4.w <= 0.0 ? const_7.z : const_7.y);			// partial precision
    r16.y = dot(r8, r2);			// partial precision
    r3.x = dot(r0, r7);			// partial precision
    r3.y = dot(r0, r2);			// partial precision
    r3 = tex2D(AnisoMap, r3);			// partial precision
    r16.x = dot(r8, r7);			// partial precision
    r2 = tex2D(AnisoMap, r16);			// partial precision
    if_ne r5.w, -r5.w
      r2.z = dot(r15, r15);	// normalize + length
      r2.y = (r14.x <= 0.0 ? r6.y : LightData[1].w);			// partial precision
      r5.w = dot(r5, r7);			// partial precision
      r2.y = (r14.y <= 0.0 ? r2.y : LightData[2].w);			// partial precision
      r2.y = (r14.z <= 0.0 ? r2.y : LightData[3].w);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * const_4.z;			// partial precision
      r3.w = (r2.z * -r2.z) + const_7.z;			// partial precision
      r2.xyz = r13.x + const_18.zxyw;
      r13.xyz = (r2.x == 0.0 ? LightData[0] : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[1] : r13);			// partial precision
      r3.xyz = (IN.color_0.g * r3) + const_7.w;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[2] : r13);			// partial precision
      r13.xyz = (const_17.x * r3) + const_17.y;			// partial precision
      r3.xyz = r3.w * r2;			// partial precision
      r13.xyz = (r2.w * r13) + r6.w;			// partial precision
      r3.xyz = r3 * r13;			// partial precision
      r2.w = max(r7.z, const_7.y);			// partial precision
      r1.xyz = (r2.w * r3) + r1;			// partial precision
      r3.w = r5.w * r3.w;			// partial precision
      r2.w = max(r3.w, const_7.y);			// partial precision
      r5.w = r0.w + const_7.z;
      r4.xyz = (r2.w * r2) + r4;			// partial precision
    else
      r5.w = r0.w;
    endif
    r7.w = r5.w + r5.w;
    r13.xyz = r7.w + const_19;
    r2.xyz = (r13.x == 0.0 ? LightData[3] : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[4] : r2);
    r2.xyz = (r13.z == 0.0 ? LightData[5] : r2);
    r14.xyz = r2 - IN.input_5;
    r2.x = dot(r12, r14);
    r2.y = dot(r11, r14);
    r2.z = dot(r10, r14);
    r7.xyz = normalize(r2);			// partial precision
    r3.xyz = r9 + r7;			// partial precision
    r2.xyz = normalize(r3);			// partial precision
    r15.y = dot(r8, r2);			// partial precision
    r3.x = dot(r0, r7);			// partial precision
    r3.y = dot(r0, r2);			// partial precision
    r3 = tex2D(AnisoMap, r3);			// partial precision
    r15.x = dot(r8, r7);			// partial precision
    r2 = tex2D(AnisoMap, r15);			// partial precision
    if_lt const_7.z, r4.w
      r2.z = dot(r14, r14);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[3].w : r6.y);			// partial precision
      r0.w = dot(r5, r7);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[4].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[5].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * const_4.z;			// partial precision
      r3.w = (r2.z * -r2.z) + const_7.z;			// partial precision
      r2.xyz = r7.w + const_19;
      r13.xyz = (r2.x == 0.0 ? LightData[2] : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[3] : r13);			// partial precision
      r3.xyz = (IN.color_0.g * r3) + const_7.w;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[4] : r13);			// partial precision
      r13.xyz = (const_17.x * r3) + const_17.y;			// partial precision
      r3.xyz = r3.w * r2;			// partial precision
      r13.xyz = (r2.w * r13) + r6.w;			// partial precision
      r3.xyz = r3 * r13;			// partial precision
      r2.w = max(r7.z, const_7.y);			// partial precision
      r1.xyz = (r2.w * r3) + r1;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, const_7.y);			// partial precision
      r5.w = r5.w + const_7.z;
      r4.xyz = (r0.w * r2) + r4;			// partial precision
    endif
    r7.w = r5.w + r5.w;
    r13.xyz = r7.w + const_20;
    r2.xyz = (r13.x == 0.0 ? LightData[5] : r6.y);
    r2.xyz = (r13.y == 0.0 ? LightData[6] : r2);
    r2.xyz = (r13.z == 0.0 ? LightData[7] : r2);
    r14.xyz = r2 - IN.input_5;
    r2.x = dot(r12, r14);
    r2.y = dot(r11, r14);
    r2.z = dot(r10, r14);
    r7.xyz = normalize(r2);			// partial precision
    r3.xyz = r9 + r7;			// partial precision
    r2.xyz = normalize(r3);			// partial precision
    r15.y = dot(r8, r2);			// partial precision
    r3.x = dot(r0, r7);			// partial precision
    r3.y = dot(r0, r2);			// partial precision
    r3 = tex2D(AnisoMap, r3);			// partial precision
    r15.x = dot(r8, r7);			// partial precision
    r2 = tex2D(AnisoMap, r15);			// partial precision
    if_lt const_18.w, r4.w
      r2.z = dot(r14, r14);	// normalize + length
      r2.y = (r13.x == 0.0 ? LightData[5].w : r6.y);			// partial precision
      r0.w = dot(r5, r7);			// partial precision
      r2.y = (r13.y == 0.0 ? LightData[6].w : r2.y);			// partial precision
      r2.y = (r13.z == 0.0 ? LightData[7].w : r2.y);			// partial precision
      r2.z = 1.0 / sqrt(r2.z);
      r2.z = 1.0 / r2.z;
      r2.y = 1.0 / r2.y;			// partial precision
      r2.z = saturate(r2.z * r2.y);
      r6.w = r3.w * const_4.z;			// partial precision
      r3.w = (r2.z * -r2.z) + const_7.z;			// partial precision
      r2.xyz = r7.w + const_20;
      r13.xyz = (r2.x == 0.0 ? LightData[4] : r6.y);			// partial precision
      r3.xyz = r6.x + HairTint;			// partial precision
      r13.xyz = (r2.y == 0.0 ? LightData[5] : r13);			// partial precision
      r3.xyz = (IN.color_0.g * r3) + const_7.w;			// partial precision
      r2.xyz = (r2.z == 0.0 ? LightData[6] : r13);			// partial precision
      r13.xyz = (const_17.x * r3) + const_17.y;			// partial precision
      r3.xyz = r3.w * r2;			// partial precision
      r13.xyz = (r2.w * r13) + r6.w;			// partial precision
      r3.xyz = r3 * r13;			// partial precision
      r2.w = max(r7.z, const_7.y);			// partial precision
      r1.xyz = (r2.w * r3) + r1;			// partial precision
      r2.w = r0.w * r3.w;			// partial precision
      r0.w = max(r2.w, const_7.y);			// partial precision
      r5.w = r5.w + const_7.z;
      r4.xyz = (r0.w * r2) + r4;			// partial precision
    endif
    r7.xyz = LightData[7] - IN.input_5;
    r2.x = dot(r12, r7);
    r2.y = dot(r11, r7);
    r2.z = dot(r10, r7);
    r3.xyz = normalize(r2);			// partial precision
    r9.xyz = r9 + r3;			// partial precision
    r2.xyz = normalize(r9);			// partial precision
    r9.y = dot(r8, r2);			// partial precision
    r2.y = dot(r0, r2);			// partial precision
    r2.x = dot(r0, r3);			// partial precision
    r2 = tex2D(AnisoMap, r2);			// partial precision
    r9.x = dot(r8, r3);			// partial precision
    r0 = tex2D(AnisoMap, r9);			// partial precision
    if_lt const_17.z, r4.w
      r0.z = dot(r7, r7);	// normalize + length
      r0.z = 1.0 / sqrt(r0.z);
      r0.z = 1.0 / r0.z;
      r0.y = 1.0 / LightData[7].w;
      r3.w = dot(r5, r3);			// partial precision
      r0.z = saturate(r0.z * r0.y);
      r4.w = (r0.z * -r0.z) + const_7.z;			// partial precision
      r2.w = r2.w * const_4.z;			// partial precision
      r3.xy = (const_8.x * r5.w) + const_8.yzzw;
      r2.xyz = r6.x + HairTint;			// partial precision
      r0.xyz = (r3.x == 0.0 ? LightData[6] : r6.y);			// partial precision
      r2.xyz = (IN.color_0.g * r2) + const_7.w;			// partial precision
      r0.xyz = (r3.y == 0.0 ? LightData[7] : r0);			// partial precision
      r5.xyz = (const_17.x * r2) + const_17.y;			// partial precision
      r2.xyz = r4.w * r0;			// partial precision
      r5.xyz = (r0.w * r5) + r2.w;			// partial precision
      r2.xyz = r2 * r5;			// partial precision
      r3.w = r3.w * r4.w;			// partial precision
      r2.w = max(r3.z, const_7.y);			// partial precision
      r0.w = max(r3.w, const_7.y);			// partial precision
      r1.xyz = (r2.w * r2) + r1;			// partial precision
      r4.xyz = (r0.w * r0) + r4;			// partial precision
    endif
    r0.xyz = r6.x + HairTint;			// partial precision
    r0.xyz = (IN.color_0.g * r0) + const_7.w;			// partial precision
    r3.xyz = r1 * IN.color_0.g;			// partial precision
    r5.xyz = r0 + r0;			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r2 = tex2D(LayerMap, IN.texcoord_0);			// partial precision
    r1.xyz = lerp(r2, r0, r2.w);			// partial precision
    r0.y = r6.z - ToggleADTS.x;			// partial precision
    r1.xyz = r5 * r1;			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor) + r0.y;			// partial precision
    r0.xyz = r4 + r0;			// partial precision
    r2.xyz = r1.w * r3;			// partial precision
    r1.xyz = (r1 * r0) + r2;			// partial precision
    r0.xyz = IN.input_6 - r1;			// partial precision
    OUT.color_0.rgb = (IN.input_6.w * r0) + r1;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 291 instruction slots used (13 texture, 278 arithmetic)
