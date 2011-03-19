//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2005.pso /Fcshaderdump19/SLS2005.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
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
//   PSLightColor   PSLightColor       1
//   EmittanceColor EmittanceColor       1
//   Toggles        Toggles       1
//   BaseMap        BaseMap       1
//   NormalMap      NormalMap       1
//   GlowMap        GlowMap       1
//   ShadowMap      ShadowMap       1
//   ShadowMaskMap  ShadowMaskMap       1
//

    const_0 = {-0.5, -1, 1, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_7;			// partial precision
    color input_0.xyz;
    color input_1;
    sampler BaseMap;
    sampler NormalMap;
    sampler GlowMap;
    sampler ShadowMap;
    sampler ShadowMaskMap;
    r0 = NormalMap[texcoord_0];			// partial precision
    r0.xyz = r0 - const_0.x;
    r1.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r1);			// partial precision
    r0.x = sat((r0.x * texcoord_1.x) + (r0.y * texcoord_1.y) + (r0.z * texcoord_1.z));			// partial precision
    r4.xyz = r0.x * PSLightColor;			// partial precision
    r0.x = texcoord_7.z;			// partial precision
    r0.y = texcoord_7.w;			// partial precision
    r2 = ShadowMaskMap[r0];			// partial precision
    r3 = ShadowMap[texcoord_7];			// partial precision
    r1 = GlowMap[texcoord_0];
    r0 = BaseMap[texcoord_0];			// partial precision
    r3.xyz = r3 - const_0.y;			// partial precision
    r2.xyz = (r2.x * r3) - const_0.z;			// partial precision
    r3.xyz = AmbientColor;
    r1.xyz = (r1 * EmittanceColor) + r3;			// partial precision
    r1.xyz = (r2 * r4) + r1;			// partial precision
    r2.xyz = (r1 >= const_0.w ? r1 : const_0.w);			// partial precision
    r1.xyz = r0 * input_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r1.xyz = (-r0 * r2) + input_1;			// partial precision
    r0.xyz = r2 * r0;			// partial precision
    r1.xyz = (input_1.w * r1) - r0;			// partial precision
    r0.w = r0.w * AmbientColor.w;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 28 instruction slots used (5 texture, 23 arithmetic)