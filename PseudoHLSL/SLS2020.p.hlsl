//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2020.pso /Fcshaderdump19/SLS2020.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
float4 EmittanceColor;
sampler2D GlowMap;
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
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float2 color_0 : COLOR0;
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0.5, -1, 1};
    const float4 const_3 = {0.7, 30, 0.2, 0};
    const float4 const_4 = {0, 0, 1, 0.5};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float1 r6;

    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = normalize(2 * (r0.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r1.xyz = (0.5 * r0.xyz) + const_4.xyz;			// partial precision
    r2.xy = r0.xy * 0.5;			// partial precision
    r1.xyz = r1.xyz * (1.0 / sqrt((((r0.z * 0.5) + 1) * r1.z) + ((r2.y * r1.y) + (r2.x * r1.x))));			// partial precision
    r2.w = (r0.w * 0.7) * pow(abs(1 - saturate(abs(dot(r1.xyz, IN.texcoord_1.xyz) - dot(r1.xyz, normalize(IN.texcoord_3.xyz))))), 30);			// partial precision
    r6.x = dot(r0.xyz, IN.texcoord_1.xyz);			// partial precision
    r0.w = ((0.2 - r6.x) >= 0.0 ? r2.w : (r2.w * max(r6.x + 0.5, 0)));			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r2.xyzw = tex2D(ShadowMaskMap, r0.xy);			// partial precision
    r3.xyzw = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r3.xyz = (r2.x * (r3.xyz - 1)) + 1;			// partial precision
    r2.xyz = saturate(r0.w * PSLightColor[0].rgb) * r3.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);			// partial precision
    r1.xyz = (2 * ((IN.color_0.g * (EmittanceColor.rgb - 0.5)) + 0.5)) * lerp(r1.xyz, r0.xyz, r1.w);			// partial precision	// [0,1] to [-1,+1]
    r0.xyz = (r1.xyz * max((r3.xyz * (saturate(r6.x) * PSLightColor[0].rgb)) + AmbientColor.rgb, 0)) + r2.xyz;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? lerp(IN.color_1.rgb, r0.xyz, IN.color_1.a) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 60 instruction slots used (5 texture, 55 arithmetic)
