//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2024.pso /Fcshaderdump19/PAR2024.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
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
//   PSLightColor  PSLightColor       1
//   Toggles       Toggles       1
//   NormalMap     NormalMap       1
//   BaseMap       BaseMap       1
//   ShadowMap     ShadowMap       1
//   ShadowMaskMap ShadowMaskMap       1
//

    const_0 = {0.0399999991, -0.0199999996, -0.5, 0.200000003};
    const_1 = {0, -1, 1, 0};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    texcoord input_7.xyz;			// partial precision			// centroid
    texcoord input_6;			// partial precision
    sampler NormalMap;
    sampler BaseMap;
    sampler ShadowMap;
    sampler ShadowMaskMap;
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.x = (texcoord_7.x * texcoord_7.x) + (texcoord_7.y * texcoord_7.y) + (texcoord_7.z * texcoord_7.z);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * texcoord_7;			// partial precision
    r0.w = (r0.w * const_0.x) - const_0.y;			// partial precision
    r1.xy = (r0.w * r0) + texcoord_0;			// partial precision
    r0.x = texcoord_6.z;			// partial precision
    r0.y = texcoord_6.w;			// partial precision
    r2 = NormalMap[r1];			// partial precision
    r0 = ShadowMaskMap[r0];			// partial precision
    r1 = ShadowMap[texcoord_6];			// partial precision
    r2.xyz = r2 - const_0.z;
    r3.xyz = r2 - r2;			// partial precision
    r2.xyz = norm(r3);			// partial precision
    r3.xyz = norm(texcoord_3);			// partial precision
    r3.x = sat((r2.x * r3.x) + (r2.y * r3.y) + (r2.z * r3.z));			// partial precision
    pow r0.w, r3.x, Toggles.z			// partial precision
    r3.xyz = norm(texcoord_1);			// partial precision
    r2.w = r2.w * r0.w;			// partial precision
    r2.x = (r2.x * r3.x) + (r2.y * r3.y) + (r2.z * r3.z);			// partial precision
    r3.w = r2.x - const_0.z;			// partial precision
    r0.w = const_0.w - r2.x;			// partial precision
    r1.w = (r3.w >= const_1.x ? r3.w : const_1.x);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r2.xyz = r0.w * PSLightColor;			// partial precision
    r1.xyz = r1 - const_1.y;			// partial precision
    r0.xyz = (r0.x * r1) - const_1.z;			// partial precision
    r1.xyz = r2 * r0;			// partial precision
    r0.xyz = sat(r1);			// partial precision
    r0.w = (r1.x * const_1.z.x) + (r1.y * const_1.z.y) + (r1.z * const_1.z.z);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 40 instruction slots used (4 texture, 36 arithmetic)