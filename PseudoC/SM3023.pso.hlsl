//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3023.pso /Fcshaderdump19/SM3023.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//   float4 LightColor;
//   float4 LightData;
//   sampler2D ShadowMap;
//   float4 ToggleADTS;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   ToggleADTS   const_5       1
//   LightColor   const_9       1
//   LightData    const_10      1
//   BaseMap      texture_0       1
//   ShadowMap    texture_2       1
//

    const float4 const_0 = {0.5, 1, 15, 0};
    const float4 const_1 = {-(1.0 / 256), 1, -1, 0};
    const float4 const_2 = {(1.0 / 15), 0.6, 0, 0};
    const float4 const_3 = {0.01, 0.02, -0.01, -0.02};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float3 input_1 : TEXCOORD6_centroid;
    float4 input_2 : TEXCOORD1_centroid;			// partial precision
    centroid texcoord_2 IN.input_3.w;			// partial precision
    sampler2D BaseMap;
    sampler2D ShadowMap;
    r0.z = 1.0 / LightData.w;
    r5.xyw = const_0.xyw;
    r0.w = r5.x * LightData.w;
    r6.w = r0.z * IN.input_2.z;
    r1.z = 1.0 / r0.w;
    r1.w = 1.0 / IN.input_2.w;			// partial precision
    r0.xyz = IN.input_1.xyz - LightData.xyz;
    r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.xy = r1.w * IN.input_2.xy;			// partial precision
    r0.w = 1.0 / sqrt(r0.w);
    r0.xy = (0.5 * r0.xy) + 0.5;			// partial precision
    r1.w = 1.0 / r0.w;
    r0.zw = 1 - r0.y;			// partial precision
    r5.z = saturate(r1.z * r1.w);
    r1.xy = saturate((r0.xzzw >= 0.0 ? 0 : r0.xwzw));			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1.xy);
    r0.w = 1 - r5.z;
    r0.z = (r5.z <= 0.0 ? r0.w : 1);
    r0.w = r1.x - r6.w;
    r0.z = r0.z * 15;			// partial precision
    r3.w = 1.0 / r0.z;			// partial precision
    r3.xy = (const_1.yz * r0.xy) + const_1.wy;			// partial precision
    r0.w = -(1.0 / 256) - r0.w;
    r2.xyzw = (r3.w * const_3.xxyy) + r3.xyxy;			// partial precision
    r0.w = (r0.w >= 0.0 ? 1 : 0);			// partial precision
    r1.xyzw = max(r2.xyzw, 0);			// partial precision
    r6.z = 1 - r0.y;			// partial precision
    r1.xy = saturate(r1.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r1.xy);
    r1.xy = saturate(r1.zwzw);			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1.xy);
    r0.z = r2.x - r6.w;
    r0.z = -(1.0 / 256) - r0.z;
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r0.z;			// partial precision
    r0.z = r1.x - r6.w;
    r0.z = -(1.0 / 256) - r0.z;
    r2.xyzw = (r3.w * const_3.zxwy) + r3.xyxy;			// partial precision
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r1.xyzw = max(r2.xyzw, 0);			// partial precision
    r0.w = r0.w + r0.z;			// partial precision
    r1.xy = saturate(r1.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r1.xy);
    r1.xy = saturate(r1.zwzw);			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1.xy);
    r0.z = r2.x - r6.w;
    r0.z = -(1.0 / 256) - r0.z;
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r0.z;			// partial precision
    r0.z = r1.x - r6.w;
    r0.z = -(1.0 / 256) - r0.z;
    r2.xyzw = (r3.w * const_3.xzyw) + r3.xyxy;			// partial precision
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r1.xyzw = max(r2.xyzw, 0);			// partial precision
    r0.w = r0.w + r0.z;			// partial precision
    r1.xy = saturate(r1.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r1.xy);
    r1.xy = saturate(r1.zwzw);			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1.xy);
    r0.z = r2.x - r6.w;
    r0.z = -(1.0 / 256) - r0.z;
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r0.z;			// partial precision
    r0.z = r1.x - r6.w;
    r0.z = -(1.0 / 256) - r0.z;
    r2.xyzw = (r3.w * const_3.zzww) + r3.xyxy;			// partial precision
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r1.xyzw = max(r2.xyzw, 0);			// partial precision
    r0.w = r0.w + r0.z;			// partial precision
    r1.xy = saturate(r1.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r1.xy);
    r1.xy = saturate(r1.zwzw);			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1.xy);
    r0.z = r2.x - r6.w;
    r0.y = -(1.0 / 256) - r0.z;
    r0.z = r1.x - r6.w;
    r0.y = (r0.y >= 0.0 ? 1 : 0);			// partial precision
    r0.z = -(1.0 / 256) - r0.z;
    r0.w = r0.w + r0.y;			// partial precision
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.z = r0.w + r0.z;			// partial precision
    r0.w = r3.y;			// partial precision
    r3.y = r3.x;			// partial precision
    r1.xyzw = r3.w * const_3.xyzw;			// partial precision
    r2.y = saturate(r0.w);			// partial precision
    r2.x = saturate(r0.x + r1.w);			// partial precision
    r4.xyzw = tex2D(ShadowMap, r2.xy);
    r3.zw = r6.z + r1.xy;			// partial precision
    r2.xyzw = max(r3.xzxw, 0);			// partial precision
    r5.x = r4.x - r6.w;
    r2.xy = saturate(r2.xy);			// partial precision
    r4.xyzw = tex2D(ShadowMap, r2.xy);
    r2.xy = saturate(r2.zwzw);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r2.xy);
    r0.y = r4.x - r6.w;
    r0.y = -(1.0 / 256) - r0.y;
    r0.y = (r0.y >= 0.0 ? 1 : 0);			// partial precision
    r0.z = r0.z + r0.y;			// partial precision
    r0.y = r2.x - r6.w;
    r0.y = -(1.0 / 256) - r0.y;
    r3.xz = r6.z + r1.zy;			// partial precision
    r0.y = (r0.y >= 0.0 ? 1 : 0);			// partial precision
    r2.xyzw = max(r3.yxyz, 0);			// partial precision
    r0.z = r0.z + r0.y;			// partial precision
    r2.xy = saturate(r2.xy);			// partial precision
    r3.xyzw = tex2D(ShadowMap, r2.xy);
    r2.xy = saturate(r2.zwzw);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r2.xy);
    r0.y = r3.x - r6.w;
    r0.y = -(1.0 / 256) - r0.y;
    r0.y = (r0.y >= 0.0 ? 1 : 0);			// partial precision
    r2.w = r0.z + r0.y;			// partial precision
    r0.z = r2.x - r6.w;
    r1.w = -(1.0 / 256) - r0.z;
    r0.xyz = r0.x + r1.zyx;			// partial precision
    r2.z = (r1.w >= 0.0 ? 1 : 0);			// partial precision
    r1.xyzw = max(r0.zwyw, 0);			// partial precision
    r0.y = r2.w + r2.z;			// partial precision
    r1.xy = saturate(r1.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, r1.xy);
    r1.xy = saturate(r1.zwzw);			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1.xy);
    r0.z = r2.x - r6.w;
    r0.z = -(1.0 / 256) - r0.z;
    r1.w = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.z = r1.x - r6.w;
    r1.w = r0.y + r1.w;			// partial precision
    r0.z = -(1.0 / 256) - r0.z;
    r1.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.xy = saturate(r0.xwzw);			// partial precision
    r0.xyzw = tex2D(ShadowMap, r0.xy);
    r0.z = r0.x - r6.w;
    r0.w = r1.w + r1.z;			// partial precision
    r0.z = -(1.0 / 256) - r0.z;
    r0.y = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.z = -(1.0 / 256) - r5.x;
    r0.w = r0.w + r0.y;			// partial precision
    r0.z = (r0.z >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + r0.z;			// partial precision
    r0.w = saturate(r0.w * (1.0 / 15));			// partial precision
    r0.w = r0.w - 1;			// partial precision
    r0.w = (LightColor.a * r0.w) + r5.y;			// partial precision
    r1.w = 1 - r0.w;			// partial precision
    r0.z = r1.w * 0.6;			// partial precision
    r0.w = r5.z * r5.z;			// partial precision
    r0.xyz = (r0.z * -LightColor.rgb) + r5.y;			// partial precision
    r2.xyz = lerp(1, r0.xyz, r0.w);			// partial precision
    r1.xyz = 1 - r2.xyz;			// partial precision
    r0.w = (ToggleADTS.w <= 0.0 ? r5.y : r5.w);
    if_ne 0, r0.w
      r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
      r2.w = r0.w;			// partial precision
    else
      r2.w = 1;
    endif
    r0.w = min(r2.w, 1);			// partial precision
    OUT.color_0.rgb = (IN.input_3.w * r1.xyz) + r2.xyz;			// partial precision
    OUT.color_0.a = min(r0.w, r1.w);			// partial precision

// approximately 159 instruction slots used (18 texture, 141 arithmetic)
