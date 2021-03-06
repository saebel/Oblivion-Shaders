//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISHIT2001.pso /Fcshaderdump19/ISHIT2001.pso.dis
//
//
// Parameters:

sampler2D Src0;
float4 blurParams;

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

    float2 p0, p1, p2, p3, p4, p5, p6, p7, p8;

    p7 = (blurParams.xy * 0.5 * (1.0 / 9)) + (blurParams.xy * -0.5) + IN.texcoord_0;

    p8 = ((1.0 / 9) * blurParams.xy) + p7;
    p6 = ((1.0 / 9) * blurParams.xy) + p8;
    p5 = ((1.0 / 9) * blurParams.xy) + p6;
    p4 = ((1.0 / 9) * blurParams.xy) + p5;
    p3 = ((1.0 / 9) * blurParams.xy) + p4;
    p2 = ((1.0 / 9) * blurParams.xy) + p3;
    p1 = ((1.0 / 9) * blurParams.xy) + p2;
    p0 = ((1.0 / 9) * blurParams.xy) + p1;

    float3 c7 = tex2D(Src0, p7);
    float3 c8 = tex2D(Src0, p8);
    float3 c6 = tex2D(Src0, p6);
    float3 c5 = tex2D(Src0, p5);
    float3 c4 = tex2D(Src0, p4);
    float3 c3 = tex2D(Src0, p3);
    float3 c2 = tex2D(Src0, p2);
    float3 c1 = tex2D(Src0, p1);
    float3 c0 = tex2D(Src0, p0);

    float3 sum =
    	(0.050 * c8) +
    	(0.025 * c7) +
    	(0.075 * c6) +
    	(0.150 * c5) +
    	(0.300 * c4) +
    	(0.150 * c3) +
    	(0.075 * c2) +
    	(0.050 * c1) +
    	(0.025 * c0);

    OUT.color_0.rgb = sum;
    OUT.color_0.a   = 1;

    return OUT;
};

// approximately 33 instruction slots used (9 texture, 24 arithmetic)
