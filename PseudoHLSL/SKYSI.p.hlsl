//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SKYSI.pso /Fcshaderdump19/SKYSI.pso.dis
//

// Structures:

struct VS_OUTPUT {
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0, 0.5, 0, 0};

    OUT.color_0.rgba = const_0.xxxy;

    return OUT;
};

// approximately 1 instruction slot used
