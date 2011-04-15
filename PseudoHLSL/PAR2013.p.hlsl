//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2013.pso /Fcshaderdump19/PAR2013.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
float4 EmittanceColor;
sampler2D GlowMap;
sampler2D NormalMap;
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
#define	uvtile(w)		(((w) * 0.04) - 0.02)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float1 att0;
    float1 att4;
    float3 q5;
    float3 q6;
    float4 r0;
    float3 r1;
    float4 r3;
    float2 uv8;

    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att4.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    uv8.xy = (uvtile(r0.w) * (IN.texcoord_7.xy / length(IN.texcoord_7.xyz))) + IN.BaseUV.xy;
    r3.xyzw = tex2D(NormalMap, uv8.xy);			// partial precision
    r0.xyzw = tex2D(GlowMap, IN.BaseUV.xy);
    q5.xyz = normalize(expand(r3.xyz));			// partial precision
    q6.xyz = (shades(q5.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb) * saturate((1 - att0.x) - att4.x);			// partial precision
    r1.xyz = (shades(q5.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb) + q6.xyz;			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = r1.xyz + ((r0.xyz * EmittanceColor.rgb) + AmbientColor.rgb);			// partial precision

    return OUT;
};

// approximately 32 instruction slots used (5 texture, 27 arithmetic)
