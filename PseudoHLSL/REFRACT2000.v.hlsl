//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/REFRACT2000.vso /Fcshaderdump19/REFRACT2000.vso.dis
//
//
// Parameters:

float4 texRatio0;
float4 texRatio1;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   texRatio0    const_6       1
//   texRatio1    const_7       1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5



    OUT.texcoord_0.xy = (IN.texcoord_0 * texRatio0.xy) + texRatio0.zw;
    OUT.texcoord_1.xy = (IN.texcoord_0 * texRatio1.xy) + texRatio1.zw;
    OUT.position.xyzw = IN.position.xyzw;

    return OUT;
};

// approximately 3 instruction slots used
