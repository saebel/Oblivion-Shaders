//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE006.pso
//    /Fcshaderdump19/WATERDISPLACE006.pso.dis
//
//
// Parameters:

float BlendAmount;
sampler2D HeightMap01;
sampler2D HeightMap02;
float fDamp;

// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float h1 = tex2D(HeightMap02, IN.texcoord_0);
    float h0 = tex2D(HeightMap01, IN.texcoord_0);

    float r2 = abs(h1);
    float r1 = abs(h0);
    float r0 = 0.8 / fDamp.x;

    r2 = (r0 * -r1) + r2;
    r2 = r2 * BlendAmount.x;
    r2 = (r0 *  r1) + r2;

    OUT.color_0.xyz = r2;
    OUT.color_0.w = 1;

    return OUT;
};

// approximately 11 instruction slots used (2 texture, 9 arithmetic)