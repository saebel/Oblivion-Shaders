//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATERHMAP000.pso /Fcshaderdump19/WATERHMAP000.pso.dis
//
//
// Parameters:
//
//   float Time;
//   sampler2D amplitudeSamp;
//   sampler2D freqSamp;
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

    const float4 const_1 = {(1.0 / (PI * 2)), 0.5, PI * 2, -PI};
    const int4 const_2 = {0, 1, 0, 0};
    const float4 const_3 = {D3DSINCOSCONST1};
    const float4 const_4 = {D3DSINCOSCONST2};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D amplitudeSamp;
    sampler2D freqSamp;
    r1.xyzw = tex2D(freqSamp, IN.texcoord_0.xy);
    r0.xyzw = tex2D(amplitudeSamp, IN.texcoord_0.xy);
    r2.w = r1.x * Time.x;
    r1.w = -r1.x * Time.x;
    r2.w = (r2.w * (1.0 / (PI * 2))) + 0.5;
    r2.w = frac(r2.w);
    r3.w = (r2.w * PI * 2) - PI;
    r2.x = cos(r3.w);
    r2.y = sin(r3.w);
    r3.w = r0.y * r2.y;
    r2.w = r0.y * r2.x;
    r1.w = (r1.w * (1.0 / (PI * 2))) + 0.5;
    r1.w = frac(r1.w);
    r2.x = (r0.x * r2.x) - r3.w;
    r3.w = (r1.w * PI * 2) - PI;
    r1.x = cos(r3.w);
    r1.y = sin(r3.w);
    r2.y = (r0.x * r2.y) + r2.w;
    r1.w = r0.w * r1.y;
    r0.x = (r0.z * r1.x) + r1.w;
    r0.w = r0.w * r1.x;
    r0.y = (r0.z * r1.y) - r0.w;
    r0.xy = r2.xy + r0.xy;
    r0.z = 0;
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;

// approximately 38 instruction slots used (2 texture, 36 arithmetic)
