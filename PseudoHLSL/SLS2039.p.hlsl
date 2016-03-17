//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2039.pso /Fcshaderdump19/SLS2039.pso.dis
//
//
// Parameters:
//
sampler2D NormalMap : register(s0);
float4 PSLightColor[4] : register(c2);
sampler2D ShadowMap : register(s4);
sampler2D ShadowMaskMap : register(s5);
float4 Toggles : register(c7);
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   PSLightColor[0]  const_2        1
//   Toggles       const_7       1
//   NormalMap     texture_0       1
//   ShadowMap     texture_4       1
//   ShadowMaskMap texture_5       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
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

    float1 q11;
    float1 q4;
    float3 q7;
    float4 r0;
    float3 t1;
    float1 t2;

    t2.x = tex2D(ShadowMaskMap, IN.texcoord_6.zw);
    t1.xyz = tex2D(ShadowMap, IN.texcoord_6.xy);
    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    q11.x = r0.w * pow(abs(shades(normalize(expand(r0.xyz)), normalize(IN.texcoord_3.xyz))), Toggles.z);
    q4.x = dot(normalize(expand(r0.xyz)), normalize(IN.texcoord_1.xyz));
    q7.xyz = ((0.2 >= q4.x ? (q11.x * max(q4.x + 0.5, 0)) : q11.x) * PSLightColor[0].rgb) * ((t2.x * (t1.xyz - 1)) + 1);
    OUT.color_0.a = weight(q7.xyz);
    OUT.color_0.rgb = saturate(q7.xyz);

    return OUT;
};

// approximately 34 instruction slots used (3 texture, 31 arithmetic)