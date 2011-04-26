//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1015.pso /Fcshaderdump19/SLS1015.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float2 NormalUV : TEXCOORD1;
    float3 texcoord_3 : TEXCOORD3;
    float3 color_0 : COLOR0;
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
    float4 r0;
    float4 r1;
    float1 r2;

    r1.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    r2.x = shades(expand(r1.xyz), expand(IN.texcoord_3.xyz));
    q0.xyz = saturate((r2.x * PSLightColor[0].rgb) + AmbientColor.rgb) * (r0.xyz * IN.color_0.rgb);
    OUT.color_0.a = r0.w * AmbientColor.a;
    OUT.color_0.rgb = q0.xyz;

    return OUT;
};

// approximately 13 instruction slots used (2 texture, 11 arithmetic)
