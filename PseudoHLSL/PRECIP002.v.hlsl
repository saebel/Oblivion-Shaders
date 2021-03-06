//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PRECIP002.vso /Fcshaderdump19/PRECIP002.vso.dis
//
//
// Parameters:
//
float3 EyePosition : register(c8);
float3 MaxPos : register(c11);
float3 MinPos : register(c10);
float3 Params : register(c12);
float3 Velocity : register(c9);
row_major float4x4 WorldViewProj : register(c0);
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WorldViewProj[0] const_0        1
//   WorldViewProj[1] const_1        1
//   WorldViewProj[2] const_2        1
//   WorldViewProj[3] const_3        1
//   EyePosition   const_8       1
//   Velocity      const_9       1
//   MinPos        const_10      1
//   MaxPos        const_11      1
//   Params        const_12      1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float4 color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI			3.14159274
#define	anglei(v)		(((v) + PI) / (2 * PI))
#define	angler(v)		(((v) * (2 * PI)) - PI)
#define	fracr(v)		angler(frac(anglei(v)))	// signed modulo % PI
#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_4 = {0, -1, 1, 0.5};

    float2 eye1;
    float3 q16;
    float1 q2;
    float3 q5;
    float3 q8;
    float4 r0;
    float4 r1;
    float2 r2;
    float4 r3;
    float3 r4;

    q2.x = fracr((Params.z * Params.x) + IN.texcoord_1.x);	// [0,1] to [-PI,PI]
    r2.y = sin(q2.x);
    r2.x = cos(q2.x);
    r3.x = dot(r2.xxy * const_4.zxz, IN.position.xyz);
    r3.z = dot(r2.yxx * const_4.yxz, IN.position.xyz);
    q16.xyz = MaxPos.xyz - MinPos.xyz;
    r3.w = IN.position.y;
    q5.xyz = (((Params.x * Velocity.xyz) + IN.texcoord_1.xyz) - MinPos.xyz) / q16.xyz;
    q8.xyz = q16.xyz * (q5.xyz == 0 ? frac(abs(q5.xyz)) : -frac(abs(q5.xyz)));
    r4.xyz = (0 < Velocity.xyz ? (abs(q8.xyz) + MinPos.xyz) : (MaxPos.xyz - abs(q8.xyz)));
    eye1.xy = r4.xy - EyePosition.xy;
    r1.xy = sqr(eye1.xy);
    r1.xz = normalize(eye1.xy);
    r1.yw = r1.z * const_4.yx;
    r0.xyz = r1.zxw * const_4.yzz;
    r1.xy = r0.xy / sqrt(dot(r1.yxw, r0.xyz));
    r0.w = r1.x;
    r3.y = dot(r1.ywz, r3.xzw);
    r3.x = dot(r0.wzy, r3.xzw);
    r0.xyz = r4.xyz + r3.xyz;
    OUT.color_0.a = sqr(1 - length((((-0.5 * abs(q16.xyz)) + MaxPos.xyz) - r4.xyz) / abs(q16.xyz)));
    OUT.color_0.rgb = 1;
    r0.w = 1;
    OUT.position.xyzw = mul(WorldViewProj, r0.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 62 instruction slots used
