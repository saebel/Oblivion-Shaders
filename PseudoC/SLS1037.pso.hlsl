//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1037.pso /Fcshaderdump19/SLS1037.pso.dis
//
//
// Parameters:
//
//   float4 EmittanceColor;
//   sampler2D GlowMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   EmittanceColor EmittanceColor       1
//   GlowMap        GlowMap       1
//

    const_0 = {0, 0, 0, 0};
    texcoord input_1.xy;
    sampler GlowMap;
    r0 = GlowMap[texcoord_1];
    r0.w = r0.x * EmittanceColor.x;
    r0.xyz = const_0.x;
    rendertarget_0 = r0;

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
