//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1005.pso /Fcshaderdump19/STB1005.pso.dis
//
//
// Parameters:
//
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
//   PSLightColor  PSLightColor       1
//   NormalMap     NormalMap       1
//   AttMapXY      AttMapXY       1
//   AttMapZ       AttMapZ       1
//   NormalCubeMap NormalCubeMap       1
//

    ps_1_3
    tex texcoord_0
    tex texcoord_1
    tex texcoord_2
    tex texcoord_3
    r0.xyz = sat((texcoord_0_bx2.x * texcoord_3_bx2.x) + (texcoord_0_bx2.y * texcoord_3_bx2.y) + (texcoord_0_bx2.z * texcoord_3_bx2.z));
    r0.xyz = r0 * PSLightColor;
    r1.xyz = texcoord_1 * texcoord_2;
    r0.xyz = r0 * r1;
  + r0.w = PSLightColor.w;

// approximately 8 instruction slots used (4 texture, 4 arithmetic)
