//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2032.pso /Fcshaderdump19/SLS2032.pso.dis
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
//

    const_0 = {-0.5, 1, 0, 0};
    texcoord input_0.xy;
    texcoord input_1.xyz;			// centroid
    texcoord input_2.xyz;			// centroid
    texcoord input_3.xyz;			// centroid
    texcoord input_4;
    texcoord input_5;
    sampler BaseMap;
    sampler NormalMap;
    sampler GlowMap;
    sampler AttenuationMap;
    r1.x = texcoord_4.z;
    r1.y = texcoord_4.w;
    r0.x = texcoord_5.z;
    r0.y = texcoord_5.w;
    r4 = AttenuationMap[r1];			// partial precision
    r5 = AttenuationMap[texcoord_4];			// partial precision
    r6 = NormalMap[texcoord_0];			// partial precision
    r2 = AttenuationMap[r0];			// partial precision
    r3 = AttenuationMap[texcoord_5];			// partial precision
    r1 = GlowMap[texcoord_0];
    r0 = BaseMap[texcoord_0];			// partial precision
    r7.xyz = norm(texcoord_2);			// partial precision
    r0.xyz = r6 - const_0.x;
    r6.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r6);			// partial precision
    r1.w = const_0.y - r5.x;			// partial precision
    r5.x = sat((r0.x * r7.x) + (r0.y * r7.y) + (r0.z * r7.z));			// partial precision
    r1.w = sat(r1.w - r4.x);			// partial precision
    r4.xyz = r5.x * const_3;			// partial precision
    r4.xyz = r1.w * r4;			// partial precision
    r5.x = sat((r0.x * texcoord_1.x) + (r0.y * texcoord_1.y) + (r0.z * texcoord_1.z));			// partial precision
    r4.xyz = (r5.x * const_2) + r4;			// partial precision
    r5.xyz = norm(texcoord_3);			// partial precision
    r1.w = const_0.y - r3.x;			// partial precision
    r0.x = sat((r0.x * r5.x) + (r0.y * r5.y) + (r0.z * r5.z));			// partial precision
    r1.w = sat(r1.w - r2.x);			// partial precision
    r0.xyz = r0.x * const_4;			// partial precision
    r2.xyz = (r1.w * r0) + r4;			// partial precision
    r0.xyz = EmittanceColor;
    r0.xyz = (r1 * r0) + AmbientColor;			// partial precision
    r0.xyz = r2 - r0;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 38 instruction slots used (7 texture, 31 arithmetic)
