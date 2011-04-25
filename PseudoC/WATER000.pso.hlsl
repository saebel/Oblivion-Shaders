//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATER000.pso /Fcshaderdump19/WATER000.pso.dis
//
//
// Parameters:
//
//   float4 DeepColor;
//   sampler2D DepthMap;
//   sampler2D DetailMap;
//   float4 EyePos;
//   float4 FogColor;
//   float4 FogParam;
//   float FresnelRI;
//   sampler2D NormalMap;
//   float4 ReflectionColor;
//   sampler2D ReflectionMap;
//   float2 Scroll;
//   float4 ShallowColor;
//   float4 SunColor;
//   float4 SunDir;
//   float4 VarAmounts;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   Scroll          const_0       1
//   EyePos          const_1       1
//   SunDir          const_2       1
//   SunColor        const_3       1
//   ShallowColor    const_5       1
//   DeepColor       const_6       1
//   ReflectionColor const_7       1
//   VarAmounts      const_8       1
//   FogParam        const_9       1
//   FogColor        const_10      1
//   FresnelRI       const_11      1
//   ReflectionMap   texture_0       1
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
//   DepthMap        texture_3       1
//

    const float4 const_4 = {0.1, 0.0002, 2496, 4};
    const float4 const_12 = {(1.0 / 0.35), 1, 0, 0};
    const float4 const_13 = {0.25, -0.2, -0.55, 0};
    const float4 const_14 = {2, -1, 0, -(1.0 / 8192)};
    float3 texcoord_0 : TEXCOORD0_centroid;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4_centroid;
    float4 texcoord_5 : TEXCOORD5_centroid;
    float4 texcoord_6 : TEXCOORD6;
    sampler2D ReflectionMap;
    sampler2D NormalMap;
    sampler2D DetailMap;
    sampler2D DepthMap;
    r0.xy = EyePos.xy - IN.texcoord_1.xy;
    r0.w = dot(r0.xy, r0.xy);
    r0.w = 1.0 / sqrt(r0.w);
    r1.w = 1.0 / r0.w;
    r2.w = saturate((r1.w * -(1.0 / 8192)) - -1);
    r3.w = r2.w * r2.w;
    r2.xy = IN.texcoord_6.xy + Scroll.xy;
    r0.xyzw = tex2D(NormalMap, r2.xy);
    r0.xyz = (2 * r0.xyz) - 1;
    r0.xy = r3.w * r0.xy;
    r0.w = saturate(r1.w * 0.0002);
    r0.w = (r0.w * 2496) + 4;
    r3.xyz = normalize(r0.xyz);
    r1.xy = (r0.w * r3.xy) + IN.texcoord_0.xy;
    r1.z = IN.texcoord_0.z;
    r1.w = 1;
    r0.x = dot(IN.texcoord_2.xyzw, r1.xyzw);
    r0.y = dot(IN.texcoord_3.xyzw, r1.xyzw);
    r0.z = dot(IN.texcoord_4.xyzw, r1.xyzw);
    r0.w = dot(IN.texcoord_5.xyzw, r1.xyzw);
    r1.xy = (0.1 * r3.xy) + r2.xy;
    r5.w = r2.w * VarAmounts.w;
    r4.x = IN.texcoord_6.z;
    r4.y = IN.texcoord_6.w;
    r2.xyzw = tex2Dproj(ReflectionMap, r0.xyzw);			// partial precision
    r1.xyzw = tex2D(DetailMap, r1.xy);
    r0.xyzw = tex2D(DepthMap, r4.xy);
    r4.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    r5.x = dot(r4.xyz, r4.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r5.x);
    r4.xyz = r4.xyz * r0.w;
    r0.w = 1.0 / r0.w;
    r5.x = saturate(dot(r4.xyz, r3.xyz));
    r1.w = -(r5.x - 1);
    r2.w = r1.w * r1.w;
    r2.w = r2.w * r2.w;
    r3.w = r1.w * r2.w;
    r0.z = -1;
    r2.w = -(r0.z + FresnelRI.x);
    r6.x = dot(-r4.xyz, r3.xyz);
    r1.w = 2 * r6.x;
    r6.w = (r2.w * r3.w) + FresnelRI.x;
    r3.xyz = (-r1.w * r3.xyz) - r4.xyz;
    r1.w = max(VarAmounts.z, r6.w);
    r3.x = saturate(dot(r3.xyz, SunDir.xyz));
    r7.w = pow(abs(r3.x), VarAmounts.x);
    r4.w = saturate(SunDir.w);
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    r0.w = saturate(r0.w * r2.w);
    r2.w = -(r0.w - 1);
    r3.w = 0.25 - r1.w;
    r0.w = -(r0.x - 1);
    r3.w = (r0.w * r3.w) + r1.w;
    r2.xyz = r2.xyz - ReflectionColor.rgb;
    r0.w = r0.x - 1;
    r0.z = VarAmounts.y;
    r2.xyz = (r0.z * r2.xyz) + ReflectionColor.rgb;			// partial precision
    r3.w = (r0.w >= 0.0 ? r1.w : r3.w);
    r3.xyz = DeepColor.rgb;
    r3.xyz = ShallowColor.rgb - r3.xyz;
    r0.w = r0.x - 0.2;
    r4.xyz = (r5.x * r3.xyz) + DeepColor.rgb;			// partial precision
    r1.w = (r0.w * -(1.0 / 0.35)) + 1;
    r3.xyz = lerp(r4.xyz, r2.xyz, r6.w);
    r6.w = r1.w * r1.w;
    r2.xyz = r7.w * SunColor.rgb;
    r1.w = (r1.w * -r6.w) - -1;
    r3.xyz = (r4.w * r2.xyz) + r3.xyz;
    r4.w = r3.w * r1.w;
    r2.xyz = lerp(r3.xyz, r1.xyz, r5.w);
    r1.w = r0.x - 0.55;
    r1.xyz = FogColor.rgb - r2.xyz;
    r1.w = (r1.w >= 0.0 ? r3.w : r4.w);
    r1.xyz = (r2.w * r1.xyz) + r2.xyz;
    r1.w = (r0.w >= 0.0 ? r1.w : 0);
    r0.xyzw = (r0.x <= 0.0 ? 0 : r1.xyzw);
    OUT.color_0.rgba = r0.xyzw;

// approximately 84 instruction slots used (4 texture, 80 arithmetic)
