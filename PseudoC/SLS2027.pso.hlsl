//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2027.pso /Fcshaderdump19/SLS2027.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   AmbientColor       1
//   PSLightColor   const_2       2
//   BaseMap        BaseMap       1
//   NormalMap      NormalMap       1
//   AttenuationMap AttenuationMap       1
//

    const_0 = {-0.5, 1, 0, 0};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// centroid
    texcoord input_2.xyz;			// centroid
    texcoord input_4;
    sampler BaseMap;
    sampler NormalMap;
    sampler AttenuationMap;
    r0.x = texcoord_4.z;
    r0.y = texcoord_4.w;
    r1 = AttenuationMap[r0];			// partial precision
    r2 = AttenuationMap[texcoord_4];			// partial precision
    r3 = NormalMap[texcoord_0];			// partial precision
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.xyz = r3 - const_0.x;
    r3.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r3);			// partial precision
    r3.xyz = norm(texcoord_2);			// partial precision
    r3.x = sat((r0.x * r3.x) + (r0.y * r3.y) + (r0.z * r3.z));			// partial precision
    r1.w = const_0.y - r2.x;			// partial precision
    r2.x = sat((r0.x * texcoord_1.x) + (r0.y * texcoord_1.y) + (r0.z * texcoord_1.z));			// partial precision
    r1.w = sat(r1.w - r1.x);			// partial precision
    r0.xyz = r3.x * const_3;			// partial precision
    r0.xyz = r1.w * r0;			// partial precision
    r0.xyz = (r2.x * const_2) + r0;			// partial precision
    r0.xyz = r0 - AmbientColor;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 23 instruction slots used (4 texture, 19 arithmetic)
