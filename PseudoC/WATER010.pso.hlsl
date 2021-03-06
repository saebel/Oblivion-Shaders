//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER010.pso /Fcshaderdump19/WATER010.pso.dis
//
//
// Parameters:
//
//   float2 BlendRadius;
//   float4 DeepColor;
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
//   float4 VarAmounts;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   Scroll          const_0       1
//   EyePos          const_1       1
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
//   DisplacementMap texture_4       1
//

    const float4 const_2 = {-0.5, 0.1, 0, 0};
    const float4 const_3 = {2, -1, 0, -(1.0 / 8192)};
    float3 texcoord_1 : TEXCOORD1_centroid;
    float2 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
    sampler2D NormalMap;
    sampler2D DetailMap;
    sampler2D DisplacementMap;
    r0.xyzw = tex2D(DisplacementMap, IN.texcoord_6.xy);
    r1.xy = IN.texcoord_6.xy - 0.5;
    r0.w = dot(r1.xy, r1.xy);
    r0.w = 1.0 / sqrt(r0.w);
    r1.w = 1.0 / r0.w;
    r0.w = 2 * r1.w;
    r2.w = 1.0 / BlendRadius.x;
    r0.w = r0.w * r2.w;
    r4.w = saturate(max(0.1, r0.w));
    r1.xy = EyePos.xy - IN.texcoord_1.xy;
    r0.w = dot(r1.xy, r1.xy);
    r0.w = 1.0 / sqrt(r0.w);
    r0.w = 1.0 / r0.w;
    r1.xyz = (2 * r0.xyz) - 1;
    r2.w = saturate((r0.w * -(1.0 / 8192)) - -1);
    r3.w = r2.w * r2.w;
    r4.x = IN.texcoord_7.z + Scroll.x;
    r4.y = IN.texcoord_7.w + Scroll.y;
    r0.xyzw = tex2D(NormalMap, r4.xy);
    r2.xyz = (2 * r0.xyz) - 1;
    r0.w = -(r4.w - 1);
    r2.xy = r3.w * r2.xy;
    r3.w = r0.w * BlendRadius.y;
    r0.xyz = lerp(r2.xyz, r1.xyz, r3.w);
    r3.xy = const_3.xy;
    r1.w = (r3.x * -r1.w) + BlendRadius.x;
    r2.xyz = normalize(r0.xyz);
    r4.w = r2.w * VarAmounts.w;
    r0.xy = (0.1 * r2.xy) + r4.xy;
    r0.xyzw = tex2D(DetailMap, r0.xy);
    r1.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    r3.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r3.x);
    r1.xyz = r1.xyz * r0.w;
    r2.w = 1.0 / r0.w;
    r2.x = saturate(dot(r1.xyz, r2.xyz));
    r0.w = -(r2.x - 1);
    r3.w = r0.w * r0.w;
    r3.w = r3.w * r3.w;
    r3.w = r0.w * r3.w;
    r0.w = -(r3.y + FresnelRI.x);
    r1.xyz = DeepColor.rgb;
    r1.xyz = ShallowColor.rgb - r1.xyz;
    r3.w = (r0.w * r3.w) + FresnelRI.x;
    r2.xyz = (r2.x * r1.xyz) + DeepColor.rgb;			// partial precision
    r1.xyz = ReflectionColor.rgb - r2.xyz;
    r0.w = -(r3.y + VarAmounts.y);
    r1.xyz = (r0.w * r1.xyz) + r2.xyz;			// partial precision
    r0.w = max(VarAmounts.z, r3.w);
    r1.xyz = r1.xyz * VarAmounts.y;
    r2.w = FogParam.x - r2.w;
    r2.xyz = saturate((r3.w * r1.xyz) + r2.xyz);
    r3.w = 1.0 / FogParam.y;
    r1.xyz = lerp(r2.xyz, r0.xyz, r4.w);
    r2.w = saturate(r2.w * r3.w);
    r0.xyz = FogColor.rgb - r1.xyz;
    r2.w = -(r2.w - 1);
    r0.xyz = (r2.w * r0.xyz) + r1.xyz;
    r0.w = (r1.w >= 0.0 ? r0.w : 0);
    OUT.color_0.rgba = r0.xyzw;

// approximately 64 instruction slots used (3 texture, 61 arithmetic)
