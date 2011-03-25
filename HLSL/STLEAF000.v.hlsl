//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STLEAF000.vso /Fcshaderdump19/STLEAF000.vso.dis
//
//
// Parameters:

float4 AmbientColor;
float4 BillboardRight;
float4 BillboardUp;
float4 DiffColor;
float4 LeafBase[48];
float4 LeafLighting;
float4 LightVector;
row_major float4x4 ModelViewProj;
float4 RockParams;
float4 RustleParams;
float SunDimmer;
float4 WindMatrices[16];

// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float4 ilum : TEXCOORD1;			// partial precision
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274

    const float4 const_4 = {(1.0 / (PI * 2)), 0.25, 0.5, 0};
    const float4 const_7 = {(1.0 / 48), 0.499999553, 0.25, -0.00138883968};
    const float4 const_8 = {PI * 2, -PI, -2.52398507e-007, 2.47609005e-005};
    const float const_9 = (1.0 / 24);
    float4 IN_position, mtx;
    float4 r0, r1, r2, r4, r5;
    float2 r3;
    float offset;
    float irock, irstl;
    float ir0, ir1, ir2, is0, is1, is2;
    float2 rr0, rr1;
    float2 irm, ism;

    irock = (IN.blendindices.z * const_7.x) + RockParams.y;
    irstl = (IN.blendindices.z * const_7.x) + RustleParams.y;

    irock = (irock * const_7.y) + const_7.z;
    irstl = (irstl * const_7.y) + const_7.z;

    irock = pow(2.0, irock);	// partial precision
    irstl = pow(2.0, irstl);	// partial precision

    ir1 = (irock * const_8.x) + const_8.y;
    is0 = (irstl * const_8.x) + const_8.y;
    ir0 = (ir1 * ir1 * const_8.z) + const_8.w;
    is1 = (is0 * is0 * const_8.z) + const_8.w;

    ir2 = (ir1 * ir0) + const_7.w;
    is1 = (is0 * is1) + const_7.w;
    ir2 = (ir1 * ir2) + const_9;
    is1 = (is0 * is1) + const_9;
    ir2 = (ir1 * ir2) + -0.5;
    is1 = (is0 * is1) + -0.5;
    ir2 = (ir1 * ir2) + 1;
    is0 = (is0 * is1) + 1;
    ir2 = ir2 * RockParams.z * RockParams.x;
    is0 = is0 * RustleParams.z * RustleParams.x;

    rr0 = frac((ir2 * const_4.x) + const_4.yzzw);
    rr1 = frac((is0 * const_4.x) + const_4.yzzw);
    rr0 = (const_8.x * rr0) + const_8.y;
    rr1 = (const_8.x * rr1) + const_8.y;
    rr0 = rr0 * rr0;
    rr1 = rr1 * rr1;

    irm = (const_8.z * rr0) + const_8.w;
    ism = (const_8.z * rr1) + const_8.w;
    irm = (irm * rr0) + const_7.w;
    ism = (ism * rr1) + const_7.w;
    irm = (irm * rr0) + const_9;
    ism = (ism * rr1) + const_9;
    irm = (irm * rr0) + -0.5;
    ism = (ism * rr1) + -0.5;

    r0.xw = (rr0.yyxx * irm.yyxx) + 1;
    r1.xw = (rr1.yyxx * ism.yyxx) + 1;
    r0.y = -r0.w;
    r1.y = -r1.w;

    /* ------------------------------------------------------------------------- */
    offset = IN.blendindices.z;
    r2 = IN.blendindices.w * LeafBase[offset];

    r5.x = dot(r0.xyw, r2);
    r4.x = dot(r0.wxw, r2);

    mtx.xy = ism;
    mtx.xw = r1.xw;
    mtx.y = r1.y;
    mtx.z = 0;

    r1.x = dot(mtx, BillboardRight);
    r1.y = dot(mtx.wxzw, BillboardRight);
    r1.zw = BillboardRight;

    r0.x = dot(mtx, BillboardUp);
    r0.y = dot(mtx.wxzw, BillboardUp);
    r0.zw = BillboardUp;

    r0 = (r4.x * r0) + (r5.x * r1);

    IN_position = r0 + IN.position;

    /* +term: wind ------------------------------------------------------------- */
    float4 InstanceWind, InstanceProj;
    offset = IN.blendindices.y;

    InstanceWind.x = dot(WindMatrices[0 + offset], IN_position);
    InstanceWind.y = dot(WindMatrices[1 + offset], IN_position);
    InstanceWind.z = dot(WindMatrices[2 + offset], IN_position);
    InstanceWind.w = dot(WindMatrices[3 + offset], IN_position);

    InstanceWind =                      InstanceWind  - IN_position;
    InstanceWind = (IN.blendindices.x * InstanceWind) + IN_position;

    InstanceProj.x = dot(ModelViewProj[0], InstanceWind);
    InstanceProj.y = dot(ModelViewProj[1], InstanceWind);
    InstanceProj.z = dot(ModelViewProj[2], InstanceWind);
    InstanceProj.w = dot(ModelViewProj[3], InstanceWind);

    OUT.position = InstanceProj;

    /* +term: ??? -------------------------------------------------------------- */
    float3 Surface;

    Surface.xyz = normalize(r2);
    Surface.xyz = (LeafLighting.y * Surface) + IN.normal;
    Surface.xyz = normalize(Surface);

    /* +term: directional diffuse light (sun) ---------------------------------- */
    float dotnrmlit = min(max(dot(Surface, LightVector), 0), 1);
    float4 envcol;

    envcol = dotnrmlit * DiffColor;
    envcol = (SunDimmer.x * envcol) + AmbientColor;

    /* +term: falloff ---------------------------------------------------------- */
    float envpower = pow(2.0, IN.blendindices.z);	// partial precision
    /* -term */

    OUT.ilum.rgb = envcol.rgb * envpower;
    OUT.ilum.a = envcol.a;

    /* +term: copy ------------------------------------------------------------- */
    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 95 instruction slots used
