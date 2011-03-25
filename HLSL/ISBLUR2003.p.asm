//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_2_b HLSL/ISBLUR2003.p.hlsl /FcHLSL/ISBLUR2003.p.asm
//
//
// Parameters:
//
//   sampler2D Src0;
//   sampler2D Src1;
//   float4 blendW;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   blendW       c0       1
//   Src0         s0       1
//   Src1         s1       1
//

    ps_2_x
    def c1, 1, 0, 0, 0
    dcl t0.xy
    dcl t1.xy
    dcl_2d s0
    dcl_2d s1
    texld r1, t1, s1
    texld r0, t0, s0
    mul r1.xyz, r1, c0.y
    mad r0.xyz, c0.x, r0, r1
    mov r0.w, c1.x
    mov oC0, r0

// approximately 6 instruction slots used (2 texture, 4 arithmetic)
