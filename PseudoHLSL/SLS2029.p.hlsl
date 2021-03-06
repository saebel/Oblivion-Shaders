//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2029.pso /Fcshaderdump19/SLS2029.pso.dis
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
    float4 texcoord_4 : TEXCOORD4;
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

    float1 att1;
    float1 att2;
    float3 q3;
    float3 q7;
    float3 q8;
    float4 r0;
    float1 r4;
    float4 r5;
    float3 t0;
    float1 t5;

    t5.x = tex2D(ShadowMaskMap, IN.texcoord_6.zw);			// partial precision
    t0.xyz = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    r5.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att1.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    q7.xyz = normalize(expand(r5.xyz));			// partial precision
    r4.x = shades(q7.xyz, IN.texcoord_1.xyz);			// partial precision
    q8.xyz = saturate((1 - att1.x) - att2.x) * (shades(q7.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    q3.xyz = ((((t5.x * (t0.xyz - 1)) + 1) * (r4.x * PSLightColor[0].rgb)) + q8.xyz) + AmbientColor.rgb;			// partial precision
    OUT.color_0.a = r0.w;			// partial precision
    OUT.color_0.rgb = q3.xyz;			// partial precision

    return OUT;
};

// approximately 30 instruction slots used (6 texture, 24 arithmetic)
