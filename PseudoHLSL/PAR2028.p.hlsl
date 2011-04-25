//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2028.pso /Fcshaderdump19/PAR2028.pso.dis
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

    float1 att0;
    float1 att25;
    float3 q10;
    float1 q11;
    float3 q12;
    float3 q13;
    float1 q26;
    float3 q31;
    float3 q4;
    float1 q5;
    float1 q7;
    float1 q8;
    float3 q9;
    float4 r0;
    float3 r1;
    float4 r3;
    float1 t1;
    float3 t2;
    float2 uv3;

    t1.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);			// partial precision
    t2.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att25.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    q26.x = saturate((1 - att0.x) - att25.x);			// partial precision
    uv3.xy = (uvtile(r0.w) * (IN.texcoord_6.xy / length(IN.texcoord_6.xyz))) + IN.BaseUV.xy;
    r3.xyzw = tex2D(NormalMap, uv3.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, uv3.xy);			// partial precision
    q4.xyz = normalize(expand(r3.xyz));			// partial precision
    q5.x = r3.w * pow(abs(shades(q4.xyz, normalize(IN.texcoord_4.xyz))), Toggles.z);			// partial precision
    q11.x = r3.w * pow(abs(shades(q4.xyz, normalize(IN.texcoord_3.xyz))), Toggles.z);			// partial precision
    q7.x = dot(q4.xyz, normalize(IN.texcoord_2.xyz));			// partial precision
    q9.xyz = saturate(q26.x * ((0.2 >= q7.x ? (q5.x * max(q7.x + 0.5, 0)) : q5.x) * PSLightColor[1].rgb));			// partial precision
    q8.x = dot(q4.xyz, IN.texcoord_1.xyz);			// partial precision
    q12.xyz = saturate((0.2 >= q8.x ? (q11.x * max(q8.x + 0.5, 0)) : q11.x) * PSLightColor[0].rgb);			// partial precision
    q10.xyz = (t1.x * (t2.xyz - 1)) + 1;			// partial precision
    q13.xyz = (q10.xyz * (saturate(q8.x) * PSLightColor[0].rgb)) + (q26.x * (saturate(q7.x) * PSLightColor[1].rgb));			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));			// partial precision
    q31.xyz = (r1.xyz * max(q13.xyz + AmbientColor.rgb, 0)) + ((q10.xyz * q12.xyz) + q9.xyz);			// partial precision
    OUT.color_0.a = AmbientColor.a;			// partial precision
    OUT.color_0.rgb = (Toggles.y <= 0.0 ? q31.xyz : lerp(q31.xyz, IN.color_1.rgb, IN.color_1.a));			// partial precision

    return OUT;
};

// approximately 76 instruction slots used (7 texture, 69 arithmetic)
