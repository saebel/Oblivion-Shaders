//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3010.pso /Fcshaderdump19/SM3010.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
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
//

    const float4 const_1 = {-0.5, 0, 1, -1};
    const int4 const_2 = {8, -1, -2, 0};
    const int4 const_4 = {2, -4, -5, -6};
    const int4 const_7 = {2, -8, -9, -10};
    const int4 const_8 = {2, -10, -11, -12};
    const int4 const_25 = {2, -12, -13, -14};
    const int4 const_26 = {2, -14, -15, 0};
    const int4 const_27 = {2, -2, -3, -4};
    const int4 const_28 = {2, -6, -7, -8};
    float2 IN.texcoord_0 : TEXCOORD0;
    float3 IN.color_0 : COLOR0;
    float3 IN.texcoord_3 : TEXCOORD3_centroid;
    float3 IN.texcoord_4 : TEXCOORD4_centroid;
    float3 IN.texcoord_5 : TEXCOORD5_centroid;
    float3 IN.texcoord_6 : TEXCOORD6_centroid;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 IN.texcoord_7 : TEXCOORD7_centroid;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    sampler2D ShadowMask;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r0.xyz = r0.xyz - 0.5;
    r0.xyz = 2 * r0.xyz;
    r2.xyz = normalize(r0.xyz);
    r9.yz = const_1.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r9.y : r9.z);
    r3.xyz = normalize(IN.texcoord_3.xyz);
    r5.xyz = normalize(IN.texcoord_4.xyz);
    r4.xyz = normalize(IN.texcoord_5.xyz);
    if_ne 0, r0.w
      r0.x = dot(r3.xyz, LightData[1].xyz);
      r0.y = dot(r5.xyz, LightData[1].xyz);
      r0.z = dot(r4.xyz, LightData[1].xyz);
      r0.w = dot(r2.xyz, r0.xyz);
      r2.w = max(r0.w, 0);
      r0.xyzw = tex2D(ShadowMask, IN.texcoord_1.zw);
      r1.xyzw = tex2D(ShadowMap, IN.texcoord_1.xy);
      r1.xyz = r1.xyz - 1;
      r1.xyz = (r0.x * r1.xyz) + 1;
      r0.xyz = r2.w * LightData[0].xyz;
      r1.xyz = r1.xyz * r0.xyz;
      r1.w = 1;
    else
      r0.w = 0;
      r1.xyz = r0.w;
      r1.w = r0.w;
    endif
    r0.w = 8;
    r2.w = r0.w - ToggleNumLights.x;
    r0.x = min(ToggleNumLights.y, r2.w);
    r0.w = (r0.x >= 0.0 ? 0 : 1);
    r0.y = frac(r0.x);
    r0.z = (r0.y <= 0.0 ? 0 : 1);
    r0.y = r0.x - r0.y;
    r2.w = (r0.w * r0.z) + r0.y;
    r0.w = (r2.w <= 0.0 ? 0 : 1);
    if_ne 0, r0.w
      r6.x = 2 * r1.w;
      r6.yz = r6.x + const_2.yz;
      r0.xyz = r6.x + const_2.wyz;
      r6.xyz = (r0.xyz >= 0.0 ? r0.xyz : -r6.xyz);
      r0.xyzw = (r6.x <= 0.0 ? LightData[1].xyzw : r9.y);
      r0.xyzw = (r6.y <= 0.0 ? LightData[2].xyzw : r0.xyzw);
      r0.xyzw = (r6.z <= 0.0 ? LightData[3].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x <= 0.0 ? LightData[0].xyz : r9.y);
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);
      r0.w = dot(r2.xyz, r7.xyz);
      r3.w = 1.0 - (r3.w * r3.w);
      r0.xyz = (r6.y <= 0.0 ? LightData[1].xyz : r0.xyz);
      r3.w = r0.w * r3.w;
      r0.xyz = (r6.z <= 0.0 ? LightData[2].xyz : r0.xyz);
      r0.w = max(r3.w, 0);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
      r1.w = r1.w + 1;
    endif
    if_lt 1, r2.w
      r6.xyz = (2 * r1.w) + const_27.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[3].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[4].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[5].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[2].xyz : r9.y);
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);
      r0.w = dot(r2.xyz, r7.xyz);
      r3.w = 1.0 - (r3.w * r3.w);
      r0.xyz = (r6.y == 0.0 ? LightData[3].xyz : r0.xyz);
      r3.w = r0.w * r3.w;
      r0.xyz = (r6.z == 0.0 ? LightData[4].xyz : r0.xyz);
      r0.w = max(r3.w, 0);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
      r1.w = r1.w + 1;
    endif
    if_lt 2, r2.w
      r6.xyz = (2 * r1.w) + const_4.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[5].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[6].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[7].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[4].xyz : r9.y);
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);
      r0.w = dot(r2.xyz, r7.xyz);
      r3.w = 1.0 - (r3.w * r3.w);
      r0.xyz = (r6.y == 0.0 ? LightData[5].xyz : r0.xyz);
      r3.w = r0.w * r3.w;
      r0.xyz = (r6.z == 0.0 ? LightData[6].xyz : r0.xyz);
      r0.w = max(r3.w, 0);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
      r1.w = r1.w + 1;
    endif
    if_lt 3, r2.w
      r6.xyz = (2 * r1.w) + const_28.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[7].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[8].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[9].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[6].xyz : r9.y);
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);
      r0.w = dot(r2.xyz, r7.xyz);
      r3.w = 1.0 - (r3.w * r3.w);
      r0.xyz = (r6.y == 0.0 ? LightData[7].xyz : r0.xyz);
      r3.w = r0.w * r3.w;
      r0.xyz = (r6.z == 0.0 ? LightData[8].xyz : r0.xyz);
      r0.w = max(r3.w, 0);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
      r1.w = r1.w + 1;
    endif
    if_lt 4, r2.w
      r6.xyz = (2 * r1.w) + const_7.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[9].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[10].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[11].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[8].xyz : r9.y);
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);
      r0.w = dot(r2.xyz, r7.xyz);
      r3.w = 1.0 - (r3.w * r3.w);
      r0.xyz = (r6.y == 0.0 ? LightData[9].xyz : r0.xyz);
      r3.w = r0.w * r3.w;
      r0.xyz = (r6.z == 0.0 ? LightData[10].xyz : r0.xyz);
      r0.w = max(r3.w, 0);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
      r1.w = r1.w + 1;
    endif
    if_lt 5, r2.w
      r6.xyz = (2 * r1.w) + const_8.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[11].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[12].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[13].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[10].xyz : r9.y);
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);
      r0.w = dot(r2.xyz, r7.xyz);
      r3.w = 1.0 - (r3.w * r3.w);
      r0.xyz = (r6.y == 0.0 ? LightData[11].xyz : r0.xyz);
      r3.w = r0.w * r3.w;
      r0.xyz = (r6.z == 0.0 ? LightData[12].xyz : r0.xyz);
      r0.w = max(r3.w, 0);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
      r1.w = r1.w + 1;
    endif
    if_lt 6, r2.w
      r6.xyz = (2 * r1.w) + const_25.yzw;
      r0.xyzw = (r6.x == 0.0 ? LightData[13].xyzw : r9.y);
      r0.xyzw = (r6.y == 0.0 ? LightData[14].xyzw : r0.xyzw);
      r0.xyzw = (r6.z == 0.0 ? LightData[15].xyzw : r0.xyzw);
      r7.xyz = r0.xyz - IN.texcoord_6.xyz;
      r0.z = dot(r7.xyz, r7.xyz);	// normalize + length
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r6.x == 0.0 ? LightData[12].xyz : r9.y);
      r3.w = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;
      r8.x = dot(r3.xyz, r7.xyz);
      r8.y = dot(r5.xyz, r7.xyz);
      r8.z = dot(r4.xyz, r7.xyz);
      r3.w = saturate(r3.w * r0.w);
      r7.xyz = normalize(r8.xyz);
      r0.w = dot(r2.xyz, r7.xyz);
      r3.w = 1.0 - (r3.w * r3.w);
      r0.xyz = (r6.y == 0.0 ? LightData[13].xyz : r0.xyz);
      r3.w = r0.w * r3.w;
      r0.xyz = (r6.z == 0.0 ? LightData[14].xyz : r0.xyz);
      r0.w = max(r3.w, 0);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
      r1.w = r1.w + 1;
    endif
    if_lt 7, r2.w
      r0.xyz = LightData[15].xyz - IN.texcoord_6.xyz;
      r3.x = dot(r3.xyz, r0.xyz);
      r3.y = dot(r5.xyz, r0.xyz);
      r3.z = dot(r4.xyz, r0.xyz);
      r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
      r0.xyz = normalize(r3.xyz);
      r0.w = 1.0 / sqrt(r0.w);
      r2.w = 1.0 / r0.w;
      r3.w = 1.0 / LightData[15].w;
      r0.w = dot(r2.xyz, r0.xyz);
      r0.z = saturate(r2.w * r3.w);
      r0.z = 1.0 - (r0.z * r0.z);
      r2.xy = (2 * r1.w) + const_26.yz;
      r1.w = r0.w * r0.z;
      r0.xyz = (r2.x == 0.0 ? LightData[14].xyz : r9.y);
      r0.w = max(r1.w, 0);
      r0.xyz = (r2.y == 0.0 ? LightData[15].xyz : r0.xyz);
      r1.xyz = (r0.w * r0.xyz) + r1.xyz;
    endif
    r0.z = r9.z - ToggleADTS.x;
    r0.w = ToggleADTS.x;
    r0.xyz = (r0.w * AmbientColor.rgb) + r0.z;
    r1.xyz = r1.xyz + r0.xyz;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r0.xyz = r0.xyz * IN.color_0.rgb;
    r1.xyz = r1.xyz * r0.xyz;
    r0.xyz = IN.texcoord_7.xyz - r1.xyz;
    OUT.color_0.rgb = (IN.texcoord_7.w * r0.xyz) + r1.xyz;
    OUT.color_0.a = r0.w * MatAlpha.x;

// approximately 268 instruction slots used (4 texture, 264 arithmetic)