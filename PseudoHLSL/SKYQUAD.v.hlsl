//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYQUAD.vso /Fcshaderdump19/SKYQUAD.vso.dis
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 color_0 : COLOR0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float4 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_0 = {1, 0, 0, 0};

    OUT.color_0.rgba = IN.color_0;
    OUT.position.xyzw = (IN.position.xyzx * const_0.xxxy) + const_0.yyyx;

    return OUT;
};

// approximately 2 instruction slots used
