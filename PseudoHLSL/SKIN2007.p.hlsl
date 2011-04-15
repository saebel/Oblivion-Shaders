//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2007.pso /Fcshaderdump19/SKIN2007.pso.dis
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
//   PSLightColor[2]   const_4        1
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
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
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

    float1 att13;
    float1 att14;
    float1 att15;
    float1 att2;
    float3 noxel0;
    float3 q1;
    float3 q10;
    float3 q12;
    float3 q27;
    float1 q6;
    float1 q7;
    float3 q9;
    float4 r0;
    float3 t3;
    float1 t8;

    t8.x = tex2D(ShadowMaskMap, IN.texcoord_6.zw);			// partial precision
    t3.xyz = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    noxel0.xyz = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att15.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att13.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    att14.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    q1.xyz = normalize(expand(noxel0.xyz));			// partial precision
    q6.x = 1 - shade(q1.xyz, normalize(IN.texcoord_7.xyz));			// partial precision
    q7.x = q6.x * sqr(q6.x);			// partial precision
    q12.xyz = (shade(q1.xyz, normalize(IN.texcoord_3.xyz)) * PSLightColor[2].rgb) + ((q7.x * PSLightColor[2].rgb) * 0.5);			// partial precision
    q9.xyz = (shade(q1.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb) + ((q7.x * PSLightColor[1].rgb) * 0.5);			// partial precision
    q10.xyz = (shade(q1.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb) + ((q7.x * PSLightColor[0].rgb) * 0.5);			// partial precision
    q27.xyz = (((t8.x * (t3.xyz - 1)) + 1) * q10.xyz) + (saturate((1 - att2.x) - att14.x) * q9.xyz);			// partial precision
    OUT.color_0.a = r0.w;			// partial precision
    OUT.color_0.rgb = ((saturate((1 - att13.x) - att15.x) * q12.xyz) + q27.xyz) + AmbientColor.rgb;			// partial precision

    return OUT;
};

// approximately 59 instruction slots used (8 texture, 51 arithmetic)
