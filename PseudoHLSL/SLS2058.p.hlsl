//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2058.pso /Fcshaderdump19/SLS2058.pso.dis
//


// Structures:

struct VS_OUTPUT {
    float4 texcoord_1 : TEXCOORD1;			// partial precision
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const int4 const_0 = {1, 0, 0, 0};

    r0.w = 1.0 / IN.texcoord_1.w;			// partial precision
    r0.w = r0.w * IN.texcoord_1.z;			// partial precision
    r0.xyz = saturate(r0.w);			// partial precision
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 5 instruction slots used
