//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STFROND2001.pso /Fcshaderdump19/STFROND2001.pso.dis
//
//
// Parameters:

sampler2D DiffuseMap;
float SunlightDimmer;

// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 color_0 : COLOR0;
    float3 color_1 : COLOR1;
    float4 fog : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0 = tex2D(DiffuseMap, IN.texcoord_0);
    float3 r1 = IN.color_0 + (SunlightDimmer.x * IN.color_1);

    float3 b0 = (-r0 * r1);
    float3 b1 = ( r0 * r1);

    OUT.color_0.rgb = b1 + (IN.fog.a * (IN.fog.rgb + b0));
    OUT.color_0.a = r0.a;

    return OUT;
};

// approximately 7 instruction slots used (1 texture, 6 arithmetic)
