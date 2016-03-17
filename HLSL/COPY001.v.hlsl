//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/COPY001.vso /Fcshaderdump19/COPY001.vso.dis
//
//
// Parameters:

row_major float2x2 RotationMatrix;
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

    const float2 const_0 = {-0.5, 0.5};
    float2 r0, r1;

    r0.xy = (texRatio0.xy * IN.texcoord_0) + texRatio0.zw;
    r0.xy = r0 + const_0.x;
    r1.xy = r0.y * RotationMatrix[1];
    r0.xy = (r0.x * RotationMatrix[0]) + r1;

    OUT.texcoord_0.xy = r0 + const_0.y;
    OUT.position = IN.position;

    return OUT;
};

// approximately 6 instruction slots used