//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE000.vso
//    /Fcshaderdump19/WATERDISPLACE000.vso.dis
//
//
// Parameters:

row_major float3x3 TranslationMatrix;

// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_0 = {1, 0, 0, 0};

    float3 r0 = (IN.position.xyxw * const_0.xxyw) + const_0.yyxw;

    OUT.position.x = dot(r0, TranslationMatrix[0]);
    OUT.position.y = dot(r0, TranslationMatrix[1]);
    OUT.position.zw = IN.position;
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 5 instruction slots used
