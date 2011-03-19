//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STFROND2001.pso /Fcshaderdump19/STFROND2001.pso.dis
//
//
// Parameters:
//
//   sampler2D DiffuseMap;
//   float SunlightDimmer;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   SunlightDimmer SunlightDimmer       1
//   DiffuseMap     DiffuseMap       1
//

    texcoord input_0.xy;
    color input_0.xyz;
    color input_1.xyz;
    texcoord input_1;
    sampler DiffuseMap;
    r0 = DiffuseMap[texcoord_0];
    r1.xyz = input_1;
    r1.xyz = (SunlightDimmer.x * r1) + input_0;
    r2.xyz = (-r0 * r1) + texcoord_1;
    r2.xyz = r2 * texcoord_1.w;
    r0.xyz = (r0 * r1) + r2;
    rendertarget_0 = r0;

// approximately 7 instruction slots used (1 texture, 6 arithmetic)
