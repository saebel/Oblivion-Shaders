//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1021.pso /Fcshaderdump19/SLS1021.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
sampler2D GlowMap : register(s2);
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
//   GlowMap      texture_2       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float2 NormalUV : TEXCOORD1;
    float2 GlowUV : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
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
    float4 r2;

    r2.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    r1.xyzw = tex2D(GlowMap, IN.GlowUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    r2.xyz = expand(r2.xyz);	// [0,1] to [-1,+1]
    q0.xyz = saturate((shades(r2.xyz, expand(IN.texcoord_3.xyz)) * PSLightColor[0].rgb) + (r1.xyz + AmbientColor.rgb));
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = r0.xyz * q0.xyz;

    return OUT;
};

// approximately 12 instruction slots used (3 texture, 9 arithmetic)
