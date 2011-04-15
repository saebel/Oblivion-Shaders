//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2005.pso /Fcshaderdump19/SKIN2005.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
sampler2D ShadowMaskMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_4       1
//   ShadowMap      texture_5       1
//   ShadowMaskMap  texture_6       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float3 texcoord_7 : TEXCOORD7_centroid;
    float4 texcoord_6 : TEXCOORD6;
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

    float1 att19;
    float1 att4;
    float3 noxel2;
    float3 q10;
    float3 q3;
    float1 q7;
    float1 q8;
    float3 q9;
    float4 r0;
    float3 r3;
    float3 t1;
    float1 t5;

    t5.x = tex2D(ShadowMaskMap, IN.texcoord_6.zw);			// partial precision
    noxel2.xyz = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att4.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    att19.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    q3.xyz = normalize(expand(noxel2.xyz));			// partial precision
    q7.x = 1 - shade(q3.xyz, normalize(IN.texcoord_7.xyz));			// partial precision
    q8.x = q7.x * sqr(q7.x);			// partial precision
    q9.xyz = (shade(q3.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb) + ((q8.x * PSLightColor[1].rgb) * 0.5);			// partial precision
    r3.xyz = saturate((1 - att4.x) - att19.x) * q9.xyz;			// partial precision
    t1.xyz = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    q10.xyz = (shade(q3.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb) + ((q8.x * PSLightColor[0].rgb) * 0.5);			// partial precision
    OUT.color_0.a = r0.w;			// partial precision
    OUT.color_0.rgb = ((((t5.x * (t1.xyz - 1)) + 1) * q10.xyz) + r3.xyz) + AmbientColor.rgb;			// partial precision

    return OUT;
};

// approximately 44 instruction slots used (6 texture, 38 arithmetic)
