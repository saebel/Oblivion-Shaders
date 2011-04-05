//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2022.pso /Fcshaderdump19/SLS2022.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
float4 EmittanceColor;
sampler2D GlowMap;
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
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
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

    const float4 const_0 = {-0.5, 0.2, 0.5, 0};
    const int4 const_4 = {1, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;

    r0.xyz = normalize(IN.texcoord_2.xyz);			// partial precision
    r2.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r5.xyz = normalize(2 * (r2.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r0.x = dot(r5.xyz, r0.xyz);			// partial precision
    r3.w = r2.w * pow(abs(saturate(dot(r5.xyz, normalize(IN.texcoord_4.xyz)))), Toggles.z);			// partial precision
    r0.w = ((0.2 - r0.x) >= 0.0 ? r3.w : (r3.w * max(r0.x + 0.5, 0)));			// partial precision
    r5.w = saturate(r0.x);			// partial precision
    r0.x = IN.texcoord_5.z;			// partial precision
    r0.y = IN.texcoord_5.w;			// partial precision
    r3.xyzw = tex2D(AttenuationMap, r0.xy);			// partial precision
    r4.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    r3.w = saturate((1 - r4.x) - r3.x);			// partial precision
    r4.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r4.w = r2.w * pow(abs(saturate(dot(r5.xyz, r4.xyz))), Toggles.z);			// partial precision
    r4.x = dot(r5.xyz, IN.texcoord_1.xyz);			// partial precision
    r2.xyz = saturate(((0.2 - r4.x) >= 0.0 ? r4.w : (r4.w * max(r4.x + 0.5, 0))) * PSLightColor[0].rgb);			// partial precision
    r2.xyz = saturate((r0.w * PSLightColor[1].rgb) * r3.w) + r2.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);
    r3.xyz = ((saturate(r4.x) * PSLightColor[0].rgb) + (r3.w * (r5.w * PSLightColor[1].rgb))) + ((r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb);			// partial precision
    r0.xyz = ((Toggles.x <= 0.0 ? (r0.xyz * IN.color_0.rgb) : r0.xyz) * max(r3.xyz, 0)) + r2.xyz;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? lerp(IN.color_1.rgb, r0.xyz, IN.color_1.a) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 66 instruction slots used (5 texture, 61 arithmetic)
