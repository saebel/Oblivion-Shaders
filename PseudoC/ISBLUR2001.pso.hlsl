//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2001.pso /Fcshaderdump19/ISBLUR2001.pso.dis
//
//
// Parameters:
//
//   sampler2D Src0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Src0         Src0       1
//

    texcoord input_0.xy;
    sampler Src0;
    r0 = Src0[texcoord_0];
    rendertarget_0 = r0;

// approximately 2 instruction slots used (1 texture, 1 arithmetic)
