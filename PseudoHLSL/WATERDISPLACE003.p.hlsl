//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE003.pso
//    /Fcshaderdump19/WATERDISPLACE003.pso.dis
//
//
// Parameters:
//
sampler2D HeightMap : register(s0);
float3 RainVars : register(c4);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   RainVars     const_4       1
//   HeightMap    texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float2 HeightUV : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0, -(1.0 / 256), 4, -0.5};
    const float4 const_1 = {-(1.0 / 256), 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;

    r0.xyzw = tex2D(HeightMap, IN.HeightUV.xy);
    r1.xyzw = tex2D(HeightMap, IN.HeightUV.xy - const_1.xy);
    r4.xyzw = tex2D(HeightMap, IN.HeightUV.xy - const_0.xy);
    r2.xyzw = tex2D(HeightMap, IN.HeightUV.xy + const_1.xy);
    r3.xyzw = tex2D(HeightMap, IN.HeightUV.xy + const_0.xy);
    r1.w = (r1.x + (r2.x + (r3.x + r4.x))) - (r0.x * 4);
    r0.xyzw = r0.xyzw - 0.5;
    r0.y = (RainVars.x * r1.w) + r0.y;
    r0.x = (RainVars.y * r0.y) + r0.x;
    r0.xyzw = (RainVars.z * r0.xyzw) + 0.5;
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = r0.xyz;

    return OUT;
};

// approximately 19 instruction slots used (5 texture, 14 arithmetic)
