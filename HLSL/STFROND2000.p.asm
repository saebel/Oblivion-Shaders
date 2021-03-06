//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_2_b HLSL/STFROND2000.p.hlsl /FcHLSL/STFROND2000.p.asm
//
//
// Parameters:
//
//   sampler2D DiffuseMap;
//   float SunlightDimmer;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   SunlightDimmer c0       1
//   DiffuseMap     s0       1
//

    ps_2_x
    dcl t0.xy
    dcl v0.xyz
    dcl v1.xyz
    dcl_2d s0
    texld r0, t0, s0
    mov r1.xyz, v1
    mad r1.xyz, c0.x, r1, v0
    mul r0.xyz, r0, r1
    mov oC0, r0

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
