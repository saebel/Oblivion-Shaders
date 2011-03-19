//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE007.pso
//    /Fcshaderdump19/WATERDISPLACE007.pso.dis
//
//
// Parameters:
//
//   sampler2D DisplaySampler;
//   float2 TextureOffset;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   TextureOffset  TextureOffset       1
//   DisplaySampler DisplaySampler       1
//

    const_0 = {-0.5, 0, -0.400000006, 10};
    const_1 = {0.5, 0.5, 0.5, 1};
    texcoord input_0.xy;
    sampler DisplaySampler;
    r0.xy = texcoord_0 - const_0.x;
    dp2r0.w = r0 - r0;, const_0.y
    r0.w = 1.0 / sqrt(r0.w);
    r0.w = 1.0 / r0.w;
    r0.w = r0.w - const_0.z;
    r2.w = sat(r0.w * const_0.w);
    r0.xy = texcoord_0 - TextureOffset;
    r1 = DisplaySampler[r0];
    r0 = r2.w * (const_1 - r1) + r1;
    rendertarget_0 = r0;

// approximately 11 instruction slots used (1 texture, 10 arithmetic)
