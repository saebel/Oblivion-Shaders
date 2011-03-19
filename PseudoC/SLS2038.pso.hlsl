//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2038.pso /Fcshaderdump19/SLS2038.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor PSLightColor       1
//   NormalMap    NormalMap       1
//

    const_0 = {-0.5, 0.5, 1, 0.699999988};
    const_1 = {30, 0.200000003, 0, 0};
    const_3 = {0, 0, 1, 0.5};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    sampler NormalMap;
    r0 = NormalMap[texcoord_0];			// partial precision
    r0.xyz = r0 - const_0.x;
    r1.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r1);			// partial precision
    r2.xy = r0 * const_0.y;			// partial precision
    r2.w = (r0.z * const_0.y) - const_0.z;			// partial precision
    r1.xyz = (const_3.w * r0) + const_3;			// partial precision
    r1.w = r2.x * r1.x;
    r1.w = (r2.y * r1.y) - r1.w;
    r1.w = (r2.w * r1.z) - r1.w;			// partial precision
    r1.w = 1.0 / sqrt(r1.w);			// partial precision
    r2.xyz = r1 * r1.w;			// partial precision
    r1.xyz = norm(texcoord_3);			// partial precision
    r3.x = (r2.x * r1.x) + (r2.y * r1.y) + (r2.z * r1.z);			// partial precision
    r1.xyz = norm(texcoord_1);			// partial precision
    r0.w = r0.w * const_0.w;			// partial precision
    r2.x = (r2.x * r1.x) + (r2.y * r1.y) + (r2.z * r1.z);			// partial precision
    r1.w = r2.x - r3.x;			// partial precision
    sat abs r1.w, r1.w			// partial precision
    r2.w = const_0.z - r1.w;			// partial precision
    pow r1.w, r2.w, const_1.x			// partial precision
    r0.x = (r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z);			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r3.w = r0.x - const_0.y;			// partial precision
    r0.w = const_1.y - r0.x;			// partial precision
    r1.w = (r3.w >= const_3.x ? r3.w : const_3.x);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r1.xyz = r0.w * PSLightColor;			// partial precision
    r0.xyz = sat(r1);			// partial precision
    r0.w = (r1.x * const_0.z.x) + (r1.y * const_0.z.y) + (r1.z * const_0.z.z);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 40 instruction slots used (1 texture, 39 arithmetic)