//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2004.pso /Fcshaderdump19/SLS2004.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
sampler2D ShadowMaskMap;
float4 Toggles;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  const_1       1
//   PSLightColor[0]  const_2        1
//   Toggles       const_7       1
//   BaseMap       texture_0       1
//   NormalMap     texture_1       1
//   ShadowMap     texture_6       1
//   ShadowMaskMap texture_7       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
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

    const float4 const_0 = {-0.5, -1, 1, 0};
    const int4 const_3 = {20, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float3 r4;

    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = normalize(2 * (r0.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r4.xyz = saturate(dot(r0.xyz, IN.texcoord_1.xyz)) * PSLightColor[0].rgb;			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r2.xyzw = tex2D(ShadowMaskMap, r0.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r3.xyzw = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r0.xyz = r0.xyz * max((((r2.x * (r3.xyz - 1)) + 1) * r4.xyz) + AmbientColor.rgb, 0);			// partial precision
    r1.xyzw = tex2D(ShadowMap, IN.texcoord_0.xy * 20);
    r1.xyz = (-((r1.x * 0.5) + 0.5) * r0.xyz) + IN.color_1.rgb;			// partial precision	// [-1,+1] to [0,1]
    r0.xyz = r0.xyz * r1.w;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? ((IN.color_1.a * r1.xyz) + r0.xyz) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 27 instruction slots used (5 texture, 22 arithmetic)
