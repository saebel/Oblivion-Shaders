//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2057.pso /Fcshaderdump19/SLS2057.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//   sampler2D ShadowMaskMap;
//   float4 Toggles;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   PSLightColor  const_2       3
//   Toggles       Toggles       1
//   NormalMap     NormalMap       1
//   ShadowMap     ShadowMap       1
//   ShadowMaskMap ShadowMaskMap       1
//

    const_0 = {-0.5, 0.200000003, 0.5, 0};
    const_1 = {-1, 1, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// centroid
    texcoord input_2.xyz;			// centroid
    color input_0;
    color input_1;
    texcoord input_3.xyz;			// partial precision			// centroid
    texcoord input_4;			// partial precision
    sampler NormalMap;
    sampler ShadowMap;
    sampler ShadowMaskMap;
    r0 = NormalMap[texcoord_0];			// partial precision
    r1.xyz = texcoord_3 - const_0.x;			// partial precision
    r1.xyz = r1 - r1;			// partial precision
    r0.xyz = r0 - const_0.x;
    r2.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r2);			// partial precision
    r2.x = sat((r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z));			// partial precision
    r1.xyz = texcoord_2 - const_0.x;
    pow r1.w, r2.x, Toggles.z			// partial precision
    r1.xyz = r1 - r1;			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r0.x = (r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z);			// partial precision
    r3.w = r0.x - const_0.z;			// partial precision
    r0.w = const_0.y - r0.x;			// partial precision
    r1.w = (r3.w >= const_0.w ? r3.w : const_0.w);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r0.xyz = r0.w * const_2;			// partial precision
    r2.xyz = r0 * texcoord_1;
    r0.x = texcoord_4.z;			// partial precision
    r0.y = texcoord_4.w;			// partial precision
    r0 = ShadowMaskMap[r0];			// partial precision
    r1 = ShadowMap[texcoord_4];			// partial precision
    r1.xyz = r1 - const_1.x;			// partial precision
    r0.xyz = (r0.x * r1) - const_1.y;			// partial precision
    r0.w = (const_3.x * input_0.x) + (const_3.y * input_0.y) + (const_3.z * input_0.z) + (const_3.w * input_0.w);
    r1.w = (const_4.x * input_1.x) + (const_4.y * input_1.y) + (const_4.z * input_1.z) + (const_4.w * input_1.w);
    r0.xyz = r2 * r0;			// partial precision
    r0.w = r0.w - r1.w;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 34 instruction slots used (3 texture, 31 arithmetic)