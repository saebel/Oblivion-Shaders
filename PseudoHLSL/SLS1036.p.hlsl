//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1036.pso /Fcshaderdump19/SLS1036.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D DiffuseMap;
float4 EmittanceColor;
sampler2D GlowMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   EmittanceColor const_6       1
//   DiffuseMap     texture_0       1
//   GlowMap        texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 DiffuseUV : TEXCOORD0;
    float2 GlowUV : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;
    float4 r1;

    r1.xyzw = tex2D(GlowMap, IN.GlowUV.xy);
    r0.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = (r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb;

    return OUT;
};

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
