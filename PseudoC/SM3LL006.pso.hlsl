//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL006.pso /Fcshaderdump19/SM3LL006.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   sampler2D FaceGenMap0;
//   sampler2D FaceGenMap1;
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
//   FaceGenMap0     texture_4       1
//   FaceGenMap1     texture_5       1
//

    const float4 const_2 = {-0.5, 0, 1, 0.5};
    const int4 const_4 = {4, -1, -2, 0};
    const int4 const_7 = {2, -4, -5, -6};
    const int4 const_8 = {2, -6, -7, 0};
    const int4 const_17 = {2, -2, -3, -4};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float3 IN.color_0 : COLOR0;			// partial precision
    float3 input_2 : TEXCOORD3_centroid;			// partial precision
    float3 input_3 : TEXCOORD4_centroid;			// partial precision
    float3 input_4 : TEXCOORD5_centroid;			// partial precision
    float3 input_5 : TEXCOORD6_centroid;			// partial precision
    float4 input_6 : TEXCOORD7_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D FaceGenMap0;
    sampler2D FaceGenMap1;
    r0 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0 + -0.5;			// partial precision
    r0.xyz = r0 + r0;			// partial precision
    r6.xyz = normalize(IN.input_4);			// partial precision
    r2.xyz = EyePosition - IN.input_5;			// partial precision
    r1.xyz = normalize(r0);			// partial precision
    r0.z = dot(r6, r2);			// partial precision
    r4.xyz = normalize(IN.input_2);			// partial precision
    r7.xyz = normalize(IN.input_3);			// partial precision
    r0.x = dot(r4, r2);			// partial precision
    r0.y = dot(r7, r2);			// partial precision
    r11.yz = const_2;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);
    r5.xyz = normalize(r0);			// partial precision
    if_ne r0.w, -r0.w
      r1.w = dot(r1, r5);			// partial precision
      r0.w = max(r1.w, 0);			// partial precision
      r0.x = dot(r4, LightData[1]);			// partial precision
      r0.w = 1 - r0.w;			// partial precision
      r0.y = dot(r7, LightData[1]);			// partial precision
      r1.w = r0.w * r0.w;			// partial precision
      r0.z = dot(r6, LightData[1]);			// partial precision
      r1.w = r0.w * r1.w;			// partial precision
      r0.w = dot(r1, r0);			// partial precision
      r0.xyz = r1.w * LightData[0];			// partial precision
      r2.xyz = (0.5 * r0) + r0.w;			// partial precision
      r0.xyz = max(r2, 0);			// partial precision
      r2.xyz = r0 * LightData[0];			// partial precision
      r2.w = 1;
    else
      r0.w = 0;
      r2.xyz = r0.w;			// partial precision
      r2.w = r0.w;
    endif
    r0.w = 4;			// partial precision
    r1.w = r0.w - ToggleNumLights.x;			// partial precision
    r0.x = min(ToggleNumLights.y, r1.w);			// partial precision
    r0.w = (r0.x >= 0.0 ? 1 : 0);
    r0.y = frac(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? 1 : 0);
    r0.y = r0.x - r0.y;			// partial precision
    r1.w = (r0.w * r0.z) + r0.y;
    r0.w = (r1.w <= 0.0 ? 1 : 0);
    if_ne r0.w, -r0.w
      r3.x = r2.w + r2.w;
      r3.yz = r3.x + const_4;
      r0.xyz = r3.x + const_4.wyzw;
      r0.w = dot(r1, r5);			// partial precision
      r9.xyz = (r0 >= 0.0 ? -r3 : r0);
      r3.w = max(r0.w, 0);			// partial precision
      r0 = (r9.x <= 0.0 ? r11.y : LightData[1]);
      r3.w = 1 - r3.w;			// partial precision
      r0 = (r9.y <= 0.0 ? r0 : LightData[2]);
      r3.z = r3.w * r3.w;			// partial precision
      r0 = (r9.z <= 0.0 ? r0 : LightData[3]);
      r5.w = r3.w * r3.z;			// partial precision
      r3.xyz = r0 - IN.input_5;
      r0.xyz = (r9.x <= 0.0 ? r11.y : LightData[0]);			// partial precision
      r10.x = dot(r4, r3);
      r10.y = dot(r7, r3);
      r10.z = dot(r6, r3);
      r0.xyz = (r9.y <= 0.0 ? r0 : LightData[1]);			// partial precision
      r8.xyz = normalize(r10);			// partial precision
      r0.xyz = (r9.z <= 0.0 ? r0 : LightData[2]);			// partial precision
      r6.w = dot(r1, r8);			// partial precision
      r4.w = dot(r3, r3);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r3.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r3.xyz = r3 * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r3;			// partial precision
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r3.xyz = r0 * r0.w;			// partial precision
      r0.xyz = max(r3, 0);			// partial precision
      r2.xyz = r2 + r0;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 1, r1.w
      r0.w = dot(r1, r5);			// partial precision
      r9.xyz = (2 * r2.w) + const_17.yzww;
      r3.w = max(r0.w, 0);			// partial precision
      r0 = (r9.x == 0.0 ? LightData[3] : r11.y);
      r3.w = 1 - r3.w;			// partial precision
      r0 = (r9.y == 0.0 ? LightData[4] : r0);
      r3.z = r3.w * r3.w;			// partial precision
      r0 = (r9.z == 0.0 ? LightData[5] : r0);
      r5.w = r3.w * r3.z;			// partial precision
      r3.xyz = r0 - IN.input_5;
      r0.xyz = (r9.x == 0.0 ? LightData[2] : r11.y);			// partial precision
      r10.x = dot(r4, r3);
      r10.y = dot(r7, r3);
      r10.z = dot(r6, r3);
      r0.xyz = (r9.y == 0.0 ? LightData[3] : r0);			// partial precision
      r8.xyz = normalize(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[4] : r0);			// partial precision
      r6.w = dot(r1, r8);			// partial precision
      r4.w = dot(r3, r3);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r3.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r3.xyz = r3 * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r3;			// partial precision
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r3.xyz = r0 * r0.w;			// partial precision
      r0.xyz = max(r3, 0);			// partial precision
      r2.xyz = r2 + r0;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt --2, r1.w
      r0.w = dot(r1, r5);			// partial precision
      r9.xyz = (2 * r2.w) + const_7.yzww;
      r3.w = max(r0.w, 0);			// partial precision
      r0 = (r9.x == 0.0 ? LightData[5] : r11.y);
      r3.w = 1 - r3.w;			// partial precision
      r0 = (r9.y == 0.0 ? LightData[6] : r0);
      r3.z = r3.w * r3.w;			// partial precision
      r0 = (r9.z == 0.0 ? LightData[7] : r0);
      r5.w = r3.w * r3.z;			// partial precision
      r3.xyz = r0 - IN.input_5;
      r0.xyz = (r9.x == 0.0 ? LightData[4] : r11.y);			// partial precision
      r10.x = dot(r4, r3);
      r10.y = dot(r7, r3);
      r10.z = dot(r6, r3);
      r0.xyz = (r9.y == 0.0 ? LightData[5] : r0);			// partial precision
      r8.xyz = normalize(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[6] : r0);			// partial precision
      r6.w = dot(r1, r8);			// partial precision
      r4.w = dot(r3, r3);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r3.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r3.xyz = r3 * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r3;			// partial precision
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r3.xyz = r0 * r0.w;			// partial precision
      r0.xyz = max(r3, 0);			// partial precision
      r2.xyz = r2 + r0;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt --3, r1.w
      r3.xyz = LightData[7] - IN.input_5;
      r4.x = dot(r4, r3);
      r4.y = dot(r7, r3);
      r4.z = dot(r6, r3);
      r3.w = dot(r1, r5);			// partial precision
      r0.xyz = normalize(r4);			// partial precision
      r0.w = dot(r3, r3);	// normalize + length
      r0.z = dot(r1, r0);			// partial precision
      r1.w = max(r0.z, 0);			// partial precision
      r0.z = max(r3.w, 0);			// partial precision
      r1.z = 1 - r0.z;			// partial precision
      r1.xy = (2 * r2.w) + const_8.yzzw;
      r2.w = r1.z * r1.z;			// partial precision
      r0.xyz = (r1.x == 0.0 ? LightData[6] : r11.y);			// partial precision
      r1.z = r1.z * r2.w;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[7] : r0);			// partial precision
      r1.xyz = r1.z * r0;			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r0.w = 1.0 / r0.w;
      r2.w = 1.0 / LightData[7].w;
      r1.xyz = r1 * 0.5;			// partial precision
      r0.w = saturate(r0.w * r2.w);
      r0.xyz = (r1.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) + 1;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = max(r1, 0);			// partial precision
      r2.xyz = r2 + r0;			// partial precision
    endif
    r0 = tex2D(FaceGenMap0, IN.texcoord_0);			// partial precision
    r1.xyz = r0 + -0.5;			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.xyz = (--2 * r1) + r0;			// partial precision
    r1 = tex2D(FaceGenMap1, IN.texcoord_0);			// partial precision
    r1.xyz = r1 + r1;			// partial precision
    r0.xyz = r0 * r1;			// partial precision
    r1.w = r11.z - ToggleADTS.x;			// partial precision
    r1.xyz = r0 * IN.color_0;			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor) + r1.w;			// partial precision
    r1.xyz = r1 + r1;			// partial precision
    r0.xyz = r2 + r0;			// partial precision
    r1.xyz = r1 * r0;			// partial precision
    r0.xyz = IN.input_6 - r1;			// partial precision
    OUT.color_0.rgb = (IN.input_6.w * r0) + r1;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 212 instruction slots used (4 texture, 208 arithmetic)
