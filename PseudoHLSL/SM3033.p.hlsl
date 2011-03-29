//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3033.pso /Fcshaderdump19/SM3033.pso.dis
//


// Structures:

struct VS_OUTPUT {
    float3 texcoord_0 : TEXCOORD0;			// partial precision
    float texcoord_1 : TEXCOORD1;			// partial precision
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0.5, 0, 0};

    OUT.color_0.a = IN.texcoord_1.x;			// partial precision
    OUT.color_0.rgb = (0.5 * r0) + 0.5;			// partial precision
    r0.xyz = IN.texcoord_0 + -0.5;			// partial precision
    r1.xyz = r0.xyz + r0.xyz;			// partial precision
    r0.xyz = normalize(r1);			// partial precision

    return OUT;
};

// approximately 7 instruction slots used
