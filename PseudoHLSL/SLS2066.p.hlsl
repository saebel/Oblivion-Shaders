//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa SLS2066.pso /FcSLS2066.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float2 NormalUV : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
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
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float3 q0;
    float4 r0;
    float4 r1;

    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    r1.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q0.xyz = (shades((IN.texcoord_3.xyz * 2) - 1, normalize(expand(r0.xyz))) * PSLightColor[0].rgb) + AmbientColor.rgb;			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = (r1.xyz * q0.xyz) * IN.texcoord_2.xyz;			// partial precision

    return OUT;
};

// approximately 14 instruction slots used (2 texture, 12 arithmetic)
