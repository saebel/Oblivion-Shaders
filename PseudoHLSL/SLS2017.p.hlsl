//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2017.pso /Fcshaderdump19/SLS2017.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D BaseMap;
float4 EmittanceColor;
sampler2D GlowMap;
sampler2D NormalMap;
float4 PSLightColor[4];
float4 Toggles;
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
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

    float1 q1;
    float3 q10;
    float3 q2;
    float1 q5;
    float1 q6;
    float3 q8;
    float3 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;
    float2 r4;

    r2.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r2.xyz = normalize(expand(r2.xyz));			// partial precision
    r4.xy = r2.xy * 0.5;			// partial precision
    q6.x = dot(r2.xyz, IN.texcoord_1.xyz);			// partial precision
    q8.xyz = (2 * ((IN.color_0.g * (EmittanceColor.rgb - 0.5)) + 0.5)) * lerp(r0.xyz, r1.xyz, r1.w);			// partial precision	// [0,1] to [-1,+1]
    r3.xyz = (0.5 * r2.xyz) + const_4.xyz;			// partial precision
    q10.xyz = r3.xyz / sqrt((((r2.z * 0.5) + 1) * r3.z) + ((r4.y * r3.y) + (r4.x * r3.x)));			// partial precision
    q1.x = 1 - saturate(abs(dot(q10.xyz, IN.texcoord_1.xyz) - dot(q10.xyz, normalize(IN.texcoord_3.xyz))));			// partial precision
    q5.x = (r2.w * 0.7) * pow(abs(q1.x), 30);			// partial precision
    q2.xyz = saturate((0.2 >= q6.x ? (q5.x * max(q6.x + 0.5, 0)) : q5.x) * PSLightColor[0].rgb);			// partial precision
    q9.xyz = (q8.xyz * max((saturate(q6.x) * PSLightColor[0].rgb) + AmbientColor.rgb, 0)) + q2.xyz;			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = (Toggles.y <= 0.0 ? q9.xyz : lerp(q9.xyz, IN.color_1.rgb, IN.color_1.a));			// partial precision

    return OUT;
};

// approximately 53 instruction slots used (3 texture, 50 arithmetic)
