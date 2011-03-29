//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER008.pso /Fcshaderdump19/WATER008.pso.dis
//
//
// Parameters:
//
//   float2 BlendRadius;
//   float4 DeepColor;
//   sampler2D DepthMap;
//   sampler2D DetailMap;
//   sampler2D DisplacementMap;
//   float4 EyePos;
//   float4 FogColor;
//   float4 FogParam;
//   float FresnelRI;
//   sampler2D NormalMap;
//   float4 ReflectionColor;
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
//   BlendRadius     const_12      1
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
//   DepthMap        texture_3       1
//   DisplacementMap texture_4       1
//

    const float4 const_4 = {-0.5, 0.1, 0.25, -0.2};
    const float4 const_13 = {-0.55, (1.0 / 0.35), 1, 0};
    const float4 const_14 = {2, -1, 0, -(1.0 / 8192)};
    float3 texcoord_1 : TEXCOORD1_centroid;
    float4 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
    sampler2D NormalMap;
    sampler2D DetailMap;
    sampler2D DepthMap;
    sampler2D DisplacementMap;
    r0.xyzw = tex2D(DisplacementMap, IN.texcoord_6);
    r1.xy = IN.texcoord_6 + -0.5;
    r0.w = dot(r1.xy, r1.xy) + 0;
    r0.w = 1.0 / sqrt(r0.w);
    r2.w = 1.0 / r0.w;
    r0.w = r2.w + r2.w;
    r1.w = 1.0 / BlendRadius.x;
    r0.w = r0.w * r1.w;
    r4.w = saturate(max(0.1, r0.w));
    r1.xy = EyePos.xy - IN.texcoord_1;
    r0.w = dot(r1.xy, r1.xy) + 0;
    r0.w = 1.0 / sqrt(r0.w);
    r0.w = 1.0 / r0.w;
    r1.xyz = (2 * r0) + -1;
    r1.w = saturate((r0.w * -(1.0 / 8192)) - -1);
    r3.w = r1.w * r1.w;
    r4.x = IN.texcoord_7.z + Scroll.x;
    r4.y = IN.texcoord_7.w + Scroll.y;
    r0.xyzw = tex2D(NormalMap, r4);
    r0.xyz = (2 * r0) + -1;
    r0.w = -(r4.w + -1);
    r0.xy = r3.w * r0.xy;
    r0.w = r0.w * BlendRadius.y;
    r2.xyz = lerp(r1, r0, r0.w);
    r1.xyz = EyePos.xyz - IN.texcoord_1;
    r3.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r0.xyz = normalize(r2);
    r3.w = 1.0 / sqrt(r3.x);
    r1.xyz = r1.xyz * r3.w;
    r2.x = dot(-r1.xyz, r0.xyz);
    r0.w = r2.x + r2.x;
    r3.xy = const_14.xy;
    r2.w = (r3.x * -r2.w) + BlendRadius.x;
    r2.xyz = (-r0.w * r0.xyz) - r1.xyz;
    r6.w = r1.w * VarAmounts.w;
    r3.x = saturate(dot(r2.xyz, SunDir.xyz));
    r2.x = saturate(dot(r1.xyz, r0.xyz));
    r1.w = pow(abs(r3.x), VarAmounts.x);
    r4.xy = (0.1 * r0.xy) + r4.xy;
    r0.w = -(r2.x + -1);
    r0.xyz = r1.w * SunColor.rgb;
    r1.w = r0.w * r0.w;
    r1.w = r1.w * r1.w;
    r1.xyz = DeepColor.rgb;
    r1.xyz = ShallowColor.rgb - r1.xyz;
    r1.w = r0.w * r1.w;
    r2.xyz = (r2.x * r1.xyz) + DeepColor.rgb;			// partial precision
    r1.xyz = ReflectionColor.rgb - r2.xyz;
    r4.w = -(r3.y + VarAmounts.y);
    r0.w = -(r3.y + FresnelRI.x);
    r1.xyz = (r4.w * r1.xyz) + r2.xyz;			// partial precision
    r0.w = (r0.w * r1.w) + FresnelRI.x;
    r1.xyz = r1.xyz * VarAmounts.y;
    r1.xyz = (r0.w * r1.xyz) + r2.xyz;
    r1.w = saturate(SunDir.w);
    r4.w = 1.0 / r3.w;
    r3.xyz = saturate((r1.w * r0) + r1);
    r3.w = max(VarAmounts.z, r0.w);
    r0.x = IN.texcoord_6.z;
    r0.y = IN.texcoord_6.w;
    r1.xyzw = tex2D(DetailMap, r4);
    r0.xyzw = tex2D(DepthMap, r0);
    r0.w = FogParam.x - r4.w;
    r1.w = 1.0 / FogParam.y;
    r0.w = saturate(r0.w * r1.w);
    r1.w = -(r0.w + -1);
    r4.w = 0.25 - r3.w;
    r0.w = -(r0.x + -1);
    r4.w = (r0.w * r4.w) + r3.w;
    r0.w = r0.x + -1;
    r4.w = (r0.w >= 0.0 ? r4.w : r3.w);
    r0.w = r0.x + -0.2;
    r3.w = (r0.w * -(1.0 / 0.35)) + 1;
    r5.w = r3.w * r3.w;
    r3.w = (r3.w * -r5.w) - -1;
    r5.w = r4.w * r3.w;
    r3.w = r0.x + -0.55;
    r2.xyz = lerp(r1, r3, r6.w);
    r3.w = (r3.w >= 0.0 ? r5.w : r4.w);
    r1.xyz = FogColor.rgb - r2.xyz;
    r0.w = (r0.w >= 0.0 ? 0 : r3.w);
    r1.xyz = (r1.w * r1.xyz) + r2.xyz;
    r1.w = (r2.w >= 0.0 ? 0 : r0.w);
    r0.xyzw = (r0.x <= 0.0 ? r1 : 0);
    OUT.color_0.rgba = r0.xyzw;

// approximately 91 instruction slots used (4 texture, 87 arithmetic)
