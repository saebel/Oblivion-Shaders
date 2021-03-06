//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1042.pso /Fcshaderdump19/SLS1042.pso.dis
//
//
// Parameters:
//
sampler2D BaseMap : register(s0);
sampler2D GlowMap : register(s1);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BaseMap      texture_0       1
//   GlowMap      texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float2 GlowUV : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;
    float4 r1;

    r0.xyzw = tex2D(GlowMap, IN.GlowUV.xy);
    r1.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = r0.xyz * (r1.xyz * IN.texcoord_2.xyz);

    return OUT;
};

// approximately 6 instruction slots used (2 texture, 4 arithmetic)
