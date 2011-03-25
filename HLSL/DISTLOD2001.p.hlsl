//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/DISTLOD2001.pso /Fcshaderdump19/DISTLOD2001.pso.dis
//
//
// Parameters:

float4 AlphaTestRef;
sampler2D DiffuseMap;

// Structures:

struct VS_OUTPUT {
    float4 position : POSITION;
    float4 color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float4 texcoord_4 : TEXCOORD4_centroid;		// partial precision
    float4 texcoord_5 : TEXCOORD5_centroid;		// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 src;
    float3 r1, bl;
    float3 a;

    src = tex2D(DiffuseMap, IN.texcoord_0);				// partial precision

    r1 = IN.texcoord_5 + IN.texcoord_4;					// partial precision
    bl = (src * r1) + (IN.color_0 - (src * r1)) * IN.color_0.a;		// partial precision

    a = AlphaTestRef.x - src.a;						// partial precision
    a = (a >= 0.0 ? 1 : 0);						// partial precision
    a * IN.texcoord_5.a;						// partial precision

    OUT.color_0.rgb = bl;						// partial precision
    OUT.color_0.a   = a;					// partial precision

    return OUT;
};

// approximately 10 instruction slots used (1 texture, 9 arithmetic)
