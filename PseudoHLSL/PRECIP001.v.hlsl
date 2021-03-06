//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PRECIP001.vso /Fcshaderdump19/PRECIP001.vso.dis
//
//
// Parameters:
//
float3 CameraUp : register(c13);
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
//   CameraUp      const_13      1
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

#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float3 eye10;
    float3 q1;
    float3 q20;
    float3 q4;
    float3 q5;
    float3 q7;
    float4 r0;
    float3 r4;

    q20.xyz = MaxPos.xyz - MinPos.xyz;
    q5.xyz = (((Params.x * Velocity.xyz) + IN.texcoord_1.xyz) - MinPos.xyz) / q20.xyz;
    q7.xyz = q20.xyz * (q5.xyz == 0 ? frac(abs(q5.xyz)) : -frac(abs(q5.xyz)));
    q1.xyz = (0 < Velocity.xyz ? (abs(q7.xyz) + MinPos.xyz) : (MaxPos.xyz - abs(q7.xyz)));
    r0.w = 1;
    OUT.color_0.rgb = 1;
    OUT.color_0.a = sqr(1 - length((((-0.5 * abs(q20.xyz)) + MaxPos.xyz) - q1.xyz) / abs(q20.xyz)));
    eye10.xyz = normalize(EyePosition.xyz - q1.xyz);
    r4.xyz = eye10.xyz * IN.position.y;
    q4.xyz = (IN.position.z * CameraUp.xyz) + ((IN.position.x * normalize(cross(CameraUp.xyz, eye10.xyz))) + r4.xyz);
    r0.xyz = q1.xyz + q4.xyz;
    OUT.position.xyzw = mul(WorldViewProj, r0.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 50 instruction slots used
