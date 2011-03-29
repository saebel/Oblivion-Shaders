//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE004.pso
//    /Fcshaderdump19/WATERDISPLACE004.pso.dis
//
//
// Parameters:

sampler2D HeightMap;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   HeightMap    texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0, -(1.0 / 256), 2, -1};
    const float4 const_1 = {0.125, 0.5, 0, 0};
    const float4 const_2 = {-(1.0 / 256), 0, -3, 0};

    r0.xy = IN.texcoord_0 - const_2.xy;
    r0.xyzw = tex2D(HeightMap, r0);
    r0.xyzw = (2 * r0) + r1;
    r0.xyzw = r0 + -3;
    r0.xyzw = (0.125 * r0) + 0.5;
    OUT.color_0.rgba = r0.xyzw;
    r1.xy = IN.texcoord_0 + const_2.xy;
    r1.xyzw = tex2D(HeightMap, r1);
    r1.xyzw = (2 * r1) + r2;
    r2.xy = IN.texcoord_0 - const_0.xy;
    r2.xyzw = tex2D(HeightMap, r2);
    r2.xyzw = (2 * r2) + r3;
    r3.xy = IN.texcoord_0 + const_0.xy;
    r3.xyzw = tex2D(HeightMap, r3);
    r3.xyzw = (2 * r3) + -1;

    return OUT;
};

// approximately 15 instruction slots used (4 texture, 11 arithmetic)
