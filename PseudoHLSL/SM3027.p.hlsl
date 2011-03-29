//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3027.pso /Fcshaderdump19/SM3027.pso.dis
//
//
// Parameters:

sampler2D BaseMap;
float4 LightData;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   LightData    const_10      1
//   BaseMap      texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;


    texcoord_1 IN.input_1.z;			// partial precision
    r0.w = 1.0 / LightData.w;			// partial precision
    OUT.color_0.rgb = r0.w * IN.input_1.z;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    OUT.color_0.a = r0.w;			// partial precision

    return OUT;
};

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
