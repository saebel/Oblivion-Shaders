//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR007.pso /Fcshaderdump19/HDR007.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
float4 HDRParam : register(c1);
sampler2D ScreenSpace : register(s0);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   HDRParam     const_1       1
//   ScreenSpace         texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 ScreenOffset : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float3 t0;

    t0.xyz = tex2D(ScreenSpace, IN.ScreenOffset.xy);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = t0.xyz * (min(max(0.01, length(t0.xyz)), HDRParam.x) / max(0.01, length(t0.xyz)));

    return OUT;
};

// approximately 11 instruction slots used (1 texture, 10 arithmetic)
