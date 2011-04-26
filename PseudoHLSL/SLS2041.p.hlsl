//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2041.pso /Fcshaderdump19/SLS2041.pso.dis
//
//
// Parameters:
//
sampler2D AttenuationMap : register(s3);
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
//   AttenuationMap texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
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

    float1 att1;
    float1 att2;
    float1 q11;
    float3 q3;
    float1 q6;
    float4 r0;
    float4 r2;

    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att1.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    q11.x = r0.w * pow(abs(shades(normalize(expand(r0.xyz)), normalize(IN.texcoord_3.xyz))), Toggles.z);			// partial precision
    q6.x = dot(normalize(expand(r0.xyz)), normalize(IN.texcoord_1.xyz));			// partial precision
    r2.w = (0.2 >= q6.x ? (q11.x * max(q6.x + 0.5, 0)) : q11.x);			// partial precision
    q3.xyz = (r2.w * PSLightColor[0].rgb) * saturate((1 - att1.x) - att2.x);			// partial precision
    OUT.color_0.a = weight(q3.xyz);			// partial precision
    OUT.color_0.rgb = saturate(q3.xyz);			// partial precision

    return OUT;
};

// approximately 34 instruction slots used (3 texture, 31 arithmetic)
