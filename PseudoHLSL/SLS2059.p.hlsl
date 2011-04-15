//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2059.pso /Fcshaderdump19/SLS2059.pso.dis
//
//
// Parameters:
//
sampler2D BaseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BaseMap      texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float4 texcoord_1 : TEXCOORD1;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;

    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    OUT.color_0.a = r0.w;			// partial precision
    OUT.color_0.rgb = saturate(IN.texcoord_1.z / IN.texcoord_1.w);			// partial precision

    return OUT;
};

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
