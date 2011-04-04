//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3018.pso /Fcshaderdump19/SM3018.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D GlowMap;
//   float4 LightData[30];
//   float3 MatAlpha;
//   float3 MatEmit;
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
//   MatAlpha        const_3       1
//   MatEmit         const_4       1
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
//   ShadowMap       texture_2       1
//   ShadowMask      texture_3       1
//   GlowMap         texture_6       1
//

    const float4 const_1 = {-0.5, 0, 1, -1};
    const int4 const_2 = {15, -1, -2, 0};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -6, -7, -8};
    const int4 const_39 = {2, -8, -9, -10};
    const int4 const_40 = {2, -10, -11, -12};
    const int4 const_41 = {2, -20, -21, -22};
    const int4 const_42 = {2, -22, -23, -24};
    const int4 const_43 = {2, -24, -25, -26};
    const int4 const_44 = {2, -26, -27, -28};
    const int4 const_45 = {2, -28, -29, 0};
    const int4 const_46 = {2, -4, -5, -6};
    const int4 const_47 = {2, -12, -13, -14};
    const int4 const_48 = {2, -14, -15, -16};
    const int4 const_49 = {2, -16, -17, -18};
    const int4 const_50 = {2, -18, -19, -20};
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
    sampler2D GlowMap;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyz = 2 * r0.xyz;			// partial precision
    r2.xyz = normalize(r0.xyz);			// partial precision
    r9.yz = const_1.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r9.z : r9.y);
    r3.xyz = normalize(IN.input_2.xyz);			// partial precision
    r5.xyz = normalize(IN.input_3.xyz);			// partial precision
    r4.xyz = normalize(IN.input_4.xyz);			// partial precision
    if_ne 0, r0.w
      r0.x = dot(r3.xyz, LightData[1].xyz);			// partial precision
      r0.y = dot(r5.xyz, LightData[1].xyz);			// partial precision
      r0.z = dot(r4.xyz, LightData[1].xyz);			// partial precision
      r0.w = dot(r2.xyz, r0.xyz);			// partial precision
      r2.w = max(r0.w, 0);			// partial precision
      r0.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      r1.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r1.xyz = r1.xyz - 1;			// partial precision
      r1.xyz = (r0.x * r1.xyz) + 1;			// partial precision
      r0.xyz = r2.w * LightData[0].xyz;			// partial precision
      r1.xyz = r1.xyz * r0.xyz;			// partial precision
      r1.w = 1;
    else
      r0.w = 0;
      r1.xyz = r0.w;			// partial precision
      r1.w = r0.w;
    endif
    r0.w = 15;			// partial precision
    r2.w = r0.w - ToggleNumLights.x;			// partial precision
    r0.x = min(ToggleNumLights.y, r2.w);			// partial precision
    r0.w = (r0.x >= 0.0 ? 1 : 0);
    r0.y = frac(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? 1 : 0);
    r0.y = r0.x - r0.y;			// partial precision
    r2.w = (r0.w * r0.z) + r0.y;
    r0.w = (r2.w <= 0.0 ? 1 : 0);
    if_ne 0, r0.w
      r6.x = 2 * r1.w;
      r6.yz = r6.x + const_2.yz;
      r0.xyz = r6.x + const_2.wyz;
      r6.xyz = (r0 >= 0.0 ? -r6.xyz : r0.xyz);
      r0.xyzw = (r6.x <= 0.0 ? r9.y : LightData[1].xyzw);
      r0.xyzw = (r6.y <= 0.0 ? r0.xyzw : LightData[2].xyzw);
      r0.xyzw = (r6.z <= 0.0 ? r0.xyzw : LightData[3].xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x <= 0.0 ? r9.y : LightData[0].xyz);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y <= 0.0 ? r0.xyz : LightData[1].xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z <= 0.0 ? r0.xyz : LightData[2].xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 1, r2.w
      r6.xyz = (2 * r1.w) + const_7.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[3].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[4].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[5].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[2].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[3].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[4].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 2, r2.w
      r6.xyz = (2 * r1.w) + const_46.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[5].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[6].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[7].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[4].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[5].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[6].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 3, r2.w
      r6.xyz = (2 * r1.w) + const_8.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[7].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[8].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[9].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[6].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[7].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[8].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 4, r2.w
      r6.xyz = (2 * r1.w) + const_39.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[9].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[10].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[11].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[8].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[9].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[10].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 5, r2.w
      r6.xyz = (2 * r1.w) + const_40.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[11].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[12].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[13].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[10].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[11].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[12].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 6, r2.w
      r6.xyz = (2 * r1.w) + const_47.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[13].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[14].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[15].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[12].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[13].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[14].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 7, r2.w
      r6.xyz = (2 * r1.w) + const_48.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[15].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[16].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[17].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[14].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[15].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[16].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 8, r2.w
      r6.xyz = (2 * r1.w) + const_49.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[17].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[18].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[19].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[16].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[17].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[18].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 9, r2.w
      r6.xyz = (2 * r1.w) + const_50.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[19].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[20].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[21].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[18].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[19].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[20].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 10, r2.w
      r6.xyz = (2 * r1.w) + const_41.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[21].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[22].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[23].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[20].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[21].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[22].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 11, r2.w
      r6.xyz = (2 * r1.w) + const_42.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[23].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[24].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[25].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[22].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[23].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[24].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 12, r2.w
      r6.xyz = (2 * r1.w) + const_43.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[25].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[26].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[27].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[24].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[25].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[26].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 13, r2.w
      r6.xyz = (2 * r1.w) + const_44.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[27].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[28].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[29].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.input_5.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[26].xyz : r9.y);			// partial precision
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);			// partial precision
      r0.w = dot(r2.xyz, r7.xyz);			// partial precision
      r3.w = 1.0 - (r3.w * r3.w);			// partial precision
      r0.xyz = (r6.y == 0.0 ? LightData[27].xyz : r0.xyz);			// partial precision
      r3.w = r0.w * r3.w;			// partial precision
      r0.xyz = (r6.z == 0.0 ? LightData[28].xyz : r0.xyz);			// partial precision
      r0.w = max(r3.w, 0);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
      r1.w = r1.w + 1;
    endif
    if_lt 14, r2.w
      r0.xyz = LightData[29].xyz - IN.input_5.xyz;
      r3.x = dot(r3.xyz, r0.xyz);
      r3.y = dot(r5.xyz, r0.xyz);
      r3.z = dot(r4.xyz, r0.xyz);
      r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
      r0.xyz = normalize(r3.xyz);			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r2.w = 1.0 / r0.w;
      r3.w = 1.0 / LightData[29].w;
      r0.w = dot(r2.xyz, r0.xyz);			// partial precision
      r0.z = saturate(r2.w * r3.w);
      r0.z = 1.0 - (r0.z * r0.z);			// partial precision
      r2.xy = (2 * r1.w) + const_45.yz;
      r1.w = r0.w * r0.z;			// partial precision
      r0.xyz = (r2.x == 0.0 ? LightData[28].xyz : r9.y);			// partial precision
      r0.w = max(r1.w, 0);			// partial precision
      r0.xyz = (r2.y == 0.0 ? LightData[29].xyz : r0.xyz);			// partial precision
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
    endif
    r1.w = r9.z - ToggleADTS.x;			// partial precision
    r0.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);			// partial precision
    r2.xyz = MatEmit.rgb;			// partial precision
    r0.xyz = (r0.xyz * r2.xyz) + AmbientColor.rgb;			// partial precision
    r0.xyz = (ToggleADTS.x * r0.xyz) + r1.w;			// partial precision
    r1.xyz = r1.xyz + r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz * IN.color_0.rgb;			// partial precision
    r1.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = IN.input_7.xyz - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.input_7.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 459 instruction slots used (5 texture, 454 arithmetic)
