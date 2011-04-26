//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE004.pso
//    /Fcshaderdump19/WATERDISPLACE004.pso.dis
//
//
// Parameters:
//
sampler2D HeightMap : register(s0);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
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

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    const float4 const_0 = {0, -(1.0 / 256), 2, -1};
    const float4 const_2 = {-(1.0 / 256), 0, -3, 0};

    float4 r0;
    float4 t0;
    float4 t1;
    float4 t2;
    float4 t3;

    t0.xyzw = tex2D(HeightMap, IN.HeightUV.xy - const_2.xy);
    t2.xyzw = tex2D(HeightMap, IN.HeightUV.xy - const_0.xy);
    t1.xyzw = tex2D(HeightMap, IN.HeightUV.xy + const_2.xy);
    t3.xyzw = tex2D(HeightMap, IN.HeightUV.xy + const_0.xy);
    r0.xyzw = (0.125 * (((2 * t0.xyzw) + ((2 * t1.xyzw) + ((2 * t2.xyzw) + expand(t3.xyzw)))) - 3)) + 0.5;
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = r0.xyz;

    return OUT;
};

// approximately 15 instruction slots used (4 texture, 11 arithmetic)
