//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_2_b HLSL/WATERHMAP003.p.hlsl /FcHLSL/WATERHMAP003.p.asm
//
//
// Parameters:
//
//   sampler2D sampScramble;
//   sampler2D sampSourceImage;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   sampScramble    s0       1
//   sampSourceImage s1       1
//

    ps_2_x
    dcl t0.xy
    dcl_2d s0
    dcl_2d s1
    texld r0, t0, s0
    mov r0.y, t0.y
    texld r0, r0, s1
    mov r0.yzw, r0.x
    mov oC0, r0

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
