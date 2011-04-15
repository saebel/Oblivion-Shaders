//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2024.pso /Fcshaderdump19/PAR2024.pso.dis
//
//
// Parameters:
//
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
sampler2D ShadowMaskMap;
float4 Toggles;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   PSLightColor[0]  const_2        1
//   Toggles       const_7       1
//   NormalMap     texture_0       1
//   BaseMap       texture_1       1
//   ShadowMap     texture_4       1
//   ShadowMaskMap texture_5       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_7 : TEXCOORD7_centroid;			// partial precision
    float4 texcoord_6 : TEXCOORD6;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	uvtile(w)		(((w) * 0.04) - 0.02)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float1 q10;
    float1 q2;
    float3 q5;
    float4 r0;
    float4 r2;
    float3 t3;
    float1 t4;
    float2 uv0;

    t4.x = tex2D(ShadowMaskMap, IN.texcoord_6.zw);			// partial precision
    t3.xyz = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    uv0.xy = (uvtile(r0.w) * (IN.texcoord_7.xy / length(IN.texcoord_7.xyz))) + IN.BaseUV.xy;			// partial precision
    r2.xyzw = tex2D(NormalMap, uv0.xy);			// partial precision
    q10.x = r2.w * pow(abs(shades(normalize(expand(r2.xyz)), normalize(IN.texcoord_3.xyz))), Toggles.z);			// partial precision
    q2.x = dot(normalize(expand(r2.xyz)), normalize(IN.texcoord_1.xyz));			// partial precision
    q5.xyz = ((0.2 >= q2.x ? (q10.x * max(q2.x + 0.5, 0)) : q10.x) * PSLightColor[0].rgb) * ((t4.x * (t3.xyz - 1)) + 1);			// partial precision
    OUT.color_0.a = weight(q5.xyz);			// partial precision
    OUT.color_0.rgb = saturate(q5.xyz);			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (4 texture, 36 arithmetic)
