//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/MENUBG000.pso /Fcshaderdump19/MENUBG000.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
float BlendValue : register(c1);
sampler2D ScreenSpace : register(s0);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BlendValue   const_1       1
//   ScreenSpace         texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 ScreenOffset : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.299, 0.587000012, 0.114, 0.14};
    const float4 const_2 = {0.11, -0.04, 1, 0};
    const float4 const_3 = {1, 0.955688059, 0.619858086, 0};
    const float4 const_4 = {1, -0.271581799, -0.646873832, 0};
    const float4 const_5 = {1, -1.1081773, 1.70506454, 0};

    float3 m0;
    float3 r0;
    float4 r1;

    r1.xyzw = tex2D(ScreenSpace, IN.ScreenOffset.xy);
    r0.x = dot(const_0.xyz, r1.xyz) + 0.14;
    r0.yz = const_2.xy;
    m0.xyz = mul(float3x3(const_3.xyz, const_4.xyz, const_5.xyz), r0.xyz);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = lerp(r1.xyz, m0.xyz, BlendValue.x);

    return OUT;
};

// approximately 11 instruction slots used (1 texture, 10 arithmetic)
