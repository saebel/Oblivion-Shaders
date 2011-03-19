//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2019.pso /Fcshaderdump19/PAR2019.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   float4 EmittanceColor;
//   sampler2D GlowMap;
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
//   PSLightColor   const_2       3
//   EmittanceColor EmittanceColor       1
//   BaseMap        BaseMap       1
//   NormalMap      NormalMap       1
//   GlowMap        GlowMap       1
//   AttenuationMap AttenuationMap       1
//   ShadowMap      ShadowMap       1
//   ShadowMaskMap  ShadowMaskMap       1
//

    const_0 = {0.0399999991, -0.0199999996, -0.5, -1};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// centroid
    texcoord input_2.xyz;			// centroid
    texcoord input_3.xyz;			// centroid
    texcoord input_4;
    texcoord input_5;
    texcoord input_7.xyz;			// centroid
    texcoord input_6;
    sampler BaseMap;
    sampler NormalMap;
    sampler GlowMap;
    sampler AttenuationMap;
    sampler ShadowMap;
    sampler ShadowMaskMap;
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.x = (texcoord_7.x * texcoord_7.x) + (texcoord_7.y * texcoord_7.y) + (texcoord_7.z * texcoord_7.z);			// partial precision
    r3.x = texcoord_4.z;
    r3.y = texcoord_4.w;
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * texcoord_7;			// partial precision
    r0.w = (r0.w * const_0.x) - const_0.y;			// partial precision
    r2.xy = (r0.w * r0) + texcoord_0;
    r1.x = texcoord_6.z;
    r1.y = texcoord_6.w;
    r0.x = texcoord_5.z;
    r0.y = texcoord_5.w;
    r5 = AttenuationMap[r3];			// partial precision
    r6 = AttenuationMap[texcoord_4];			// partial precision
    r7 = NormalMap[r2];			// partial precision
    r3 = ShadowMaskMap[r1];			// partial precision
    r4 = ShadowMap[texcoord_6];			// partial precision
    r1 = AttenuationMap[r0];			// partial precision
    r2 = AttenuationMap[texcoord_5];			// partial precision
    r0 = GlowMap[texcoord_0];
    r7.xyz = r7 - const_0.z;
    r8.xyz = r7 - r7;			// partial precision
    r7.xyz = norm(r8);			// partial precision
    r8.xyz = norm(texcoord_2);			// partial precision
    add r0.w, -r6.x, -const_0.w			// partial precision
    r6.x = sat((r7.x * r8.x) + (r7.y * r8.y) + (r7.z * r8.z));			// partial precision
    r0.w = sat(r0.w - r5.x);			// partial precision
    r5.xyz = r6.x * const_3;			// partial precision
    r5.xyz = r0.w * r5;			// partial precision
    r4.xyz = r4 - const_0.w;			// partial precision
    r4.xyz = (r3.x * r4) - const_0.w;			// partial precision
    r3.x = sat((r7.x * texcoord_1.x) + (r7.y * texcoord_1.y) + (r7.z * texcoord_1.z));			// partial precision
    r3.xyz = r3.x * const_2;			// partial precision
    r3.xyz = (r4 * r3) + r5;			// partial precision
    r4.xyz = norm(texcoord_3);			// partial precision
    add r0.w, -r2.x, -const_0.w			// partial precision
    r2.x = sat((r7.x * r4.x) + (r7.y * r4.y) + (r7.z * r4.z));			// partial precision
    r0.w = sat(r0.w - r1.x);			// partial precision
    r1.xyz = r2.x * const_4;			// partial precision
    r1.xyz = (r0.w * r1) + r3;			// partial precision
    r2.xyz = EmittanceColor;
    r0.xyz = (r0 * r2) + AmbientColor;			// partial precision
    r0.xyz = r1 - r0;			// partial precision
    r0.w = -const_0.w;
    rendertarget_0 = r0;			// partial precision

// approximately 51 instruction slots used (9 texture, 42 arithmetic)