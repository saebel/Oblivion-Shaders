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
    float4 depth;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.1, 1, 0, 0};


    OUT.color_0.rgba = const_0.xxxy;
    OUT.depth.xyzw = 1;

    return OUT;
};

// approximately 2 instruction slots used
