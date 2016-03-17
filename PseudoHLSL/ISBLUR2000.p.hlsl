//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2000.pso /Fcshaderdump19/ISBLUR2000.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
sampler2D ScreenSpace : register(s0);
float4 alphaAdd : register(c2);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   alphaAdd     const_2       1
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

#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {0.6, 0.73, 0.8, 1};

    float4 r0;

    r0.xyzw = tex2D(ScreenSpace, IN.ScreenOffset.xy);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = r0.xyz * ((sqr(shades(const_0.xyz, r0.xyz) * alphaAdd.y) + (r0.w * alphaAdd.z)) + alphaAdd.x);

    return OUT;
};

// approximately 9 instruction slots used (1 texture, 8 arithmetic)