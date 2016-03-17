//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1002.pso /Fcshaderdump19/SLS1002.pso.dis
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
    float2 NormalUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
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

    float4 r0;

    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    OUT.color_0.a = PSLightColor[0].a;
    OUT.color_0.rgb = shades(expand(r0.xyz), expand(IN.texcoord_1.xyz)) * PSLightColor[0].rgb;

    return OUT;
};

// approximately 9 instruction slots used (1 texture, 8 arithmetic)