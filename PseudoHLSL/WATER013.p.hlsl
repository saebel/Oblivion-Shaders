//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER013.pso /Fcshaderdump19/WATER013.pso.dis
//
//
// Parameters:
//
float4 DeepColor : register(c6);
float4 EyePos : register(c1);
float4 FogColor : register(c10);
float4 FogParam : register(c9);
float FresnelRI : register(c11);
float4 ReflectionColor : register(c7);
float4 ShallowColor : register(c5);
float4 SunColor : register(c3);
float4 SunDir : register(c2);
float4 VarAmounts : register(c8);
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


// Structures:

struct VS_OUTPUT {
    float3 texcoord_1 : TEXCOORD1_centroid;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const int4 const_0 = {1, 1, -1, 0};

    float3 eye0;
    float3 q15;
    float1 q2;
    float1 q4;
    float3 q5;
    float1 q6;
    float3 q8;
    float3 r0;
    float3 r2;
    float4 r3;

    r3.w = saturate(SunDir.w);
    eye0.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    r0.xyz = normalize(eye0.xyz);
    r2.xyz = r0.xyz * -const_0.xyz;
    q2.x = 1 - saturate(r0.z);
    q6.x = 1 - saturate((FogParam.x - length(eye0.xyz)) / FogParam.y);
    q15.xyz = (saturate(r0.z) * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb;
    q4.x = ((1 - FresnelRI.x) * (q2.x * sqr(sqr(q2.x)))) + FresnelRI.x;
    q5.xyz = (q4.x * ((((1 - VarAmounts.y) * (ReflectionColor.rgb - q15.xyz)) + q15.xyz) * VarAmounts.y)) + q15.xyz;
    q8.xyz = saturate((r3.w * (pow(abs(shades(r2.xyz, SunDir.xyz)), VarAmounts.x) * SunColor.rgb)) + q5.xyz);
    OUT.color_0.a = max(VarAmounts.z, q4.x);
    OUT.color_0.rgb = (q6.x * (FogColor.rgb - q8.xyz)) + q8.xyz;

    return OUT;
};

// approximately 37 instruction slots used