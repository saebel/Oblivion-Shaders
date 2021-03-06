//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SKYSICLOUDS.pso /Fcshaderdump19/SKYSICLOUDS.pso.dis
//
//
// Parameters:

float2 Params;
sampler2D TexMap;
sampler2D TexMapBlend;

// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0, r1;

    r1 = tex2D(TexMapBlend, IN.texcoord_1);
    r0 = tex2D(TexMap, IN.texcoord_0);

    OUT.color_0.rgb = float4(0, 0, 0, 0);
    OUT.color_0.a   = (Params.x * (r1.a - r0.a)) + r0.a;

    return OUT;
};

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
