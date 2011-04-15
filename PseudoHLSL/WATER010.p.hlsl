//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER010.pso /Fcshaderdump19/WATER010.pso.dis
//
//
// Parameters:
//
float2 BlendRadius;
float4 DeepColor;
sampler2D DetailMap;
sampler2D DisplacementMap;
float4 EyePos;
float4 FogColor;
float4 FogParam;
float FresnelRI;
sampler2D NormalMap;
float4 ReflectionColor;
float2 Scroll;
float4 ShallowColor;
float4 VarAmounts;
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
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_3 = {2, -1, 0, -(1.0 / 8192)};

    float1 eye21;
    float3 eye6;
    float3 noxel3;
    float3 q10;
    float1 q12;
    float3 q13;
    float1 q14;
    float3 q16;
    float2 q18;
    float1 q5;
    float1 q8;
    float4 r0;
    float3 r2;
    float2 r3;
    float3 t15;

    r0.xyzw = tex2D(DisplacementMap, IN.texcoord_6.xy);
    eye21.x = saturate(1 - (length(EyePos.xy - IN.texcoord_1.xy) / 8192));
    r3.xy = const_3.xy;
    q18.xy = IN.texcoord_7.zw + Scroll.xy;
    noxel3.xyz = tex2D(NormalMap, q18.xy);
    r2.xyz = expand(noxel3.xyz);	// [0,1] to [-1,+1]
    r2.xy = sqr(eye21.x) * r2.xy;
    eye6.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    q5.x = 1 - saturate(max(0.1, (2 * length(IN.texcoord_6.xy - 0.5)) / BlendRadius.x));
    r2.xyz = normalize(lerp(expand(r0.xyz), r2.xyz, q5.x * BlendRadius.y));
    t15.xyz = tex2D(DetailMap, (0.1 * r2.xy) + q18.xy);
    q8.x = shades(normalize(eye6.xyz), r2.xyz);
    q14.x = 1 - saturate((FogParam.x - length(eye6.xyz)) / FogParam.y);
    q10.xyz = (q8.x * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb;			// partial precision
    q12.x = ((FresnelRI.x - r3.y) * ((1 - q8.x) * sqr(sqr(1 - q8.x)))) + FresnelRI.x;
    q13.xyz = (((VarAmounts.y - r3.y) * (ReflectionColor.rgb - q10.xyz)) + q10.xyz) * VarAmounts.y;
    q16.xyz = lerp(t15.xyz, saturate((q12.x * q13.xyz) + q10.xyz), eye21.x * VarAmounts.w);
    OUT.color_0.a = ((BlendRadius.x - (r3.x * length(IN.texcoord_6.xy - 0.5))) >= 0.0 ? max(VarAmounts.z, q12.x) : 0);
    OUT.color_0.rgb = (q14.x * (FogColor.rgb - q16.xyz)) + q16.xyz;

    return OUT;
};

// approximately 64 instruction slots used (3 texture, 61 arithmetic)
