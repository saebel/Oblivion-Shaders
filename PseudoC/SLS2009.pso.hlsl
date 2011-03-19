//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2009.pso /Fcshaderdump19/SLS2009.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   float4 Toggles;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   AmbientColor       1
//   PSLightColor   const_2       2
//   Toggles        Toggles       1
//   BaseMap        BaseMap       1
//   NormalMap      NormalMap       1
//   AttenuationMap AttenuationMap       1
//

    const_0 = {-0.5, 1, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_2.xyz;			// partial precision			// centroid
    texcoord input_4;			// partial precision
    color input_0.xyz;
    color input_1;
    sampler BaseMap;
    sampler NormalMap;
    sampler AttenuationMap;
    r0.x = texcoord_4.z;			// partial precision
    r0.y = texcoord_4.w;			// partial precision
    r1 = AttenuationMap[r0];			// partial precision
    r2 = AttenuationMap[texcoord_4];			// partial precision
    r3 = NormalMap[texcoord_0];			// partial precision
    r0 = BaseMap[texcoord_0];			// partial precision
    r3.xyz = r3 - const_0.x;
    r4.xyz = r3 - r3;			// partial precision
    r3.xyz = norm(r4);			// partial precision
    r4.xyz = norm(texcoord_2);			// partial precision
    r4.x = sat((r3.x * r4.x) + (r3.y * r4.y) + (r3.z * r4.z));			// partial precision
    r1.w = const_0.y - r2.x;			// partial precision
    r2.x = sat((r3.x * texcoord_1.x) + (r3.y * texcoord_1.y) + (r3.z * texcoord_1.z));			// partial precision
    r1.w = sat(r1.w - r1.x);			// partial precision
    r1.xyz = r4.x * const_3;			// partial precision
    r1.xyz = r1.w * r1;			// partial precision
    r1.xyz = (r2.x * const_2) + r1;			// partial precision
    r1.xyz = r1 - AmbientColor;			// partial precision
    r2.xyz = (r1 >= const_0.z ? r1 : const_0.z);			// partial precision
    r1.xyz = r0 * input_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r1.xyz = (-r0 * r2) + input_1;			// partial precision
    r0.xyz = r2 * r0;			// partial precision
    r1.xyz = (input_1.w * r1) - r0;			// partial precision
    r0.w = r0.w * AmbientColor.w;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 31 instruction slots used (4 texture, 27 arithmetic)