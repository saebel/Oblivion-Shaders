//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_1_3 HLSL/STB1002.p.hlsl /FcHLSL/STB1002.p.asm
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
//   AmbientColor c0       1
//   PSLightColor c1       1
//   BaseMap      s0       1
//   NormalMap    s1       1
//

    ps_1_3
    tex t0
    tex t1
    texcoord t3
    dp3_sat r0.xyz, t1_bx2, t3_bx2
    mad_sat r0.xyz, r0, c1, c0
    mul r1.xyz, t0, v0
  + mov r0.w, t0.w
    mul r0.xyz, r0, r1

// approximately 7 instruction slots used (3 texture, 4 arithmetic)
