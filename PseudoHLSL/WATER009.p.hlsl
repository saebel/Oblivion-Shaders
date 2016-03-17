//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER009.pso /Fcshaderdump19/WATER009.pso.dis
//
//
// Parameters:
//
float2 BlendRadius : register(c12);
float4 DeepColor : register(c6);
sampler2D DetailMap : register(s2);
sampler2D DisplacementMap : register(s4);
float4 EyePos : register(c1);
float4 FogColor : register(c10);
float4 FogParam : register(c9);
float FresnelRI : register(c11);
sampler2D NormalMap : register(s1);
float4 ReflectionColor : register(c7);
samplerCUBE ReflectionMap : register(s0);
float2 Scroll : register(c0);
float4 ShallowColor : register(c5);
float4 VarAmounts : register(c8);
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
//   ReflectionMap   texture_0       1
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
//   DisplacementMap texture_4       1
//


// Structures:

struct VS_OUTPUT {
    float3 texcoord_1 : TEXCOORD1_centroid;
    float2 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_3 = {2, -1, 0, -(1.0 / 8192)};

    float1 eye21;
    float3 eye6;
    float3 noxel3;
    float1 q11;
    float1 q13;
    float3 q15;
    float1 q16;
    float2 q18;
    float3 q34;
    float1 q5;
    float1 q9;
    float4 r0;
    float4 r1;
    float2 r3;
    float3 t33;

    r0.xyzw = tex2D(DisplacementMap, IN.texcoord_6.xy);
    eye21.x = saturate(1 - (length(EyePos.xy - IN.texcoord_1.xy) / 8192));
    r1.xyz = expand(r0.xyz);
    r3.xy = const_3.xy;
    q18.xy = IN.texcoord_7.zw + Scroll.xy;
    noxel3.xyz = tex2D(NormalMap, q18.xy);
    r0.xyz = expand(noxel3.xyz);
    r0.xy = sqr(eye21.x) * r0.xy;
    eye6.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    q5.x = 1 - saturate(max(0.1, (2 * length(IN.texcoord_6.xy - 0.5)) / BlendRadius.x));
    r1.xyz = normalize(lerp(r0.xyz, r1.xyz, q5.x * BlendRadius.y));
    t33.xyz = tex2D(DetailMap, (0.1 * r1.xy) + q18.xy);
    q9.x = dot(normalize(eye6.xyz), r1.xyz);
    r1.xyzw = texCUBE(ReflectionMap, normalize(eye6.xyz) - ((2 * q9.x) * r1.xyz));
    q11.x = 1 - saturate(q9.x);
    q16.x = 1 - saturate((FogParam.x - length(eye6.xyz)) / FogParam.y);
    r1.xyz = ((r1.xyz * (ReflectionColor.rgb - r3.y)) * ReflectionColor.rgb) * VarAmounts.y;
    q13.x = ((FresnelRI.x - r3.y) * (q11.x * sqr(sqr(q11.x)))) + FresnelRI.x;
    q15.xyz = saturate((q13.x * r1.xyz) + ((saturate(q9.x) * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb));
    q34.xyz = lerp(q15.xyz, t33.xyz, eye21.x * VarAmounts.w);
    OUT.color_0.a = ((BlendRadius.x - (r3.x * length(IN.texcoord_6.xy - 0.5))) >= 0.0 ? max(VarAmounts.z, q13.x) : 0);
    OUT.color_0.rgb = (q16.x * (FogColor.rgb - q34.xyz)) + q34.xyz;

    return OUT;
};

// approximately 68 instruction slots used (4 texture, 64 arithmetic)