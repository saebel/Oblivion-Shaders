//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_1_3 HLSL/STB1008.p.hlsl /FcHLSL/STB1008.p.asm
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
    dp3_sat r0, t0_bx2, t3_bx2
    mul r1.w, r0.w, r0.w
    mul r1.w, r1.w, r1.w
    mul r1.w, t0.w, r1.w
    mul r1.xyz, r1.w, c0
    mul r1.xyz, t1, r1
  + mul r0.w, t0.w, r0.w
    mul r0.xyz, t2, r1

// approximately 11 instruction slots used (4 texture, 7 arithmetic)
