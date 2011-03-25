//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE004.pso
//    /Fcshaderdump19/WATERDISPLACE004.pso.dis
//
//
// Parameters:

sampler2D HeightMap;

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

    const float2 const_0 = {0, -(1.0 / 256)};
    const float2 const_2 = {-(1.0 / 256), 0};

    float2 p3 = IN.texcoord_0 + const_0;
    float2 p2 = IN.texcoord_0 - const_0;
    float2 p1 = IN.texcoord_0 + const_2;
    float2 p0 = IN.texcoord_0 - const_2;

    float4 h3 = tex2D(HeightMap, p3);
    float4 h2 = tex2D(HeightMap, p2);
    float4 h1 = tex2D(HeightMap, p1);
    float4 h0 = tex2D(HeightMap, p0);

    h0 = (2 * h0) + (2 * h1) + (2 * h2) + (2 * h3) - 4;
    h0 = (h0 / 8) + 0.5;

    OUT.color_0 = h0;

    return OUT;
};

// approximately 15 instruction slots used (4 texture, 11 arithmetic)
