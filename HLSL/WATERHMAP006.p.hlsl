//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATERHMAP006.pso /Fcshaderdump19/WATERHMAP006.pso.dis
//
//
// Parameters:

sampler2D HeightMap;

// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float h0 = tex2D(HeightMap, IN.texcoord_0);

    OUT.color_0.xyz = abs(h0);
    OUT.color_0.w = 1;

    return OUT;
};

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
