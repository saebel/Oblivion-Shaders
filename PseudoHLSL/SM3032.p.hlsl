//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3032.pso /Fcshaderdump19/SM3032.pso.dis
//


// Structures:

struct VS_OUTPUT {
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

    const float4 const_0 = {0.5, 0, 0, 0};


    OUT.color_0.rgba = const_0.xxyy;			// partial precision

    return OUT;
};

// approximately 1 instruction slot used
