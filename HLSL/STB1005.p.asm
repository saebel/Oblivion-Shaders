//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_1_3 HLSL/STB1005.p.hlsl /FcHLSL/STB1005.p.asm
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
//   PSLightColor  c0       1
//   AttMapXY      s0       1
//   AttMapZ       s1       1
//   NormalCubeMap s2       1
//   NormalMap     s3       1
//

    ps_1_3
    tex t0
    tex t1
    tex t2
    tex t3
    dp3_sat r0.xyz, t0_bx2, t3_bx2
    mul r0.xyz, r0, c0
    mul r0.xyz, t1, r0
    mul r0.xyz, t2, r0
  + mov r0.w, c0.w

// approximately 8 instruction slots used (4 texture, 4 arithmetic)