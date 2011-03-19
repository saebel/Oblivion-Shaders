//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1036.pso /Fcshaderdump19/SLS1036.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D DiffuseMap;
//   float4 EmittanceColor;
//   sampler2D GlowMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   AmbientColor       1
//   EmittanceColor EmittanceColor       1
//   DiffuseMap     DiffuseMap       1
//   GlowMap        GlowMap       1
//

    texcoord input_0.xy;
    texcoord input_1.xy;
    sampler DiffuseMap;
    sampler GlowMap;
    r1 = GlowMap[texcoord_1];
    r0 = DiffuseMap[texcoord_0];
    r0.xyz = EmittanceColor;
    r0.xyz = (r1 * r0) + AmbientColor;
    rendertarget_0 = r0;

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
