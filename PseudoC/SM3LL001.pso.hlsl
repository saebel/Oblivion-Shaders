//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL001.pso /Fcshaderdump19/SM3LL001.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
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
//

    const float4 const_2 = {-0.5, 0, 1, 4};
    const int4 const_4 = {2, -4, -5, -6};
    const int4 const_7 = {2, -6, -7, 0};
    const int4 const_8 = {-1, -2, 0, 2};
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
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0.xyz + -0.5;			// partial precision
    r0.xyz = r0.xyz + r0.xyz;			// partial precision
    r7.xyz = normalize(IN.input_4);			// partial precision
    r1.xyz = EyePosition.xyz - IN.input_5;			// partial precision
    r4.xyz = normalize(r0);			// partial precision
    r0.z = dot(r7.xyz, r1.xyz);			// partial precision
    r9.xyz = normalize(IN.input_2);			// partial precision
    r8.xyz = normalize(IN.input_3);			// partial precision
    r0.x = dot(r9.xyz, r1.xyz);			// partial precision
    r0.y = dot(r8.xyz, r1.xyz);			// partial precision
    r3.yzw = const_2.yzw;
    r1.w = (ToggleNumLights.x <= 0.0 ? r3.z : r3.y);
    r6.xyz = normalize(r0);			// partial precision
    if_ne r1.w, -r1.w
      r0.x = dot(r9.xyz, LightData[1].xyz);			// partial precision
      r0.y = dot(r8.xyz, LightData[1].xyz);			// partial precision
      r0.z = dot(r7.xyz, LightData[1].xyz);			// partial precision
      r2.xyz = r6.xyz + r0.xyz;			// partial precision
      r1.xyz = normalize(r2);			// partial precision
      r1.z = saturate(dot(r1.xyz, r4.xyz));			// partial precision
      r1.w = dot(r4.xyz, r0.xyz);			// partial precision
      r0.z = pow(abs(r1.z), ToggleNumLights.z);			// partial precision
      r0.y = max(r1.w, 0);			// partial precision
      r2.w = 1;
      r2.xyz = r0.y * LightData[0].xyz;			// partial precision
      r0.xyz = r0.z * LightData[0].xyz;			// partial precision
    else
      r2.yzw = 0;
      r2.xyz = r2.wyzw;			// partial precision
      r0.xyz = r2.w;			// partial precision
    endif
    r3.w = r3.w - ToggleNumLights.x;			// partial precision
    r1.x = min(ToggleNumLights.y, r3.w);			// partial precision
    r1.w = (r1.x >= 0.0 ? 1 : 0);
    r1.y = frac(r1.x);			// partial precision
    r1.z = (r1.y <= 0.0 ? 1 : 0);
    r1.y = r1.x - r1.y;			// partial precision
    r3.x = (r1.w * r1.z) + r1.y;
    r1.w = (r3.x <= 0.0 ? 1 : 0);
    if_ne r1.w, -r1.w
      r5.x = r2.w + r2.w;
      r5.yz = r5.x + const_8.xxyw;
      r1.xyz = r5.x + const_8.zxyw;
      r10.xyz = (r1 >= 0.0 ? -r5 : r1);
      r1.xyzw = (r10.x <= 0.0 ? r3.y : LightData[1]);
      r1.xyzw = (r10.y <= 0.0 ? r1 : LightData[2]);
      r1.xyzw = (r10.z <= 0.0 ? r1 : LightData[3]);
      r11.xyz = (r10.x <= 0.0 ? r3.y : LightData[0]);			// partial precision
      r5.xyz = r1.xyz - IN.input_5;
      r1.xyz = (r10.y <= 0.0 ? r11 : LightData[1]);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z <= 0.0 ? r1 : LightData[2]);			// partial precision
      r10.xyz = normalize(r11);			// partial precision
      r3.w = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r3.w = 1.0 / sqrt(r3.w);
      r5.xyz = normalize(r11);			// partial precision
      r4.w = 1.0 / r3.w;
      r5.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r3.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r4.w * r1.w);
      r5.xyz = r1.xyz * r3.w;			// partial precision
      r3.w = (r1.w * -r1.w) + 1;			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r3.w * r5.xyz) + r0.xyz;			// partial precision
      r3.w = r3.w * r1.w;			// partial precision
      r1.w = max(r3.w, 0);			// partial precision
      r3.w = r2.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    else
      r3.w = r2.w;
    endif
    if_lt 1, r3.x
      r10.xyz = (2 * r3.w) + const_17.yzww;
      r1.xyzw = (r10.x == 0.0 ? LightData[3] : r3.y);
      r1.xyzw = (r10.y == 0.0 ? LightData[4] : r1);
      r1.xyzw = (r10.z == 0.0 ? LightData[5] : r1);
      r11.xyz = (r10.x == 0.0 ? LightData[2] : r3.y);			// partial precision
      r5.xyz = r1.xyz - IN.input_5;
      r1.xyz = (r10.y == 0.0 ? LightData[3] : r11);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[4] : r1);			// partial precision
      r10.xyz = normalize(r11);			// partial precision
      r2.w = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r2.w = 1.0 / sqrt(r2.w);
      r5.xyz = normalize(r11);			// partial precision
      r4.w = 1.0 / r2.w;
      r5.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r2.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r4.w * r1.w);
      r5.xyz = r1.xyz * r2.w;			// partial precision
      r2.w = (r1.w * -r1.w) + 1;			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r2.w * r5.xyz) + r0.xyz;			// partial precision
      r2.w = r2.w * r1.w;			// partial precision
      r1.w = max(r2.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt 2, r3.x
      r10.xyz = (2 * r3.w) + const_4.yzww;
      r1.xyzw = (r10.x == 0.0 ? LightData[5] : r3.y);
      r1.xyzw = (r10.y == 0.0 ? LightData[6] : r1);
      r1.xyzw = (r10.z == 0.0 ? LightData[7] : r1);
      r11.xyz = (r10.x == 0.0 ? LightData[4] : r3.y);			// partial precision
      r5.xyz = r1.xyz - IN.input_5;
      r1.xyz = (r10.y == 0.0 ? LightData[5] : r11);			// partial precision
      r11.x = dot(r9.xyz, r5.xyz);
      r11.y = dot(r8.xyz, r5.xyz);
      r11.z = dot(r7.xyz, r5.xyz);
      r1.xyz = (r10.z == 0.0 ? LightData[6] : r1);			// partial precision
      r10.xyz = normalize(r11);			// partial precision
      r2.w = dot(r5.xyz, r5.xyz);	// normalize + length
      r11.xyz = r6.xyz + r10.xyz;			// partial precision
      r2.w = 1.0 / sqrt(r2.w);
      r5.xyz = normalize(r11);			// partial precision
      r4.w = 1.0 / r2.w;
      r5.w = saturate(dot(r5.xyz, r4.xyz));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      r2.w = pow(abs(r5.w), ToggleNumLights.z);			// partial precision
      r1.w = saturate(r4.w * r1.w);
      r5.xyz = r1.xyz * r2.w;			// partial precision
      r2.w = (r1.w * -r1.w) + 1;			// partial precision
      r1.w = dot(r4.xyz, r10.xyz);			// partial precision
      r0.xyz = (r2.w * r5.xyz) + r0.xyz;			// partial precision
      r2.w = r2.w * r1.w;			// partial precision
      r1.w = max(r2.w, 0);			// partial precision
      r3.w = r3.w + 1;
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    if_lt --3, r3.x
      r5.xyz = LightData[7].xyz - IN.input_5;
      r1.x = dot(r9.xyz, r5.xyz);
      r1.y = dot(r8.xyz, r5.xyz);
      r1.z = dot(r7.xyz, r5.xyz);
      r1.w = dot(r5.xyz, r5.xyz);	// normalize + length
      r5.xyz = normalize(r1);			// partial precision
      r6.xyz = r6.xyz + r5.xyz;			// partial precision
      r1.w = 1.0 / sqrt(r1.w);
      r1.w = 1.0 / r1.w;
      r2.w = 1.0 / LightData[7].w;
      r1.xyz = normalize(r6);			// partial precision
      r1.w = saturate(r1.w * r2.w);
      r3.x = saturate(dot(r1.xyz, r4.xyz));			// partial precision
      r2.w = (r1.w * -r1.w) + 1;			// partial precision
      r1.w = pow(abs(r3.x), ToggleNumLights.z);			// partial precision
      r6.xy = (2 * r3.w) + const_7.yzzw;
      r1.xyz = (r6.x == 0.0 ? LightData[6] : r3.y);			// partial precision
      r3.w = dot(r4.xyz, r5.xyz);			// partial precision
      r1.xyz = (r6.y == 0.0 ? LightData[7] : r1);			// partial precision
      r3.w = r2.w * r3.w;			// partial precision
      r4.xyz = r1.w * r1.xyz;			// partial precision
      r1.w = max(r3.w, 0);			// partial precision
      r0.xyz = (r2.w * r4.xyz) + r0.xyz;			// partial precision
      r2.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    endif
    r1.z = r3.z - ToggleADTS.x;			// partial precision
    r1.w = ToggleADTS.x;			// partial precision
    r1.xyz = (r1.w * AmbientColor) + r1.z;			// partial precision
    r1.xyz = r2.xyz + r1.xyz;			// partial precision
    r2.xyz = r0.w * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0.xyz * IN.color_0;			// partial precision
    r1.xyz = (r0.xyz * r1.xyz) + r2.xyz;			// partial precision
    r0.xyz = IN.input_6 - r1.xyz;			// partial precision
    OUT.color_0.rgb = (IN.input_6.w * r0.xyz) + r1.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision

// approximately 213 instruction slots used (2 texture, 211 arithmetic)
