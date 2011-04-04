//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2006.pso /Fcshaderdump19/PAR2006.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
sampler2D ShadowMaskMap;
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
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
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

    const float4 const_0 = {0.04, -0.02, -0.5, -1};
    const int4 const_4 = {0, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xy = (((r0.w * 0.04) - 0.02) * ((1.0 / length(IN.texcoord_6.xyz)) * IN.texcoord_6.xy)) + IN.texcoord_0.xy;
    r5.xyzw = tex2D(NormalMap, r0.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, r0.xy);			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? (r0.xyz * IN.color_0.rgb) : r0.xyz);			// partial precision
    r1.x = IN.texcoord_7.z;			// partial precision
    r1.y = IN.texcoord_7.w;			// partial precision
    r1.xyzw = tex2D(ShadowMaskMap, r1.xy);			// partial precision
    r2.x = IN.texcoord_4.z;			// partial precision
    r2.y = IN.texcoord_4.w;			// partial precision
    r3.xyzw = tex2D(AttenuationMap, r2.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r4.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r5.xyz = normalize(2 * (r5.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r2.xyz = max(((((r1.x * (r2.xyz - 1)) + 1) * (saturate(dot(r5.xyz, IN.texcoord_1.xyz)) * PSLightColor[0].rgb)) + (saturate((1 - r4.x) - r3.x) * (saturate(dot(r5.xyz, normalize(IN.texcoord_2.xyz))) * PSLightColor[1].rgb))) + AmbientColor.rgb, 0);			// partial precision
    r1.xyz = (-r0.xyz * r2.xyz) + IN.color_1.rgb;			// partial precision
    r0.xyz = r2.xyz * r0.xyz;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? ((IN.color_1.a * r1.xyz) + r0.xyz) : r0.xyz);			// partial precision
    r0.w = AmbientColor.a;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 44 instruction slots used (7 texture, 37 arithmetic)
