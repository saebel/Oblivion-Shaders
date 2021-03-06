//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATERHMAP000.pso /Fcshaderdump19/WATERHMAP000.pso.dis
//
//
// Parameters:
//
float Time : register(c0);
sampler2D amplitudeSamp : register(s0);
sampler2D freqSamp : register(s1);
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   Time          const_0       1
//   amplitudeSamp texture_0       1
//   freqSamp      texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5
#define	PI			3.14159274
#define	anglei(v)		(((v) + PI) / (2 * PI))
#define	angler(v)		(((v) * (2 * PI)) - PI)
#define	fracr(v)		angler(frac(anglei(v)))	// signed modulo % PI
#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float1 q1;
    float1 q4;
    float4 r0;
    float2 r2;
    float1 t0;

    t0.x = tex2D(freqSamp, IN.texcoord_0.xy);
    r0.xyzw = tex2D(amplitudeSamp, IN.texcoord_0.xy);
    q1.x = fracr(t0.x * Time.x);	// [0,1] to [-PI,PI]
    q4.x = fracr(-t0.x * Time.x);	// [0,1] to [-PI,PI]
    r2.y = (r0.x * sin(q1.x)) + (r0.y * cos(q1.x));
    r2.x = (r0.x * cos(q1.x)) - (r0.y * sin(q1.x));
    r0.y = (r0.z * sin(q4.x)) - (r0.w * cos(q4.x));
    r0.x = (r0.z * cos(q4.x)) + (r0.w * sin(q4.x));
    r0.xy = r2.xy + r0.xy;
    r0.z = 0;
    OUT.color_0.a = 1;
    OUT.color_0.rgb = r0.xyz;

    return OUT;
};

// approximately 38 instruction slots used (2 texture, 36 arithmetic)
