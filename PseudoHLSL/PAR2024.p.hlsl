//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2024.pso /Fcshaderdump19/PAR2024.pso.dis
//
//
// Parameters:

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
//   PSLightColor[0]  const_2        1
//   Toggles       const_7       1
//   NormalMap     texture_0       1
//   BaseMap       texture_1       1
//   ShadowMap     texture_4       1
//   ShadowMaskMap texture_5       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_7 : TEXCOORD7_centroid;			// partial precision
    float4 texcoord_6 : TEXCOORD6;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.04, -0.02, -0.5, 0.2};
    const int4 const_1 = {0, -1, 1, 0};

    float4 r0;
    float4 r1;
    float4 r2;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.x = IN.texcoord_6.z;			// partial precision
    r0.y = IN.texcoord_6.w;			// partial precision
    r1.xy = (((r0.w * 0.04) - 0.02) * (IN.texcoord_7.xy / length(IN.texcoord_7.xyz))) + IN.texcoord_0.xy;			// partial precision
    r0.xyzw = tex2D(ShadowMaskMap, r0.xy);			// partial precision
    r2.xyzw = tex2D(NormalMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(ShadowMap, IN.texcoord_6.xy);			// partial precision
    r2.xyz = normalize(2 * (r2.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r2.w = r2.w * pow(abs(saturate(dot(r2.xyz, normalize(IN.texcoord_3.xyz)))), Toggles.z);			// partial precision
    r2.x = dot(r2.xyz, normalize(IN.texcoord_1.xyz));			// partial precision
    r1.xyz = (((0.2 - r2.x) >= 0.0 ? r2.w : (r2.w * max(r2.x + 0.5, 0))) * PSLightColor[0].rgb) * ((r0.x * (r1.xyz - 1)) + 1);			// partial precision
    r0.w = dot(r1.xyz, 1);			// partial precision
    r0.xyz = saturate(r1.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (4 texture, 36 arithmetic)
