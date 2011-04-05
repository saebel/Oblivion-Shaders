//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2032.pso /Fcshaderdump19/SLS2032.pso.dis
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


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   EmittanceColor const_6       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_3       1
//   AttenuationMap texture_4       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 1, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;

    r0.x = IN.texcoord_5.z;
    r0.y = IN.texcoord_5.w;
    r2.xyzw = tex2D(AttenuationMap, r0.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r6.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = normalize(2 * (r6.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r1.x = IN.texcoord_4.z;
    r1.y = IN.texcoord_4.w;
    r4.xyzw = tex2D(AttenuationMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    r5.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r0.xyz = ((saturate((1 - r3.x) - r2.x) * (saturate(dot(r0.xyz, normalize(IN.texcoord_3.xyz))) * PSLightColor[2].rgb)) + ((saturate(dot(r0.xyz, IN.texcoord_1.xyz)) * PSLightColor[0].rgb) + saturate((1 - r5.x) - r4.x) * (saturate(dot(r0.xyz, normalize(IN.texcoord_2.xyz))) * PSLightColor[1].rgb))) + ((r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 38 instruction slots used (7 texture, 31 arithmetic)
