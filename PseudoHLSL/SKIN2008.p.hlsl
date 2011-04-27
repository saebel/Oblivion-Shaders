//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2008.pso /Fcshaderdump19/SKIN2008.pso.dis
//
//
// Parameters:
//
sampler2D AttenuationMap : register(s3);
sampler2D NormalMap : register(s0);
float4 PSLightColor[4] : register(c2);
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   NormalMap      texture_0       1
//   AttenuationMap texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float3 texcoord_7 : TEXCOORD7_centroid;
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

    float1 att11;
    float1 att6;
    float1 att7;
    float1 att8;
    float3 noxel2;
    float3 q12;
    float3 q13;
    float3 q3;
    float1 q4;
    float1 q5;
    float3 q9;

    noxel2.xyz = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    att8.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att6.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    att7.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att11.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    q3.xyz = normalize(expand(noxel2.xyz));			// partial precision
    q4.x = 1 - shade(q3.xyz, normalize(IN.texcoord_7.xyz));			// partial precision
    q5.x = q4.x * sqr(q4.x);			// partial precision
    q9.xyz = (shade(q3.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb) + ((q5.x * PSLightColor[1].rgb) * 0.5);			// partial precision
    q12.xyz = (shade(q3.xyz, normalize(IN.texcoord_1.xyz)) * PSLightColor[0].rgb) + ((q5.x * PSLightColor[0].rgb) * 0.5);			// partial precision
    q13.xyz = (saturate((1 - att11.x) - att7.x) * q12.xyz) + (saturate((1 - att6.x) - att8.x) * q9.xyz);			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = q13.xyz;			// partial precision

    return OUT;
};

// approximately 46 instruction slots used (5 texture, 41 arithmetic)
