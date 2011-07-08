//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR003.pso /Fcshaderdump19/HDR003.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
sampler2D ScreenSpace : register(s0);
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

    float3 t0;

    /* original shader ---------------------------------------
     *
     * plain copy
     */

    t0.xyz = tex2D(ScreenSpace, IN.ScreenOffset.xy);

    OUT.color_0.a = 1;
    OUT.color_0.rgb = t0.xyz;

    // - full screen Shader
    // - copy input to output, set w to 1
    //
    // out . xyzw = [in . xyz,1]

    return OUT;
};

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
