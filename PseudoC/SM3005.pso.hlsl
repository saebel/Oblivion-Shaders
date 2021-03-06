//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3005.pso /Fcshaderdump19/SM3005.pso.dis
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
//

    const float4 const_2 = {0.04, -0.02, -0.5, 0};
    const int4 const_4 = {0, 1, 10, 2};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -4, -5, -6};
    const int4 const_29 = {2, -6, -7, -8};
    const int4 const_30 = {2, -10, -11, -12};
    const int4 const_31 = {2, -16, -17, -18};
    const int4 const_32 = {2, -18, -19, 0};
    const int4 const_33 = {2, -8, -9, -10};
    const int4 const_34 = {2, -12, -13, -14};
    const int4 const_35 = {2, -14, -15, -16};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float3 IN.color_0 : COLOR0;			// partial precision
    float3 IN.texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 IN.texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float3 IN.texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float3 IN.texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 IN.texcoord_7 : TEXCOORD7_centroid;			// partial precision
    sampler2D BaseMap;
    sampler2D NormalMap;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r7.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r1.xyz = EyePosition.xyz - IN.texcoord_6.xyz;			// partial precision
    r0.z = dot(r7.xyz, r1.xyz);			// partial precision
    r9.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r8.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r0.x = dot(r9.xyz, r1.xyz);			// partial precision
    r0.y = dot(r8.xyz, r1.xyz);			// partial precision
    r0.w = (r0.w * 0.04) - 0.02;			// partial precision
    r6.xyz = normalize(r0.xyz);			// partial precision
    r12.xy = (r0.w * r6.xy) + IN.texcoord_0.xy;			// partial precision
    r0.xyzw = tex2D(NormalMap, r12.xy);
    r0.xyzw = r0.xyzw - 0.5;
    r0.xyzw = 2 * r0.xyzw;			// partial precision
    r3.xyz = const_4.xyz;
    r1.w = (ToggleNumLights.x <= 0.0 ? r3.x : r3.y);
    r4.xyz = normalize(r0.xyz);			// partial precision
    if_ne 0, r1.w
      r0.x = dot(r9.xyz, LightData[1].xyz);			// partial precision
      r0.y = dot(r8.xyz, LightData[1].xyz);			// partial precision
      r0.z = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r2.xyz = r6.xyz + r0.xyz;			// partial precision
      r1.xyz = normalize(r2.xyz);			// partial precision
      r1.z = saturate(dot(r1.xyz, r4.xyz));			// partial precision
      r1.w = dot(r4.xyz, r0.xyz);			// partial precision
      r0.z = pow(abs(r1.z), ToggleNumLights.z);			// partial precision
      r0.y = max(r1.w, 0);			// partial precision
      r3.w = 1;
      r2.xyz = r0.y * LightData[0].xyz;			// partial precision
      r0.xyz = r0.z * LightData[0].xyz;			// partial precision
    else
      r1.w = 0;
      r2.xyz = r1.w;			// partial precision
      r0.xyz = r1.w;			// partial precision
      r3.w = r1.w;
    endif
    r2.w = r3.z - ToggleNumLights.x;			// partial precision
    r1.x = min(ToggleNumLights.y, r2.w);			// partial precision
    r1.w = (r1.x >= 0.0 ? 0 : 1);
    r1.y = frac(r1.x);			// partial precision
    r1.z = (r1.y <= 0.0 ? 0 : 1);
    r1.y = r1.x - r1.y;			// partial precision
    r2.w = (r1.w * r1.z) + r1.y;
    r1.w = (r2.w <= 0.0 ? 0 : 1);
    if_ne 0, r1.w
      r5.x = 2 * r3.w;
      r5.yz = r5.x - const_4.yw;
      r1.xyz = r5.x - const_4.xyw;
      r10.xyz = (r1.xyz >= 0.0 ? r1.xyz : -r5.xyz);
      r3.x = 0;
      r1.xyzw = (r10.x <= 0.0 ? LightData[1].xyzw : r3.x);
      r1.xyzw = (r10.y <= 0.0 ? LightData[2].xyzw : r1.xyzw);
      r1.xyzw = (r10.z <= 0.0 ? LightData[3].xyzw : r1.xyzw);
      r11.xyz = (r10.x <= 0.0 ? LightData[0].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y <= 0.0 ? LightData[1].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z <= 0.0 ? LightData[2].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 1, r2.w
      r10.xyz = (2 * r3.w) + const_7.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[3].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[4].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[5].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[2].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[3].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[4].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 2, r2.w
      r10.xyz = (2 * r3.w) + const_8.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[5].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[6].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[7].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[4].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[5].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[6].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 3, r2.w
      r10.xyz = (2 * r3.w) + const_29.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[7].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[8].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[9].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[6].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[7].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[8].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 4, r2.w
      r10.xyz = (2 * r3.w) + const_33.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[9].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[10].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[11].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[8].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[9].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[10].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 5, r2.w
      r10.xyz = (2 * r3.w) + const_30.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[11].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[12].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[13].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[10].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[11].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[12].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 6, r2.w
      r10.xyz = (2 * r3.w) + const_34.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[13].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[14].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[15].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[12].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[13].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[14].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 7, r2.w
      r10.xyz = (2 * r3.w) + const_35.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[15].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[16].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[17].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[14].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[15].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[16].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 8, r2.w
      r10.xyz = (2 * r3.w) + const_31.yzw;
      r3.x = 0;
      r1.xyzw = (r10.x == 0.0 ? LightData[17].xyzw : r3.x);
      r1.xyzw = (r10.y == 0.0 ? LightData[18].xyzw : r1.xyzw);
      r1.xyzw = (r10.z == 0.0 ? LightData[19].xyzw : r1.xyzw);
      r11.xyz = (r10.x == 0.0 ? LightData[16].xyz : r3.x);			// partial precision
      r5.xyz = r1.xyz - IN.texcoord_6.xyz;
      r1.xyz = (r10.y == 0.0 ? LightData[17].xyz : r11.xyz);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[18].xyz : r1.xyz);			// partial precision
      r10.xyz = normalize(r11.xyz);			// partial precision
      r3.z = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.z = 1.0 / sqrt(r3.z);
      r5.xyz = normalize(r11.xyz);			// partial precision
      r3.x = 1.0 / r3.z;
      r4.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.z = pow(abs(r4.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r3.x * r1.w);
      r5.xyz = r1.xyz * r3.z;			// partial precision
      r3.z = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.z * r5.xyz) + r0.xyz;			// partial precision
      r3.z = r3.z * r1.w;			// partial precision
      r1.w = max(r3.z, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 9, r2.w
      r5.xyz = LightData[19].xyz - IN.texcoord_6.xyz;
      r1.x = dot(r9.xyz, r5.xyz);
      r1.y = dot(r8.xyz, r5.xyz);
      r1.z = dot(r7.xyz, r5.xyz);
      r1.w = dot(r5.xyz, r5.xyz);	// normalize + length
      r5.xyz = normalize(r1.xyz);			// partial precision
      r6.xyz = r6.xyz + r5.xyz;			// partial precision
      r1.w = 1.0 / sqrt(r1.w);
      r1.w = 1.0 / r1.w;
      r2.w = 1.0 / LightData[19].w;
      r1.xyz = normalize(r6.xyz);			// partial precision
      r1.w = saturate(r1.w * r2.w);
      r3.z = saturate(dot(r1.xyz, r4.xyz));			// partial precision
      r2.w = 1.0 - (r1.w * r1.w);			// partial precision
      r1.w = pow(abs(r3.z), ToggleNumLights.z);			// partial precision
      r6.xy = (2 * r3.w) + const_32.yz;
      r1.x = 0;
      r1.xyz = (r6.x == 0.0 ? LightData[18].xyz : r1.x);			// partial precision
      r3.w = dot(r4.xyz, r5.xyz);			// partial precision
      r1.xyz = (r6.y == 0.0 ? LightData[19].xyz : r1.xyz);			// partial precision
      r3.w = r2.w * r3.w;			// partial precision
      r4.xyz = r1.w * r1.xyz;			// partial precision
      r1.w = max(r3.w, 0);			// partial precision
      r0.xyz = (r2.w * r4.xyz) + r0.xyz;			// partial precision
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    r1.z = r3.y - ToggleADTS.x;			// partial precision
    r1.w = ToggleADTS.x;			// partial precision
    r1.xyz = (r1.w * AmbientColor.rgb) + r1.z;			// partial precision
    r1.xyz = r2.xyz + r1.xyz;			// partial precision
    r2.xyz = r0.w * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, r12.xy);			// partial precision
    r0.xyz = r0.xyz * IN.color_0.rgb;			// partial precision
    r1.xyz = (r0.xyz * r1.xyz) + r2.xyz;			// partial precision
    r0.xyz = IN.texcoord_7.xyz - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = MatAlpha.x;			// partial precision

// approximately 447 instruction slots used (3 texture, 444 arithmetic)
