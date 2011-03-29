//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER012.pso /Fcshaderdump19/WATER012.pso.dis
//
//
// Parameters:
//
//   float4 DeepColor;
//   float4 EyePos;
//   float4 FogColor;
//   float4 FogParam;
//   float FresnelRI;
//   float4 ReflectionColor;
//   sampler2D ReflectionMap;
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
//

    const int4 const_0 = {1, 1, -1, 0};
    float3 texcoord_0 : TEXCOORD0_centroid;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4_centroid;
    float4 texcoord_5 : TEXCOORD5_centroid;
    sampler2D ReflectionMap;
    r1.xyz = IN.texcoord_0;
    r1.w = 1;
    r0.x = dot(IN.texcoord_2.xyzw, r1.xyzw);
    r0.y = dot(IN.texcoord_3.xyzw, r1.xyzw);
    r0.z = dot(IN.texcoord_4.xyzw, r1.xyzw);
    r0.w = dot(IN.texcoord_5.xyzw, r1.xyzw);
    r0.xyzw = tex2Dproj(ReflectionMap, r0);			// partial precision
    r1.xyz = EyePos.xyz - IN.texcoord_1;
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r2.x);
    r1.xyz = r1.xyz * r0.w;
    r4.w = 1.0 / r0.w;
    r0.w = saturate(r1.z);
    r1.w = 1 - r0.w;
    r2.w = r1.w * r1.w;
    r0.xyz = r0.xyz - ReflectionColor.rgb;
    r2.w = r2.w * r2.w;
    r2.xyz = ReflectionColor.rgb;
    r0.xyz = (VarAmounts.y * r0.xyz) + r2.xyz;			// partial precision
    r2.w = r1.w * r2.w;
    r1.xyz = r1.xyz * -const_0.xyz;
    r1.w = 1;
    r1.w = r1.w - FresnelRI.x;
    r2.w = (r1.w * r2.w) + FresnelRI.x;
    r2.x = saturate(dot(r1.xyz, SunDir.xyz));
    r1.xyz = DeepColor.rgb;
    r1.xyz = ShallowColor.rgb - r1.xyz;
    r1.w = pow(abs(r2.x), VarAmounts.x);
    r2.xyz = (r0.w * r1.xyz) + DeepColor.rgb;			// partial precision
    r3.w = saturate(SunDir.w);
    r1.xyz = lerp(r0, r2, r2.w);
    r0.w = FogParam.x - r4.w;
    r0.xyz = r1.w * SunColor.rgb;
    r1.w = 1.0 / FogParam.y;
    r1.xyz = (r3.w * r0.xyz) + r1.xyz;
    r0.w = saturate(r0.w * r1.w);
    r0.xyz = FogColor.rgb - r1.xyz;
    r1.w = 1 - r0.w;
    r0.w = max(VarAmounts.z, r2.w);
    r0.xyz = (r1.w * r0.xyz) + r1.xyz;
    OUT.color_0.rgba = r0.xyzw;

// approximately 44 instruction slots used (1 texture, 43 arithmetic)
