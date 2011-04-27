//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR1001.pso /Fcshaderdump19/HAIR1001.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D AnisoMap : register(s3);
sampler2D DiffuseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
float4 Toggles : register(c7);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   Toggles      const_7       1
//   DiffuseMap   texture_0       1
//   NormalMap    texture_1       1
//   AnisoMap     texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float4 input_0 : COLOR0;
    float4 DiffuseUV : TEXCOORD0;
    float4 NormalUV : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 AnisoUV : TEXCOORD3;
};

struct PS_OUTPUT {
    float4 output_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float3 q0;
    float4 r0;

    IN.NormalUV.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    IN.DiffuseUV.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);
    texm3x2pad IN.texcoord_2, expand(IN.NormalUV)	// [0,1] to [-1,+1]
    texm3x2IN.AnisoUV = tex2D(AnisoMap, IN.AnisoUV.xy);, expand(IN.NormalUV)	// [0,1] to [-1,+1]
    r0.xyzw = IN.AnisoUV.xyzw * IN.input_0.w;
    2 * (mul) r0.xyz, r0, Toggles
    q0.xyz = saturate(saturate((PSLightColor[0].rgb * r0.xyz) + IN.input_0.xyz) + AmbientColor.rgb);
    r0.xyz = (IN.DiffuseUV.xyz * (IN.NormalUV.w * (r0.w * PSLightColor[0].rgb))) + (IN.DiffuseUV.xyz * q0.xyz);
    r0.w = IN.DiffuseUV.w * AmbientColor.a;
    OUT.output_0.xyzw = r0.xyzw;

    return OUT;
};

// approximately 12 instruction slots used (4 texture, 8 arithmetic)
