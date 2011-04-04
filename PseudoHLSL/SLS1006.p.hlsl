//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1006.pso /Fcshaderdump19/SLS1006.pso.dis
//
//
// Parameters:

sampler2D DiffuseMap;
float4 EmittanceColor;
sampler2D LayerMap;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   EmittanceColor const_6       1
//   DiffuseMap     texture_0       1
//   LayerMap       texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 color_0 : COLOR0;
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

    const float4 const_0 = {-0.5, 0.5, 0, 0};

    float4 r0;
    float4 r1;

    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r1.xyzw = tex2D(LayerMap, IN.texcoord_0.xy);
    r0.xyz = (2 * ((IN.color_0.g * (EmittanceColor.rgb - 0.5)) + 0.5)) * lerp(r1.xyz, r0.xyz, r1.w);	// [0,1] to [-1,+1]
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 10 instruction slots used (2 texture, 8 arithmetic)
