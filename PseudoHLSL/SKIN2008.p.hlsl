//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2008.pso /Fcshaderdump19/SKIN2008.pso.dis
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
//   NormalMap      texture_0       1
//   AttenuationMap texture_3       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float3 texcoord_7 : TEXCOORD7_centroid;
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

    const float4 const_0 = {-0.5, 1, 0, 0.5};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float3 r5;

    r0.x = IN.texcoord_4.z;
    r0.y = IN.texcoord_4.w;
    r0.xyzw = tex2D(AttenuationMap, r0.xy);			// partial precision
    r4.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r5.xyz = normalize(2 * (r4.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r0.w = 1 - max(dot(r5.xyz, normalize(IN.texcoord_7.xyz)), 0);			// partial precision
    r0.w = r0.w * (r0.w * r0.w);			// partial precision
    r1.x = IN.texcoord_5.z;
    r1.y = IN.texcoord_5.w;
    r2.xyzw = tex2D(AttenuationMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    r0.xyz = (saturate((1 - r1.x) - r0.x) * ((max(dot(r5.xyz, normalize(IN.texcoord_1.xyz)), 0) * PSLightColor[0].rgb) + ((r0.w * PSLightColor[0].rgb) * 0.5))) + saturate((1 - r3.x) - r2.x) * ((max(dot(r5.xyz, normalize(IN.texcoord_2.xyz)), 0) * PSLightColor[1].rgb) + ((r0.w * PSLightColor[1].rgb) * 0.5));			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 46 instruction slots used (5 texture, 41 arithmetic)
