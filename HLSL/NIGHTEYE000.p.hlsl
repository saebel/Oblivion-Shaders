//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/NIGHTEYE000.pso /Fcshaderdump19/NIGHTEYE000.pso.dis
//
//
// Parameters:

float4 SpellInput;
sampler2D Src0;

// Structures:

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const int4 const_0 = {1, 0, 0, -1};
    const float3 const_2 = {1, 1, 1};
    const float3 const_3 = {0.21, 0.5, 0.78};

    float3 c1, c0 = tex2D(Src0, IN.texcoord_0);
    float cB;

    cB = dot(const_0, SpellInput) - 1;
    cB = cB * cB;

/*  + */
    c1 = dot(const_2, c0);
    cB = (-cB * 0.5) + 0.5;
    cB = ( cB > 0.5 ? 0 : 1);

/*  + */
    c1 = const_3 * c1;

    OUT.color_0.rgb = lerp(c1, c0, cB);
    OUT.color_0.a   = 1;

    return OUT;
};

// approximately 7 instruction slots used (1 texture, 6 arithmetic)
