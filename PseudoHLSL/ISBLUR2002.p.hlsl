//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2002.pso /Fcshaderdump19/ISBLUR2002.pso.dis
//
//
// Parameters:
//
sampler2D Src0 : register(s0);
float4 blurParams : register(c1);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   blurParams   const_1       1
//   Src0         texture_0       1
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

    const float4 const_0 = {0.5, (1.0 / 18), (1.0 / 9), 0.05};

    float3 q0;
    float3 q1;
    float2 q10;
    float2 q2;
    float2 q3;
    float2 q4;
    float2 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;
    float4 r7;
    float4 r8;

    r0.xyz = const_0.xyz;
    r7.y = (blurParams.y * r0.y) + (IN.texcoord_0.y - (blurParams.y * r0.x));
    r7.x = (blurParams.x * r0.y) + (IN.texcoord_0.x - (blurParams.x * r0.x));
    r8.xy = (r0.z * blurParams.xy) + r7.xy;
    r7.xyzw = tex2D(Src0, r7.xy);
    q2.xy = (r0.z * blurParams.xy) + r8.xy;
    r8.xyzw = tex2D(Src0, r8.xy);
    r6.xyzw = tex2D(Src0, q2.xy);
    q3.xy = (r0.z * blurParams.xy) + q2.xy;
    r5.xyzw = tex2D(Src0, q3.xy);
    q4.xy = (r0.z * blurParams.xy) + q3.xy;
    r4.xyzw = tex2D(Src0, q4.xy);
    q9.xy = (r0.z * blurParams.xy) + q4.xy;
    r3.xyzw = tex2D(Src0, q9.xy);
    q10.xy = (r0.z * blurParams.xy) + q9.xy;
    r2.xyzw = tex2D(Src0, q10.xy);
    r1.xy = (r0.z * blurParams.xy) + q10.xy;
    r0.xyzw = tex2D(Src0, (r0.z * blurParams.xy) + r1.xy);
    r1.xyzw = tex2D(Src0, r1.xy);
    q0.xyz = (0.3 * r4.xyz) + ((0.15 * r5.xyz) + ((0.075 * r6.xyz) + ((0.025 * r7.xyz) + (r8.xyz * 0.05))));
    q1.xyz = (0.025 * r0.xyz) + ((0.05 * r1.xyz) + ((0.075 * r2.xyz) + ((0.15 * r3.xyz) + q0.xyz)));
    OUT.color_0.a = 1;
    OUT.color_0.rgb = q1.xyz;

    return OUT;
};

// approximately 33 instruction slots used (9 texture, 24 arithmetic)
