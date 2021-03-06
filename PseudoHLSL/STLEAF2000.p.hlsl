//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STLEAF2000.pso /Fcshaderdump19/STLEAF2000.pso.dis
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
    float2 DiffuseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;

    r0.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);			// partial precision
    OUT.color_0.a = r0.w;			// partial precision
    OUT.color_0.rgb = r0.xyz * IN.texcoord_1.xyz;			// partial precision

    return OUT;
};

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
