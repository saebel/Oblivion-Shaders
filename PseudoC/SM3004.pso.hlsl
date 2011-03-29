//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3004.pso /Fcshaderdump19/SM3004.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   float4 LightData[30];
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
//   LightData[0]       const_9          1
//   LightData[1]       const_10          1
//   LightData[2]       const_11          1
//   LightData[3]       const_12          1
//   LightData[4]       const_13          1
//   LightData[5]       const_14          1
//   LightData[6]       const_15          1
//   LightData[7]       const_16          1
//   LightData[8]       const_17         1
//   LightData[9]       const_18         1
//   LightData[10]       const_19         1
//   LightData[11]       const_20         1
//   LightData[12]       const_21         1
//   LightData[13]       const_22         1
//   LightData[14]       const_23         1
//   LightData[15]       const_24         1
//   LightData[16]       const_25        1
//   LightData[17]       const_26        1
//   LightData[18]       const_27        1
//   LightData[19]       const_28        1
//   LightData[20]       const_29       1
//   LightData[21]       const_30       1
//   LightData[22]       const_31       1
//   LightData[23]       const_32       1
//   LightData[24]       const_33       1
//   LightData[25]       const_34       1
//   LightData[26]       const_35       1
//   LightData[27]       const_36       1
//   LightData[28]       const_37       1
//   LightData[29]       const_38       1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//

    const float4 const_2 = {0.04, -0.02, -0.5, 0};
    const int4 const_4 = {1, 15, 0, 2};
    const int4 const_7 = {2, -4, -5, -6};
    const int4 const_8 = {2, -2, -3, -4};
    const int4 const_39 = {2, -8, -9, -10};
    const int4 const_40 = {2, -10, -11, -12};
    const int4 const_41 = {2, -12, -13, -14};
    const int4 const_42 = {2, -20, -21, -22};
    const int4 const_43 = {2, -22, -23, -24};
    const int4 const_44 = {2, -28, -29, 0};
    const int4 const_45 = {2, -6, -7, -8};
    const int4 const_46 = {2, -14, -15, -16};
    const int4 const_47 = {2, -16, -17, -18};
    const int4 const_48 = {2, -18, -19, -20};
    const int4 const_49 = {2, -24, -25, -26};
    const int4 const_50 = {2, -26, -27, -28};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float3 IN.color_0 : COLOR0;			// partial precision
    float3 input_2 : TEXCOORD3_centroid;			// partial precision
    float3 input_3 : TEXCOORD4_centroid;			// partial precision
    float3 input_4 : TEXCOORD5_centroid;			// partial precision
    float3 input_5 : TEXCOORD6_centroid;			// partial precision
    float4 input_6 : TEXCOORD7_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D NormalMap;
    r9.xy = const_4.xy;
    r0.w = r9.y - ToggleNumLights.x;			// partial precision
    r3.z = min(ToggleNumLights.y, r0.w);			// partial precision
    r1.w = frac(r3.z);			// partial precision
    r2.w = (r3.z >= 0.0 ? 1 : 0);
    r3.w = (r1.w <= 0.0 ? 1 : 0);
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r4.xyz = normalize(IN.input_4);			// partial precision
    r1.xyz = EyePosition.xyz - IN.input_5;			// partial precision
    r0.z = dot(r4.xyz, r1.xyz);			// partial precision
    r6.xyz = normalize(IN.input_2);			// partial precision
    r5.xyz = normalize(IN.input_3);			// partial precision
    r0.x = dot(r6.xyz, r1.xyz);			// partial precision
    r0.y = dot(r5.xyz, r1.xyz);			// partial precision
    r0.z = dot(r0.xyz, r0.xyz);	// normalize + length			// partial precision
    r0.z = 1.0 / sqrt(r0.z);			// partial precision
    r0.w = (r0.w * 0.04) + -0.02;			// partial precision
    r0.xy = r0.xy * r0.z;			// partial precision
    r1.z = dot(r4.xyz, LightData[1].xyz);			// partial precision
    r10.xy = (r0.w * r0) + IN.texcoord_0;			// partial precision
    r0.xyzw = tex2D(NormalMap, r10);
    r0.xyz = r0.xyz + -0.5;
    r1.x = dot(r6.xyz, LightData[1].xyz);			// partial precision
    r0.xyz = r0.xyz + r0.xyz;			// partial precision
    r2.xyz = normalize(r0);			// partial precision
    r1.y = dot(r5.xyz, LightData[1].xyz);			// partial precision
    r0.w = r3.z - r1.w;			// partial precision
    r1.w = dot(r2.xyz, r1.xyz);			// partial precision
    r3.w = (r2.w * r3.w) + r0.w;
    r0.z = max(r1.w, 0);			// partial precision
    r0.w = 1;
    r0.xyz = r0.z * LightData[0].xyz;			// partial precision
    r2.w = 0;
    r0.xyzw = (ToggleNumLights.x <= 0.0 ? r0 : r2.w);
    r1.w = (r3.w <= 0.0 ? 1 : 0);
    if_ne r1.w, -r1.w
      r3.x = r0.w + r0.w;
      r3.yz = r3.x - const_4.xxww;
      r1.xyz = r3.x - const_4.zxww;
      r3.xyz = (r1 >= 0.0 ? -r3 : r1);
      r1.xyzw = (r3.x <= 0.0 ? r2.w : LightData[1]);
      r1.xyzw = (r3.y <= 0.0 ? r1 : LightData[2]);
      r1.xyzw = (r3.z <= 0.0 ? r1 : LightData[3]);
      r7.xyz = r1.xyz - IN.input_5;
      r1.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r1.z);
      r1.xyz = (r3.x <= 0.0 ? r2.w : LightData[0]);			// partial precision
      r3.x = 1.0 / r4.w;
      r1.w = 1.0 / r1.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.x = saturate(r3.x * r1.w);
      r7.xyz = normalize(r8);			// partial precision
      r1.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.x = (r3.x * -r3.x) + 1;			// partial precision
      r1.xyz = (r3.y <= 0.0 ? r1 : LightData[1]);			// partial precision
      r3.y = r1.w * r3.x;			// partial precision
      r1.xyz = (r3.z <= 0.0 ? r1 : LightData[2]);			// partial precision
      r1.w = max(r3.y, 0);			// partial precision
      r0.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r0.w = r0.w + 1;
    endif
    if_lt 1, r3.w
      r3.xyz = (2 * r0.w) + const_8.yzww;
      r1.xyzw = (r3.x == 0.0 ? LightData[3] : r2.w);
      r1.xyzw = (r3.y == 0.0 ? LightData[4] : r1);
      r1.xyzw = (r3.z == 0.0 ? LightData[5] : r1);
      r7.xyz = r1.xyz - IN.input_5;
      r1.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r1.z);
      r1.xyz = (r3.x == 0.0 ? LightData[2] : r2.w);			// partial precision
      r3.x = 1.0 / r4.w;
      r1.w = 1.0 / r1.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.x = saturate(r3.x * r1.w);
      r7.xyz = normalize(r8);			// partial precision
      r1.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.x = (r3.x * -r3.x) + 1;			// partial precision
      r1.xyz = (r3.y == 0.0 ? LightData[3] : r1);			// partial precision
      r3.y = r1.w * r3.x;			// partial precision
      r1.xyz = (r3.z == 0.0 ? LightData[4] : r1);			// partial precision
      r1.w = max(r3.y, 0);			// partial precision
      r3.xyz = (r1.w * r1.xyz) + r0.xyz;			// partial precision
      r1.w = r0.w + 1;
    else
      r3.xyz = r0.xyz;			// partial precision
      r1.w = r0.w;
    endif
    if_lt 2, r3.w
      r1.xyz = (2 * r1.w) + const_7.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[5] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[6] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[7] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[4] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[5] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[6] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --3, r3.w
      r1.xyz = (2 * r1.w) + const_45.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[7] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[8] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[9] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[6] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[7] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[8] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --4, r3.w
      r1.xyz = (2 * r1.w) + const_39.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[9] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[10] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[11] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[8] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[9] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[10] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --5, r3.w
      r1.xyz = (2 * r1.w) + const_40.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[11] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[12] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[13] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[10] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[11] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[12] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --6, r3.w
      r1.xyz = (2 * r1.w) + const_41.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[13] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[14] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[15] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[12] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[13] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[14] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --7, r3.w
      r1.xyz = (2 * r1.w) + const_46.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[15] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[16] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[17] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[14] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[15] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[16] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --8, r3.w
      r1.xyz = (2 * r1.w) + const_47.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[17] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[18] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[19] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[16] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[17] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[18] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --9, r3.w
      r1.xyz = (2 * r1.w) + const_48.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[19] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[20] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[21] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[18] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[19] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[20] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --10, r3.w
      r1.xyz = (2 * r1.w) + const_42.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[21] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[22] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[23] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[20] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[21] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[22] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --11, r3.w
      r1.xyz = (2 * r1.w) + const_43.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[23] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[24] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[25] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[22] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[23] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[24] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --12, r3.w
      r1.xyz = (2 * r1.w) + const_49.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[25] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[26] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[27] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[24] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[25] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[26] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --13, r3.w
      r1.xyz = (2 * r1.w) + const_50.yzww;
      r0.xyzw = (r1.x == 0.0 ? LightData[27] : r2.w);
      r0.xyzw = (r1.y == 0.0 ? LightData[28] : r0);
      r0.xyzw = (r1.z == 0.0 ? LightData[29] : r0);
      r7.xyz = r0.xyz - IN.input_5;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[26] : r2.w);			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r6.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r1.x = saturate(r1.x * r0.w);
      r7.xyz = normalize(r8);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r1.x = (r1.x * -r1.x) + 1;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[27] : r0);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[28] : r0);			// partial precision
      r0.w = max(r1.y, 0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt --14, r3.w
      r0.xyz = LightData[29].xyz - IN.input_5;
      r1.x = dot(r6.xyz, r0.xyz);
      r1.y = dot(r5.xyz, r0.xyz);
      r1.z = dot(r4.xyz, r0.xyz);
      r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
      r0.xyz = normalize(r1);			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r1.z = 1.0 / r0.w;
      r1.y = 1.0 / LightData[29].w;
      r0.w = dot(r2.xyz, r0.xyz);			// partial precision
      r0.z = saturate(r1.z * r1.y);
      r0.z = (r0.z * -r0.z) + 1;			// partial precision
      r1.xy = (2 * r1.w) + const_44.yzzw;
      r1.w = r0.w * r0.z;			// partial precision
      r0.xyz = (r1.x == 0.0 ? LightData[28] : r2.w);			// partial precision
      r0.w = max(r1.w, 0);			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[29] : r0);			// partial precision
      r3.xyz = (r0.w * r0.xyz) + r3.xyz;			// partial precision
    endif
    r0.xyzw = tex2D(BaseMap, r10);			// partial precision
    r1.w = r9.x - ToggleADTS.x;			// partial precision
    r0.w = ToggleADTS.x;			// partial precision
    r2.xyz = (r0.w * AmbientColor) + r1.w;			// partial precision
    r1.xyz = r0.xyz * IN.color_0;			// partial precision
    r0.xyz = r3.xyz + r2.xyz;			// partial precision
    r1.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = IN.input_6 - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.input_6.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = MatAlpha.x;			// partial precision

// approximately 459 instruction slots used (3 texture, 456 arithmetic)
