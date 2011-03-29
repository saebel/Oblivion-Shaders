//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3028.pso /Fcshaderdump19/SM3028.pso.dis
//
//
// Parameters:

sampler2D NormalMap;
float PSRefractionPower;


// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   PSRefractionPower const_8       1
//   NormalMap         texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float3 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0.1, -0.1, 1.0 - 0.1};
    const int4 const_1 = {1, 0, 0, 0};

    OUT.color_0.xy = (--0.5 * r0) - -0.5;			// partial precision
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0);
    r0.w = 1.0 / IN.texcoord_0.z;			// partial precision
    r0.xy = r0.xy + -0.5;
    r0.xy = r0.xy + r0.xy;			// partial precision
    r1.xy = min(r0.xy, 0.1);			// partial precision
    r0.xy = max(-0.1, r1.xy);			// partial precision
    r0.xy = (1.0 - 0.1 * r0) + IN.texcoord_1;			// partial precision
    r0.xy = r0.xy * r0.w;			// partial precision
    r0.xy = const_1.xy;
    OUT.color_0.zw = (PSRefractionPower.x * r0.xyxy) + r0.xyyx;			// partial precision

    return OUT;
};

// approximately 11 instruction slots used (1 texture, 10 arithmetic)
