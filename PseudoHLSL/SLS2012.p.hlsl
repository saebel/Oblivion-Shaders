//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2012.pso /Fcshaderdump19/SLS2012.pso.dis
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

    float1 att2;
    float1 att3;
    float3 q1;
    float3 q10;
    float3 q4;
    float3 q6;
    float3 q7;
    float3 q8;
    float3 q9;
    float4 r0;
    float4 r5;
    float3 t0;
    float1 t5;

    t5.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    t0.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r5.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att3.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    q1.xyz = normalize(expand(r5.xyz));			// partial precision
    q4.xyz = saturate((1 - att2.x) - att3.x) * (shades(q1.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    q8.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));			// partial precision
    q6.xyz = (((t5.x * (t0.xyz - 1)) + 1) * (shades(q1.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb)) + q4.xyz;			// partial precision
    q7.xyz = max(q6.xyz + AmbientColor.rgb, 0);			// partial precision
    q9.xyz = q7.xyz * q8.xyz;			// partial precision
    q10.xyz = (Toggles.y <= 0.0 ? q9.xyz : ((IN.color_1.a * (IN.color_1.rgb - (q8.xyz * q7.xyz))) + q9.xyz));			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = q10.xyz;			// partial precision

    return OUT;
};

// approximately 38 instruction slots used (6 texture, 32 arithmetic)
