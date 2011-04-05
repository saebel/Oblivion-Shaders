//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/GRASS2005.pso /Fcshaderdump19/GRASS2005.pso.dis
//
//
// Parameters:

float4 AlphaTestRef;
sampler2D AttMap;
sampler2D DiffuseMap;
float4 PointLightColor;
sampler2D ShadowMap;
sampler2D ShadowMaskMap;


// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   PointLightColor const_2       1
//   AlphaTestRef    const_3       1
//   DiffuseMap      texture_0       1
//   AttMap          texture_1       1
//   ShadowMap       texture_2       1
//   ShadowMaskMap   texture_3       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float4 texcoord_1 : TEXCOORD1;			// partial precision
    float2 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 color_0 : COLOR0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-1, 1, 0, 0.4};

    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;

    r0.xyzw = tex2D(ShadowMaskMap, IN.texcoord_3.xy);			// partial precision
    r1.xyzw = tex2D(ShadowMap, IN.texcoord_2.xy);			// partial precision
    r1.xyz = (IN.texcoord_3.z * (r0.x * (r1.xyz - 1))) + 1;			// partial precision
    r0.xyz = IN.texcoord_5.xyz;			// partial precision
    r3.xyz = (r1.xyz * r0.xyz) + IN.texcoord_4.xyz;			// partial precision
    r0.x = IN.texcoord_1.z;			// partial precision
    r0.y = IN.texcoord_1.w;			// partial precision
    r1.xyzw = tex2D(AttMap, r0.xy);			// partial precision
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);			// partial precision
    r0.w = (((AlphaTestRef.x - r0.w) >= 0.0 ? 1 : 0)) * IN.texcoord_5.w;			// partial precision
    r2.xyzw = tex2D(AttMap, IN.texcoord_1.xy);			// partial precision
    r1.xyz = (saturate((1 - r2.x) - r1.x) * (0.4 * PointLightColor.rgb)) + r3.xyz;			// partial precision
    r0.xyz = (r0.xyz * r1.xyz) + (((-r0.xyz * r1.xyz) + IN.color_0.rgb) * IN.color_0.a);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 24 instruction slots used (5 texture, 19 arithmetic)
