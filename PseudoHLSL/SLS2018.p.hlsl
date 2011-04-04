//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2018.pso /Fcshaderdump19/SLS2018.pso.dis
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
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
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

    const float4 const_0 = {-0.5, -1, 1, 0.2};
    const int4 const_3 = {0, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;

    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r2.xyz = 2 * (r0.xyz - 0.5);			// partial precision	// [0,1] to [-1,+1]
    r0.xyz = normalize(r2.xyz);			// partial precision
    r2.x = saturate(dot(r0.xyz, normalize(IN.texcoord_3.xyz)));			// partial precision
    r0.x = dot(r0.xyz, IN.texcoord_1.xyz);			// partial precision
    r2.w = r0.w * pow(abs(r2.x), Toggles.z);			// partial precision
    r0.w = ((0.2 - r0.x) >= 0.0 ? r2.w : (r2.w * max(r0.x + 0.5, 0)));			// partial precision
    r3.w = saturate(r0.x);			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r1.xyzw = tex2D(ShadowMaskMap, r0.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r3.xyz = (r1.x * (r2.xyz - 1)) + 1;			// partial precision
    r2.xyz = saturate(r0.w * PSLightColor[0].rgb) * r3.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = (((Toggles.x <= 0.0 ? (r0.xyz * IN.color_0.rgb) : r0.xyz)) * max((r3.xyz * (r3.w * PSLightColor[0].rgb)) + AmbientColor.rgb, 0)) + r2.xyz;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? lerp(IN.color_1.rgb, r0.xyz, IN.color_1.a) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 41 instruction slots used (4 texture, 37 arithmetic)
