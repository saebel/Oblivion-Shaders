//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1021.pso /Fcshaderdump19/SLS1021.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D GlowMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor AmbientColor       1
//   PSLightColor PSLightColor       1
//   BaseMap      BaseMap       1
//   NormalMap    NormalMap       1
//   GlowMap      GlowMap       1
//

    const_0 = {-0.5, 0, 0, 0};
    texcoord input_0.xy;
    texcoord input_1.xy;
    texcoord input_2.xy;
    texcoord input_3.xyz;
    sampler BaseMap;
    sampler NormalMap;
    sampler GlowMap;
    r2 = NormalMap[texcoord_1];
    r1 = GlowMap[texcoord_2];
    r0 = BaseMap[texcoord_0];
    r2.xyz = r2 - const_0.x;
    r2.xyz = r2 - r2;
    r3.xyz = texcoord_3 - const_0.x;
    r3.xyz = r3 - r3;
    r2.x = sat((r2.x * r3.x) + (r2.y * r3.y) + (r2.z * r3.z));
    r1.xyz = r1 - AmbientColor;
    r1.xyz = sat((r2.x * PSLightColor) - r1);
    r0.xyz = r0 * r1;
    rendertarget_0 = r0;

// approximately 12 instruction slots used (3 texture, 9 arithmetic)
