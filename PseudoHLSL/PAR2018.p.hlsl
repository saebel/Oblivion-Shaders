//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2018.pso /Fcshaderdump19/PAR2018.pso.dis
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
#define	uvtile(w)		(((w) * 0.04) - 0.02)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float1 att0;
    float1 att14;
    float1 att6;
    float1 att7;
    float3 q2;
    float3 q21;
    float4 r0;
    float3 r2;
    float3 r3;
    float4 r6;
    float3 t1;
    float1 t3;
    float2 uv12;

    t3.x = tex2D(ShadowMaskMap, IN.texcoord_6.zw);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att7.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att6.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    att14.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    uv12.xy = (uvtile(r0.w) * (IN.texcoord_7.xy / length(IN.texcoord_7.xyz))) + IN.BaseUV.xy;
    r6.xyzw = tex2D(NormalMap, uv12.xy);			// partial precision
    r0.w = saturate((1 - att0.x) - att14.x);			// partial precision
    t1.xyz = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    q2.xyz = normalize(expand(r6.xyz));			// partial precision
    r0.xyz = shades(q2.xyz, normalize(IN.texcoord_3.xyz)) * PSLightColor[2].rgb;			// partial precision
    r2.xyz = shades(q2.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb;			// partial precision
    r3.xyz = (t3.x * (t1.xyz - 1)) + 1;			// partial precision
    q21.xyz = (r3.xyz * r2.xyz) + (r0.w * (shades(q2.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb));			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = ((saturate((1 - att6.x) - att7.x) * r0.xyz) + q21.xyz) + AmbientColor.rgb;			// partial precision

    return OUT;
};

// approximately 48 instruction slots used (8 texture, 40 arithmetic)
