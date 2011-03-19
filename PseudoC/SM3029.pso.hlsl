//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3029.pso /Fcshaderdump19/SM3029.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float PSRefractionPower;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   PSRefractionPower PSRefractionPower       1
//   NormalMap         NormalMap       1
//

    const_0 = {-0.5, 0.100000001, -0.100000001, 0.899999976};
    const_1 = {1, 0, 0, 0};
    texcoord input_0.xyz;			// partial precision
    texcoord_1 input_1.xy;			// partial precision
    sampler NormalMap;
    r0 = NormalMap[input_0];
    r0.xy = r0 - const_0.x;
    r0.xy = r0 - r0;			// partial precision
    r1.xy = (r0 < const_0.y ? r0 : const_0.y);			// partial precision
    r0.xy = (const_0.z >= r1 ? const_0.z : r1);			// partial precision
    r0.xy = (const_0.w * r0) + input_1;			// partial precision
    r0.w = 1.0 / input_0.z;			// partial precision
    r0.xy = r0 * r0.w;			// partial precision
    rendertarget_0.xy = (-const_0.x * r0) + -const_0.x;			// partial precision
    r0.xy = const_1;
    rendertarget_0.zw = (PSRefractionPower.x * r0.xyxy) - r0.xyyx;			// partial precision

// approximately 11 instruction slots used (1 texture, 10 arithmetic)
