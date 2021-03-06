//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3016.pso /Fcshaderdump19/SM3016.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   sampler2D FaceGenMap0;
//   sampler2D FaceGenMap1;
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
//   FaceGenMap0     texture_4       1
//   FaceGenMap1     texture_5       1
//

    const float4 const_2 = {-0.5, 0, 1, -1};
    const int4 const_4 = {10, -1, -2, 0};
    const int4 const_7 = {2, -6, -7, -8};
    const int4 const_8 = {2, -8, -9, -10};
    const int4 const_29 = {2, -10, -11, -12};
    const int4 const_30 = {2, -14, -15, -16};
    const int4 const_31 = {2, -18, -19, 0};
    const int4 const_32 = {2, -16, -17, -18};
    const int4 const_33 = {2, -2, -3, -4};
    const int4 const_34 = {2, -4, -5, -6};
    const int4 const_35 = {2, -12, -13, -14};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float3 IN.color_0 : COLOR0;			// partial precision
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
    sampler2D FaceGenMap0;
    sampler2D FaceGenMap1;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyz = 2 * r0.xyz;			// partial precision
    r6.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r1.xyz = EyePosition.xyz - IN.texcoord_6.xyz;			// partial precision
    r3.xyz = normalize(r0.xyz);			// partial precision
    r0.z = dot(r6.xyz, r1.xyz);			// partial precision
    r4.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r7.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r0.x = dot(r4.xyz, r1.xyz);			// partial precision
    r0.y = dot(r7.xyz, r1.xyz);			// partial precision
    r11.yz = const_2.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);			// partial precision
    r5.xyz = normalize(r0.xyz);			// partial precision
    if_ne 0, r0.w
      r1.w = dot(r3.xyz, r5.xyz);			// partial precision
      r0.x = dot(r4.xyz, LightData[1].xyz);			// partial precision
      r0.w = max(r1.w, 0);			// partial precision
      r0.y = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r0.w = 1 - r0.w;			// partial precision
      r0.z = dot(r6.xyz, LightData[1].xyz);			// partial precision
      r1.z = r0.w * r0.w;			// partial precision
      r1.w = dot(r3.xyz, r0.xyz);			// partial precision
      r1.z = r0.w * r1.z;			// partial precision
      r0.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      r1.xyz = r1.z * LightData[0].xyz;			// partial precision
      r1.xyz = (0.5 * r1.xyz) + r1.w;			// partial precision
      r8.xyz = max(r1.xyz, 0);			// partial precision
      r1.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r2.xyz = r1.xyz - 1;			// partial precision
      r1.xyz = r8.xyz * LightData[0].xyz;			// partial precision
      r0.xyz = (r0.x * r2.xyz) + 1;			// partial precision
      r2.xyz = r1.xyz * r0.xyz;			// partial precision
      r2.w = 1;
    else
      r0.w = 0;			// partial precision
      r2.xyz = r0.w;			// partial precision
      r2.w = r0.w;
    endif
    r0.w = 10;			// partial precision
    r1.w = r0.w - ToggleNumLights.x;			// partial precision
    r0.x = min(ToggleNumLights.y, r1.w);			// partial precision
    r0.w = (r0.x >= 0.0 ? 0 : 1);			// partial precision
    r0.y = frac(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? 0 : 1);			// partial precision
    r0.y = r0.x - r0.y;			// partial precision
    r1.w = (r0.w * r0.z) + r0.y;
    r0.w = (r1.w <= 0.0 ? 0 : 1);			// partial precision
    if_ne 0, r0.w
      r1.x = 2 * r2.w;
      r1.yz = r1.x + const_4.yz;
      r0.xyz = r1.x + const_4.wyz;
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (r0.xyz >= 0.0 ? r0.xyz : -r1.xyz);
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x <= 0.0 ? LightData[1].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y <= 0.0 ? LightData[2].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x <= 0.0 ? LightData[0].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y <= 0.0 ? LightData[1].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z <= 0.0 ? LightData[2].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 1, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_33.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[3].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[4].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[2].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[3].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[4].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 2, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_34.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[5].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[6].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[4].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[5].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[6].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 3, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[7].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[8].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[9].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[6].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[7].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[8].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 4, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_8.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[9].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[10].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[11].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[8].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[9].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[10].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 5, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_29.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[11].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[12].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[13].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[10].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[11].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[12].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 6, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_35.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[13].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[14].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[15].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[12].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[13].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[14].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 7, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_30.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[15].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[16].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[17].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[14].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[15].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[16].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 8, r1.w
      r0.w = dot(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_32.yzw;
      r1.z = max(r0.w, 0);			// partial precision
      r0.xyzw = (r9.x == 0.0 ? LightData[17].xyzw : r11.y);			// partial precision
      r1.z = 1 - r1.z;			// partial precision
      r0.xyzw = (r9.y == 0.0 ? LightData[18].xyzw : r0.xyzw);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0.xyzw = (r9.z == 0.0 ? LightData[19].xyzw : r0.xyzw);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.xyz = (r9.x == 0.0 ? LightData[16].xyz : r11.y);			// partial precision
      r10.x = dot(r4.xyz, r1.xyz);
      r10.y = dot(r7.xyz, r1.xyz);
      r10.z = dot(r6.xyz, r1.xyz);
      r0.xyz = (r9.y == 0.0 ? LightData[17].xyz : r0.xyz);			// partial precision
      r8.xyz = normalize(r10.xyz);			// partial precision
      r0.xyz = (r9.z == 0.0 ? LightData[18].xyz : r0.xyz);			// partial precision
      r6.w = dot(r3.xyz, r8.xyz);			// partial precision
      r4.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r3.w = max(r6.w, 0);			// partial precision
      r1.xyz = r5.w * r0.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r4.w * r0.w);
      r0.xyz = (r3.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
      r2.w = r2.w + 1;
    endif
    if_lt 9, r1.w
      r1.xyz = LightData[19].xyz - IN.texcoord_6.xyz;
      r4.x = dot(r4.xyz, r1.xyz);
      r4.y = dot(r7.xyz, r1.xyz);
      r4.z = dot(r6.xyz, r1.xyz);
      r3.w = dot(r3.xyz, r5.xyz);			// partial precision
      r0.xyz = normalize(r4.xyz);			// partial precision
      r0.w = dot(r1.xyz, r1.xyz);	// normalize + length
      r0.z = dot(r3.xyz, r0.xyz);			// partial precision
      r1.w = max(r0.z, 0);			// partial precision
      r0.z = max(r3.w, 0);			// partial precision
      r1.z = 1 - r0.z;			// partial precision
      r1.xy = (2 * r2.w) + const_31.yz;
      r2.w = r1.z * r1.z;			// partial precision
      r0.xyz = (r1.x == 0.0 ? LightData[18].xyz : r11.y);			// partial precision
      r1.z = r1.z * r2.w;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[19].xyz : r0.xyz);			// partial precision
      r1.xyz = r1.z * r0.xyz;			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r0.w = 1.0 / r0.w;
      r2.w = 1.0 / LightData[19].w;
      r1.xyz = r1.xyz * 0.5;			// partial precision
      r0.w = saturate(r0.w * r2.w);
      r0.xyz = (r1.w * r0.xyz) + r1.xyz;			// partial precision
      r0.w = 1.0 - (r0.w * r0.w);			// partial precision
      r1.xyz = r0.xyz * r0.w;			// partial precision
      r0.xyz = max(r1.xyz, 0);			// partial precision
      r2.xyz = r2.xyz + r0.xyz;			// partial precision
    endif
    r0.xyzw = tex2D(FaceGenMap0, IN.texcoord_0.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = (2 * r1.xyz) + r0.xyz;			// partial precision
    r1.xyzw = tex2D(FaceGenMap1, IN.texcoord_0.xy);			// partial precision
    r1.xyz = 2 * r1.xyz;			// partial precision
    r0.xyz = r0.xyz * r1.xyz;			// partial precision
    r1.w = r11.z - ToggleADTS.x;			// partial precision
    r1.xyz = r0.xyz * IN.color_0.rgb;			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor.rgb) + r1.w;			// partial precision
    r1.xyz = 2 * r1.xyz;			// partial precision
    r0.xyz = r2.xyz + r0.xyz;			// partial precision
    r1.xyz = r1.xyz * r0.xyz;			// partial precision
    r0.xyz = IN.texcoord_7.xyz - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 433 instruction slots used (6 texture, 427 arithmetic)
