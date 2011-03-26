//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2002.pso /Fcshaderdump19/ISBLUR2002.pso.dis
//
//
// Parameters:
//
//   sampler2D Src0;
//   float4 blurParams;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   blurParams   const_1       1
//   Src0         texture_0       1
//

    const float4 const_0 = {0.5, (1.0 / 18), (1.0 / 9), 0.05};
    const float4 const_2 = {0.025, 0.075, 0.15, 0.3};
    const int4 const_3 = {1, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D Src0;
    r0.xyz = const_0;
    r0.w = (blurParams.x * -r0.x) + IN.texcoord_0.x;
    r7.x = (blurParams.x * r0.y) + r0.w;
    r0.w = (blurParams.y * -r0.x) + IN.texcoord_0.y;
    r7.y = (blurParams.y * r0.y) + r0.w;
    r8.xy = (r0.z * blurParams) + r7;
    r6.xy = (r0.z * blurParams) + r8;
    r5.xy = (r0.z * blurParams) + r6;
    r4.xy = (r0.z * blurParams) + r5;
    r3.xy = (r0.z * blurParams) + r4;
    r2.xy = (r0.z * blurParams) + r3;
    r1.xy = (r0.z * blurParams) + r2;
    r0.xy = (r0.z * blurParams) + r1;
    r7 = tex2D(Src0, r7);
    r8 = tex2D(Src0, r8);
    r6 = tex2D(Src0, r6);
    r5 = tex2D(Src0, r5);
    r4 = tex2D(Src0, r4);
    r3 = tex2D(Src0, r3);
    r2 = tex2D(Src0, r2);
    r1 = tex2D(Src0, r1);
    r0 = tex2D(Src0, r0);
    r8.xyz = r8 * 0.05;
    r7.xyz = (0.025 * r7) + r8;
    r6.xyz = (0.075 * r6) + r7;
    r5.xyz = (0.15 * r5) + r6;
    r4.xyz = (0.3 * r4) + r5;
    r3.xyz = (0.15 * r3) + r4;
    r2.xyz = (0.075 * r2) + r3;
    r1.xyz = (0.05 * r1) + r2;
    r0.xyz = (0.025 * r0) + r1;
    r0.w = 1;
    OUT.color_0 = r0;

// approximately 33 instruction slots used (9 texture, 24 arithmetic)
