//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYQUADSI.vso /Fcshaderdump19/SKYQUADSI.vso.dis
//
    const int4 const_0 = {1, 0, 0, 0};
    float4 IN.position : POSITION;
    float4 OUT.position : POSITION;
    OUT.position.xyzw = (IN.position.xyzx * const_0.xxxy) + const_0.yyyx;

// approximately 1 instruction slot used
