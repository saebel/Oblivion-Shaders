//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE006.pso
//    /Fcshaderdump19/WATERDISPLACE006.pso.dis
//
//
// Parameters:
//
float BlendAmount;
sampler2D HeightMap01;
sampler2D HeightMap02;
float fDamp;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BlendAmount  const_1       1
//   fDamp        const_3       1
//   HeightMap01  texture_0       1
//   HeightMap02  texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float4 r0;
    float4 r1;

    r1.xyzw = tex2D(HeightMap02, IN.texcoord_0.xy);
    r0.xyzw = tex2D(HeightMap01, IN.texcoord_0.xy);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = ((0.8 / fDamp.x) * abs(r0.x)) + (abs(r1.x) - ((0.8 / fDamp.x) * abs(r0.x)) * BlendAmount.x);

    return OUT;
};

// approximately 11 instruction slots used (2 texture, 9 arithmetic)
