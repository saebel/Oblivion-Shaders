//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2059.pso /Fcshaderdump19/SLS2059.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BaseMap      BaseMap       1
//

    texcoord input_0.xy;			// partial precision
    texcoord input_1;			// partial precision
    sampler BaseMap;
    r0 = BaseMap[texcoord_0];			// partial precision
    r1.w = 1.0 / texcoord_1.w;			// partial precision
    r1.w = r1.w * texcoord_1.z;			// partial precision
    r0.xyz = sat(r1.w);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 5 instruction slots used (1 texture, 4 arithmetic)