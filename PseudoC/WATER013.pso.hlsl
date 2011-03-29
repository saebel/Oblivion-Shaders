//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER013.pso /Fcshaderdump19/WATER013.pso.dis
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
//

    const int4 const_0 = {1, 1, -1, 0};
    float3 texcoord_1 : TEXCOORD1_centroid;
    r0.xyz = EyePos.xyz - IN.texcoord_1;
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r1.x);
    r0.xyz = r0.xyz * r0.w;
    r4.w = 1.0 / r0.w;
    r0.w = saturate(r0.z);
    r1.w = 1 - r0.w;
    r2.w = r1.w * r1.w;
    r2.xyz = r0.xyz * -const_0.xyz;
    r2.w = r2.w * r2.w;
    r3.w = r1.w * r2.w;
    r0.xyz = DeepColor.rgb;
    r0.xyz = ShallowColor.rgb - r0.xyz;
    r1.w = 1;
    r2.w = r1.w - FresnelRI.x;
    r1.xyz = (r0.w * r0.xyz) + DeepColor.rgb;			// partial precision
    r2.w = (r2.w * r3.w) + FresnelRI.x;
    r0.xyz = ReflectionColor.rgb - r1.xyz;
    r0.w = r1.w - VarAmounts.y;
    r2.x = saturate(dot(r2.xyz, SunDir.xyz));
    r0.xyz = (r0.w * r0.xyz) + r1.xyz;			// partial precision
    r1.w = pow(abs(r2.x), VarAmounts.x);
    r0.xyz = r0.xyz * VarAmounts.y;
    r3.w = saturate(SunDir.w);
    r1.xyz = (r2.w * r0.xyz) + r1.xyz;
    r0.w = FogParam.x - r4.w;
    r0.xyz = r1.w * SunColor.rgb;
    r1.w = 1.0 / FogParam.y;
    r1.xyz = saturate((r3.w * r0) + r1);
    r0.w = saturate(r0.w * r1.w);
    r0.xyz = FogColor.rgb - r1.xyz;
    r1.w = 1 - r0.w;
    r0.w = max(VarAmounts.z, r2.w);
    r0.xyz = (r1.w * r0.xyz) + r1.xyz;
    OUT.color_0.rgba = r0.xyzw;

// approximately 37 instruction slots used
