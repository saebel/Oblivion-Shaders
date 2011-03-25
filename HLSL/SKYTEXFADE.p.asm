//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_3_0 HLSL/SKYTEXFADE.p.hlsl /FcHLSL/SKYTEXFADE.p.asm
//
//
// Parameters:
//
//   sampler2D TexMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   TexMap       s0       1
//

    ps_3_0
    dcl_texcoord v0.xy
    dcl_texcoord2 v1.x
    dcl_color v2
    dcl_2d s0
    texld r0, v0, s0
    mul r0.w, r0.w, v2.w
    mul oC0.xyz, r0, v2
    mul oC0.w, r0.w, v1.x

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
