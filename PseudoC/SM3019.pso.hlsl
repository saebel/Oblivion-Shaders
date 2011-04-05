//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3019.pso /Fcshaderdump19/SM3019.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   sampler2D GlowMap;
//   float4 LightData[16];
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
//   EyePosition     const_1       1
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
//   GlowMap         texture_6       1
//

    const float4 const_2 = {-0.5, 0, 1, -1};
    const int4 const_7 = {8, -1, -2, 0};
    const int4 const_8 = {2, -2, -3, -4};
    const int4 const_25 = {2, -4, -5, -6};
    const int4 const_26 = {2, -8, -9, -10};
    const int4 const_27 = {2, -10, -11, -12};
    const int4 const_28 = {2, -14, -15, 0};
    const int4 const_29 = {2, -12, -13, -14};
    const int4 const_30 = {2, -6, -7, -8};
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
    r6.xyz = normalize(IN.input_4.xyz);			// partial precision
    r1.xyz = EyePosition.xyz - IN.input_5.xyz;			// partial precision
    r3.xyz = normalize(r0.xyz);			// partial precision
    r0.z = dot(r6.xyz, r1.xyz);			// partial precision
    r8.xyz = normalize(IN.input_2.xyz);			// partial precision
    r7.xyz = normalize(IN.input_3.xyz);			// partial precision
    r0.x = dot(r8.xyz, r1.xyz);			// partial precision
    r0.y = dot(r7.xyz, r1.xyz);			// partial precision
    r11.yz = const_2.yz;
    r1.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);
    r5.xyz = normalize(r0.xyz);			// partial precision
    if_ne 0, r1.w
      r4.x = dot(r8.xyz, LightData[1].xyz);			// partial precision
      r4.y = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r4.z = dot(r6.xyz, LightData[1].xyz);			// partial precision
      r1.xyz = r5.xyz + r4.xyz;			// partial precision
      r0.xyz = normalize(r1.xyz);			// partial precision
      r0.z = saturate(dot(r0.xyz, r3.xyz));			// partial precision
      r3.w = pow(abs(r0.z), ToggleNumLights.z);			// partial precision
      r1.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      r2.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r0.xyz = r2.xyz - 1;			// partial precision
      r2.w = dot(r3.xyz, r4.xyz);			// partial precision
      r2.xyz = (r1.x * r0.xyz) + 1;			// partial precision
      r1.w = max(r2.w, 0);			// partial precision
      r0.xyz = r3.w * LightData[0].xyz;			// partial precision
      r1.xyz = r1.w * LightData[0].xyz;			// partial precision
      r0.xyz = r2.xyz * r0.xyz;			// partial precision
      r2.xyz = r2.xyz * r1.xyz;			// partial precision
      r3.w = 1;
    else
      r1.w = 0;
      r2.xyz = r1.w;			// partial precision
      r0.xyz = r1.w;			// partial precision
      r3.w = r1.w;
    endif
    r1.w = ToggleNumLights.x;
    r2.w = 8 - r1.w;			// partial precision
    r1.x = min(ToggleNumLights.y, r2.w);			// partial precision
    r1.w = (r1.x >= 0.0 ? 1 : 0);
    r1.y = frac(r1.x);			// partial precision
    r1.z = (r1.y <= 0.0 ? 1 : 0);
    r1.y = r1.x - r1.y;			// partial precision
    r2.w = (r1.w * r1.z) + r1.y;
    r1.w = (r2.w <= 0.0 ? 1 : 0);
    if_ne 0, r1.w
      r4.x = 2 * r3.w;
      r4.yz = r4.x + const_7.yz;
      r1.xyz = r4.x + const_7.wyz;
      r9.xyz = (r1.xyz >= 0.0 ? -r4.xyz : r1.xyz);
      r1.xyzw = (r9.x <= 0.0 ? r11.y : LightData[1].xyzw);
      r1.xyzw = (r9.y <= 0.0 ? r1.xyzw : LightData[2].xyzw);
      r1.xyzw = (r9.z <= 0.0 ? r1.xyzw : LightData[3].xyzw);
      r10.xyz = (r9.x <= 0.0 ? r11.y : LightData[0].xyz);			// partial precision
      r4.xyz = r1.xyz - IN.input_5.xyz;
      r1.xyz = (r9.y <= 0.0 ? r10.xyz : LightData[1].xyz);			// partial precision
      r10.x = dot(r8.xyz, r4.xyz);
      r10.y = dot(r7.xyz, r4.xyz);
      r10.z = dot(r6.xyz, r4.xyz);
      r1.xyz = (r9.z <= 0.0 ? r1.xyz : LightData[2].xyz);			// partial precision
      r9.xyz = normalize(r10.xyz);			// partial precision
      r4.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r10.xyz = r5.xyz + r9.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10.xyz);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4.xyz, r3.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1.xyz * r4.w;			// partial precision
      r4.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r3.xyz, r9.xyz);			// partial precision
      r0.xyz = (r4.w * r4.xyz) + r0.xyz;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 1, r2.w
      r9.xyz = (2 * r3.w) + const_8.yzw;
      r1.xyzw = (r9.x == 0.0 ? LightData[3].xyzw : r11.y);
      r1.xyzw = (r9.y == 0.0 ? LightData[4].xyzw : r1.xyzw);
      r1.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : r1.xyzw);
      r10.xyz = (r9.x == 0.0 ? LightData[2].xyz : r11.y);			// partial precision
      r4.xyz = r1.xyz - IN.input_5.xyz;
      r1.xyz = (r9.y == 0.0 ? LightData[3].xyz : r10.xyz);			// partial precision
      r10.x = dot(r8.xyz, r4.xyz);
      r10.y = dot(r7.xyz, r4.xyz);
      r10.z = dot(r6.xyz, r4.xyz);
      r1.xyz = (r9.z == 0.0 ? LightData[4].xyz : r1.xyz);			// partial precision
      r9.xyz = normalize(r10.xyz);			// partial precision
      r4.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r10.xyz = r5.xyz + r9.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10.xyz);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4.xyz, r3.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1.xyz * r4.w;			// partial precision
      r4.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r3.xyz, r9.xyz);			// partial precision
      r0.xyz = (r4.w * r4.xyz) + r0.xyz;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 2, r2.w
      r9.xyz = (2 * r3.w) + const_25.yzw;
      r1.xyzw = (r9.x == 0.0 ? LightData[5].xyzw : r11.y);
      r1.xyzw = (r9.y == 0.0 ? LightData[6].xyzw : r1.xyzw);
      r1.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : r1.xyzw);
      r10.xyz = (r9.x == 0.0 ? LightData[4].xyz : r11.y);			// partial precision
      r4.xyz = r1.xyz - IN.input_5.xyz;
      r1.xyz = (r9.y == 0.0 ? LightData[5].xyz : r10.xyz);			// partial precision
      r10.x = dot(r8.xyz, r4.xyz);
      r10.y = dot(r7.xyz, r4.xyz);
      r10.z = dot(r6.xyz, r4.xyz);
      r1.xyz = (r9.z == 0.0 ? LightData[6].xyz : r1.xyz);			// partial precision
      r9.xyz = normalize(r10.xyz);			// partial precision
      r4.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r10.xyz = r5.xyz + r9.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10.xyz);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4.xyz, r3.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1.xyz * r4.w;			// partial precision
      r4.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r3.xyz, r9.xyz);			// partial precision
      r0.xyz = (r4.w * r4.xyz) + r0.xyz;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 3, r2.w
      r9.xyz = (2 * r3.w) + const_30.yzw;
      r1.xyzw = (r9.x == 0.0 ? LightData[7].xyzw : r11.y);
      r1.xyzw = (r9.y == 0.0 ? LightData[8].xyzw : r1.xyzw);
      r1.xyzw = (r9.z == 0.0 ? LightData[9].xyzw : r1.xyzw);
      r10.xyz = (r9.x == 0.0 ? LightData[6].xyz : r11.y);			// partial precision
      r4.xyz = r1.xyz - IN.input_5.xyz;
      r1.xyz = (r9.y == 0.0 ? LightData[7].xyz : r10.xyz);			// partial precision
      r10.x = dot(r8.xyz, r4.xyz);
      r10.y = dot(r7.xyz, r4.xyz);
      r10.z = dot(r6.xyz, r4.xyz);
      r1.xyz = (r9.z == 0.0 ? LightData[8].xyz : r1.xyz);			// partial precision
      r9.xyz = normalize(r10.xyz);			// partial precision
      r4.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r10.xyz = r5.xyz + r9.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10.xyz);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4.xyz, r3.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1.xyz * r4.w;			// partial precision
      r4.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r3.xyz, r9.xyz);			// partial precision
      r0.xyz = (r4.w * r4.xyz) + r0.xyz;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 4, r2.w
      r9.xyz = (2 * r3.w) + const_26.yzw;
      r1.xyzw = (r9.x == 0.0 ? LightData[9].xyzw : r11.y);
      r1.xyzw = (r9.y == 0.0 ? LightData[10].xyzw : r1.xyzw);
      r1.xyzw = (r9.z == 0.0 ? LightData[11].xyzw : r1.xyzw);
      r10.xyz = (r9.x == 0.0 ? LightData[8].xyz : r11.y);			// partial precision
      r4.xyz = r1.xyz - IN.input_5.xyz;
      r1.xyz = (r9.y == 0.0 ? LightData[9].xyz : r10.xyz);			// partial precision
      r10.x = dot(r8.xyz, r4.xyz);
      r10.y = dot(r7.xyz, r4.xyz);
      r10.z = dot(r6.xyz, r4.xyz);
      r1.xyz = (r9.z == 0.0 ? LightData[10].xyz : r1.xyz);			// partial precision
      r9.xyz = normalize(r10.xyz);			// partial precision
      r4.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r10.xyz = r5.xyz + r9.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10.xyz);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4.xyz, r3.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1.xyz * r4.w;			// partial precision
      r4.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r3.xyz, r9.xyz);			// partial precision
      r0.xyz = (r4.w * r4.xyz) + r0.xyz;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 5, r2.w
      r9.xyz = (2 * r3.w) + const_27.yzw;
      r1.xyzw = (r9.x == 0.0 ? LightData[11].xyzw : r11.y);
      r1.xyzw = (r9.y == 0.0 ? LightData[12].xyzw : r1.xyzw);
      r1.xyzw = (r9.z == 0.0 ? LightData[13].xyzw : r1.xyzw);
      r10.xyz = (r9.x == 0.0 ? LightData[10].xyz : r11.y);			// partial precision
      r4.xyz = r1.xyz - IN.input_5.xyz;
      r1.xyz = (r9.y == 0.0 ? LightData[11].xyz : r10.xyz);			// partial precision
      r10.x = dot(r8.xyz, r4.xyz);
      r10.y = dot(r7.xyz, r4.xyz);
      r10.z = dot(r6.xyz, r4.xyz);
      r1.xyz = (r9.z == 0.0 ? LightData[12].xyz : r1.xyz);			// partial precision
      r9.xyz = normalize(r10.xyz);			// partial precision
      r4.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r10.xyz = r5.xyz + r9.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10.xyz);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4.xyz, r3.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1.xyz * r4.w;			// partial precision
      r4.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r3.xyz, r9.xyz);			// partial precision
      r0.xyz = (r4.w * r4.xyz) + r0.xyz;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 6, r2.w
      r9.xyz = (2 * r3.w) + const_29.yzw;
      r1.xyzw = (r9.x == 0.0 ? LightData[13].xyzw : r11.y);
      r1.xyzw = (r9.y == 0.0 ? LightData[14].xyzw : r1.xyzw);
      r1.xyzw = (r9.z == 0.0 ? LightData[15].xyzw : r1.xyzw);
      r10.xyz = (r9.x == 0.0 ? LightData[12].xyz : r11.y);			// partial precision
      r4.xyz = r1.xyz - IN.input_5.xyz;
      r1.xyz = (r9.y == 0.0 ? LightData[13].xyz : r10.xyz);			// partial precision
      r10.x = dot(r8.xyz, r4.xyz);
      r10.y = dot(r7.xyz, r4.xyz);
      r10.z = dot(r6.xyz, r4.xyz);
      r1.xyz = (r9.z == 0.0 ? LightData[14].xyz : r1.xyz);			// partial precision
      r9.xyz = normalize(r10.xyz);			// partial precision
      r4.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r10.xyz = r5.xyz + r9.xyz;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = normalize(r10.xyz);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = saturate(dot(r4.xyz, r3.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r4.w = pow(abs(r6.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r5.w * r1.w);
      r4.xyz = r1.xyz * r4.w;			// partial precision
      r4.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r3.xyz, r9.xyz);			// partial precision
      r0.xyz = (r4.w * r4.xyz) + r0.xyz;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = max(r4.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 7, r2.w
      r4.xyz = LightData[15].xyz - IN.input_5.xyz;
      r1.x = dot(r8.xyz, r4.xyz);
      r1.y = dot(r7.xyz, r4.xyz);
      r1.z = dot(r6.xyz, r4.xyz);
      r1.w = dot(r4.xyz, r4.xyz);	// normalize + length
      r4.xyz = normalize(r1.xyz);			// partial precision
      r5.xyz = r5.xyz + r4.xyz;			// partial precision
      r1.w = 1.0 / sqrt(r1.w);
      r1.w = 1.0 / r1.w;
      r2.w = 1.0 / LightData[15].w;
      r1.xyz = normalize(r5.xyz);			// partial precision
      r1.w = saturate(r1.w * r2.w);
      r4.w = saturate(dot(r1.xyz, r3.xyz));			// partial precision
      r2.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r5.xy = (2 * r3.w) + const_28.yz;
      r1.xyz = (r5.x == 0.0 ? LightData[14].xyz : r11.y);			// partial precision
      r3.w = dot(r3.xyz, r4.xyz);			// partial precision
      r1.xyz = (r5.y == 0.0 ? LightData[15].xyz : r1.xyz);			// partial precision
      r3.w = r2.w * r3.w;			// partial precision
      r3.xyz = r1.w * r1.xyz;			// partial precision
      r1.w = max(r3.w, 0);			// partial precision
      r0.xyz = (r2.w * r3.xyz) + r0.xyz;			// partial precision
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    r2.w = r11.z - ToggleADTS.x;			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);			// partial precision
    r3.xyz = MatEmit.rgb;			// partial precision
    r1.xyz = (r1.xyz * r3.xyz) + AmbientColor.rgb;			// partial precision
    r1.xyz = (ToggleADTS.x * r1.xyz) + r2.w;			// partial precision
    r1.xyz = r2.xyz + r1.xyz;			// partial precision
    r2.xyz = r0.w * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz * IN.color_0.rgb;			// partial precision
    r1.xyz = (r0.xyz * r1.xyz) + r2.xyz;			// partial precision
    r0.xyz = IN.input_7.xyz - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.input_7.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 369 instruction slots used (5 texture, 364 arithmetic)
