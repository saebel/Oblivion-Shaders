//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2000.vso /Fcshaderdump19/ISBLUR2000.vso.dis
//
//
// Parameters:

float4 texRatio0;

// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    OUT.texcoord_0 = (IN.texcoord_0 * texRatio0) + texRatio0.zwzw;
    OUT.position = IN.position;

    return OUT;
};

// approximately 2 instruction slots used
