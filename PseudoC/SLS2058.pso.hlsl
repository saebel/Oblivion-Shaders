//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2058.pso /Fcshaderdump19/SLS2058.pso.dis
//
    const int4 const_0 = {1, 0, 0, 0};
    float4 texcoord_1 : TEXCOORD1;			// partial precision
    r0.w = 1.0 / IN.texcoord_1.w;			// partial precision
    r0.w = r0.w * IN.texcoord_1.z;			// partial precision
    r0.xyz = saturate(r0.w);			// partial precision
    r0.w = const_0.x;
    OUT.color_0 = r0;			// partial precision

// approximately 5 instruction slots used
