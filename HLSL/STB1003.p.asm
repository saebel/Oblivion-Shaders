//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_1_3 HLSL/STB1003.p.hlsl /FcHLSL/STB1003.p.asm
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
//   PSLightColor  c0       2
//   AmbientColor  c2       1
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
    mul r0.xyz, t1, r0
    mul r0.xyz, t2, r0
    dp3_sat r1.xyz, t0_bx2, v0_bx2
    mad r1.xyz, r1, c0, c2
    mad_sat r0.xyz, r0, c1, r1
  + mov r0.w, c2.w

// approximately 10 instruction slots used (4 texture, 6 arithmetic)
