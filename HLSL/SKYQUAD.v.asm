//
// Generated by Microsoft (R) D3DX9 Shader Compiler 5.04.00.2904
//
//   fxc /Tvs_3_0 HLSL/SKYQUAD.v.hlsl /FcHLSL/SKYQUAD.v.asm
//
    vs_3_0
    def c0, 1, 0, 0, 0
    dcl_position v0
    dcl_color v1
    dcl_position o0
    dcl_color o1
    mad o0, v0.xyzx, c0.xxxy, c0.yyyx
    mov o1, v1

// approximately 2 instruction slots used