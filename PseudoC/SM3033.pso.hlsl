//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3033.pso /Fcshaderdump19/SM3033.pso.dis
//
    const_0 = {-0.5, 0.5, 0, 0};
    texcoord input_0.xyz;			// partial precision
    texcoord_1 input_1.x;			// partial precision
    r0.xyz = input_0 - const_0.x;			// partial precision
    r1.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r1);			// partial precision
    rendertarget_0.xyz = (const_0.y * r0) + const_0.y;			// partial precision
    rendertarget_0.w = input_1.x;			// partial precision

// approximately 7 instruction slots used
