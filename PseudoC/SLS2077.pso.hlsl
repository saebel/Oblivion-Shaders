//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS2077.pso /Fcshaderdump19/SLS2077.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor PSLightColor       1
//   BaseMap      BaseMap       1
//   ShadowMap    ShadowMap       1
//

    const_0 = {0.5, 1, 15, 0};
    const_1 = {-0.000195312503, 0.00999999978, 0.600000024, 0};
    const_3 = {1, -1, 0, 0};
    const_4 = {0, 1, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_6.xyz;			// centroid
    texcoord input_1;			// partial precision			// centroid
    texcoord input_2;			// centroid
    texcoord input_3;			// partial precision
    sampler BaseMap;
    sampler ShadowMap;
    r0.w = 1.0 / texcoord_1.w;			// partial precision
    r0.xy = r0.w * texcoord_1;
    r0.xy = (const_0.x * r0) + const_0.x;
    r1.xyz = texcoord_2;
    r1.xyz = texcoord_6 - r1;
    r0.w = const_0.y - r0.y;
    r1.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r1.w = 1.0 / sqrt(r1.x);
    r1.w = 1.0 / r1.w;
    r2.w = texcoord_2.w * const_0.x;
    r2.w = 1.0 / r2.w;
    r3.w = sat(r1.w * r2.w);
    r1.w = 1.0 / sqrt(r3.w);
    r1.w = 1.0 / r1.w;
    r2.w = const_0.y - r1.w;
    r0.z = const_0.y - r0.y;
    r1.w = (r1.w <= 0.0 ? r2.w : const_0.y);
    r1.x = sat((r0.x >= 0.0 ? const_0.w : r0.x));
    r1.y = sat((r0.z >= 0.0 ? const_0.w : r0.w));
    r0.w = r1.w * const_0.z;			// partial precision
    r2.xy = const_3;
    r0.xy = (r2 * r0) + const_4;
    r0.w = 1.0 / r0.w;			// partial precision
    r0.xy = sat((r0.w * const_1.y) - r0);
    r2 = ShadowMap[r1];
    r1 = ShadowMap[r0];
    r0 = BaseMap[texcoord_0];			// partial precision
    r2.w = 1.0 / texcoord_2.w;
    r1.w = (texcoord_1.z * -r2.w) - r2.x;
    r1.w = const_1.x - r1.w;
    r1.w = (r1.w >= 0.0 ? const_0.y : const_0.w);			// partial precision
    r2.w = (texcoord_1.z * -r2.w) - r1.x;
    r2.w = const_1.x - r2.w;
    r2.w = (r2.w >= 0.0 ? const_0.y : const_0.w);			// partial precision
    r1.w = sat(r1.w - r2.w);			// partial precision
    r1.w = r1.w - const_0.y;			// partial precision
    r0.z = const_0.y;
    r1.w = (PSLightColor.w * r1.w) - r0.z;			// partial precision
    r2.w = const_0.y - r1.w;			// partial precision
    r1.w = r2.w * const_1.z;			// partial precision
    r3.w = r3.w * r3.w;
    r0.xyz = (r1.w * -PSLightColor) - r0.z;			// partial precision
    r1.xyz = r3.w * (const_0.y - r0) + r0;			// partial precision
    r1.w = (r0.w < const_0.y ? r0.w : const_0.y);			// partial precision
    r0.xyz = texcoord_3.w * (const_0.y - r1) + r1;			// partial precision
    r0.w = (r1.w < r2.w ? r1.w : r2.w);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 49 instruction slots used (3 texture, 46 arithmetic)