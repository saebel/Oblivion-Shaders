//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1044.pso /Fcshaderdump19/SLS1044.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor PSLightColor       1
//   BaseMap      BaseMap       1
//   NormalMap    NormalMap       1
//

    const_0 = {-0.5, 1, 0, 0};
    texcoord input_0.xy;
    texcoord input_1.xy;
    texcoord input_2.xyz;
    texcoord input_3.xyz;
    sampler BaseMap;
    sampler NormalMap;
    r1 = NormalMap[texcoord_1];
    r0 = BaseMap[texcoord_0];
    r1.xyz = r1 - const_0.x;
    r1.xyz = r1 - r1;
    r2.xyz = texcoord_3 - const_0.x;
    r2.xyz = r2 - r2;
    r1.x = sat((r1.x * r2.x) + (r1.y * r2.y) + (r1.z * r2.z));
    r1.xyz = sat(r1.x * PSLightColor);
    r0.xyz = r0 * texcoord_2;
    r0.xyz = r1 * r0;
    r0.w = const_0.y;
    rendertarget_0 = r0;

// approximately 12 instruction slots used (2 texture, 10 arithmetic)