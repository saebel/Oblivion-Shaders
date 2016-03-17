//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_3_0 HLSL/SKYSICLOUDS.p.hlsl /FcHLSL/SKYSICLOUDS.p.asm
//
//
// Parameters:
//
//   float2 Params;
//   sampler2D TexMap;
//   sampler2D TexMapBlend;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Params       c0       1
//   TexMap       s0       1
//   TexMapBlend  s1       1
//

    ps_3_0
    def c1, 0, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xy
    dcl_2d s0
    dcl_2d s1
    texld r1, v1, s1
    texld r0, v0, s0
    add r0.z, r1.w, -r0.w
    mad oC0.w, c0.x, r0.z, r0.w
    mov oC0.xyz, c1.x

// approximately 5 instruction slots used (2 texture, 3 arithmetic)