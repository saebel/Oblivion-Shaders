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


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   fDamp        const_3       1
//   DisplaceMap  texture_0       1
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

    const float4 const_0 = {-(1.0 / 256), 0, (1.0 / 256), 2};
    const float4 const_1 = {-(1.0 / 256), (1.0 / 256), 1, 0.5};
    const float4 const_2 = {0, -(1.0 / 256), 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;
    float4 r7;

    r0.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy - const_2.xy);
    r2.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy + (1.0 / 256));
    r4.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy + const_1.xy);
    r2.w = abs(r4.x);
    r3.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy - const_1.xy);
    r3.w = abs(r3.x);
    r5.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy + -(1.0 / 256));
    r4.w = abs(r5.x);
    r6.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy + const_0.xy);
    r7.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy - const_0.xy);
    r0.w = (2 * (abs(r7.x) * fDamp.x)) + ((fDamp.x * r3.w) + ((fDamp.x * -r2.w) + ((fDamp.x * -r4.w) - (2 * (abs(r6.x) * fDamp.x)))));
    r1.xyzw = tex2D(DisplaceMap, IN.texcoord_0.xy + const_2.xy);
    r1.w = abs(r2.x);
    r3.w = (fDamp.x * r2.w) + ((fDamp.x * -r3.w) + ((fDamp.x * -r4.w) - (2 * (abs(r1.x) * fDamp.x))));
    r2.w = abs(r0.x) * fDamp.x;
    r0.x = -((fDamp.x * r1.w) + r0.w);
    r0.w = 1;
    r0.y = (fDamp.x * r1.w) + ((2 * r2.w) + r3.w);
    r0.z = 1;
    r0.z = 1.0 / length(r0.xyz);
    r0.xy = r0.xy * r0.z;
    r0.xyz = (0.5 * r0.xyz) + 0.5;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 48 instruction slots used (8 texture, 40 arithmetic)
