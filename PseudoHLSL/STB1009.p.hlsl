//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1009.pso /Fcshaderdump19/STB1009.pso.dis
//

// Structures:

struct VS_OUTPUT {
    float4 input_0 : COLOR0;
};

struct PS_OUTPUT {
    float4 output_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;

    r0.xyzw = IN.input_0.xyzw;
    OUT.output_0.xyzw = r0.xyzw;

    return OUT;
};

// approximately 1 instruction slot used
