//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1000.pso /Fcshaderdump19/STB1000.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D DiffuseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor AmbientColor       1
//   DiffuseMap   DiffuseMap       1
//

    ps_1_3
    tex texcoord_0
    r0.xyz = AmbientColor;
  + r0.w = texcoord_0.w;

// approximately 2 instruction slots used (1 texture, 1 arithmetic)
