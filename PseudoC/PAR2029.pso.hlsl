//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2029.pso /Fcshaderdump19/PAR2029.pso.dis
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
//   float4 Toggles;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   AmbientColor       1
//   PSLightColor   const_2       2
//   EmittanceColor EmittanceColor       1
//   Toggles        Toggles       1
//   BaseMap        BaseMap       1
//   NormalMap      NormalMap       1
//   GlowMap        GlowMap       1
//   AttenuationMap AttenuationMap       1
//   ShadowMap      ShadowMap       1
//   ShadowMaskMap  ShadowMaskMap       1
//

    const_0 = {0.0399999991, -0.0199999996, -0.5, -1};
    const_4 = {0.200000003, 0, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_2.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    texcoord input_4.xyz;			// partial precision			// centroid
    texcoord input_5;			// partial precision
    texcoord input_6.xyz;			// partial precision			// centroid
    texcoord input_7;			// partial precision
    color input_0.xyz;
    color input_1;
    sampler BaseMap;
    sampler NormalMap;
    sampler GlowMap;
    sampler AttenuationMap;
    sampler ShadowMap;
    sampler ShadowMaskMap;
    r0 = BaseMap[texcoord_0];			// partial precision
    r0.x = (texcoord_6.x * texcoord_6.x) + (texcoord_6.y * texcoord_6.y) + (texcoord_6.z * texcoord_6.z);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * texcoord_6;			// partial precision
    r0.w = (r0.w * const_0.x) - const_0.y;			// partial precision
    r1.xy = (r0.w * r0) + texcoord_0;
    r2.x = texcoord_5.z;			// partial precision
    r2.y = texcoord_5.w;			// partial precision
    r0.x = texcoord_7.z;			// partial precision
    r0.y = texcoord_7.w;			// partial precision
    r4 = NormalMap[r1];			// partial precision
    r1 = BaseMap[r1];			// partial precision
    r5 = AttenuationMap[r2];			// partial precision
    r6 = AttenuationMap[texcoord_5];			// partial precision
    r2 = ShadowMaskMap[r0];			// partial precision
    r3 = ShadowMap[texcoord_7];			// partial precision
    r0 = GlowMap[texcoord_0];
    r4.xyz = r4 - const_0.z;
    r7.xyz = r4 - r4;			// partial precision
    r4.xyz = norm(r7);			// partial precision
    r7.xyz = norm(texcoord_4);			// partial precision
    r7.x = sat((r4.x * r7.x) + (r4.y * r7.y) + (r4.z * r7.z));			// partial precision
    pow r0.w, r7.x, Toggles.z			// partial precision
    r7.xyz = norm(texcoord_2);			// partial precision
    r2.w = r4.w * r0.w;			// partial precision
    r8.x = (r4.x * r7.x) + (r4.y * r7.y) + (r4.z * r7.z);			// partial precision
    r1.w = r8.x - const_0.z;			// partial precision
    r0.w = (r1.w >= const_4.y ? r1.w : const_4.y);			// partial precision
    r1.w = r2.w * r0.w;			// partial precision
    r0.w = const_4.x - r8.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    add r1.w, -r6.x, -const_0.w			// partial precision
    r6.xyz = norm(texcoord_3);			// partial precision
    r1.w = sat(r1.w - r5.x);			// partial precision
    r5.x = sat((r4.x * r6.x) + (r4.y * r6.y) + (r4.z * r6.z));			// partial precision
    pow r2.w, r5.x, Toggles.z			// partial precision
    r7.x = (r4.x * texcoord_1.x) + (r4.y * texcoord_1.y) + (r4.z * texcoord_1.z);			// partial precision
    r3.w = r4.w * r2.w;			// partial precision
    r4.w = r7.x - const_0.z;			// partial precision
    r2.w = (r4.w >= const_4.y ? r4.w : const_4.y);			// partial precision
    r2.w = r3.w * r2.w;			// partial precision
    r4.xyz = r0.w * const_3;			// partial precision
    r0.w = const_4.x - r7.x;			// partial precision
    r6.xyz = sat(r1.w * r4);			// partial precision
    r0.w = (r0.w >= 0.0 ? r3.w : r2.w);			// partial precision
    r5.xyz = sat(r0.w * const_2);			// partial precision
    r3.xyz = r3 - const_0.w;			// partial precision
    r4.xyz = (r2.x * r3) - const_0.w;			// partial precision
    r2.xyz = (r4 * r5) + r6;			// partial precision
    r3.xyz = r1 * input_0;			// partial precision
    r0.w = sat(r8.x);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r3 : r1);			// partial precision
    r3.xyz = r0.w * const_3;			// partial precision
    r0.w = sat(r7.x);			// partial precision
    r5.xyz = r1.w * r3;			// partial precision
    r3.xyz = r0.w * const_2;			// partial precision
    r3.xyz = (r4 * r3) + r5;			// partial precision
    r4.xyz = AmbientColor;
    r0.xyz = (r0 * EmittanceColor) + r4;			// partial precision
    r3.xyz = r3 - r0;			// partial precision
    r0.xyz = (r3 >= const_4.y ? r3 : const_4.y);			// partial precision
    r0.xyz = (r1 * r0) + r2;			// partial precision
    r1.xyz = input_1.w * (input_1 - r0) + r0;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    r0.w = AmbientColor.w;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 79 instruction slots used (8 texture, 71 arithmetic)