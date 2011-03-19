//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2016.pso /Fcshaderdump19/PAR2016.pso.dis
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
//   PSLightColor   const_2       3
//   BaseMap        BaseMap       1
//   NormalMap      NormalMap       1
//   AttenuationMap AttenuationMap       1
//

    const_0 = {0.0399999991, -0.0199999996, -0.5, 1};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// centroid
    texcoord input_2.xyz;			// centroid
    texcoord input_3.xyz;			// centroid
    texcoord input_4;
    texcoord input_5;
    texcoord input_7.xyz;			// centroid
    sampler BaseMap;
    sampler NormalMap;
    sampler AttenuationMap;
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.x = (texcoord_7.x * texcoord_7.x) + (texcoord_7.y * texcoord_7.y) + (texcoord_7.z * texcoord_7.z);			// partial precision
    r2.x = texcoord_4.z;
    r2.y = texcoord_4.w;
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * texcoord_7;			// partial precision
    r0.w = (r0.w * const_0.x) - const_0.y;			// partial precision
    r1.xy = (r0.w * r0) + texcoord_0;
    r0.x = texcoord_5.z;
    r0.y = texcoord_5.w;
    r2 = AttenuationMap[r2];			// partial precision
    r3 = AttenuationMap[texcoord_4];			// partial precision
    r4 = NormalMap[r1];			// partial precision
    r0 = AttenuationMap[r0];			// partial precision
    r1 = AttenuationMap[texcoord_5];			// partial precision
    r4.xyz = r4 - const_0.z;
    r5.xyz = r4 - r4;			// partial precision
    r4.xyz = norm(r5);			// partial precision
    r5.xyz = norm(texcoord_2);			// partial precision
    r0.w = const_0.w - r3.x;			// partial precision
    r3.x = sat((r4.x * r5.x) + (r4.y * r5.y) + (r4.z * r5.z));			// partial precision
    r0.w = sat(r0.w - r2.x);			// partial precision
    r2.xyz = r3.x * const_3;			// partial precision
    r2.xyz = r0.w * r2;			// partial precision
    r3.x = sat((r4.x * texcoord_1.x) + (r4.y * texcoord_1.y) + (r4.z * texcoord_1.z));			// partial precision
    r2.xyz = (r3.x * const_2) + r2;			// partial precision
    r3.xyz = norm(texcoord_3);			// partial precision
    r0.w = const_0.w - r1.x;			// partial precision
    r1.x = sat((r4.x * r3.x) + (r4.y * r3.y) + (r4.z * r3.z));			// partial precision
    r0.w = sat(r0.w - r0.x);			// partial precision
    r0.xyz = r1.x * const_4;			// partial precision
    r0.xyz = (r0.w * r0) + r2;			// partial precision
    r0.xyz = r0 - AmbientColor;			// partial precision
    r0.w = const_0.w;
    rendertarget_0 = r0;			// partial precision

// approximately 41 instruction slots used (6 texture, 35 arithmetic)