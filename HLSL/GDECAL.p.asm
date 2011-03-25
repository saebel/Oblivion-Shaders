//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tps_2_b HLSL/GDECAL.p.hlsl /FcHLSL/GDECAL.p.asm
//
//
// Parameters:
//
//   sampler2D DecalMap;
//   float4 PSDecalOffsets;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSDecalOffsets c0       1
//   DecalMap       s0       1
//

    ps_2_x
    dcl t0.xyz
    dcl_2d s0
    mov_sat r0.xy, t0
    mad r0.x, c0.y, r0.x, c0.x
    mad r0.y, c0.w, r0.y, c0.z
    texld r0, r0, s0
    mul r0.xyz, r0, t0.z
    mul r0.w, r0.w, t0.z
    mov oC0, r0

// approximately 7 instruction slots used (1 texture, 6 arithmetic)
