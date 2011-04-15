//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2003.pso /Fcshaderdump19/ISBLUR2003.pso.dis
//
//
#define	OverlaySpace	Src1
#define	ScreenSpace	Src0
// Parameters:
//
sampler2D ScreenSpace;
sampler2D OverlaySpace;
float4 blendW;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   blendW       const_0       1
//   ScreenSpace         texture_0       1
//   OverlaySpace         texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 ScreenOffset : TEXCOORD0;
    float2 OverlayOffset : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;
    float3 t0;

    t0.xyz = tex2D(OverlaySpace, IN.OverlayOffset.xy);
    r0.xyzw = tex2D(ScreenSpace, IN.ScreenOffset.xy);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = (blendW.x * r0.xyz) + (t0.xyz * blendW.y);

    return OUT;
};

// approximately 6 instruction slots used (2 texture, 4 arithmetic)