//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2060.pso /Fcshaderdump19/SLS2060.pso.dis
//


// Structures:

struct VS_OUTPUT {
    float4 texcoord_1 : TEXCOORD1;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const int4 const_0 = {1, 0, 0, 0};

    float4 r0;

    r0.xyz = saturate((1.0 / IN.texcoord_1.w) * IN.texcoord_1.z);			// partial precision
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 5 instruction slots used
