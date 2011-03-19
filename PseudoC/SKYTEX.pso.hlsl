//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SKYTEX.pso /Fcshaderdump19/SKYTEX.pso.dis
//
//
// Parameters:
//
//   float2 Params;
//   sampler2D TexMap;
//   sampler2D TexMapBlend;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Params       Params       1
//   TexMap       TexMap       1
//   TexMapBlend  TexMapBlend       1
//

    texcoord input_0.xy;
    texcoord_1 input_1.xy;
    color input_2;
    sampler TexMap;
    sampler TexMapBlend;
    r2 = TexMap[input_0];
    r1 = TexMapBlend[input_1];
    r0 = Params.x * (r1 - r2) + r2;
    r0.xyz = r0 * input_2;
    rendertarget_0.w = r0.w * input_2.w;
    rendertarget_0.xyz = r0 * Params.y;

// approximately 7 instruction slots used (2 texture, 5 arithmetic)
