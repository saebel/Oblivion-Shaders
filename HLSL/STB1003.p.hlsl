//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1003.pso /Fcshaderdump19/STB1003.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttMapXY;
sampler2D AttMapZ;
samplerCUBE NormalCubeMap;
sampler2D NormalMap;
float4 PSLightColor[4];

// Structures:

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float2 texcoord_3 : TEXCOORD3;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float3 t0 = tex2D(AttMapXY, IN.texcoord_0);
    float3 t1 = tex2D(AttMapZ, IN.texcoord_1);
    float3 t2 = texCUBE(NormalCubeMap, IN.texcoord_2);
    float3 t3 = tex2D(NormalMap, IN.texcoord_3);
    float3 r0, r1, r2;

    r0 = saturate(dot(2 * (t0 - 0.5), 2 * (t3 - 0.5)));
    r1 = saturate(dot(2 * (t0 - 0.5), 2 * (IN.color_0 - 0.5)));

    r2 = r0 * t1 * t2;

    r1 = (PSLightColor[0] * r1) + AmbientColor;
    r0 = (PSLightColor[1] * r2) + r1;

    OUT.color_0.rgb = saturate(r0);
    OUT.color_0.a   = AmbientColor.a;

    return OUT;
};

// approximately 10 instruction slots used (4 texture, 6 arithmetic)