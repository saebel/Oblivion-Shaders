//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STLEAF2001.pso /Fcshaderdump19/STLEAF2001.pso.dis
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

    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision
    texcoord input_2;			// partial precision
    sampler DiffuseMap;
    r0 = DiffuseMap[texcoord_0];			// partial precision
    r1.xyz = texcoord_1;			// partial precision
    r1.xyz = (-r0 * r1) + texcoord_2;			// partial precision
    r1.xyz = r1 * texcoord_2.w;			// partial precision
    r0.xyz = (r0 * texcoord_1) + r1;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 6 instruction slots used (1 texture, 5 arithmetic)