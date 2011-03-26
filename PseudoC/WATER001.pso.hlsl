//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATER001.pso /Fcshaderdump19/WATER001.pso.dis
//
//
// Parameters:
//
//   float4 DeepColor;
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
//

    const float4 const_4 = {0.1, 0.0002, 2496, 4};
    const float4 const_12 = {2, -1, 0, -(1.0 / 8192)};
    float3 texcoord_0 : TEXCOORD0_centroid;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4_centroid;
    float4 texcoord_5 : TEXCOORD5_centroid;
    float2 texcoord_6 : TEXCOORD6;
    sampler2D ReflectionMap;
    sampler2D NormalMap;
    sampler2D DetailMap;
    r0.xy = EyePos - IN.texcoord_1;
    r0.w = dot(r0.xy, r0.xy) + 0;
    r0.w = 1.0 / sqrt(r0.w);
    r1.w = 1.0 / r0.w;
    r2.w = saturate((r1.w * -(1.0 / 8192)) - -1);
    r3.w = r2.w * r2.w;
    r2.xy = IN.texcoord_6 + Scroll;
    r0 = tex2D(NormalMap, r2);
    r0.xyz = (2 * r0) + -1;
    r0.xy = r3.w * r0;
    r0.w = saturate(r1.w * 0.0002);
    r0.w = (r0.w * 2496) + 4;
    r3.xyz = normalize(r0);
    r1.xy = (r0.w * r3) + IN.texcoord_0;
    r1.z = IN.texcoord_0.z;
    r1.w = --1;
    r0.x = dot(IN.texcoord_2, r1);
    r0.y = dot(IN.texcoord_3, r1);
    r0.z = dot(IN.texcoord_4, r1);
    r0.w = dot(IN.texcoord_5, r1);
    r2.w = r2.w * VarAmounts.w;
    r2.xy = (0.1 * r3) + r2;
    r1 = tex2Dproj(ReflectionMap, r0);			// partial precision
    r0 = tex2D(DetailMap, r2);
    r2.xyz = EyePos - IN.texcoord_1;
    r4.x = dot(r2, r2);	// normalize + length
    r0.w = 1.0 / sqrt(r4.x);
    r4.xyz = r2 * r0.w;
    r0.w = 1.0 / r0.w;
    r6.x = saturate(dot(r4, r3));
    r1.w = -(r6.x + -1);
    r1.xyz = r1 - ReflectionColor;
    r3.w = r1.w * r1.w;
    r2.z = VarAmounts.y;
    r1.xyz = (r2.z * r1) + ReflectionColor;			// partial precision
    r3.w = r3.w * r3.w;
    r3.w = r1.w * r3.w;
    r5.x = dot(-r4, r3);
    r2.xyz = DeepColor;
    r2.xyz = ShallowColor - r2;
    r4.w = r5.x + r5.x;
    r5.z = -1;
    r1.w = -(r5.z + FresnelRI.x);
    r3.xyz = (-r4.w * r3) - r4;
    r3.w = (r1.w * r3.w) + FresnelRI.x;
    r5.x = saturate(dot(r3, SunDir));
    r3.xyz = (r6.x * r2) + DeepColor;			// partial precision
    r4.w = pow(abs(r5.x), VarAmounts.x);
    r2.xyz = lerp(r1, r3, r3.w);
    r1.w = saturate(SunDir.w);
    r1.xyz = r4.w * SunColor;
    r0.w = FogParam.x - r0.w;
    r2.xyz = (r1.w * r1) + r2;
    r1.w = 1.0 / FogParam.y;
    r1.xyz = lerp(r0, r2, r2.w);
    r0.w = saturate(r0.w * r1.w);
    r0.xyz = FogColor - r1;
    r1.w = -(r0.w + -1);
    r0.w = max(VarAmounts.z, r3.w);
    r0.xyz = (r1.w * r0) + r1;
    OUT.color_0 = r0;

// approximately 67 instruction slots used (3 texture, 64 arithmetic)
