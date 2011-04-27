//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1001.pso /Fcshaderdump19/STB1001.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
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
    float4 texcoord_3 : TEXCOORD3;
    float3 input_0 : COLOR0;
    float4 BaseUV : TEXCOORD0;
    float4 NormalUV : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 output_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float4 r0;

    IN.NormalUV.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    IN.BaseUV.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    r0.xyz = saturate(dot(expand(IN.NormalUV.xyz), expand(IN.texcoord_3.xyz)));	// [0,1] to [-1,+1]
    r0.xyz = saturate((PSLightColor[0].rgb * r0.xyz) + AmbientColor.rgb) * (IN.BaseUV.xyz * IN.input_0.xyz);
    r0.w = IN.BaseUV.w;
    OUT.output_0.xyzw = r0.xyzw;

    return OUT;
};

// approximately 7 instruction slots used (3 texture, 4 arithmetic)
