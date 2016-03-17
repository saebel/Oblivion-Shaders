//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE005.pso
//    /Fcshaderdump19/WATERDISPLACE005.pso.dis
//
//
// Parameters:

sampler2D DisplaceMap;
float fDamp;

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

    const float2 const_0 = {-(1.0 / 256), 0};
    const float2 const_1 = {-(1.0 / 256), (1.0 / 256)};
    const float2 const_2 = {0, -(1.0 / 256)};

    float2 p7 = IN.texcoord_0 - const_0;
    float2 p6 = IN.texcoord_0 + const_0;
    float2 p5 = IN.texcoord_0 + const_0.x;
    float2 p4 = IN.texcoord_0 + const_1;
    float2 p3 = IN.texcoord_0 - const_1;
    float2 p2 = IN.texcoord_0 + const_1.y;
    float2 p1 = IN.texcoord_0 + const_2;
    float2 p0 = IN.texcoord_0 - const_2;

    float d7 = tex2D(DisplaceMap, p7);
    float d6 = tex2D(DisplaceMap, p6);
    float d5 = tex2D(DisplaceMap, p5);
    float d4 = tex2D(DisplaceMap, p4);
    float d3 = tex2D(DisplaceMap, p3);
    float d2 = tex2D(DisplaceMap, p2);
    float d1 = tex2D(DisplaceMap, p1);
    float d0 = tex2D(DisplaceMap, p0);

    float r1 = abs(d6) *  fDamp.x * 2     ;
    float r4 = abs(d5) * -fDamp.x     - r1;
    float r2 = abs(d4) * -fDamp.x     + r1;
    float r3 = abs(d3) *  fDamp.x     + r1;
    float r0 = abs(d7) *  fDamp.x * 2 + r1;
          r1 = abs(d2) *  fDamp.x     + r0;
    float r5 = abs(d1) *  fDamp.x * 2     ;
          r2 = abs(d0) *  fDamp.x         ;

    r4 = (fDamp.x * -r4) - r5;
    r3 = (fDamp.x * -r3) + r4;
    r3 = (fDamp.x *  r2) + r3;
    r5 = (      2 *  r2) + r3;
    r1 = (fDamp.x *  r1) + r5;

    float3 dd;

    dd.x = -r0;
    dd.y =  r1;
    dd.z =   1;
    dd = normalize(dd);
    dd = (0.5 * dd) + 0.5;

    OUT.color_0.xyz = dd;
    OUT.color_0.w = 1;

    return OUT;
};

// approximately 48 instruction slots used (8 texture, 40 arithmetic)