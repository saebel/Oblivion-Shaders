//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_2_b HLSL/WATERDISPLACE007.p.hlsl /FcHLSL/WATERDISPLACE007.p.asm
//
//
// Parameters:
//
//   sampler2D DisplaySampler;
//   float2 TextureOffset;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   TextureOffset  c0       1
//   DisplaySampler s0       1
//

    ps_2_x
    def c1, -0.5, 0, -0.400000006, 10
    def c2, 0.5, 0.5, 0.5, 1
    def c3, -0.5, -0.5, -0.5, -1
    dcl t0.xy
    dcl_2d s0
    add r0.xy, t0, c1.x
    dp2add r0.w, r0, r0, c1.y
    rsq r0.w, r0.w
    rcp r0.w, r0.w
    add r0.w, r0.w, c1.z
    mul_sat r1.w, r0.w, c1.w
    add r0.xy, t0, c0
    texld r0, r0, s0
    add r0, r0, c3
    mad r0, r1.w, r0, c2
    mov oC0, r0

// approximately 11 instruction slots used (1 texture, 10 arithmetic)
