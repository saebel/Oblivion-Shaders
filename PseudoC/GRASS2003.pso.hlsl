//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/GRASS2003.pso /Fcshaderdump19/GRASS2003.pso.dis
//
//
// Parameters:
//
//   float4 AlphaTestRef;
//   sampler2D AttMap;
//   sampler2D DiffuseMap;
//   float4 PointLightColor;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   PointLightColor PointLightColor       1
//   AlphaTestRef    AlphaTestRef       1
//   DiffuseMap      DiffuseMap       1
//   AttMap          AttMap       1
//

    const_0 = {0, 1, 0.400000006, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_4.xyz;			// partial precision			// centroid
    texcoord input_5;			// partial precision			// centroid
    texcoord input_1;			// partial precision
    color input_0;
    sampler DiffuseMap;
    sampler AttMap;
    r0.x = texcoord_1.z;			// partial precision
    r0.y = texcoord_1.w;			// partial precision
    r1 = AttMap[r0];			// partial precision
    r2 = AttMap[texcoord_1];			// partial precision
    r0 = DiffuseMap[texcoord_0];			// partial precision
    r1.w = const_0.y - r2.x;			// partial precision
    r2.xyz = texcoord_5;			// partial precision
    r2.xyz = r2 - texcoord_4;			// partial precision
    r1.w = sat(r1.w - r1.x);			// partial precision
    r1.y = const_0.z;
    r1.xyz = r1.y * PointLightColor;			// partial precision
    r1.xyz = (r1.w * r1) + r2;			// partial precision
    r2.xyz = (-r0 * r1) + input_0;			// partial precision
    r0.w = AlphaTestRef.x - r0.w;			// partial precision
    r2.xyz = r2 * input_0.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.xyz = (r0 * r1) + r2;			// partial precision
    r0.w = r0.w * texcoord_5.w;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 19 instruction slots used (3 texture, 16 arithmetic)
