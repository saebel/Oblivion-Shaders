//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3012.pso /Fcshaderdump19/SM3012.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 HairTint : register(c2);
sampler2D LayerMap : register(s5);
float4 LightData[30];
float3 MatAlpha : register(c3);
sampler2D NormalMap : register(s1);
sampler2D ShadowMap : register(s2);
sampler2D ShadowMask : register(s3);
float4 ToggleADTS : register(c5);
float4 ToggleNumLights : register(c6);
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    const_0       1
//   HairTint        const_2       1
//   MatAlpha        const_3       1
//   ToggleADTS      const_5       1
//   ToggleNumLights const_6       1
//   LightData[0]       const_9          1
//   LightData[1]       const_10          1
//   LightData[2]       const_11          1
//   LightData[3]       const_12          1
//   LightData[4]       const_13          1
//   LightData[5]       const_14          1
//   LightData[6]       const_15          1
//   LightData[7]       const_16          1
//   LightData[8]       const_17         1
//   LightData[9]       const_18         1
//   LightData[10]       const_19         1
//   LightData[11]       const_20         1
//   LightData[12]       const_21         1
//   LightData[13]       const_22         1
//   LightData[14]       const_23         1
//   LightData[15]       const_24         1
//   LightData[16]       const_25        1
//   LightData[17]       const_26        1
//   LightData[18]       const_27        1
//   LightData[19]       const_28        1
//   LightData[20]       const_29       1
//   LightData[21]       const_30       1
//   LightData[22]       const_31       1
//   LightData[23]       const_32       1
//   LightData[24]       const_33       1
//   LightData[25]       const_34       1
//   LightData[26]       const_35       1
//   LightData[27]       const_36       1
//   LightData[28]       const_37       1
//   LightData[29]       const_38       1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   ShadowMap       texture_2       1
//   ShadowMask      texture_3       1
//   LayerMap        texture_5       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float2 color_0 : COLOR0;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float3 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_1 : TEXCOORD1;			// partial precision
    float4 texcoord_7 : TEXCOORD7_centroid;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const int4 const_1 = {15, -1, -2, 0};
    const int4 const_39 = {2, -8, -9, -10};
    const int4 const_4 = {2, -2, -3, -4};
    const int4 const_40 = {2, -12, -13, -14};
    const int4 const_41 = {2, -10, -11, -12};
    const int4 const_42 = {2, -20, -21, -22};
    const int4 const_43 = {2, -18, -19, -20};
    const int4 const_44 = {2, -24, -25, -26};
    const int4 const_45 = {2, -22, -23, -24};
    const int4 const_46 = {2, -26, -27, -28};
    const int4 const_47 = {2, -28, -29, 0};
    const int4 const_48 = {2, -6, -7, -8};
    const int4 const_49 = {2, -14, -15, -16};
    const int4 const_50 = {2, -16, -17, -18};
    const float4 const_7 = {-0.5, 0, 1, -1};
    const int4 const_8 = {2, -4, -5, -6};

    float3 l124;
    float3 l33;
    float3 l42;
    float3 l44;
    float3 l46;
    float3 l48;
    float3 l50;
    float3 l52;
    float3 l54;
    float3 l56;
    float3 l58;
    float3 l60;
    float3 l62;
    float3 l64;
    float3 l66;
    float3 l68;
    float3 m133;
    float3 m137;
    float3 m141;
    float3 m145;
    float3 m149;
    float3 m153;
    float3 m157;
    float3 m161;
    float3 m165;
    float3 m169;
    float3 m173;
    float3 m177;
    float3 m181;
    float3 m185;
    float3 m188;
    float1 q10;
    float3 q11;
    float1 q12;
    float3 q13;
    float1 q14;
    float3 q15;
    float1 q16;
    float3 q17;
    float1 q18;
    float3 q19;
    float1 q2;
    float1 q20;
    float3 q21;
    float1 q22;
    float3 q23;
    float1 q24;
    float3 q25;
    float1 q26;
    float3 q27;
    float1 q28;
    float3 q29;
    float1 q30;
    float3 q31;
    float1 q32;
    float3 q35;
    float3 q4;
    float3 q5;
    float1 q6;
    float3 q7;
    float3 q71;
    float1 q8;
    float3 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;
    float3 t0;
    float1 t1;

