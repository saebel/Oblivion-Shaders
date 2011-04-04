//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2021.pso /Fcshaderdump19/SLS2021.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
float4 Toggles;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_5       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
    float3 color_0 : COLOR0;
    float4 color_1 : COLOR1;
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

    const float4 const_0 = {-0.5, 0.2, 0.5, 0};
    const int4 const_4 = {1, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float1 r5;

    r0.xyz = normalize(IN.texcoord_2.xyz);			// partial precision
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r4.xyz = normalize(2 * (r1.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r3.w = r1.w * pow(abs(saturate(dot(r4.xyz, normalize(IN.texcoord_4.xyz)))), Toggles.z);			// partial precision
    r5.x = dot(r4.xyz, r0.xyz);			// partial precision
    r0.w = ((0.2 - r5.x) >= 0.0 ? r3.w : (r3.w * max(r5.x + 0.5, 0)));			// partial precision
    r0.x = IN.texcoord_5.z;			// partial precision
    r0.y = IN.texcoord_5.w;			// partial precision
    r2.xyzw = tex2D(AttenuationMap, r0.xy);			// partial precision
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    r2.w = saturate((1 - r3.x) - r2.x);			// partial precision
    r3.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r3.w = pow(abs(saturate(dot(r4.xyz, r3.xyz))), Toggles.z);			// partial precision
    r3.x = dot(r4.xyz, IN.texcoord_1.xyz);			// partial precision
    r4.w = r1.w * r3.w;			// partial precision
    r2.xyz = saturate((r0.w * PSLightColor[1].rgb) * r2.w) + saturate((((0.2 - r3.x) >= 0.0 ? r4.w : (r4.w * max(r3.x + 0.5, 0)))) * PSLightColor[0].rgb);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = (((Toggles.x <= 0.0 ? (r0.xyz * IN.color_0.rgb) : r0.xyz)) * max(((saturate(r3.x) * PSLightColor[0].rgb) + (r2.w * (saturate(r5.x) * PSLightColor[1].rgb))) + AmbientColor.rgb, 0)) + r2.xyz;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? lerp(IN.color_1.rgb, r0.xyz, IN.color_1.a) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 63 instruction slots used (4 texture, 59 arithmetic)
