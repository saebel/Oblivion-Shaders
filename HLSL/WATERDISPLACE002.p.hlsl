//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE002.pso
//    /Fcshaderdump19/WATERDISPLACE002.pso.dis
//
//
// Parameters:

sampler2D HeightMap;
float3 WadingVars;

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
    const float2 const_1 = {-(1.0 / 256), 0};

    float2 p3 = IN.texcoord_0 + const_0;
    float2 p2 = IN.texcoord_0 - const_0;
    float2 p1 = IN.texcoord_0 + const_1;
    float2 p0 = IN.texcoord_0 - const_1;

    float2 h3 = tex2D(HeightMap, p3);
    float2 h4 = tex2D(HeightMap, p2);
    float2 h2 = tex2D(HeightMap, p1);
    float2 h1 = tex2D(HeightMap, p0);
    float4 h0 = tex2D(HeightMap, IN.texcoord_0);

    float sums = (h0.x * -4) + (h1.x + h2.x + h3.x + h4.x);

    h0.y = (WadingVars.x * sums) + h0.y - 0.5;
    h0.x = (WadingVars.y * h0.y) + h0.x - 0.5;
    h0   = (WadingVars.z * h0  )        + 0.5;

    OUT.color_0 = h0;

    return OUT;
};

// approximately 19 instruction slots used (5 texture, 14 arithmetic)
