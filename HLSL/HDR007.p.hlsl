//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR007.pso /Fcshaderdump19/HDR007.pso.dis
//
//
// Parameters:

float4 HDRParam;
sampler2D Src0;

// Structures:

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float3 c2;
    float upper, lower, range;

    c2 = tex2D(Src0, IN.texcoord_0);

    upper = max(0.01, length(c2));			// max(length, 0.01)
    lower = min(upper, HDRParam.x);			// min(length, fUpperLUMClamp == 1.400000)
    range = lower / upper;

    OUT.color_0.rgb = range * c2;			// (min() / max()) * color
    OUT.color_0.a   = 1;

    return OUT;
};

// approximately 11 instruction slots used (1 texture, 10 arithmetic)