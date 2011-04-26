//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/REFRACT2000.pso /Fcshaderdump19/REFRACT2000.pso.dis
//
//
#define	OverlaySpace	Src1
#define	ScreenSpace	Src0
// Parameters:
//
sampler2D ScreenSpace : register(s0);
sampler2D OverlaySpace : register(s1);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
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

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float1 q1;
    float4 r0;
    float2 r1;
    float4 t0;
    float4 t2;

    r0.xyz = tex2D(OverlaySpace, IN.OverlayOffset.xy);
    t0.xyzw = tex2D(ScreenSpace, IN.ScreenOffset.xy);
    q1.x = r0.z * (r0.y - 0.5);
    r1.x = IN.ScreenOffset.x - (2 * (r0.z * (r0.x - 0.5)));	// [0,1] to [-1,+1]
    r1.y = (2 * q1.x) + IN.ScreenOffset.y;
    r0.xyz = tex2D(OverlaySpace, r1.xy);
    t2.xyzw = tex2D(ScreenSpace, r1.xy);
    r0.xyzw = (q1.x == 0 ? t0.xyzw : t2.xyzw);
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = r0.xyz;

    return OUT;
};

// approximately 15 instruction slots used (4 texture, 11 arithmetic)
