//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PARTICLE.pso /Fcshaderdump19/PARTICLE.pso.dis
//
//
// Parameters:
//
//   sampler2D SourceTexture;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   SourceTexture SourceTexture       1
//

    color input_0;
    texcoord input_0.xy;			// partial precision
    sampler SourceTexture;
    r0 = SourceTexture[texcoord_0];			// partial precision
    r0 = r0 * input_0;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
