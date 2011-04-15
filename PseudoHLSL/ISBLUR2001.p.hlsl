//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2001.pso /Fcshaderdump19/ISBLUR2001.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
sampler2D ScreenSpace;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
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

    float4 r0;

    r0.xyzw = tex2D(ScreenSpace, IN.ScreenOffset.xy);
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = r0.xyz;

    return OUT;
};

// approximately 2 instruction slots used (1 texture, 1 arithmetic)
