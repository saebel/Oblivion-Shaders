//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISHIT2002.pso /Fcshaderdump19/ISHIT2002.pso.dis
//
//
#define	OverlaySpace	Src1
// Parameters:
//
sampler2D Src0 : register(s0);
sampler2D OverlaySpace : register(s1);
float4 blurParams : register(c1);
float4 doubleVisParams : register(c2);
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   blurParams      const_1       1
//   doubleVisParams const_2       1
//   Src0            texture_0       1
//   OverlaySpace            texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
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
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float1 q1;
    float1 q2;
    float2 r0;
    float4 r1;
    float4 r2;
    float3 t3;

    t3.xyz = tex2D(OverlaySpace, IN.OverlayOffset.xy);
    r0.xy = IN.texcoord_0.xy - doubleVisParams.xy;
    r1.y = max(r0.y, 1 - doubleVisParams.w);
    r1.x = max(r0.x, 0);
    r2.xy = IN.texcoord_0.xy + doubleVisParams.xy;
    r0.y = min(r2.y, 1);
    r0.x = min(doubleVisParams.z, r2.x);
    r2.xyzw = tex2D(Src0, r1.xy);
    r1.xyzw = tex2D(Src0, r0.xy);
    q1.x = 2 * ((doubleVisParams.z / doubleVisParams.w) * (IN.OverlayOffset.x - 0.5));	// [0,1] to [-1,+1]
    q2.x = min(sqrt(sqr(q1.x) + (expand(IN.OverlayOffset.y) * expand(IN.OverlayOffset.y))) * blurParams.z, 1);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = (0.5 * ((r2.xyz + r1.xyz) * (1 - q2.x))) + (t3.xyz * q2.x);

    return OUT;
};

// approximately 31 instruction slots used (3 texture, 28 arithmetic)
