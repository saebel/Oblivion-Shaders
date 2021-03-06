//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_1_3 HLSL/NIGHTEYE000.p.hlsl /FcHLSL/NIGHTEYE000.p.asm
//
//
// Parameters:
//
//   float4 SpellInput;
//   sampler2D Src0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   SpellInput   c0       1
//   Src0         s0       1
//

    ps_1_3
    def c1, 1, 0, 0, -1
    def c2, 1, 1, 1, 0.5
    def c3, 0.209999993, 0.5, 0.779999971, 0.5
    def c4, 0, 0, 0, 1
    tex t0
    dp4 r1, c1, c0
    add t0.w, r1.w, c1.w
    mul_d2 t0.w, t0.w, t0.w
    add t0.w, -t0.w, c2.w
  + dp3 r1.xyz, c2, t0
    add t0.w, -t0.w, c2.w
  + mul r1.xyz, r1, c3
    mad r0.w, t0.w, c3.w, c3.w
    cnd r0.xyz, r0.w, r1, t0
  + mov r0.w, c4.w

// approximately 8 instruction slots used (1 texture, 7 arithmetic)
