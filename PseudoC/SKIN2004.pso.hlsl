//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2004.pso /Fcshaderdump19/SKIN2004.pso.dis
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
//   PSLightColor[0]   PSLightColor[0]       1
//   PSLightColor[1]   PSLightColor[1]       1
//   BaseMap        BaseMap       1
//   NormalMap      NormalMap       1
//   AttenuationMap AttenuationMap       1
//

    const_0 = {-0.5, 0, 1, 0.5};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// centroid
    texcoord input_2.xyz;			// centroid
    texcoord input_4;
    texcoord input_7.xyz;			// centroid
    sampler BaseMap;
    sampler NormalMap;
    sampler AttenuationMap;
    r0.x = texcoord_4.z;
    r0.y = texcoord_4.w;
    r1 = AttenuationMap[r0];			// partial precision
    r2 = AttenuationMap[texcoord_4];			// partial precision
    r3 = NormalMap[texcoord_0];			// partial precision
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.xyz = norm(texcoord_7);			// partial precision
    r3.xyz = r3 - const_0.x;
    r3.xyz = r3 - r3;			// partial precision
    r4.xyz = norm(r3);			// partial precision
    r0.x = (r4.x * r0.x) + (r4.y * r0.y) + (r4.z * r0.z);			// partial precision
    r1.w = (r0.x >= const_0.y ? r0.x : const_0.y);			// partial precision
    r1.w = const_0.z - r1.w;			// partial precision
    r2.w = r1.w * r1.w;			// partial precision
    r1.w = r1.w * r2.w;			// partial precision
    r0.xyz = r1.w * PSLightColor[1];			// partial precision
    r3.xyz = r1.w * PSLightColor[0];			// partial precision
    r0.xyz = r0 * const_0.w;			// partial precision
    r5.xyz = norm(texcoord_2);			// partial precision
    r5.x = (r4.x * r5.x) + (r4.y * r5.y) + (r4.z * r5.z);			// partial precision
    r4.x = (r4.x * texcoord_1.x) + (r4.y * texcoord_1.y) + (r4.z * texcoord_1.z);			// partial precision
    r2.w = (r5.x >= const_0.y ? r5.x : const_0.y);			// partial precision
    r1.w = const_0.z - r2.x;			// partial precision
    r0.xyz = (r2.w * PSLightColor[1]) + r0;			// partial precision
    r2.w = (r4.x >= const_0.y ? r4.x : const_0.y);			// partial precision
    r2.xyz = r3 * const_0.w;			// partial precision
    r1.w = sat(r1.w - r1.x);			// partial precision
    r1.xyz = (r2.w * PSLightColor[0]) + r2;			// partial precision
    r0.xyz = (r1.w * r0) + r1;			// partial precision
    r0.xyz = r0 - AmbientColor;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 37 instruction slots used (4 texture, 33 arithmetic)
