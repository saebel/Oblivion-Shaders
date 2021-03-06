//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER002.pso /Fcshaderdump19/WATER002.pso.dis
//
//
// Parameters:
//
float4 DeepColor : register(c6);
sampler2D DepthMap : register(s3);
sampler2D DetailMap : register(s2);
float4 EyePos : register(c1);
float4 FogColor : register(c10);
float4 FogParam : register(c9);
float FresnelRI : register(c11);
sampler2D NormalMap : register(s1);
float4 ReflectionColor : register(c7);
float2 Scroll : register(c0);
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
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
//   DepthMap        texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float3 texcoord_1 : TEXCOORD1_centroid;
    float4 texcoord_6 : TEXCOORD6;
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

    float1 depth12;
    float3 eye0;
    float1 eye19;
    float3 noxel3;
    float2 q1;
    float3 q11;
    float1 q13;
    float1 q15;
    float1 q22;
    float1 q26;
    float3 q27;
    float1 q31;
    float1 q43;
    float3 q7;
    float1 q9;
    float4 r0;
    float4 r1;
    float3 r2;
    float3 t10;

    depth12.x = tex2D(DepthMap, IN.texcoord_6.zw);
    eye19.x = saturate(1 - (length(EyePos.xy - IN.texcoord_1.xy) / 8192));
    q1.xy = IN.texcoord_6.xy + Scroll.xy;
    noxel3.xyz = tex2D(NormalMap, q1.xy);
    r2.xyz = expand(noxel3.xyz);	// [0,1] to [-1,+1]
    r2.xy = sqr(eye19.x) * r2.xy;
    r0.xyz = normalize(r2.xyz);
    t10.xyz = tex2D(DetailMap, (0.1 * r0.xy) + q1.xy);
    eye0.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    q22.x = shades(normalize(eye0.xyz), r0.xyz);
    q43.x = pow(abs(shades(reflect(-normalize(eye0.xyz), r0.xyz), SunDir.xyz)), VarAmounts.x);
    q9.x = 1 - saturate((FogParam.x - length(eye0.xyz)) / FogParam.y);
    q15.x = 1 - ((depth12.x - 0.2) / 0.35);
    q7.xyz = (q22.x * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb;			// partial precision
    q26.x = ((FresnelRI.x + 1) * ((1 - q22.x) * sqr(sqr(1 - q22.x)))) + FresnelRI.x;
    q31.x = max(VarAmounts.z, q26.x);
    q27.xyz = (q26.x * ((((VarAmounts.y + 1) * (ReflectionColor.rgb - q7.xyz)) + q7.xyz) * VarAmounts.y)) + q7.xyz;
    q11.xyz = lerp(saturate((saturate(SunDir.w) * (q43.x * SunColor.rgb)) + q27.xyz), t10.xyz, eye19.x * VarAmounts.w);
    r1.xyz = (q9.x * (FogColor.rgb - q11.xyz)) + q11.xyz;
    q13.x = (depth12.x >= 1 ? q31.x : (((1 - depth12.x) * (0.25 - q31.x)) + q31.x));
    r1.w = (depth12.x >= 0.2 ? (depth12.x >= 0.55 ? q13.x : (q13.x * (1 - (q15.x * sqr(q15.x))))) : 0);
    r0.xyzw = (depth12.x <= 0.0 ? 0 : r1.xyzw);
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = r0.xyz;

    return OUT;
};

// approximately 74 instruction slots used (3 texture, 71 arithmetic)
