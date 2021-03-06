//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STFROND2001.pso /Fcshaderdump19/STFROND2001.pso.dis
//
//
// Parameters:
//
sampler2D DiffuseMap : register(s0);
float SunlightDimmer : register(c0);
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   SunlightDimmer const_0       1
//   DiffuseMap     texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 DiffuseUV : TEXCOORD0;
    float3 color_0 : COLOR0;
    float3 color_1 : COLOR1;
    float4 texcoord_1 : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float3 q0;
    float4 r0;

    r0.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);
    q0.xyz = (SunlightDimmer.x * IN.color_1.rgb) + IN.color_0.rgb;
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = (r0.xyz * q0.xyz) + ((IN.texcoord_1.xyz - (r0.xyz * q0.xyz)) * IN.texcoord_1.w);

    return OUT;
};

// approximately 7 instruction slots used (1 texture, 6 arithmetic)
