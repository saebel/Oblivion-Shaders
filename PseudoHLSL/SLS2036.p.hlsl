//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2036.pso /Fcshaderdump19/SLS2036.pso.dis
//
//
// Parameters:

sampler2D AttenuationMap;
sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   NormalMap      texture_0       1
//   AttenuationMap texture_3       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
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
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;

    r0.x = IN.texcoord_6.z;
    r0.y = IN.texcoord_6.w;
    r0.xyzw = tex2D(AttenuationMap, r0.xy);			// partial precision
    r1.x = IN.texcoord_5.z;
    r1.y = IN.texcoord_5.w;
    r4.xyzw = tex2D(AttenuationMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(AttenuationMap, IN.texcoord_6.xy);			// partial precision
    r2.x = IN.texcoord_4.z;
    r2.y = IN.texcoord_4.w;
    r2.xyzw = tex2D(AttenuationMap, r2.xy);			// partial precision
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r5.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    r6.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r6.xyz = normalize(2 * (r6.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r0.xyz = (saturate((1 - r1.x) - r0.x) * (saturate(dot(r6.xyz, normalize(IN.texcoord_3.xyz))) * PSLightColor[2].rgb)) + ((saturate((1 - r3.x) - r2.x) * (saturate(dot(r6.xyz, normalize(IN.texcoord_1.xyz))) * PSLightColor[0].rgb)) + saturate((1 - r5.x) - r4.x) * (saturate(dot(r6.xyz, normalize(IN.texcoord_2.xyz))) * PSLightColor[1].rgb));			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 44 instruction slots used (7 texture, 37 arithmetic)
