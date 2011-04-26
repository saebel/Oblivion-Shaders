//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa SLS2070.pso /FcSLS2070.pso.dis
//
//
// Parameters:
//
sampler2D BaseMap : register(s0);
sampler2D GlowMap : register(s1);
float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   PSLightColor[1] const_3        1
//   PSLightColor[2] const_4        1
//   BaseMap      texture_0       1
//   GlowMap      texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float2 GlowUV : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float1 q0;
    float4 r0;
    float4 r1;
    float4 r2;

    r1.xyzw = tex2D(GlowMap, IN.GlowUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q0.x = dot(PSLightColor[1].rgba, IN.color_0.rgba) + dot(PSLightColor[2].rgba, IN.color_1.rgba);			// partial precision
    r2.w = saturate(((q0.x * 2) + r0.w) - 1);			// partial precision
    r2.xyz = (r0.xyz * r1.xyz) * IN.texcoord_2.xyz;			// partial precision
    OUT.color_0.rgba = r2.xyzw;			// partial precision

    return OUT;
};

// approximately 10 instruction slots used (2 texture, 8 arithmetic)
