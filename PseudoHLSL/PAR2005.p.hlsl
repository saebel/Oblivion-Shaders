//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2005.pso /Fcshaderdump19/PAR2005.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AttenuationMap : register(s5);
sampler2D BaseMap : register(s0);
float4 EmittanceColor : register(c6);
sampler2D GlowMap : register(s4);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4];
float4 Toggles : register(c7);
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
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
#define	uvtile(w)		(((w) * 0.04) - 0.02)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float1 att0;
    float1 att11;
    float3 q13;
    float3 q14;
    float3 q2;
    float3 q4;
    float3 q5;
    float3 q6;
    float4 r0;
    float4 r1;
    float4 r4;
    float2 uv1;

    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att11.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    uv1.xy = (uvtile(r0.w) * (IN.texcoord_6.xy / length(IN.texcoord_6.xyz))) + IN.BaseUV.xy;
    r4.xyzw = tex2D(NormalMap, uv1.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, uv1.xy);			// partial precision
    q2.xyz = normalize(expand(r4.xyz));			// partial precision
    q13.xyz = saturate((1 - att0.x) - att11.x) * (shades(q2.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    r1.xyz = (r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb;			// partial precision
    q14.xyz = max(((shades(q2.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb) + q13.xyz) + r1.xyz, 0);			// partial precision
    q4.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));			// partial precision
    q5.xyz = q14.xyz * q4.xyz;			// partial precision
    q6.xyz = (Toggles.y <= 0.0 ? q5.xyz : ((IN.color_1.a * (IN.color_1.rgb - (q4.xyz * q14.xyz))) + q5.xyz));			// partial precision
    OUT.color_0.a = AmbientColor.a;			// partial precision
    OUT.color_0.rgb = q6.xyz;			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (6 texture, 34 arithmetic)
