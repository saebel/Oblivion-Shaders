//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STLEAF2001.pso /Fcshaderdump19/STLEAF2001.pso.dis
//
//
// Parameters:

sampler2D DiffuseMap;

// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;				// partial precision
    float3 ilum : TEXCOORD1;					// partial precision
    float4 fog : TEXCOORD2;					// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0 = tex2D(DiffuseMap, IN.texcoord_0);		// partial precision
    float3 r1 = IN.ilum;					// partial precision

    float3 b0 = (-r0 * r1);					// partial precision
    float3 b1 = ( r0 * r1);					// partial precision

    OUT.color_0.rgb = b1 + (IN.fog.a * (IN.fog.rgb + b0));	// partial precision
    OUT.color_0.a = r0.a;

    return OUT;
};

// approximately 6 instruction slots used (1 texture, 5 arithmetic)