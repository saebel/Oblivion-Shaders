//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_3_0 HLSL/COPY001.p.hlsl /FcHLSL/COPY001.p.asm
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
    def c0, 1, -1, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    texld r0, v0, s0
    mad oC0, r0.xyzx, c0.xxxy, c0.zzzx

// approximately 2 instruction slots used (1 texture, 1 arithmetic)