#define	TanSpaceProj	float3x3(r7.xyz, r6.xyz, r5.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r4.xyz = normalize(expand(r0.xyz));			// partial precision
    r5.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r6.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r7.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r3.xyz = const_7.xyz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r3.y : r3.z);

    if (0 != r0.w) {
      t1.x = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      t0.xyz = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      l124.xyz = mul(TanSpaceProj, LightData[1].xyz);
      r1.w = 1;
      r2.xyz = ((t1.x * (t0.xyz - 1)) + 1) * (shade(r4.xyz, l124.xyz) * LightData[0].xyz);			// partial precision
    }
    else {
      r2.xyz = 0;			// partial precision
      r1.w = 0;
    }

    q2.x = min(ToggleNumLights.y, 15 - ToggleNumLights.x);			// partial precision
    r2.w = ((q2.x >= 0.0 ? 0 : 1) * (frac(q2.x) <= 0.0 ? 0 : 1)) + (q2.x - frac(q2.x));
    r0.w = (r2.w <= 0.0 ? 0 : 1);

    if (0 != r0.w) {
      r1.x = 2 * r1.w;
      r1.yz = r1.x + const_1.yz;
      q4.xyz = r1.x + const_1.wyz;
      r1.w = r1.w + 1;
      r1.xyz = (q4.xyz >= 0.0 ? q4.xyz : -r1.xyz);
      r0.xyzw = (r1.z <= 0.0 ? LightData[3].xyzw : (r1.y <= 0.0 ? LightData[2].xyzw : (r1.x <= 0.0 ? LightData[1].xyzw : r3.y)));
      q5.xyz = r0.xyz - IN.texcoord_6.xyz;
      q6.x = saturate(length(q5.xyz) / r0.w);
      m133.xyz = mul(TanSpaceProj, q5.xyz);
      l42.xyz = (r1.z <= 0.0 ? LightData[2].xyz : (r1.y <= 0.0 ? LightData[1].xyz : (r1.x <= 0.0 ? LightData[0].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m133.xyz)) * (1.0 - sqr(q6.x)), 0) * l42.xyz) + r2.xyz;			// partial precision
    }


    if (1 != r2.w) {
      r1.xyz = (2 * r1.w) + const_4.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[5].xyzw : (r1.y == 0.0 ? LightData[4].xyzw : (r1.x == 0.0 ? LightData[3].xyzw : r3.y)));
      q7.xyz = r0.xyz - IN.texcoord_6.xyz;
      q8.x = saturate(length(q7.xyz) / r0.w);
      m137.xyz = mul(TanSpaceProj, q7.xyz);
      l44.xyz = (r1.z == 0.0 ? LightData[4].xyz : (r1.y == 0.0 ? LightData[3].xyz : (r1.x == 0.0 ? LightData[2].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m137.xyz)) * (1.0 - sqr(q8.x)), 0) * l44.xyz) + r2.xyz;			// partial precision
    }


    if (2 != r2.w) {
      r1.xyz = (2 * r1.w) + const_8.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[7].xyzw : (r1.y == 0.0 ? LightData[6].xyzw : (r1.x == 0.0 ? LightData[5].xyzw : r3.y)));
      q9.xyz = r0.xyz - IN.texcoord_6.xyz;
      q10.x = saturate(length(q9.xyz) / r0.w);
      m141.xyz = mul(TanSpaceProj, q9.xyz);
      l46.xyz = (r1.z == 0.0 ? LightData[6].xyz : (r1.y == 0.0 ? LightData[5].xyz : (r1.x == 0.0 ? LightData[4].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m141.xyz)) * (1.0 - sqr(q10.x)), 0) * l46.xyz) + r2.xyz;			// partial precision
    }


    if (3 != r2.w) {
      r1.xyz = (2 * r1.w) + const_48.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[9].xyzw : (r1.y == 0.0 ? LightData[8].xyzw : (r1.x == 0.0 ? LightData[7].xyzw : r3.y)));
      q11.xyz = r0.xyz - IN.texcoord_6.xyz;
      q12.x = saturate(length(q11.xyz) / r0.w);
      m145.xyz = mul(TanSpaceProj, q11.xyz);
      l48.xyz = (r1.z == 0.0 ? LightData[8].xyz : (r1.y == 0.0 ? LightData[7].xyz : (r1.x == 0.0 ? LightData[6].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m145.xyz)) * (1.0 - sqr(q12.x)), 0) * l48.xyz) + r2.xyz;			// partial precision
    }


    if (4 != r2.w) {
      r1.xyz = (2 * r1.w) + const_39.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[11].xyzw : (r1.y == 0.0 ? LightData[10].xyzw : (r1.x == 0.0 ? LightData[9].xyzw : r3.y)));
      q13.xyz = r0.xyz - IN.texcoord_6.xyz;
      q14.x = saturate(length(q13.xyz) / r0.w);
      m149.xyz = mul(TanSpaceProj, q13.xyz);
      l50.xyz = (r1.z == 0.0 ? LightData[10].xyz : (r1.y == 0.0 ? LightData[9].xyz : (r1.x == 0.0 ? LightData[8].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m149.xyz)) * (1.0 - sqr(q14.x)), 0) * l50.xyz) + r2.xyz;			// partial precision
    }


    if (5 != r2.w) {
      r1.xyz = (2 * r1.w) + const_41.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[13].xyzw : (r1.y == 0.0 ? LightData[12].xyzw : (r1.x == 0.0 ? LightData[11].xyzw : r3.y)));
      q15.xyz = r0.xyz - IN.texcoord_6.xyz;
      q16.x = saturate(length(q15.xyz) / r0.w);
      m153.xyz = mul(TanSpaceProj, q15.xyz);
      l52.xyz = (r1.z == 0.0 ? LightData[12].xyz : (r1.y == 0.0 ? LightData[11].xyz : (r1.x == 0.0 ? LightData[10].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m153.xyz)) * (1.0 - sqr(q16.x)), 0) * l52.xyz) + r2.xyz;			// partial precision
    }


    if (6 != r2.w) {
      r1.xyz = (2 * r1.w) + const_40.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[15].xyzw : (r1.y == 0.0 ? LightData[14].xyzw : (r1.x == 0.0 ? LightData[13].xyzw : r3.y)));
      q17.xyz = r0.xyz - IN.texcoord_6.xyz;
      q18.x = saturate(length(q17.xyz) / r0.w);
      m157.xyz = mul(TanSpaceProj, q17.xyz);
      l54.xyz = (r1.z == 0.0 ? LightData[14].xyz : (r1.y == 0.0 ? LightData[13].xyz : (r1.x == 0.0 ? LightData[12].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m157.xyz)) * (1.0 - sqr(q18.x)), 0) * l54.xyz) + r2.xyz;			// partial precision
    }


    if (7 != r2.w) {
      r1.xyz = (2 * r1.w) + const_49.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[17].xyzw : (r1.y == 0.0 ? LightData[16].xyzw : (r1.x == 0.0 ? LightData[15].xyzw : r3.y)));
      q19.xyz = r0.xyz - IN.texcoord_6.xyz;
      q20.x = saturate(length(q19.xyz) / r0.w);
      m161.xyz = mul(TanSpaceProj, q19.xyz);
      l56.xyz = (r1.z == 0.0 ? LightData[16].xyz : (r1.y == 0.0 ? LightData[15].xyz : (r1.x == 0.0 ? LightData[14].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m161.xyz)) * (1.0 - sqr(q20.x)), 0) * l56.xyz) + r2.xyz;			// partial precision
    }


    if (8 != r2.w) {
      r1.xyz = (2 * r1.w) + const_50.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[19].xyzw : (r1.y == 0.0 ? LightData[18].xyzw : (r1.x == 0.0 ? LightData[17].xyzw : r3.y)));
      q21.xyz = r0.xyz - IN.texcoord_6.xyz;
      q22.x = saturate(length(q21.xyz) / r0.w);
      m165.xyz = mul(TanSpaceProj, q21.xyz);
      l58.xyz = (r1.z == 0.0 ? LightData[18].xyz : (r1.y == 0.0 ? LightData[17].xyz : (r1.x == 0.0 ? LightData[16].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m165.xyz)) * (1.0 - sqr(q22.x)), 0) * l58.xyz) + r2.xyz;			// partial precision
    }


    if (9 != r2.w) {
      r1.xyz = (2 * r1.w) + const_43.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[21].xyzw : (r1.y == 0.0 ? LightData[20].xyzw : (r1.x == 0.0 ? LightData[19].xyzw : r3.y)));
      q23.xyz = r0.xyz - IN.texcoord_6.xyz;
      q24.x = saturate(length(q23.xyz) / r0.w);
      m169.xyz = mul(TanSpaceProj, q23.xyz);
      l60.xyz = (r1.z == 0.0 ? LightData[20].xyz : (r1.y == 0.0 ? LightData[19].xyz : (r1.x == 0.0 ? LightData[18].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m169.xyz)) * (1.0 - sqr(q24.x)), 0) * l60.xyz) + r2.xyz;			// partial precision
    }


    if (10 != r2.w) {
      r1.xyz = (2 * r1.w) + const_42.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[23].xyzw : (r1.y == 0.0 ? LightData[22].xyzw : (r1.x == 0.0 ? LightData[21].xyzw : r3.y)));
      q25.xyz = r0.xyz - IN.texcoord_6.xyz;
      q26.x = saturate(length(q25.xyz) / r0.w);
      m173.xyz = mul(TanSpaceProj, q25.xyz);
      l62.xyz = (r1.z == 0.0 ? LightData[22].xyz : (r1.y == 0.0 ? LightData[21].xyz : (r1.x == 0.0 ? LightData[20].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m173.xyz)) * (1.0 - sqr(q26.x)), 0) * l62.xyz) + r2.xyz;			// partial precision
    }


    if (11 != r2.w) {
      r1.xyz = (2 * r1.w) + const_45.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[25].xyzw : (r1.y == 0.0 ? LightData[24].xyzw : (r1.x == 0.0 ? LightData[23].xyzw : r3.y)));
      q27.xyz = r0.xyz - IN.texcoord_6.xyz;
      q28.x = saturate(length(q27.xyz) / r0.w);
      m177.xyz = mul(TanSpaceProj, q27.xyz);
      l64.xyz = (r1.z == 0.0 ? LightData[24].xyz : (r1.y == 0.0 ? LightData[23].xyz : (r1.x == 0.0 ? LightData[22].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m177.xyz)) * (1.0 - sqr(q28.x)), 0) * l64.xyz) + r2.xyz;			// partial precision
    }


    if (12 != r2.w) {
      r1.xyz = (2 * r1.w) + const_44.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[27].xyzw : (r1.y == 0.0 ? LightData[26].xyzw : (r1.x == 0.0 ? LightData[25].xyzw : r3.y)));
      q29.xyz = r0.xyz - IN.texcoord_6.xyz;
      q30.x = saturate(length(q29.xyz) / r0.w);
      m181.xyz = mul(TanSpaceProj, q29.xyz);
      l66.xyz = (r1.z == 0.0 ? LightData[26].xyz : (r1.y == 0.0 ? LightData[25].xyz : (r1.x == 0.0 ? LightData[24].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m181.xyz)) * (1.0 - sqr(q30.x)), 0) * l66.xyz) + r2.xyz;			// partial precision
    }


    if (13 != r2.w) {
      r1.xyz = (2 * r1.w) + const_46.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[29].xyzw : (r1.y == 0.0 ? LightData[28].xyzw : (r1.x == 0.0 ? LightData[27].xyzw : r3.y)));
      q31.xyz = r0.xyz - IN.texcoord_6.xyz;
      q32.x = saturate(length(q31.xyz) / r0.w);
      m185.xyz = mul(TanSpaceProj, q31.xyz);
      l68.xyz = (r1.z == 0.0 ? LightData[28].xyz : (r1.y == 0.0 ? LightData[27].xyz : (r1.x == 0.0 ? LightData[26].xyz : r3.y)));			// partial precision
      r2.xyz = (max(dot(r4.xyz, normalize(m185.xyz)) * (1.0 - sqr(q32.x)), 0) * l68.xyz) + r2.xyz;			// partial precision
    }


    if (14 != r2.w) {
      l33.xyz = LightData[29].xyz - IN.texcoord_6.xyz;
      m188.xyz = mul(TanSpaceProj, l33.xyz);
      r1.xy = (2 * r1.w) + const_47.yz;
      r2.xyz = (max(dot(r4.xyz, normalize(m188.xyz)) * (1.0 - sqr(saturate(length(l33.xyz) / LightData[29].w))), 0) * (r1.y == 0.0 ? LightData[29].xyz : (r1.x == 0.0 ? LightData[28].xyz : r3.y))) + r2.xyz;			// partial precision
    }

    r1.xyzw = tex2D(LayerMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q71.xyz = (2 * ((IN.color_0.g * (r3.x + HairTint.rgb)) + 0.5)) * lerp(r0.xyz, r1.xyz, r1.w);			// partial precision
    q35.xyz = q71.xyz * (r2.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r3.z - ToggleADTS.x)));			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q35.xyz)) + q35.xyz;			// partial precision

    return OUT;
};

// approximately 463 instruction slots used (5 texture, 458 arithmetic)
