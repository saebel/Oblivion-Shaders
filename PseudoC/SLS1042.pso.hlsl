//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1042.pso /Fcshaderdump19/SLS1042.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//   sampler2D GlowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BaseMap      BaseMap       1
//   GlowMap      GlowMap       1
//

    const_0 = {1, 0, 0, 0};
    texcoord input_0.xy;
    texcoord input_1.xy;
    texcoord input_2.xyz;
    sampler BaseMap;
    sampler GlowMap;
    r1 = BaseMap[texcoord_0];
    r0 = GlowMap[texcoord_1];
    r1.xyz = r1 * texcoord_2;
    r0.xyz = r0 * r1;
    r0.w = const_0.x;
    rendertarget_0 = r0;

// approximately 6 instruction slots used (2 texture, 4 arithmetic)