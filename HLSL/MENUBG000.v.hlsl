//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/MENUBG000.vso /Fcshaderdump19/MENUBG000.vso.dis
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
    float3 texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float3 const_0 = {0.3, 0.59, 0.11};

    OUT.texcoord_0 = (IN.texcoord_0 * texRatio0) + texRatio0.zwzw;
    OUT.texcoord_1 = const_0;
    OUT.position = IN.position;

    return OUT;
};

// approximately 3 instruction slots used
