//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2025.pso /Fcshaderdump19/PAR2025.pso.dis
//
//
// Parameters:
//
sampler2D AttenuationMap : register(s3);
sampler2D BaseMap : register(s1);
sampler2D NormalMap : register(s0);
float4 PSLightColor[4];
float4 Toggles : register(c7);
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSLightColor[0]   const_2        1
//   Toggles        const_7       1
//   NormalMap      texture_0       1
//   BaseMap        texture_1       1
//   AttenuationMap texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
    float3 texcoord_7 : TEXCOORD7_centroid;			// partial precision
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

    float1 att2;
    float1 att3;
    float1 q1;
    float1 q12;
    float3 q13;
    float4 r0;
    float4 r2;
    float2 uv8;

    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att3.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    uv8.xy = (uvtile(r0.w) * (IN.texcoord_7.xy / length(IN.texcoord_7.xyz))) + IN.BaseUV.xy;			// partial precision
    r2.xyzw = tex2D(NormalMap, uv8.xy);			// partial precision
    r0.w = saturate((1 - att2.x) - att3.x);			// partial precision
    q1.x = dot(normalize(expand(r2.xyz)), normalize(IN.texcoord_1.xyz));			// partial precision
    q12.x = r2.w * pow(abs(shades(normalize(expand(r2.xyz)), normalize(IN.texcoord_3.xyz))), Toggles.z);			// partial precision
    q13.xyz = ((0.2 >= q1.x ? (q12.x * max(q1.x + 0.5, 0)) : q12.x) * PSLightColor[0].rgb) * r0.w;			// partial precision
    OUT.color_0.a = weight(q13.xyz);			// partial precision
    OUT.color_0.rgb = saturate(q13.xyz);			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (4 texture, 36 arithmetic)
