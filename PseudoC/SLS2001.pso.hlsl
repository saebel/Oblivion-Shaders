//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2001.pso /Fcshaderdump19/SLS2001.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
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
//   ShadowMap    ShadowMap       1
//

    const_0 = {-0.100000001, -0.5, 0, 20};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_7.x;			// partial precision			// centroid
    color input_1;
    sampler BaseMap;
    sampler NormalMap;
    sampler ShadowMap;
    r0.w = texcoord_7.x - const_0.x;			// partial precision
    r0 = -r0.w;
    r1.xy = texcoord_0 * const_0.w;
    texkill r0
    r2 = NormalMap[texcoord_0];			// partial precision
    r0 = BaseMap[texcoord_0];			// partial precision
    r1 = ShadowMap[r1];
    r2.xyz = r2 - const_0.y;
    r3.xyz = r2 - r2;			// partial precision
    r2.xyz = norm(r3);			// partial precision
    r3.x = sat((r2.x * texcoord_1.x) + (r2.y * texcoord_1.y) + (r2.z * texcoord_1.z));			// partial precision
    r2.xyz = AmbientColor;
    r3.xyz = (r3.x * PSLightColor) + r2;			// partial precision
    r2.xyz = (r3 >= const_0.z ? r3 : const_0.z);			// partial precision
    r0.xyz = r0 * r2;			// partial precision
    r1.w = (r1.x * -const_0.y) - const_0.y;
    r1.xyz = (-r1.w * r0) + input_1;			// partial precision
    r0.xyz = r0 * r1.w;			// partial precision
    r1.xyz = (input_1.w * r1) - r0;			// partial precision
    r0.w = r0.w * AmbientColor.w;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 24 instruction slots used (4 texture, 20 arithmetic)