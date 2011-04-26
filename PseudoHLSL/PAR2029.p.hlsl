//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2029.pso /Fcshaderdump19/PAR2029.pso.dis
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
sampler2D ShadowMap : register(s6);
sampler2D ShadowMaskMap : register(s7);
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
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
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
#define	uvtile(w)		(((w) * 0.04) - 0.02)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float1 att1;
    float1 att18;
    float1 q19;
    float1 q21;
    float3 q25;
    float3 q26;
    float3 q28;
    float3 q3;
    float1 q4;
    float1 q6;
    float1 q7;
    float3 q8;
    float3 q9;
    float4 r0;
    float4 r1;
    float4 r4;
    float3 t0;
    float1 t23;
    float2 uv2;

    t23.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    t0.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att1.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    att18.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    q19.x = saturate((1 - att1.x) - att18.x);			// partial precision
    uv2.xy = (uvtile(r0.w) * (IN.texcoord_6.xy / length(IN.texcoord_6.xyz))) + IN.BaseUV.xy;
    r4.xyzw = tex2D(NormalMap, uv2.xy);			// partial precision
    r0.xyzw = tex2D(GlowMap, IN.BaseUV.xy);
    r1.xyzw = tex2D(BaseMap, uv2.xy);			// partial precision
    q3.xyz = normalize(expand(r4.xyz));			// partial precision
    q4.x = r4.w * pow(abs(shades(q3.xyz, normalize(IN.texcoord_4.xyz))), Toggles.z);			// partial precision
    q21.x = r4.w * pow(abs(shades(q3.xyz, normalize(IN.texcoord_3.xyz))), Toggles.z);			// partial precision
    q6.x = dot(q3.xyz, normalize(IN.texcoord_2.xyz));			// partial precision
    q8.xyz = saturate(q19.x * ((0.2 >= q6.x ? (q4.x * max(q6.x + 0.5, 0)) : q4.x) * PSLightColor[1].rgb));			// partial precision
    q7.x = dot(q3.xyz, IN.texcoord_1.xyz);			// partial precision
    q9.xyz = saturate((0.2 >= q7.x ? (q21.x * max(q7.x + 0.5, 0)) : q21.x) * PSLightColor[0].rgb);			// partial precision
    q25.xyz = (t23.x * (t0.xyz - 1)) + 1;			// partial precision
    q26.xyz = (q25.xyz * (saturate(q7.x) * PSLightColor[0].rgb)) + (q19.x * (saturate(q6.x) * PSLightColor[1].rgb));			// partial precision
    r0.xyz = max(q26.xyz + ((r0.xyz * EmittanceColor.rgb) + AmbientColor.rgb), 0);			// partial precision
    q28.xyz = ((Toggles.x <= 0.0 ? r1.xyz : (r1.xyz * IN.color_0.rgb)) * r0.xyz) + ((q25.xyz * q9.xyz) + q8.xyz);			// partial precision
    OUT.color_0.a = AmbientColor.a;			// partial precision
    OUT.color_0.rgb = (Toggles.y <= 0.0 ? q28.xyz : lerp(q28.xyz, IN.color_1.rgb, IN.color_1.a));			// partial precision

    return OUT;
};

// approximately 79 instruction slots used (8 texture, 71 arithmetic)
