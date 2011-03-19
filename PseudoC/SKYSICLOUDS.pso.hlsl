//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SKYSICLOUDS.pso /Fcshaderdump19/SKYSICLOUDS.pso.dis
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

    const_0 = {0, 0, 0, 0};
    texcoord input_0.xy;
    texcoord_1 input_1.xy;
    sampler TexMap;
    sampler TexMapBlend;
    r1 = TexMapBlend[input_1];
    r0 = TexMap[input_0];
    r0.z = r1.w - r0.w;
    rendertarget_0.w = (Params.x * r0.z) - r0.w;
    rendertarget_0.xyz = const_0.x;

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
