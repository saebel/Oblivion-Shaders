//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE006.pso
//    /Fcshaderdump19/WATERDISPLACE006.pso.dis
//
//
// Parameters:
//
//   float BlendAmount;
//   sampler2D HeightMap01;
//   sampler2D HeightMap02;
//   float fDamp;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BlendAmount  BlendAmount       1
//   fDamp        fDamp       1
//   HeightMap01  HeightMap01       1
//   HeightMap02  HeightMap02       1
//

    const_0 = {0.800000012, 1, 0, 0};
    texcoord input_0.xy;
    sampler HeightMap01;
    sampler HeightMap02;
    r1 = HeightMap02[texcoord_0];
    r0 = HeightMap01[texcoord_0];
    abs r2.w, r1.x
    r0.w = 1.0 / fDamp.x;
    r0.w = r0.w * const_0.x;
    abs r1.w, r0.x
    r2.w = (r0.w * -r1.w) - r2.w;
    r2.w = r2.w * BlendAmount.x;
    r0.xyz = (r0.w * r1.w) - r2.w;
    r0.w = const_0.y;
    rendertarget_0 = r0;

// approximately 11 instruction slots used (2 texture, 9 arithmetic)