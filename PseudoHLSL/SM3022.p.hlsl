//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3022.pso /Fcshaderdump19/SM3022.pso.dis
//
//
// Parameters:
//
samplerCUBE EnvironmentCubeMap : register(s1);
float4 MatAlpha : register(c3);
sampler2D NormalMap : register(s0);
float4 PSLightColor : register(c9);
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   MatAlpha           const_3       1
//   PSLightColor       const_9       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;			// partial precision
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	envreflect(i, n)	((2 * dot(i, n)) * (i)) - ((n) * dot(i, i))

    float4 r0;
    float4 r1;

    r0.xyzw = texCUBE(EnvironmentCubeMap, envreflect(expand(IN.texcoord_1.xyz), normalize(IN.texcoord_2.xyz)));			// partial precision
    r1.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = ((((r0.xyz * r1.w) * MatAlpha.x) * IN.color_0.rgb) * PSLightColor.rgb) * IN.texcoord_1.w;			// partial precision

    return OUT;
};

// approximately 18 instruction slots used (2 texture, 16 arithmetic)
