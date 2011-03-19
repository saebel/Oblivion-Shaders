//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2005.pso /Fcshaderdump19/SKIN2005.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//   sampler2D ShadowMaskMap;
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
//   ShadowMap      ShadowMap       1
//   ShadowMaskMap  ShadowMaskMap       1
//

    const_0 = {-0.5, -1, 1, 0};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// centroid
    texcoord input_2.xyz;			// centroid
    texcoord input_4;
    texcoord input_7.xyz;			// centroid
    texcoord input_6;
    sampler BaseMap;
    sampler NormalMap;
    sampler AttenuationMap;
    sampler ShadowMap;
    sampler ShadowMaskMap;
    r1.x = texcoord_4.z;
    r1.y = texcoord_4.w;
    r0.x = texcoord_6.z;
    r0.y = texcoord_6.w;
    r3 = AttenuationMap[r1];			// partial precision
    r4 = AttenuationMap[texcoord_4];			// partial precision
    r5 = NormalMap[texcoord_0];			// partial precision
    r1 = ShadowMaskMap[r0];			// partial precision
    r2 = ShadowMap[texcoord_6];			// partial precision
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.xyz = norm(texcoord_7);			// partial precision
    r5.xyz = r5 - const_0.x;
    r5.xyz = r5 - r5;			// partial precision
    r6.xyz = norm(r5);			// partial precision
    r0.x = (r6.x * r0.x) + (r6.y * r0.y) + (r6.z * r0.z);			// partial precision
    r1.w = (r0.x >= const_0.w ? r0.x : const_0.w);			// partial precision
    r1.w = const_0.z - r1.w;			// partial precision
    r2.w = r1.w * r1.w;			// partial precision
    r1.w = r1.w * r2.w;			// partial precision
    r5.xyz = r1.w * PSLightColor[1];			// partial precision
    r0.xyz = r1.w * PSLightColor[0];			// partial precision
    r5.xyz = r5 * -const_0.x;			// partial precision
    r7.xyz = norm(texcoord_2);			// partial precision
    r1.w = const_0.z - r4.x;			// partial precision
    r7.x = (r6.x * r7.x) + (r6.y * r7.y) + (r6.z * r7.z);			// partial precision
    r4.x = (r6.x * texcoord_1.x) + (r6.y * texcoord_1.y) + (r6.z * texcoord_1.z);			// partial precision
    r2.w = (r7.x >= const_0.w ? r7.x : const_0.w);			// partial precision
    r1.w = sat(r1.w - r3.x);			// partial precision
    r3.xyz = (r2.w * PSLightColor[1]) + r5;			// partial precision
    r3.xyz = r1.w * r3;			// partial precision
    r2.xyz = r2 - const_0.y;			// partial precision
    r1.xyz = (r1.x * r2) - const_0.z;			// partial precision
    r1.w = (r4.x >= const_0.w ? r4.x : const_0.w);			// partial precision
    r0.xyz = r0 * -const_0.x;			// partial precision
    r0.xyz = (r1.w * PSLightColor[0]) + r0;			// partial precision
    r0.xyz = (r1 * r0) + r3;			// partial precision
    r0.xyz = r0 - AmbientColor;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 44 instruction slots used (6 texture, 38 arithmetic)