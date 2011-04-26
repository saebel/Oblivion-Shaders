//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1006.pso /Fcshaderdump19/STB1006.pso.dis
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
    float3 input_0 : COLOR0;
    float4 DiffuseUV : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 output_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;

    IN.DiffuseUV.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);
    r0.xyz = IN.DiffuseUV.xyz * IN.input_0.xyz;
    r0.w = IN.DiffuseUV.w;
    OUT.output_0.xyzw = r0.xyzw;

    return OUT;
};

// approximately 2 instruction slots used (1 texture, 1 arithmetic)
