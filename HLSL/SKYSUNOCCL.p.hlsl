//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SKYSUNOCCL.pso /Fcshaderdump19/SKYSUNOCCL.pso.dis
//

// Structures:

struct VS_OUTPUT {
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
    float depth : DEPTH;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    OUT.color_0 = float4(0.1, 0.1, 0.1, 1);
    OUT.depth   = 1;

    return OUT;
};

// approximately 2 instruction slots used
