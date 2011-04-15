//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2003.pso /Fcshaderdump19/SKIN2003.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D FaceGenMap0;
sampler2D FaceGenMap1;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
sampler2D ShadowMaskMap;
float4 Toggles;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   FaceGenMap0    texture_2       1
//   FaceGenMap1    texture_3       1
//   AttenuationMap texture_5       1
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float3 color_0 : COLOR0;
    float4 color_1 : COLOR1;
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

    float1 att23;
    float1 att4;
    float3 noxel2;
    float3 q10;
    float3 q11;
    float3 q12;
    float3 q13;
    float3 q14;
    float3 q27;
    float3 q3;
    float1 q6;
    float1 q7;
    float3 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r5;
    float3 t1;
    float1 t5;

    t5.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    t1.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    noxel2.xyz = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r2.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);			// partial precision
    r1.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att4.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    att23.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    q3.xyz = normalize(expand(noxel2.xyz));			// partial precision
    q27.xyz = 2 * ((2 * r2.xyz) * (expand(r1.xyz) + r0.xyz));			// partial precision
    q6.x = 1 - shade(q3.xyz, normalize(IN.texcoord_6.xyz));			// partial precision
    q7.x = q6.x * sqr(q6.x);			// partial precision
    q10.xyz = (shade(q3.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb) + ((q7.x * PSLightColor[1].rgb) * 0.5);			// partial precision
    r5.xyz = saturate((1 - att4.x) - att23.x) * q10.xyz;			// partial precision
    q11.xyz = (shade(q3.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb) + ((q7.x * PSLightColor[0].rgb) * 0.5);			// partial precision
    q12.xyz = max(((((t5.x * (t1.xyz - 1)) + 1) * q11.xyz) + r5.xyz) + AmbientColor.rgb, 0);			// partial precision
    q9.xyz = (Toggles.x <= 0.0 ? q27.xyz : (q27.xyz * IN.color_0.rgb));			// partial precision
    q13.xyz = q12.xyz * q9.xyz;			// partial precision
    q14.xyz = (Toggles.y <= 0.0 ? q13.xyz : ((IN.color_1.a * (IN.color_1.rgb - (q9.xyz * q12.xyz))) + q13.xyz));			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = q14.xyz;			// partial precision

    return OUT;
};

// approximately 59 instruction slots used (8 texture, 51 arithmetic)
