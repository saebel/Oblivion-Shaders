//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2007.pso /Fcshaderdump19/PAR2007.pso.dis
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
    const_4 = {0, 0, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_2.xyz;			// partial precision			// centroid
    texcoord input_4;			// partial precision
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
    r2.x = texcoord_4.z;			// partial precision
    r2.y = texcoord_4.w;			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * texcoord_6;			// partial precision
    r0.w = (r0.w * const_0.x) - const_0.y;			// partial precision
    r0.xy = (r0.w * r0) + texcoord_0;
    r1.x = texcoord_7.z;			// partial precision
    r1.y = texcoord_7.w;			// partial precision
    r4 = AttenuationMap[r2];			// partial precision
    r5 = AttenuationMap[texcoord_4];			// partial precision
    r6 = NormalMap[r0];			// partial precision
    r0 = BaseMap[r0];			// partial precision
    r2 = ShadowMaskMap[r1];			// partial precision
    r3 = ShadowMap[texcoord_7];			// partial precision
    r1 = GlowMap[texcoord_0];
    r6.xyz = r6 - const_0.z;
    r7.xyz = r6 - r6;			// partial precision
    r6.xyz = norm(r7);			// partial precision
    r7.xyz = norm(texcoord_2);			// partial precision
    r7.x = sat((r6.x * r7.x) + (r6.y * r7.y) + (r6.z * r7.z));			// partial precision
    add r0.w, -r5.x, -const_0.w			// partial precision
    r5.x = sat((r6.x * texcoord_1.x) + (r6.y * texcoord_1.y) + (r6.z * texcoord_1.z));			// partial precision
    r0.w = sat(r0.w - r4.x);			// partial precision
    r4.xyz = r7.x * const_3;			// partial precision
    r4.xyz = r0.w * r4;			// partial precision
    r3.xyz = r3 - const_0.w;			// partial precision
    r3.xyz = (r2.x * r3) - const_0.w;			// partial precision
    r2.xyz = r5.x * const_2;			// partial precision
    r2.xyz = (r3 * r2) + r4;			// partial precision
    r3.xyz = AmbientColor;
    r1.xyz = (r1 * EmittanceColor) + r3;			// partial precision
    r1.xyz = r2 - r1;			// partial precision
    r2.xyz = (r1 >= const_4.x ? r1 : const_4.x);			// partial precision
    r1.xyz = r0 * input_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r1.xyz = (-r0 * r2) + input_1;			// partial precision
    r0.xyz = r2 * r0;			// partial precision
    r1.xyz = (input_1.w * r1) - r0;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    r0.w = AmbientColor.w;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 47 instruction slots used (8 texture, 39 arithmetic)