//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2016.pso /Fcshaderdump19/SLS2016.pso.dis
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
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

    float1 q1;
    float3 q2;
    float3 q3;
    float3 q4;
    float1 q7;
    float4 r0;
    float4 r1;
    float4 r2;

    r2.xyzw = tex2D(NormalMap, IN.BaseUV.xy);
    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    q7.x = r2.w * pow(abs(shades(normalize(expand(r2.xyz)), normalize(IN.texcoord_3.xyz))), Toggles.z);
    q1.x = dot(normalize(expand(r2.xyz)), IN.texcoord_1.xyz);
    q2.xyz = saturate((0.2 >= q1.x ? (q7.x * max(q1.x + 0.5, 0)) : q7.x) * PSLightColor[0].rgb);
    q3.xyz = (saturate(q1.x) * PSLightColor[0].rgb) + ((r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb);
    q4.xyz = ((Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb)) * max(q3.xyz, 0)) + q2.xyz;
    OUT.color_0.a = r0.w * AmbientColor.a;
    OUT.color_0.rgb = (Toggles.y <= 0.0 ? q4.xyz : lerp(q4.xyz, IN.color_1.rgb, IN.color_1.a));

    return OUT;
};

// approximately 36 instruction slots used (3 texture, 33 arithmetic)