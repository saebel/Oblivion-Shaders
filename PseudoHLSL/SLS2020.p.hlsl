//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2020.pso /Fcshaderdump19/SLS2020.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
float4 EmittanceColor : register(c6);
sampler2D GlowMap : register(s4);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
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
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float2 color_0 : COLOR0;
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

    const float4 const_4 = {0, 0, 1, 0.5};

    float1 q10;
    float3 q11;
    float3 q12;
    float3 q13;
    float3 q16;
    float3 q3;
    float1 q4;
    float4 r0;
    float4 r1;
    float2 r2;
    float1 r6;
    float3 t0;
    float1 t2;

    t2.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    t0.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyz = normalize(expand(r0.xyz));			// partial precision
    r2.xy = r0.xy * 0.5;			// partial precision
    r6.x = dot(r0.xyz, IN.texcoord_1.xyz);			// partial precision
    q3.xyz = (t2.x * (t0.xyz - 1)) + 1;			// partial precision
    r1.xyz = (0.5 * r0.xyz) + const_4.xyz;			// partial precision
    q16.xyz = r1.xyz / sqrt((((r0.z * 0.5) + 1) * r1.z) + ((r2.y * r1.y) + (r2.x * r1.x)));			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);			// partial precision
    q4.x = 1 - saturate(abs(dot(q16.xyz, IN.texcoord_1.xyz) - dot(q16.xyz, normalize(IN.texcoord_3.xyz))));			// partial precision
    q10.x = (r0.w * 0.7) * pow(abs(q4.x), 30);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q11.xyz = saturate((0.2 >= r6.x ? (q10.x * max(r6.x + 0.5, 0)) : q10.x) * PSLightColor[0].rgb) * q3.xyz;			// partial precision
    q12.xyz = (2 * ((IN.color_0.g * (EmittanceColor.rgb - 0.5)) + 0.5)) * lerp(r0.xyz, r1.xyz, r1.w);			// partial precision	// [0,1] to [-1,+1]
    q13.xyz = (q12.xyz * max((q3.xyz * (saturate(r6.x) * PSLightColor[0].rgb)) + AmbientColor.rgb, 0)) + q11.xyz;			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = (Toggles.y <= 0.0 ? q13.xyz : lerp(q13.xyz, IN.color_1.rgb, IN.color_1.a));			// partial precision

    return OUT;
};

// approximately 60 instruction slots used (5 texture, 55 arithmetic)
