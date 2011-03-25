//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PRECIP003.vso /Fcshaderdump19/PRECIP003.vso.dis
//
//
// Parameters:

float3 CameraUp;
float3 EyePosition;
float3 MaxPos;
float3 MinPos;
float3 Params;
float3 Velocity;
row_major float4x4 WorldViewProj;

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

#define	PI	3.14159274

    const float4 const_4 = {PI * 2, -PI, 0, 0};
    const float4 const_5 = {0, (1.0 / (PI * 2)), 0.5, 1};
    const int4 const_6 = {-1, 0, 1, 0};
    float3 r0, r1, r2, r3, r4, r5, r6;
    float4 t0, t1;

    r3.xyz = (Params.x * Velocity) + IN.texcoord_1;

    r1.xyz =      MaxPos;
    r2.xyz = r1 - MinPos;
    r3.xyz = r3 - MinPos;

    r4.x = 1.0 / r2.x;
    r4.y = 1.0 / r2.y;
    r4.z = 1.0 / r2.z;

    r3.xyz = r3 * r4;
    r5.xyz = frac(abs(r3));
    r4.xyz = (r3 >= -r3 ? 1.0 : 0.0);
    r3.xyz = lerp(r5, -r5, r4);
    r3.xyz = r2 * r3;
    r4.xyz = abs(r3) + MinPos;
    r5.xyz = MaxPos - abs(r3);
    r0.xyz = (0 < Velocity ? 1.0 : 0.0);
    r3.xyz = lerp(r4, r5, r0);

    r4.xyz = r3 - EyePosition;
    r5.xyz = normalize(-r4);

    t0.w = (Params.z * Params.x) + IN.texcoord_1.x;
    t0.w = (t0.w * const_5.y) + 0.5;
    t0.w = frac(t0.w);
    t1.w = (t0.w * const_4.x) + const_4.y;

    float c = cos(t1.w);
    float s = sin(t1.w);

    r6.xyz = float3(  1 * c, 0 * c, 1 * s );
    r4.xyz = float3( -1 * s, 0 * c, 1 * s );

    r0.xyz = r5.yzx * CameraUp.zxy;
    t0.w = dot(r6, IN.position);
    r6.xyz = (CameraUp.yzx * r5.zxy) - r0;
    r5.xyz = r5 * IN.position.y;
    r0.xyz = normalize(r6);
    r0.xyz = (t0.w * r0) + r5;
    t0.w = dot(r4, IN.position);
    r0.xyz = (t0.w * CameraUp) + r0;
    r1.xyz = (-0.5 * abs(r2)) + r1;

    r2.x = 1.0 / abs(r2.x);
    r2.y = 1.0 / abs(r2.y);
    r2.z = 1.0 / abs(r2.z);

    r1.xyz = r1 - r3;
    r0.xyz = r3 + r0;
    r1.xyz = r2 * r1;

    t0.w = 1;
    t1.w = 1 - length(r1.xyz);

    OUT.position.x = dot(WorldViewProj[0], r0);
    OUT.position.y = dot(WorldViewProj[1], r0);
    OUT.position.z = dot(WorldViewProj[2], r0);
    OUT.position.w = dot(WorldViewProj[3], r0);
    OUT.color_0.rgb = 1;
    OUT.color_0.a = t1.w * t1.w;
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 60 instruction slots used
