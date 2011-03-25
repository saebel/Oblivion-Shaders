//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/BOLT.pso /Fcshaderdump19/BOLT.pso.dis
//
//
// Parameters:
//
//   float4 CoreColor;
//   float4 GlowColor;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   CoreColor    const_0       1
//   GlowColor    const_1       1
//

    const int4 const_2 = {1, 0, 0, 0};
    float4 IN.color_0 : COLOR0;
    float texcoord_0 : TEXCOORD0;			// partial precision
    r1.w = const_2.x - IN.texcoord_0.x;			// partial precision
    r0.w = IN.texcoord_0.x + const_2.x;			// partial precision
    r1.w = (IN.texcoord_0.x <= 0.0 ? r1.w : r0.w);			// partial precision
    r0.w = r1.w * r1.w;			// partial precision
    r0.w = r0.w * r0.w;			// partial precision
    r0.w = r1.w * r0.w;			// partial precision
    r0.xyz = r1.w * GlowColor;			// partial precision
    r0.xyz = (r0.w * CoreColor) + r0;			// partial precision
    r0.w = IN.color_0.a;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 10 instruction slots used
