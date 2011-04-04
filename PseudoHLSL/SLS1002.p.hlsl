//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1002.pso /Fcshaderdump19/SLS1002.pso.dis
//
//
// Parameters:

sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   NormalMap    texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
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

    const float4 const_0 = {-0.5, 0, 0, 0};

    float4 r0;

    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r0.xyz = saturate(dot(2 * (r0.xyz - 0.5), 2 * (IN.texcoord_1.xyz - 0.5))) * PSLightColor[0].rgb;	// [0,1] to [-1,+1]
    r0.w = PSLightColor[0].a;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 9 instruction slots used (1 texture, 8 arithmetic)
