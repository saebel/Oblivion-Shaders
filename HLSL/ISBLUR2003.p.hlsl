//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2003.pso /Fcshaderdump19/ISBLUR2003.pso.dis
//
//
// Parameters:

sampler2D Src0;
sampler2D Src1;
float4 blendW;

// Structures:

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float3 c0, c1;

    c1 = tex2D(Src1, IN.texcoord_1);
    c0 = tex2D(Src0, IN.texcoord_0);

    OUT.color_0.rgb = (blendW.x * c0) + (blendW.y * c1);
    OUT.color_0.a   = 1;

    return OUT;
};

// approximately 6 instruction slots used (2 texture, 4 arithmetic)
