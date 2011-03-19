//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1010.pso /Fcshaderdump19/SLS1010.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
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
//

    const_0 = {-0.5, 0, 0, 0};
    texcoord input_0.xy;
    texcoord input_1.xy;
    texcoord input_3.xyz;
    color input_0;
    sampler BaseMap;
    sampler NormalMap;
    r1 = NormalMap[texcoord_1];
    r0 = BaseMap[texcoord_0];
    r1.xyz = r1 - const_0.x;
    r1.xyz = r1 - r1;
    r2.xyz = texcoord_3 - const_0.x;
    r2.xyz = r2 - r2;
    r2.x = sat((r1.x * r2.x) + (r1.y * r2.y) + (r1.z * r2.z));
    r1.xyz = PSLightColor;
    r1.xyz = sat((r2.x * r1) - AmbientColor);
    r2.xyz = (-r0 * r1) + input_0;
    r2.xyz = r2 * input_0.w;
    r0.xyz = (r0 * r1) + r2;
    rendertarget_0 = r0;

// approximately 13 instruction slots used (2 texture, 11 arithmetic)