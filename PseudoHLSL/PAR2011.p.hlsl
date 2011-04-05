//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2011.pso /Fcshaderdump19/PAR2011.pso.dis
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

    const float4 const_0 = {0.04, -0.02, -0.5, -1};
    const float4 const_3 = {0.2, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float3 r5;
    float1 r6;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r1.xy = (((r0.w * 0.04) - 0.02) * (IN.texcoord_6.xy / length(IN.texcoord_6.xyz))) + IN.texcoord_0.xy;
    r2.xyzw = tex2D(ShadowMaskMap, r0.xy);			// partial precision
    r0.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);
    r0.w = AmbientColor.a;			// partial precision
    r4.xyzw = tex2D(NormalMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(BaseMap, r1.xy);			// partial precision
    r4.xyz = normalize(2 * (r4.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r2.w = r4.w * pow(abs(saturate(dot(r4.xyz, normalize(IN.texcoord_3.xyz)))), Toggles.z);			// partial precision
    r3.xyzw = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r6.x = dot(r4.xyz, IN.texcoord_1.xyz);			// partial precision
    r4.xyz = (r2.x * (r3.xyz - 1)) + 1;			// partial precision
    r3.xyz = (r4.xyz * (saturate(r6.x) * PSLightColor[0].rgb)) + ((r0.xyz * EmittanceColor.rgb) + AmbientColor.rgb);			// partial precision
    r5.xyz = saturate(((0.2 - r6.x) >= 0.0 ? r2.w : (r2.w * max(r6.x + 0.5, 0))) * PSLightColor[0].rgb);			// partial precision
    r0.xyz = ((Toggles.x <= 0.0 ? (r1.xyz * IN.color_0.rgb) : r1.xyz) * max(r3.xyz, 0)) + (r5.xyz * r4.xyz);			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? lerp(IN.color_1.rgb, r0.xyz, IN.color_1.a) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 50 instruction slots used (6 texture, 44 arithmetic)
