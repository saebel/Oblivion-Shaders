//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1031.pso /Fcshaderdump19/SLS1031.pso.dis
//
//
// Parameters:
//
sampler2D DiffuseMap : register(s0);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   DiffuseMap   texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 DiffuseUV : TEXCOORD0;
    float4 color_0 : COLOR0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;

    r0.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);
    OUT.color_0.a = r0.w * IN.color_0.a;
    OUT.color_0.rgb = IN.color_0.rgb;

    return OUT;
};

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
