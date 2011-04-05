//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2014.pso /Fcshaderdump19/PAR2014.pso.dis
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


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_4       1
//   ShadowMap      texture_5       1
//   ShadowMaskMap  texture_6       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float3 texcoord_7 : TEXCOORD7_centroid;
    float4 texcoord_6 : TEXCOORD6;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.04, -0.02, -0.5, -1};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.x = IN.texcoord_6.z;
    r0.y = IN.texcoord_6.w;
    r2.xy = (((r0.w * 0.04) - 0.02) * (IN.texcoord_7.xy / length(IN.texcoord_7.xyz))) + IN.texcoord_0.xy;
    r0.xyzw = tex2D(ShadowMaskMap, r0.xy);			// partial precision
    r0.w = 1;
    r1.x = IN.texcoord_4.z;
    r1.y = IN.texcoord_4.w;
    r4.xyzw = tex2D(NormalMap, r2.xy);			// partial precision
    r2.xyzw = tex2D(AttenuationMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r4.xyz = normalize(2 * (r4.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r3.xyz = (saturate(dot(r4.xyz, normalize(IN.texcoord_2.xyz))) * PSLightColor[1].rgb) * saturate((1 - r3.x) - r2.x);			// partial precision
    r0.xyz = (((r0.x * (r1.xyz - 1)) + 1) * (saturate(dot(r4.xyz, IN.texcoord_1.xyz)) * PSLightColor[0].rgb)) + r3.xyz;			// partial precision
    r0.xyz = r0.xyz + AmbientColor.rgb;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 36 instruction slots used (6 texture, 30 arithmetic)
