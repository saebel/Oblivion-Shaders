//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATERHMAP005.pso /Fcshaderdump19/WATERHMAP005.pso.dis
//
//
// Parameters:

sampler2D amplitudeSamp;
int fResolution;

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

    const int2 const_1 = {-1, 1};

    float2 p6; p6.xy = (fResolution.x * -const_1) + IN.texcoord_0;
    float2 p7; p7.x = p6.x;
               p7.y = IN.texcoord_0.y;
    float2 p4; p4.xy = IN.texcoord_0 - fResolution.x;
    float2 p5; p5.x = p4.x;
               p5.y = IN.texcoord_0.y;
    float2 p3; p3.xy = (fResolution.x * const_1) + IN.texcoord_0;
    float2 p2; p2.xy = IN.texcoord_0 + fResolution.x;
    float2 p1; p1.x = IN.texcoord_0.x;
               p1.y = p4.y;
    float2 p0; p0.x = IN.texcoord_0.x;
               p0.y = p3.y;

    float  a6 = tex2D(amplitudeSamp, p6);
    float  a7 = tex2D(amplitudeSamp, p7);
    float  a5 = tex2D(amplitudeSamp, p5);
    float  a4 = tex2D(amplitudeSamp, p4);
    float  a3 = tex2D(amplitudeSamp, p3);
    float  a2 = tex2D(amplitudeSamp, p2);
    float  a1 = tex2D(amplitudeSamp, p1);
    float  a0 = tex2D(amplitudeSamp, p0);
    float4 aa;

    float r0, r1, r2, r3, r4, r5;

    r5 = (abs(a4) *      0.8);
    r1 = (abs(a5) * -2 * 0.8) - r5;
    r1 = (abs(a3) * -    0.8) + r1;
    r1 = (abs(a6) *      0.8) + r1;
    r0 = (abs(a7) *  2 * 0.8) + r1;
    r0 = (abs(a2) *      0.8) + r0;
    r4 = (abs(a1) * -2 * 0.8) - r5;
    r3 = (abs(a6) * -    0.8) + r4;
    r3 = (abs(a3) *      0.8) + r3;

    aa.x =                - r0;
    aa.y = (a2 *     0.8) + r0;
    aa.z =       1            ;
    aa.w = (a0 * 2 * 0.8) + r3;

    aa.xy = normalize(aa);
    aa = (0.5 * aa) + 0.5;

    OUT.color_0.xyz = aa;
    OUT.color_0.w = aa;

    return OUT;
};

// approximately 48 instruction slots used (8 texture, 40 arithmetic)
