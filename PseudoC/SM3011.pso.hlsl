//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3011.pso /Fcshaderdump19/SM3011.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   float4 LightData[20];
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
//   MatAlpha        const_3       1
//   ToggleADTS      const_5       1
//   ToggleNumLights const_6       1
//   LightData[0]       const_9         1
//   LightData[1]       const_10         1
//   LightData[2]       const_11         1
//   LightData[3]       const_12         1
//   LightData[4]       const_13         1
//   LightData[5]       const_14         1
//   LightData[6]       const_15         1
//   LightData[7]       const_16         1
//   LightData[8]       const_17        1
//   LightData[9]       const_18        1
//   LightData[10]       const_19        1
//   LightData[11]       const_20        1
//   LightData[12]       const_21        1
//   LightData[13]       const_22        1
//   LightData[14]       const_23        1
//   LightData[15]       const_24        1
//   LightData[16]       const_25       1
//   LightData[17]       const_26       1
//   LightData[18]       const_27       1
//   LightData[19]       const_28       1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   ShadowMap       texture_2       1
//   ShadowMask      texture_3       1
//

    const float4 const_2 = {-0.5, 0, 1, -1};
    const int4 const_4 = {10, -1, -2, 0};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -6, -7, -8};
    const int4 const_29 = {2, -8, -9, -10};
    const int4 const_30 = {2, -10, -11, -12};
    const int4 const_31 = {2, -14, -15, -16};
    const int4 const_32 = {2, -18, -19, 0};
    const int4 const_33 = {2, -4, -5, -6};
    const int4 const_34 = {2, -12, -13, -14};
    const int4 const_35 = {2, -16, -17, -18};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float3 IN.color_0 : COLOR0;			// partial precision
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
    r0 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0 + const_2.x;			// partial precision
    r0.xyz = r0 + r0;			// partial precision
    r6.xyz = normalize(IN.input_4);			// partial precision
    r1.xyz = EyePosition - IN.input_5;			// partial precision
    r3.xyz = normalize(r0);			// partial precision
    r0.z = dot(r6, r1);			// partial precision
    r8.xyz = normalize(IN.input_2);			// partial precision
    r7.xyz = normalize(IN.input_3);			// partial precision
    r0.x = dot(r8, r1);			// partial precision
    r0.y = dot(r7, r1);			// partial precision
    r11.yz = const_2;
    r1.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);
    r5.xyz = normalize(r0);			// partial precision
    if_ne r1.w, -r1.w
      r4.x = dot(r8, LightData[1]);			// partial precision
      r4.y = dot(r7, LightData[1]);			// partial precision
      r4.z = dot(r6, LightData[1]);			// partial precision
      r1.xyz = r5 + r4;			// partial precision
      r0.xyz = normalize(r1);			// partial precision
      r0.z = saturate(dot(r0, r3));			// partial precision
      r3.w = pow(abs(r0.z), ToggleNumLights.z);			// partial precision
      r1 = tex2D(ShadowMask, IN.texcoord_1.zwzw);			// partial precision
      r2 = tex2D(ShadowMap, IN.texcoord_1);			// partial precision
      r0.xyz = r2 + const_2.w;			// partial precision
      r2.w = dot(r3, r4);			// partial precision
      r2.xyz = (r1.x * r0) + const_2.z;			// partial precision
      r1.w = max(r2.w, const_2.y);			// partial precision
      r0.xyz = r3.w * LightData[0];			// partial precision
      r1.xyz = r1.w * LightData[0];			// partial precision
      r0.xyz = r2 * r0;			// partial precision
      r2.xyz = r2 * r1;			// partial precision
      r3.w = const_2.z;
    else
      r1.w = const_2.y;
      r2.xyz = r1.w;			// partial precision
      r0.xyz = r1.w;			// partial precision
      r3.w = r1.w;
    endif
    r1.w = ToggleNumLights.x;
    r2.w = const_4.x - r1.w;			// partial precision
    r1.x = min(ToggleNumLights.y, r2.w);			// partial precision
    r1.w = (r1.x >= 0.0 ? const_2.z : const_2.y);
    r1.y = r1.x - floor(r1.x);			// partial precision
    r1.z = (r1.y <= 0.0 ? const_2.z : const_2.y);
    r1.y = r1.x - r1.y;			// partial precision
    r2.w = (r1.w * r1.z) + r1.y;
    r1.w = (r2.w <= 0.0 ? const_2.z : const_2.y);
    if_ne r1.w, -r1.w
      r4.x = r3.w + r3.w;
      r4.yz = r4.x + const_4;
      r1.xyz = r4.x + const_4.wyzw;
      r9.xyz = (r1 >= 0.0 ? -r4 : r1);
      r1 = (r9.x <= 0.0 ? r11.y : LightData[1]);
      r1 = (r9.y <= 0.0 ? r1 : LightData[2]);
      r1 = (r9.z <= 0.0 ? r1 : LightData[3]);
      r10.xyz = (r9.x <= 0.0 ? r11.y : LightData[0]);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y <= 0.0 ? r10 : LightData[1]);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z <= 0.0 ? r1 : LightData[2]);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt const_2.z, r2.w
      r9.xyz = (const_7.x * r3.w) + const_7.yzww;
      r1 = (r9.x == 0.0 ? LightData[3] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[4] : r1);
      r1 = (r9.z == 0.0 ? LightData[5] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[2] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[3] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[4] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_4.z, r2.w
      r9.xyz = (const_33.x * r3.w) + const_33.yzww;
      r1 = (r9.x == 0.0 ? LightData[5] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[6] : r1);
      r1 = (r9.z == 0.0 ? LightData[7] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[4] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[5] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[6] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_7.z, r2.w
      r9.xyz = (const_8.x * r3.w) + const_8.yzww;
      r1 = (r9.x == 0.0 ? LightData[7] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[8] : r1);
      r1 = (r9.z == 0.0 ? LightData[9] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[6] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[7] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[8] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_7.w, r2.w
      r9.xyz = (const_29.x * r3.w) + const_29.yzww;
      r1 = (r9.x == 0.0 ? LightData[9] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[10] : r1);
      r1 = (r9.z == 0.0 ? LightData[11] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[8] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[9] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[10] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_33.z, r2.w
      r9.xyz = (const_30.x * r3.w) + const_30.yzww;
      r1 = (r9.x == 0.0 ? LightData[11] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[12] : r1);
      r1 = (r9.z == 0.0 ? LightData[13] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[10] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[11] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[12] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_33.w, r2.w
      r9.xyz = (const_34.x * r3.w) + const_34.yzww;
      r1 = (r9.x == 0.0 ? LightData[13] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[14] : r1);
      r1 = (r9.z == 0.0 ? LightData[15] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[12] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[13] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[14] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_8.z, r2.w
      r9.xyz = (const_31.x * r3.w) + const_31.yzww;
      r1 = (r9.x == 0.0 ? LightData[15] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[16] : r1);
      r1 = (r9.z == 0.0 ? LightData[17] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[14] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[15] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[16] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_8.w, r2.w
      r9.xyz = (const_35.x * r3.w) + const_35.yzww;
      r1 = (r9.x == 0.0 ? LightData[17] : r11.y);
      r1 = (r9.y == 0.0 ? LightData[18] : r1);
      r1 = (r9.z == 0.0 ? LightData[19] : r1);
      r10.xyz = (r9.x == 0.0 ? LightData[16] : r11.y);			// partial precision
      r4.xyz = r1 - IN.input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[17] : r10);			// partial precision
      r10.x = dot(r8, r4);
      r10.y = dot(r7, r4);
      r10.z = dot(r6, r4);
      r1.xyz = (r9.z == 0.0 ? LightData[18] : r1);			// partial precision
      r9.xyz = normalize(r10);			// partial precision
      r4.w = dot(r4, r4);	// normalize + length
      r10.xyz = r5 + r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4, r3));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = dot(r3, r9);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, const_2.y);			// partial precision
      r3.w = r3.w + const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_29.z, r2.w
      r4.xyz = LightData[19] - IN.input_5;
      r1.x = dot(r8, r4);
      r1.y = dot(r7, r4);
      r1.z = dot(r6, r4);
      r1.w = dot(r4, r4);	// normalize + length
      r4.xyz = normalize(r1);			// partial precision
      r5.xyz = r5 + r4;			// partial precision
      r1.w = 1.0 / sqrt(r1.w);
      r1.w = 1.0 / r1.w;
      r2.w = 1.0 / LightData[19].w;
      r1.xyz = normalize(r5);			// partial precision
      r1.w = saturate(r1.w * r2.w);
      r4.w = saturate(dot(r1, r3));			// partial precision
      r2.w = (r1.w * -r1.w) + const_2.z;			// partial precision
      r1.w = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r5.xy = (const_32.x * r3.w) + const_32.yzzw;
      r1.xyz = (r5.x == 0.0 ? LightData[18] : r11.y);			// partial precision
      r3.w = dot(r3, r4);			// partial precision
      r1.xyz = (r5.y == 0.0 ? LightData[19] : r1);			// partial precision
      r3.w = r2.w * r3.w;			// partial precision
      r3.xyz = r1.w * r1;			// partial precision
      r1.w = max(r3.w, const_2.y);			// partial precision
      r0.xyz = (r2.w * r3) + r0;			// partial precision
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    r1.z = r11.z - ToggleADTS.x;			// partial precision
    r1.w = ToggleADTS.x;			// partial precision
    r1.xyz = (r1.w * AmbientColor) + r1.z;			// partial precision
    r1.xyz = r2 + r1;			// partial precision
    r2.xyz = r0.w * r0;			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0 * IN.color_0;			// partial precision
    r1.xyz = (r0 * r1) + r2;			// partial precision
    r0.xyz = IN.input_7 - r1;			// partial precision
    OUT.color_0.rgb = (IN.input_7.w * r0) + r1;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 441 instruction slots used (4 texture, 437 arithmetic)
