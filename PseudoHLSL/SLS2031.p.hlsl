//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2031.pso /Fcshaderdump19/SLS2031.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AttenuationMap : register(s4);
sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
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
    float1 att1;
    float1 att2;
    float1 att8;
    float3 q3;
    float3 q4;
    float4 r0;
    float3 r3;
    float4 r5;

    r5.xyzw = tex2D(NormalMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    att8.x = tex2D(AttenuationMap, IN.texcoord_5.zw);
    att0.x = tex2D(AttenuationMap, IN.texcoord_5.xy);
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.zw);
    att1.x = tex2D(AttenuationMap, IN.texcoord_4.xy);
    q3.xyz = normalize(expand(r5.xyz));
    r0.xyz = shades(q3.xyz, normalize(IN.texcoord_3.xyz)) * PSLightColor[2].rgb;
    q4.xyz = saturate((1 - att1.x) - att2.x) * (shades(q3.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);
    r3.xyz = (shades(q3.xyz, IN.texcoord_1.xyz) * PSLightColor[0].rgb) + q4.xyz;
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = ((saturate((1 - att0.x) - att8.x) * r0.xyz) + r3.xyz) + AmbientColor.rgb;

    return OUT;
};

// approximately 35 instruction slots used (6 texture, 29 arithmetic)