//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2033.pso /Fcshaderdump19/SLS2033.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AttenuationMap : register(s4);
sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
sampler2D ShadowMap : register(s5);
sampler2D ShadowMaskMap : register(s6);
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_4       1
//   ShadowMap      texture_5       1
//   ShadowMaskMap  texture_6       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
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
    float1 att11;
    float1 att2;
    float1 att7;
    float3 q4;
    float3 q5;
    float3 q6;
    float3 q9;
    float4 r0;
    float4 r1;
    float4 r5;
    float3 t1;
    float1 t3;

    t3.x = tex2D(ShadowMaskMap, IN.texcoord_6.zw);			// partial precision
    r5.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att7.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    att11.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    t1.xyz = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att0.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r1.w = saturate((1 - att7.x) - att11.x);			// partial precision
    q4.xyz = normalize(expand(r5.xyz));			// partial precision
    q5.xyz = saturate((1 - att0.x) - att2.x) * (shades(q4.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    q6.xyz = (((t3.x * (t1.xyz - 1)) + 1) * (shades(q4.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb)) + q5.xyz;			// partial precision
    q9.xyz = (r1.w * (shades(q4.xyz, normalize(IN.texcoord_3.xyz)) * PSLightColor[2].rgb)) + q6.xyz;			// partial precision
    OUT.color_0.a = r0.w;			// partial precision
    OUT.color_0.rgb = q9.xyz + AmbientColor.rgb;			// partial precision

    return OUT;
};

// approximately 42 instruction slots used (8 texture, 34 arithmetic)
