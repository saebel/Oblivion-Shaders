//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2038.pso /Fcshaderdump19/SLS2038.pso.dis
//
//
// Parameters:
//
sampler2D NormalMap : register(s0);
float4 PSLightColor[4] : register(c2);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   NormalMap    texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
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

    const float4 const_3 = {0, 0, 1, 0.5};

    float1 q10;
    float1 q2;
    float1 q3;
    float3 q4;
    float3 q8;
    float4 r0;
    float3 r1;
    float2 r2;

    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    r0.xyz = normalize(expand(r0.xyz));			// partial precision
    r2.xy = r0.xy * 0.5;			// partial precision
    q2.x = dot(r0.xyz, normalize(IN.texcoord_1.xyz));			// partial precision
    r1.xyz = (0.5 * r0.xyz) + const_3.xyz;			// partial precision
    q8.xyz = r1.xyz / sqrt((((r0.z * 0.5) + 1) * r1.z) + ((r2.y * r1.y) + (r2.x * r1.x)));			// partial precision
    q3.x = 1 - saturate(abs(dot(q8.xyz, normalize(IN.texcoord_1.xyz)) - dot(q8.xyz, normalize(IN.texcoord_3.xyz))));			// partial precision
    q10.x = (r0.w * 0.7) * pow(abs(q3.x), 30);			// partial precision
    q4.xyz = (0.2 >= q2.x ? (q10.x * max(q2.x + 0.5, 0)) : q10.x) * PSLightColor[0].rgb;			// partial precision
    OUT.color_0.a = weight(q4.xyz);			// partial precision
    OUT.color_0.rgb = saturate(q4.xyz);			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (1 texture, 39 arithmetic)
