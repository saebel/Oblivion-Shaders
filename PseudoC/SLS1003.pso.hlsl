//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1003.pso /Fcshaderdump19/SLS1003.pso.dis
//
//
// Parameters:
//
//   sampler2D DiffuseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   DiffuseMap   DiffuseMap       1
//

    texcoord input_0.xy;
    sampler DiffuseMap;
    r0 = DiffuseMap[texcoord_0];
    rendertarget_0 = r0;

// approximately 2 instruction slots used (1 texture, 1 arithmetic)
