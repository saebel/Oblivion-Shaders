//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/DEBUG.pso /Fcshaderdump19/DEBUG.pso.dis
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
//   Src0         texture_0       1
//

    IN.texcoord_0.xyzw = tex2D(Src0, texcoord_0);
    r0.xyzw = IN.texcoord_0;

// approximately 2 instruction slots used (1 texture, 1 arithmetic)
