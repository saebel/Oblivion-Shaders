//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER004.pso /Fcshaderdump19/WATER004.pso.dis
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
float4 ReflectionColor;
samplerCUBE ReflectionMap;
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
//   ReflectionMap   texture_0       1
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
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
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float1 eye18;
    float3 eye3;
    float3 noxel2;
    float2 q0;
    float1 q11;
    float1 q12;
    float3 q14;
    float3 q30;
    float1 q7;
    float1 q9;
    float4 r1;
    float3 r2;
    float3 t29;

    eye18.x = saturate(1 - (length(EyePos.xy - IN.texcoord_1.xy) / 8192));
    q0.xy = IN.texcoord_6.xy + Scroll.xy;
    noxel2.xyz = tex2D(NormalMap, q0.xy);
    r2.xyz = expand(noxel2.xyz);
    r2.xy = sqr(eye18.x) * r2.xy;
    r1.xyz = normalize(r2.xyz);
    t29.xyz = tex2D(DetailMap, (0.1 * r1.xy) + q0.xy);
    eye3.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    q7.x = dot(normalize(eye3.xyz), r1.xyz);
    r1.xyzw = texCUBE(ReflectionMap, normalize(eye3.xyz) - ((2 * q7.x) * r1.xyz));
    q9.x = 1 - saturate(q7.x);
    q12.x = 1 - saturate((FogParam.x - length(eye3.xyz)) / FogParam.y);
    r1.xyz = ((r1.xyz * (ReflectionColor.rgb + 1)) * ReflectionColor.rgb) * VarAmounts.y;
    q11.x = ((FresnelRI.x + 1) * (q9.x * sqr(sqr(q9.x)))) + FresnelRI.x;
    q14.xyz = saturate((q11.x * r1.xyz) + ((saturate(q7.x) * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb));
    q30.xyz = lerp(t29.xyz, q14.xyz, eye18.x * VarAmounts.w);
    OUT.color_0.a = max(VarAmounts.z, q11.x);
    OUT.color_0.rgb = (q12.x * (FogColor.rgb - q30.xyz)) + q30.xyz;

    return OUT;
};

// approximately 51 instruction slots used (3 texture, 48 arithmetic)