//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR003.pso /Fcshaderdump19/HDR003.pso.dis
//
//
// Parameters:

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

    OUT.color_0.rgb = tex2D(Src0, IN.texcoord_0);
    OUT.color_0.a   = 1;

    return OUT;
};

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
