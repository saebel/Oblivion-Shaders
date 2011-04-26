//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2028.pso /Fcshaderdump19/SLS2028.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AttenuationMap : register(s4);
sampler2D BaseMap : register(s0);
float4 EmittanceColor : register(c6);
sampler2D GlowMap : register(s3);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4];
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   EmittanceColor const_6       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_3       1
//   AttenuationMap texture_4       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
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

    float1 att0;
    float1 att1;
    float3 q2;
    float3 q3;
    float3 q6;
    float4 r0;
    float4 r1;
    float1 r3;
    float4 r4;

    r4.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att1.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    q6.xyz = normalize(expand(r4.xyz));			// partial precision
    r3.x = shades(q6.xyz, IN.texcoord_1.xyz);			// partial precision
    q2.xyz = saturate((1 - att0.x) - att1.x) * (shades(q6.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    q3.xyz = ((r3.x * PSLightColor[0].rgb) + q2.xyz) + ((r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb);			// partial precision
    OUT.color_0.a = r0.w;			// partial precision
    OUT.color_0.rgb = q3.xyz;			// partial precision

    return OUT;
};

// approximately 26 instruction slots used (5 texture, 21 arithmetic)
