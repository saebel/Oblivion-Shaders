//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3022.pso /Fcshaderdump19/SM3022.pso.dis
//
//
// Parameters:

samplerCUBE EnvironmentCubeMap;
float4 MatAlpha;
sampler2D NormalMap;
float4 PSLightColor;


// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   MatAlpha           const_3       1
//   PSLightColor       const_9       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float4 input_1 : TEXCOORD1_centroid;			// partial precision
    float3 input_2 : TEXCOORD2_centroid;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
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

    const float4 const_0 = {-0.5, 1, 0, 0};

    float4 r0;
    float4 r1;

    r1.xyz = normalize(IN.input_2.xyz);			// partial precision
    r0.xyzw = texCUBE(EnvironmentCubeMap, ((2 * dot(2 * (IN.input_1.xyz - 0.5), r1.xyz)) * (2 * (IN.input_1.xyz - 0.5))) - (r1.xyz * dot(2 * (IN.input_1.xyz - 0.5), r0.xyz)));			// partial precision	// [0,1] to [-1,+1]
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    OUT.color_0.rgb = ((((r0.xyz * r1.w) * MatAlpha.x) * IN.color_0.rgb) * PSLightColor.rgb) * IN.input_1.w;			// partial precision
    OUT.color_0.a = 1;			// partial precision

    return OUT;
};

// approximately 18 instruction slots used (2 texture, 16 arithmetic)
