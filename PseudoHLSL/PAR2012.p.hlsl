//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2012.pso /Fcshaderdump19/PAR2012.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];


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
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float3 texcoord_7 : TEXCOORD7_centroid;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.04, -0.02, -0.5, 1};

    float4 r0;
    float4 r1;
    float4 r2;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.x = IN.texcoord_4.z;
    r0.y = IN.texcoord_4.w;
    r2.xyzw = tex2D(NormalMap, (((r0.w * 0.04) - 0.02) * ((1.0 / length(IN.texcoord_7.xyz)) * IN.texcoord_7.xy)) + IN.texcoord_0.xy);			// partial precision
    r0.xyzw = tex2D(AttenuationMap, r0.xy);			// partial precision
    r0.w = 1;
    r1.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r2.xyz = normalize(2 * (r2.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r0.xyz = ((saturate(dot(r2.xyz, IN.texcoord_1.xyz)) * PSLightColor[0].rgb) + ((saturate(dot(r2.xyz, normalize(IN.texcoord_2.xyz))) * PSLightColor[1].rgb) * saturate((1 - r1.x) - r0.x))) + AmbientColor.rgb;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 29 instruction slots used (4 texture, 25 arithmetic)
