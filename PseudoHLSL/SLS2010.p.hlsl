//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2010.pso /Fcshaderdump19/SLS2010.pso.dis
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
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

    float1 att1;
    float1 att2;
    float3 q0;
    float3 q14;
    float3 q3;
    float3 q5;
    float3 q6;
    float3 q7;
    float4 r0;
    float4 r1;
    float4 r4;

    r4.xyzw = tex2D(NormalMap, IN.BaseUV.xy);
    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.zw);
    att1.x = tex2D(AttenuationMap, IN.texcoord_4.xy);
    q0.xyz = normalize(expand(r4.xyz));
    q3.xyz = saturate((1 - att1.x) - att2.x) * (shades(q0.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);
    r1.xyz = (r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb;
    q14.xyz = max(((shades(q0.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb) + q3.xyz) + r1.xyz, 0);
    q5.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));
    q6.xyz = q14.xyz * q5.xyz;
    q7.xyz = (Toggles.y <= 0.0 ? q6.xyz : ((IN.color_1.a * (IN.color_1.rgb - (q5.xyz * q14.xyz))) + q6.xyz));
    OUT.color_0.a = r0.w * AmbientColor.a;
    OUT.color_0.rgb = q7.xyz;

    return OUT;
};

// approximately 34 instruction slots used (5 texture, 29 arithmetic)