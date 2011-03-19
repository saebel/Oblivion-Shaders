//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2037.pso /Fcshaderdump19/SLS2037.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   float4 Toggles;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor PSLightColor       1
//   Toggles      Toggles       1
//   NormalMap    NormalMap       1
//

    const_0 = {-0.5, 0.200000003, 0.5, 0};
    const_1 = {1, 0, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    sampler NormalMap;
    r0 = NormalMap[texcoord_0];			// partial precision
    r1.xyz = norm(texcoord_3);			// partial precision
    r0.xyz = r0 - const_0.x;
    r2.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r2);			// partial precision
    r2.x = sat((r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z));			// partial precision
    pow r1.w, r2.x, Toggles.z			// partial precision
    r1.xyz = norm(texcoord_1);			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r0.x = (r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z);			// partial precision
    r3.w = r0.x - const_0.z;			// partial precision
    r0.w = const_0.y - r0.x;			// partial precision
    r1.w = (r3.w >= const_0.w ? r3.w : const_0.w);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r1.xyz = r0.w * PSLightColor;			// partial precision
    r0.xyz = sat(r1);			// partial precision
    r0.w = (r1.x * const_1.x.x) + (r1.y * const_1.x.y) + (r1.z * const_1.x.z);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 27 instruction slots used (1 texture, 26 arithmetic)
