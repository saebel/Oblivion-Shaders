//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_3_0 HLSL/COPY000.p.hlsl /FcHLSL/COPY000.p.asm
//
//
// Parameters:
//
//   sampler2D Src0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Src0         s0       1
//

    ps_3_0
    dcl_texcoord v0.xy
    dcl_2d s0
    texld oC0, v0, s0

// approximately 1 instruction slot used (1 texture, 0 arithmetic)
