//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER014.pso /Fcshaderdump19/WATER014.pso.dis
//
//
// Parameters:
//
float4 DeepColor;
sampler2D DetailMap;
float4 EyePos;
float4 FogColor;
float4 FogParam;
float FresnelRI;
sampler2D NormalMap;
float2 Scroll;
float4 ShallowColor;
float4 VarAmounts;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Scroll       const_0       1
//   EyePos       const_1       1
//   ShallowColor const_5       1
//   DeepColor    const_6       1
//   VarAmounts   const_8       1
//   FogParam     const_9       1
//   FogColor     const_10      1
//   FresnelRI    const_11      1
//   NormalMap    texture_1       1
//   DetailMap    texture_2       1
//


// Structures:

struct VS_OUTPUT {
    float3 texcoord_1 : TEXCOORD1_centroid;
    float2 texcoord_6 : TEXCOORD6;
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

    float1 eye16;
    float3 eye4;
    float3 noxel2;
    float2 q0;
    float1 q10;
    float1 q12;
    float1 q7;
    float3 q9;
    float3 r0;
    float3 r2;
    float3 r4;
    float3 t8;

    eye16.x = saturate(1 - (length(EyePos.xy - IN.texcoord_1.xy) / 8192));
    q0.xy = IN.texcoord_6.xy + Scroll.xy;
    noxel2.xyz = tex2D(NormalMap, q0.xy);
    r0.xyz = expand(noxel2.xyz);	// [0,1] to [-1,+1]
    r0.xy = sqr(eye16.x) * r0.xy;
    r2.xyz = normalize(r0.xyz);
    t8.xyz = tex2D(DetailMap, (0.1 * r2.xy) + q0.xy);
    eye4.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    q10.x = 1 - shades(normalize(eye4.xyz), r2.xyz);
    q12.x = max(VarAmounts.z, ((FresnelRI.x + 1) * (q10.x * sqr(sqr(q10.x)))) + FresnelRI.x);
    q7.x = 1 - saturate((FogParam.x - length(eye4.xyz)) / FogParam.y);
    r4.xyz = (saturate(2 * r2.y) * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb;			// partial precision
    q9.xyz = lerp(t8.xyz, r4.xyz, eye16.x * VarAmounts.w);
    r0.xyz = (q7.x * (FogColor.rgb - q9.xyz)) + q9.xyz;
    r0.x = ((eye16.x * r0.x) * 0.2) + r0.x;
    OUT.color_0.a = q12.x;
    OUT.color_0.rgb = r0.xyz;

    return OUT;
};

// approximately 45 instruction slots used (2 texture, 43 arithmetic)
