//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2021.pso /Fcshaderdump19/SLS2021.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AttenuationMap : register(s5);
sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
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

    float1 att0;
    float1 att3;
    float3 q13;
    float1 q19;
    float1 q2;
    float3 q23;
    float1 q4;
    float1 q5;
    float1 q6;
    float3 q7;
    float3 q8;
    float3 q9;
    float4 r0;
    float4 r1;

    r1.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att3.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    q5.x = saturate((1 - att0.x) - att3.x);			// partial precision
    q13.xyz = normalize(expand(r1.xyz));			// partial precision
    q4.x = r1.w * pow(abs(shades(q13.xyz, normalize(IN.texcoord_4.xyz))), Toggles.z);			// partial precision
    q19.x = r1.w * pow(abs(shades(q13.xyz, normalize(IN.texcoord_3.xyz))), Toggles.z);			// partial precision
    q2.x = dot(q13.xyz, normalize(IN.texcoord_2.xyz));			// partial precision
    q7.xyz = saturate(((0.2 >= q2.x ? (q4.x * max(q2.x + 0.5, 0)) : q4.x) * PSLightColor[1].rgb) * q5.x);			// partial precision
    q6.x = dot(q13.xyz, IN.texcoord_1.xyz);			// partial precision
    q8.xyz = saturate((0.2 >= q6.x ? (q19.x * max(q6.x + 0.5, 0)) : q19.x) * PSLightColor[0].rgb);			// partial precision
    q9.xyz = (saturate(q6.x) * PSLightColor[0].rgb) + (q5.x * (saturate(q2.x) * PSLightColor[1].rgb));			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));			// partial precision
    q23.xyz = (r1.xyz * max(q9.xyz + AmbientColor.rgb, 0)) + (q7.xyz + q8.xyz);			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = (Toggles.y <= 0.0 ? q23.xyz : lerp(q23.xyz, IN.color_1.rgb, IN.color_1.a));			// partial precision

    return OUT;
};

// approximately 63 instruction slots used (4 texture, 59 arithmetic)
