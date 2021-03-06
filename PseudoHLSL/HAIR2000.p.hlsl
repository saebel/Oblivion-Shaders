//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2000.pso /Fcshaderdump19/HAIR2000.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AnisoMap : register(s3);
sampler2D DiffuseMap : register(s0);
sampler2D HeightMap : register(s2);
sampler2D LayerMap : register(s5);
sampler2D NormalMap : register(s1);
float4 PSHairTint : register(c24);
float4 PSLightColor[4] : register(c2);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   PSHairTint   const_24      1
//   DiffuseMap   texture_0       1
//   NormalMap    texture_1       1
//   HeightMap    texture_2       1
//   AnisoMap     texture_3       1
//   LayerMap     texture_5       1
//


// Structures:

struct VS_OUTPUT {
    float2 DiffuseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 color_0 : COLOR0;
    float2 color_1 : COLOR1;
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
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float3 q0;
    float1 q2;
    float3 q3;
    float3 q4;
    float3 q5;
    float1 q8;
    float3 q81;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float2 r5;

    r3.xyzw = tex2D(NormalMap, IN.DiffuseUV.xy);
    r0.xyzw = tex2D(HeightMap, IN.DiffuseUV.xy);
    r1.xy = (IN.texcoord_1.xy * uvtile(r0.x)) + IN.DiffuseUV.xy;
    r0.xyzw = tex2D(NormalMap, r1.xy);
    r1.xyzw = tex2D(LayerMap, r1.xy);
    q81.xyz = normalize(expand(r0.xyz));
    r0.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);
    q8.x = 1 - shade(q81.xyz, IN.texcoord_1.xyz);
    q2.x = sqr(q8.x);
    r5.y = dot(q81.xyz, IN.texcoord_3.xyz);
    r5.x = dot(q81.xyz, IN.texcoord_2.xyz);
    r2.xyzw = tex2D(AnisoMap, r5.xy);
    q3.xyz = saturate((saturate((q8.x * q2.x) + max(r5.x, 0)) * PSLightColor[0].rgb) + IN.color_0.rgb);
    r2.xyz = saturate((q8.x * q2.x) + q3.xyz);
    q0.xyz = (IN.color_1.g * (PSHairTint.rgb - 0.5)) + 0.5;
    q5.xyz = (IN.color_0.a * (max(IN.texcoord_2.z, 0) * PSLightColor[0].rgb)) + IN.color_0.rgb;
    q4.xyz = ((IN.color_0.a * (r2.xyz * PSLightColor[0].rgb)) + AmbientColor.rgb) + IN.color_0.rgb;
    r2.xyz = q4.xyz * (r1.xyz * (2 * q0.xyz));
    r1.xyz = (q8.x * q2.x) * PSLightColor[0].rgb;
    r0.xyz = lerp((((IN.color_0.a * r1.xyz) + q5.xyz) + AmbientColor.rgb) * (r0.xyz * (2 * q0.xyz)), r2.xyz, r1.w);
    r1.xyz = ((0.5 * q0.xyz) + 0.15) * (r3.w * PSLightColor[0].rgb);
    r1.w = (r1.z <= 0.0 ? 0 : 1) * ((r1.x <= 0.0 ? 0 : 1) * (r1.y <= 0.0 ? 0 : 1));
    OUT.color_0.a = r0.w * AmbientColor.a;
    OUT.color_0.rgb = (r1.w <= 0.0 ? r0.xyz : (((r2.w * IN.color_0.a) * r1.xyz) + r0.xyz));

    return OUT;
};

// approximately 57 instruction slots used (6 texture, 51 arithmetic)
