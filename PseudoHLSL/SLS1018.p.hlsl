//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1018.pso /Fcshaderdump19/SLS1018.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
sampler2D FaceGenMap : register(s2);
sampler2D FaceGenMap2 : register(s3);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   FaceGenMap   texture_2       1
//   FaceGenMap2  texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float2 NormalUV : TEXCOORD1;
    float2 FaceUV : TEXCOORD2;
    float2 Face2UV : TEXCOORD3;
    float3 color_1 : COLOR1;
    float4 color_0 : COLOR0;
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

    float3 q0;
    float3 q2;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;

    r3.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    r2.xyzw = tex2D(FaceGenMap2, IN.Face2UV.xy);
    r1.xyzw = tex2D(FaceGenMap, IN.FaceUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    q0.xyz = saturate((shades(expand(r3.xyz), expand(IN.color_1.rgb)) * PSLightColor[0].rgb) + AmbientColor.rgb);
    q2.xyz = 2 * ((2 * r2.xyz) * (expand(r1.xyz) + r0.xyz));
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = (q2.xyz * q0.xyz) + ((IN.color_0.rgb - (q2.xyz * q0.xyz)) * IN.color_0.a);

    return OUT;
};

// approximately 20 instruction slots used (4 texture, 16 arithmetic)
