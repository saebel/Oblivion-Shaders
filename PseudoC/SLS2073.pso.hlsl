//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2073.pso /Fcshaderdump19/SLS2073.pso.dis
//
    const float4 const_0 = {-0.5, 0.5, 0, 0};
    float3 texcoord_0 : TEXCOORD0;			// partial precision
    float texcoord_1 : TEXCOORD1;			// partial precision
    r0.xyz = IN.texcoord_0 + -0.5;			// partial precision
    r1.xyz = r0 + r0;			// partial precision
    r0.xyz = normalize(r1);			// partial precision
    r0.xyz = (0.5 * r0) + 0.5;			// partial precision
    r0.w = IN.texcoord_1.x;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 8 instruction slots used
