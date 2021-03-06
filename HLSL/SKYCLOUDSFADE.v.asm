//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_3_0 HLSL/SKYCLOUDSFADE.v.hlsl /FcHLSL/SKYCLOUDSFADE.v.asm
//
//
// Parameters:
//
//   float4 BlendColor[3];
//   float3 EyePosition;
//   row_major float4x4 Model;
//   row_major float4x4 ModelViewProj;
//   float TexCoordYOff;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj c0       4
//   BlendColor    c4       3
//   Model         c7       3
//   EyePosition   c10      1
//   TexCoordYOff  c11      1
//

    vs_3_0
    def c12, 0.142857149, 0, 0, 0
    dcl_position v0
    dcl_texcoord v1
    dcl_color v2
    dcl_position o0
    dcl_texcoord o1.xy
    dcl_texcoord1 o2.xy
    dcl_texcoord2 o3.x
    dcl_color o4
    mul r0.xyz, c5, v2.y
    mad r0.xyz, v2.x, c4, r0
    mad o4.xyz, v2.z, c6, r0
    mul o4.w, c4.w, v2.w
    dp4 r0.w, c9, v0
    add r0.w, r0.w, -c10.z
    dp4 r0.x, c0, v0
    dp4 r0.y, c1, v0
    dp4 r0.z, c3, v0
    mul_sat o3.x, r0.w, c12.x
    mov o0, r0.xyzz
    add r0.y, c11.x, v1.y
    mov r0.x, v1.x
    mov o1.xy, r0
    mov o2.xy, r0

// approximately 15 instruction slots used
