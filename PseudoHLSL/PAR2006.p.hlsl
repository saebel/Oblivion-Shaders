//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2006.pso /Fcshaderdump19/PAR2006.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AttenuationMap : register(s5);
sampler2D BaseMap : register(s0);
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

    float1 att0;
    float1 att13;
    float3 q14;
    float3 q4;
    float3 q5;
    float3 q6;
    float3 q7;
    float3 q8;
    float3 q9;
    float4 r0;
    float4 r5;
    float1 t1;
    float3 t2;
    float2 uv3;

    t2.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att13.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    uv3.xy = (uvtile(r0.w) * (IN.texcoord_6.xy / length(IN.texcoord_6.xyz))) + IN.BaseUV.xy;
    r5.xyzw = tex2D(NormalMap, uv3.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, uv3.xy);			// partial precision
    q4.xyz = normalize(expand(r5.xyz));			// partial precision
    q14.xyz = saturate((1 - att0.x) - att13.x) * (shades(q4.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    t1.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    q7.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));			// partial precision
    q5.xyz = (((t1.x * (t2.xyz - 1)) + 1) * (shades(q4.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb)) + q14.xyz;			// partial precision
    q6.xyz = max(q5.xyz + AmbientColor.rgb, 0);			// partial precision
    q8.xyz = q6.xyz * q7.xyz;			// partial precision
    q9.xyz = (Toggles.y <= 0.0 ? q8.xyz : ((IN.color_1.a * (IN.color_1.rgb - (q7.xyz * q6.xyz))) + q8.xyz));			// partial precision
    OUT.color_0.a = AmbientColor.a;			// partial precision
    OUT.color_0.rgb = q9.xyz;			// partial precision

    return OUT;
};

// approximately 44 instruction slots used (7 texture, 37 arithmetic)
