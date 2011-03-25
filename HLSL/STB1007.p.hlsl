//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1007.pso /Fcshaderdump19/STB1007.pso.dis
//
//
// Parameters:

float3 LightColor[3];
sampler2D NormalMap;

// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const int4 const_1 = {1, 0, 0, 0};

    float4 t0 = tex2D(NormalMap, IN.texcoord_0);
    float4 r0, r1;

    r0 = saturate(dot(2 * (t0 - 0.5), 2 * (IN.texcoord_1 - 0.5)));
    r0.a = r0.a * r0.a;
    r0.a = r0.a * r0.a;
    r1.a = r0.a * r0.a;

    OUT.color_0.rgb = t0.a * r1.a * dot(const_1, LightColor[0]);
    OUT.color_0.a   = t0.a * r0.a;

    return OUT;
};

// approximately 9 instruction slots used (2 texture, 7 arithmetic)