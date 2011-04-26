//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1008.pso /Fcshaderdump19/STB1008.pso.dis
//
//
// Parameters:
//
sampler2D AttMapXY : register(s1);
sampler2D AttMapZ : register(s2);
samplerCUBE NormalCubeMap : register(s3);
sampler2D NormalMap : register(s0);
float4 PSLightColor[4];
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
    float4 NormalUV : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
};

struct PS_OUTPUT {
    float4 output_0 : COLOR0;
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

    const int4 const_0 = {1, 0, 0, 0};

    float3 att0;
    float3 att1;
    float3 q3;
    float4 r0;

    IN.texcoord_3.xyzw = texCUBE(NormalCubeMap, IN.texcoord_3.xyz);
    IN.NormalUV.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    att0.xyz = tex2D(AttMapZ, IN.texcoord_2.xy);
    att1.xyz = tex2D(AttMapXY, IN.texcoord_1.xy);
    r0.xyzw = saturate(dot(expand(IN.NormalUV.xyz), expand(IN.texcoord_3.xyz)));	// [0,1] to [-1,+1]
    q3.xyz = IN.NormalUV.w * (sqr(sqr(r0.w)) * PSLightColor[0].rgb);
    r0.xyz = q3.xyz * (att1.xyz * att0.xyz);
    IN.texcoord_1.xyzw = dot(const_0.xyz, q3.xyz);
    r0.w = IN.NormalUV.w * IN.texcoord_1.w;
    OUT.output_0.xyzw = r0.xyzw;

    return OUT;
};

// approximately 12 instruction slots used (4 texture, 8 arithmetic)
