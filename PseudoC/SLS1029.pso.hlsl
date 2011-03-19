//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1029.pso /Fcshaderdump19/SLS1029.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttMapXY;
//   sampler2D AttMapZ;
//   samplerCUBE NormalCubeMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  AmbientColor       1
//   PSLightColor  const_2       2
//   NormalMap     NormalMap       1
//   AttMapXY      AttMapXY       1
//   AttMapZ       AttMapZ       1
//   NormalCubeMap NormalCubeMap       1
//

    const_0 = {-0.5, 0, 0, 0};
    color input_0.xyz;
    texcoord input_0.xy;
    texcoord input_1.xy;
    texcoord input_2.xy;
    texcoord input_3.xyz;
    sampler NormalMap;
    sampler AttMapXY;
    sampler AttMapZ;
    dcl_cube NormalCubeMap
    r2 = AttMapXY[texcoord_1];
    r3 = AttMapZ[texcoord_2];
    r1 = NormalCubeMap[texcoord_3];
    r0 = NormalMap[texcoord_0];
    r2.xyz = r2 * r3;
    r1.xyz = r1 - const_0.x;
    r3.xyz = r1 - r1;
    r0.xyz = r0 - const_0.x;
    r1.xyz = r0 - r0;
    r0.x = sat((r1.x * r3.x) + (r1.y * r3.y) + (r1.z * r3.z));
    r0.xyz = r2 * r0.x;
    r2.xyz = input_0 - const_0.x;
    r2.xyz = r2 - r2;
    r2.x = sat((r1.x * r2.x) + (r1.y * r2.y) + (r1.z * r2.z));
    r1.xyz = AmbientColor;
    r1.xyz = (r2.x * const_2) - r1;
    r0.xyz = sat((const_3 * r0) + r1);
    r0.w = AmbientColor.w;
    rendertarget_0 = r0;

// approximately 19 instruction slots used (4 texture, 15 arithmetic)