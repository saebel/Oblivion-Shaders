//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2008.pso /Fcshaderdump19/PAR2008.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   float4 Toggles;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor AmbientColor       1
//   PSLightColor PSLightColor       1
//   Toggles      Toggles       1
//   BaseMap      BaseMap       1
//   NormalMap    NormalMap       1
//

    const_0 = {0.0399999991, -0.0199999996, -0.5, 0.200000003};
    const_3 = {0, 0, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    texcoord input_6.xyz;			// partial precision			// centroid
    color input_0.xyz;
    color input_1;
    sampler BaseMap;
    sampler NormalMap;
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.x = (texcoord_6.x * texcoord_6.x) + (texcoord_6.y * texcoord_6.y) + (texcoord_6.z * texcoord_6.z);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * texcoord_6;			// partial precision
    r0.w = (r0.w * const_0.x) - const_0.y;			// partial precision
    r0.xy = (r0.w * r0) + texcoord_0;
    r1 = NormalMap[r0];			// partial precision
    r0 = BaseMap[r0];			// partial precision
    r1.xyz = r1 - const_0.z;
    r2.xyz = r1 - r1;			// partial precision
    r1.xyz = norm(r2);			// partial precision
    r2.xyz = norm(texcoord_3);			// partial precision
    r2.x = sat((r1.x * r2.x) + (r1.y * r2.y) + (r1.z * r2.z));			// partial precision
    pow r0.w, r2.x, Toggles.z			// partial precision
    r3.x = (r1.x * texcoord_1.x) + (r1.y * texcoord_1.y) + (r1.z * texcoord_1.z);			// partial precision
    r2.w = r1.w * r0.w;			// partial precision
    r1.w = r3.x - const_0.z;			// partial precision
    r0.w = (r1.w >= const_3.x ? r1.w : const_3.x);			// partial precision
    r1.w = r2.w * r0.w;			// partial precision
    r0.w = const_0.w - r3.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r2.xyz = sat(r0.w * PSLightColor);			// partial precision
    r1.xyz = r0 * input_0;			// partial precision
    r0.w = sat(r3.x);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r0.xyz = PSLightColor;
    r3.xyz = (r0.w * r0) + AmbientColor;			// partial precision
    r0.xyz = (r3 >= const_3.x ? r3 : const_3.x);			// partial precision
    r0.xyz = (r1 * r0) + r2;			// partial precision
    r1.xyz = input_1.w * (input_1 - r0) + r0;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    r0.w = AmbientColor.w;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 40 instruction slots used (3 texture, 37 arithmetic)
