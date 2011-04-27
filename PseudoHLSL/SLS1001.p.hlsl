//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1001.pso /Fcshaderdump19/SLS1001.pso.dis
//
//
// Parameters:
//
sampler2D AttMapXY : register(s1);
sampler2D AttMapZ : register(s2);
samplerCUBE NormalCubeMap : register(s3);
sampler2D NormalMap : register(s0);
float4 PSLightColor[4] : register(c2);
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   PSLightColor[0]  const_2        1
//   NormalMap     texture_0       1
//   AttMapXY      texture_1       1
//   AttMapZ       texture_2       1
//   NormalCubeMap texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
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

    float3 att0;
    float3 att1;
    float4 r2;
    float4 r3;

    r2.xyzw = texCUBE(NormalCubeMap, IN.texcoord_3.xyz);
    r3.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    att0.xyz = tex2D(AttMapZ, IN.texcoord_2.xy);
    att1.xyz = tex2D(AttMapXY, IN.texcoord_1.xy);
    OUT.color_0.a = PSLightColor[0].a;
    OUT.color_0.rgb = (shades(expand(r3.xyz), expand(r2.xyz)) * PSLightColor[0].rgb) * (att1.xyz * att0.xyz);

    return OUT;
};

// approximately 14 instruction slots used (4 texture, 10 arithmetic)
