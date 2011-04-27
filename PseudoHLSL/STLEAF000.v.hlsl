//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STLEAF000.vso /Fcshaderdump19/STLEAF000.vso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c5);
float4 BillboardRight : register(c13);
float4 BillboardUp : register(c14);
float4 DiffColor : register(c6);
float4 LeafBase[48];
float4 LeafLighting : register(c17);
float4 LightVector : register(c11);
row_major float4x4 ModelViewProj : register(c0);
float4 RockParams : register(c15);
float4 RustleParams : register(c16);
float SunDimmer : register(c10);
float4 WindMatrices[16];
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   AmbientColor   const_5       1
//   DiffColor      const_6       1
//   SunDimmer      const_10      1
//   LightVector    const_11      1
//   BillboardRight const_13      1
//   BillboardUp    const_14      1
//   RockParams     const_15      1
//   RustleParams   const_16      1
//   LeafLighting   const_17      1
//   WindMatrices[0]   const_18      4
//   WindMatrices[1]   const_19      4
//   WindMatrices[2]   const_20      4
//   WindMatrices[3]   const_21      4
//   LeafBase[0]       const_34     48
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
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
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_4 = {(1.0 / (PI * 2)), 0.25, 0.5, 0};

    float1 q0;
    float1 q1;
    float2 q11;
    float1 q12;
    float3 q14;
    float1 q2;
    float4 q28;
    float2 q3;
    float2 q5;
    float4 q59;
    float1 q6;
    float1 q7;
    float1 q8;
    float2 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float1 r4;
    float1 r5;

    q6.x = angler(exp2((((IN.blendindices.z / 48) + RustleParams.y) * 0.499999553) + 0.25));	// [0,1] to [-PI,PI]
    q7.x = sqr(q6.x);
    q0.x = angler(exp2((((IN.blendindices.z / 48) + RockParams.y) * 0.499999553) + 0.25));	// [0,1] to [-PI,PI]
    q1.x = sqr(q0.x);
    q12.x = IN.blendindices.y;
    r1.zw = BillboardRight.zw;
    r0.z = 0;
    r3.z = 0;
    q8.x = (q7.x * ((q7.x * ((q7.x * -2.52398507e-007) + 2.47609005e-005)) - (1.0 / 72))) + (1.0 / 24);
    q2.x = (q1.x * ((q1.x * ((q1.x * -2.52398507e-007) + 2.47609005e-005)) - (1.0 / 72))) + (1.0 / 24);
    q9.xy = (((((q7.x * ((q7.x * q8.x) - 0.5)) + 1) * RustleParams.z) * RustleParams.x) / (PI * 2)) + const_4.yz;
    r1.xy = angler(frac(q9.xy)) * angler(frac(q9.xy));
    q3.xy = (((((q1.x * ((q1.x * q2.x) - 0.5)) + 1) * RockParams.z) * RockParams.x) / (PI * 2)) + const_4.yz;
    r0.xy = angler(frac(q3.xy)) * angler(frac(q3.xy));
    q11.xy = (((((-2.52398507e-007 * r1.xy) + 2.47609005e-005) * r1.xy) - (1.0 / 72)) * r1.xy) + (1.0 / 24);
    r3.xy = (q11.xy * r1.xy) - 0.5;
    r3.xw = (r1.yx * r3.yx) + 1;
    r3.y = -r3.w;
    r1.y = dot(r3.wxz, BillboardRight.xyz);
    r1.x = dot(r3.xyz, BillboardRight.xyz);
    q5.xy = (((((-2.52398507e-007 * r0.xy) + 2.47609005e-005) * r0.xy) - (1.0 / 72)) * r0.xy) + (1.0 / 24);
    r2.xy = (q5.xy * r0.xy) - 0.5;
    r0.xw = (r0.yx * r2.yx) + 1;
    r2.xyzw = IN.blendindices.w * LeafBase[IN.blendindices.z];
    q14.xyz = normalize((LeafLighting.y * (r2.xyz / length(r2.xyzw))) + IN.normal.xyz);
    r0.y = -r0.w;
    r4.x = dot(r0.zwx, r2.xyz);
    r5.x = dot(r0.zxy, r2.xyz);
    r0.y = dot(r3.wxz, BillboardUp.xyz);
    r0.x = dot(r3.xyz, BillboardUp.xyz);
    r0.zw = BillboardUp.zw;
    q59.xyzw = ((r4.x * r0.xyzw) + (r5.x * r1.xyzw)) + IN.position.xyzw;
    q28.xyzw = mul(float4x4(WindMatrices[0 + q12.x].xyzw, WindMatrices[1 + q12.x].xyzw, WindMatrices[2 + q12.x].xyzw, WindMatrices[3 + q12.x].xyzw), q59.xyzw);
    OUT.position.xyzw = mul(ModelViewProj, (IN.blendindices.x * (q28.xyzw - q59.xyzw)) + q59.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    r0.xyzw = (SunDimmer.x * (shades(q14.xyz, LightVector.xyz) * DiffColor.rgba)) + AmbientColor.rgba;
    OUT.texcoord_1.w = r0.w;
    OUT.texcoord_1.xyz = r0.xyz * exp2(IN.blendindices.z);

    return OUT;
};

// approximately 95 instruction slots used
