//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STLEAF2000.pso /Fcshaderdump19/STLEAF2000.pso.dis
//
//
// Parameters:

sampler2D DiffuseMap;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   DiffuseMap   texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1;			// partial precision
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


    float4 r0;

    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r0.xyz * IN.texcoord_1.xyz;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
