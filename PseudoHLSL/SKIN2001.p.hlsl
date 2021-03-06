//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2001.pso /Fcshaderdump19/SKIN2001.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
sampler2D FaceGenMap0 : register(s2);
sampler2D FaceGenMap1 : register(s3);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
sampler2D ShadowMap : register(s6);
sampler2D ShadowMaskMap : register(s7);
float4 Toggles : register(c7);
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  const_1       1
//   PSLightColor[0]  const_2        1
//   Toggles       const_7       1
//   BaseMap       texture_0       1
//   NormalMap     texture_1       1
//   FaceGenMap0   texture_2       1
//   FaceGenMap1   texture_3       1
//   ShadowMap     texture_6       1
//   ShadowMaskMap texture_7       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
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

    float3 noxel1;
    float3 q10;
    float3 q18;
    float1 q4;
    float3 q7;
    float3 q8;
    float3 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r5;
    float3 t0;
    float1 t6;

    t6.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    t0.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    noxel1.xyz = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r2.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);			// partial precision
    r1.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);			// partial precision
    q4.x = 1 - shade(normalize(expand(noxel1.xyz)), normalize(IN.texcoord_6.xyz));			// partial precision
    r0.xyz = ((q4.x * sqr(q4.x)) * PSLightColor[0].rgb) * 0.5;			// partial precision
    r5.xyz = (shade(normalize(expand(noxel1.xyz)), IN.texcoord_1.xyz) * PSLightColor[0].rgb) + r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q7.xyz = max((((t6.x * (t0.xyz - 1)) + 1) * r5.xyz) + AmbientColor.rgb, 0);			// partial precision
    q18.xyz = 2 * ((2 * r2.xyz) * (expand(r1.xyz) + r0.xyz));			// partial precision
    q8.xyz = (Toggles.x <= 0.0 ? q18.xyz : (q18.xyz * IN.color_0.rgb));			// partial precision
    q9.xyz = q7.xyz * q8.xyz;			// partial precision
    q10.xyz = (Toggles.y <= 0.0 ? q9.xyz : ((IN.color_1.a * (IN.color_1.rgb - (q8.xyz * q7.xyz))) + q9.xyz));			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = q10.xyz;			// partial precision

    return OUT;
};

// approximately 43 instruction slots used (6 texture, 37 arithmetic)
