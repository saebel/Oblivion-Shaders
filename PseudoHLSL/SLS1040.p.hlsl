//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1040.pso /Fcshaderdump19/SLS1040.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
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
    float3 r2;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r1.xyzw = tex2D(NormalMap, IN.texcoord_1.xy);
    r2.xyz = 2 * (IN.texcoord_3.xyz - 0.5);	// [0,1] to [-1,+1]
    r2.x = saturate(dot(2 * (r1.xyz - 0.5), r2.xyz));	// [0,1] to [-1,+1]
    r1.xyz = PSLightColor[0].rgb;
    r0.xyz = saturate((r2.x * r1) + AmbientColor) * (r0.xyz * IN.texcoord_2.xyz);
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 13 instruction slots used (2 texture, 11 arithmetic)
