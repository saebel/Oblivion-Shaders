//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2013.pso /Fcshaderdump19/SLS2013.pso.dis
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
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
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

    float1 att12;
    float1 att2;
    float3 q1;
    float3 q13;
    float3 q17;
    float3 q5;
    float3 q6;
    float3 q7;
    float3 q8;
    float4 r0;
    float4 r1;
    float4 r6;
    float3 t0;
    float1 t3;

    t3.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    t0.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r6.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    att12.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    q1.xyz = normalize(expand(r6.xyz));			// partial precision
    q13.xyz = saturate((1 - att2.x) - att12.x) * (shades(q1.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    q6.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));			// partial precision
    q5.xyz = (((t3.x * (t0.xyz - 1)) + 1) * (shades(q1.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb)) + q13.xyz;			// partial precision
    q17.xyz = max(q5.xyz + ((r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb), 0);			// partial precision
    q7.xyz = q17.xyz * q6.xyz;			// partial precision
    q8.xyz = (Toggles.y <= 0.0 ? q7.xyz : ((IN.color_1.a * (IN.color_1.rgb - (q6.xyz * q17.xyz))) + q7.xyz));			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = q8.xyz;			// partial precision

    return OUT;
};

// approximately 41 instruction slots used (7 texture, 34 arithmetic)
