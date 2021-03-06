//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3018.pso /Fcshaderdump19/SM3018.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
sampler2D GlowMap : register(s6);
float4 LightData[30] : register(c9);
float3 MatAlpha : register(c3);
float3 MatEmit : register(c4);
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
//   MatAlpha        const_3       1
//   MatEmit         const_4       1
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
//   GlowMap         texture_6       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
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

    const float4 const_1 = {-0.5, 0, 1, -1};
    const int4 const_2 = {15, -1, -2, 0};
    const int4 const_39 = {2, -8, -9, -10};
    const int4 const_40 = {2, -10, -11, -12};
    const int4 const_41 = {2, -20, -21, -22};
    const int4 const_42 = {2, -22, -23, -24};
    const int4 const_43 = {2, -24, -25, -26};
    const int4 const_44 = {2, -26, -27, -28};
    const int4 const_45 = {2, -28, -29, 0};
    const int4 const_46 = {2, -4, -5, -6};
    const int4 const_47 = {2, -12, -13, -14};
    const int4 const_48 = {2, -14, -15, -16};
    const int4 const_49 = {2, -16, -17, -18};
    const int4 const_50 = {2, -18, -19, -20};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -6, -7, -8};

    float3 l10;
    float3 l13;
    float3 l151;
    float3 l16;
    float3 l19;
    float3 l22;
    float3 l25;
    float3 l28;
    float3 l31;
    float3 l34;
    float3 l37;
    float3 l40;
    float3 l43;
    float3 l46;
    float3 l47;
    float3 l7;
    float3 m160;
    float3 m164;
    float3 m168;
    float3 m172;
    float3 m176;
    float3 m180;
    float3 m184;
    float3 m188;
    float3 m192;
    float3 m196;
    float3 m200;
    float3 m204;
    float3 m208;
    float3 m212;
    float3 m215;
    float3 q100;
    float3 q11;
    float1 q12;
    float3 q14;
    float1 q15;
    float3 q17;
    float1 q18;
    float1 q2;
    float3 q20;
    float1 q21;
    float3 q23;
    float1 q24;
    float3 q26;
    float1 q27;
    float3 q29;
    float1 q30;
    float3 q32;
    float1 q33;
    float3 q35;
    float1 q36;
    float3 q38;
    float1 q39;
    float3 q4;
    float3 q41;
    float1 q42;
    float3 q44;
    float1 q45;
    float3 q5;
    float3 q50;
    float1 q6;
    float3 q8;
    float1 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r9;
    float3 t0;
    float1 t1;

#define	TanSpaceProj	float3x3(r3.xyz, r5.xyz, r4.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r2.xyz = normalize(expand(r0.xyz));			// partial precision
    r4.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r5.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r3.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r9.yz = const_1.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r9.y : r9.z);

    if (0 != r0.w) {
      t1.x = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      t0.xyz = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      l151.xyz = mul(TanSpaceProj, LightData[1].xyz);
      r1.w = 1;
      r1.xyz = ((t1.x * (t0.xyz - 1)) + 1) * (shade(r2.xyz, l151.xyz) * LightData[0].xyz);			// partial precision
    }
    else {
      r1.xyz = 0;			// partial precision
      r1.w = 0;
    }

    q2.x = min(ToggleNumLights.y, 15 - ToggleNumLights.x);			// partial precision
    r2.w = ((q2.x >= 0.0 ? 0 : 1) * (frac(q2.x) <= 0.0 ? 0 : 1)) + (q2.x - frac(q2.x));
    r0.w = (r2.w <= 0.0 ? 0 : 1);

    if (0 != r0.w) {
      r6.x = 2 * r1.w;
      r6.yz = r6.x + const_2.yz;
      q4.xyz = r6.x + const_2.wyz;
      r1.w = r1.w + 1;
      r6.xyz = (q4.xyz >= 0.0 ? q4.xyz : -r6.xyz);
      r0.xyzw = (r6.z <= 0.0 ? LightData[3].xyzw : (r6.y <= 0.0 ? LightData[2].xyzw : (r6.x <= 0.0 ? LightData[1].xyzw : r9.y)));
      q5.xyz = r0.xyz - IN.texcoord_6.xyz;
      q6.x = saturate(length(q5.xyz) / r0.w);
      m160.xyz = mul(TanSpaceProj, q5.xyz);
      l7.xyz = (r6.z <= 0.0 ? LightData[2].xyz : (r6.y <= 0.0 ? LightData[1].xyz : (r6.x <= 0.0 ? LightData[0].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m160.xyz)) * (1.0 - sqr(q6.x)), 0) * l7.xyz) + r1.xyz;			// partial precision
    }


    if (1 != r2.w) {
      r6.xyz = (2 * r1.w) + const_7.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[5].xyzw : (r6.y == 0.0 ? LightData[4].xyzw : (r6.x == 0.0 ? LightData[3].xyzw : r9.y)));
      q8.xyz = r0.xyz - IN.texcoord_6.xyz;
      q9.x = saturate(length(q8.xyz) / r0.w);
      m164.xyz = mul(TanSpaceProj, q8.xyz);
      l10.xyz = (r6.z == 0.0 ? LightData[4].xyz : (r6.y == 0.0 ? LightData[3].xyz : (r6.x == 0.0 ? LightData[2].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m164.xyz)) * (1.0 - sqr(q9.x)), 0) * l10.xyz) + r1.xyz;			// partial precision
    }


    if (2 != r2.w) {
      r6.xyz = (2 * r1.w) + const_46.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[7].xyzw : (r6.y == 0.0 ? LightData[6].xyzw : (r6.x == 0.0 ? LightData[5].xyzw : r9.y)));
      q11.xyz = r0.xyz - IN.texcoord_6.xyz;
      q12.x = saturate(length(q11.xyz) / r0.w);
      m168.xyz = mul(TanSpaceProj, q11.xyz);
      l13.xyz = (r6.z == 0.0 ? LightData[6].xyz : (r6.y == 0.0 ? LightData[5].xyz : (r6.x == 0.0 ? LightData[4].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m168.xyz)) * (1.0 - sqr(q12.x)), 0) * l13.xyz) + r1.xyz;			// partial precision
    }


    if (3 != r2.w) {
      r6.xyz = (2 * r1.w) + const_8.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[9].xyzw : (r6.y == 0.0 ? LightData[8].xyzw : (r6.x == 0.0 ? LightData[7].xyzw : r9.y)));
      q14.xyz = r0.xyz - IN.texcoord_6.xyz;
      q15.x = saturate(length(q14.xyz) / r0.w);
      m172.xyz = mul(TanSpaceProj, q14.xyz);
      l16.xyz = (r6.z == 0.0 ? LightData[8].xyz : (r6.y == 0.0 ? LightData[7].xyz : (r6.x == 0.0 ? LightData[6].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m172.xyz)) * (1.0 - sqr(q15.x)), 0) * l16.xyz) + r1.xyz;			// partial precision
    }


    if (4 != r2.w) {
      r6.xyz = (2 * r1.w) + const_39.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[11].xyzw : (r6.y == 0.0 ? LightData[10].xyzw : (r6.x == 0.0 ? LightData[9].xyzw : r9.y)));
      q17.xyz = r0.xyz - IN.texcoord_6.xyz;
      q18.x = saturate(length(q17.xyz) / r0.w);
      m176.xyz = mul(TanSpaceProj, q17.xyz);
      l19.xyz = (r6.z == 0.0 ? LightData[10].xyz : (r6.y == 0.0 ? LightData[9].xyz : (r6.x == 0.0 ? LightData[8].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m176.xyz)) * (1.0 - sqr(q18.x)), 0) * l19.xyz) + r1.xyz;			// partial precision
    }


    if (5 != r2.w) {
      r6.xyz = (2 * r1.w) + const_40.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[13].xyzw : (r6.y == 0.0 ? LightData[12].xyzw : (r6.x == 0.0 ? LightData[11].xyzw : r9.y)));
      q20.xyz = r0.xyz - IN.texcoord_6.xyz;
      q21.x = saturate(length(q20.xyz) / r0.w);
      m180.xyz = mul(TanSpaceProj, q20.xyz);
      l22.xyz = (r6.z == 0.0 ? LightData[12].xyz : (r6.y == 0.0 ? LightData[11].xyz : (r6.x == 0.0 ? LightData[10].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m180.xyz)) * (1.0 - sqr(q21.x)), 0) * l22.xyz) + r1.xyz;			// partial precision
    }


    if (6 != r2.w) {
      r6.xyz = (2 * r1.w) + const_47.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[15].xyzw : (r6.y == 0.0 ? LightData[14].xyzw : (r6.x == 0.0 ? LightData[13].xyzw : r9.y)));
      q23.xyz = r0.xyz - IN.texcoord_6.xyz;
      q24.x = saturate(length(q23.xyz) / r0.w);
      m184.xyz = mul(TanSpaceProj, q23.xyz);
      l25.xyz = (r6.z == 0.0 ? LightData[14].xyz : (r6.y == 0.0 ? LightData[13].xyz : (r6.x == 0.0 ? LightData[12].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m184.xyz)) * (1.0 - sqr(q24.x)), 0) * l25.xyz) + r1.xyz;			// partial precision
    }


    if (7 != r2.w) {
      r6.xyz = (2 * r1.w) + const_48.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[17].xyzw : (r6.y == 0.0 ? LightData[16].xyzw : (r6.x == 0.0 ? LightData[15].xyzw : r9.y)));
      q26.xyz = r0.xyz - IN.texcoord_6.xyz;
      q27.x = saturate(length(q26.xyz) / r0.w);
      m188.xyz = mul(TanSpaceProj, q26.xyz);
      l28.xyz = (r6.z == 0.0 ? LightData[16].xyz : (r6.y == 0.0 ? LightData[15].xyz : (r6.x == 0.0 ? LightData[14].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m188.xyz)) * (1.0 - sqr(q27.x)), 0) * l28.xyz) + r1.xyz;			// partial precision
    }


    if (8 != r2.w) {
      r6.xyz = (2 * r1.w) + const_49.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[19].xyzw : (r6.y == 0.0 ? LightData[18].xyzw : (r6.x == 0.0 ? LightData[17].xyzw : r9.y)));
      q29.xyz = r0.xyz - IN.texcoord_6.xyz;
      q30.x = saturate(length(q29.xyz) / r0.w);
      m192.xyz = mul(TanSpaceProj, q29.xyz);
      l31.xyz = (r6.z == 0.0 ? LightData[18].xyz : (r6.y == 0.0 ? LightData[17].xyz : (r6.x == 0.0 ? LightData[16].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m192.xyz)) * (1.0 - sqr(q30.x)), 0) * l31.xyz) + r1.xyz;			// partial precision
    }


    if (9 != r2.w) {
      r6.xyz = (2 * r1.w) + const_50.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[21].xyzw : (r6.y == 0.0 ? LightData[20].xyzw : (r6.x == 0.0 ? LightData[19].xyzw : r9.y)));
      q32.xyz = r0.xyz - IN.texcoord_6.xyz;
      q33.x = saturate(length(q32.xyz) / r0.w);
      m196.xyz = mul(TanSpaceProj, q32.xyz);
      l34.xyz = (r6.z == 0.0 ? LightData[20].xyz : (r6.y == 0.0 ? LightData[19].xyz : (r6.x == 0.0 ? LightData[18].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m196.xyz)) * (1.0 - sqr(q33.x)), 0) * l34.xyz) + r1.xyz;			// partial precision
    }


    if (10 != r2.w) {
      r6.xyz = (2 * r1.w) + const_41.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[23].xyzw : (r6.y == 0.0 ? LightData[22].xyzw : (r6.x == 0.0 ? LightData[21].xyzw : r9.y)));
      q35.xyz = r0.xyz - IN.texcoord_6.xyz;
      q36.x = saturate(length(q35.xyz) / r0.w);
      m200.xyz = mul(TanSpaceProj, q35.xyz);
      l37.xyz = (r6.z == 0.0 ? LightData[22].xyz : (r6.y == 0.0 ? LightData[21].xyz : (r6.x == 0.0 ? LightData[20].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m200.xyz)) * (1.0 - sqr(q36.x)), 0) * l37.xyz) + r1.xyz;			// partial precision
    }


    if (11 != r2.w) {
      r6.xyz = (2 * r1.w) + const_42.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[25].xyzw : (r6.y == 0.0 ? LightData[24].xyzw : (r6.x == 0.0 ? LightData[23].xyzw : r9.y)));
      q38.xyz = r0.xyz - IN.texcoord_6.xyz;
      q39.x = saturate(length(q38.xyz) / r0.w);
      m204.xyz = mul(TanSpaceProj, q38.xyz);
      l40.xyz = (r6.z == 0.0 ? LightData[24].xyz : (r6.y == 0.0 ? LightData[23].xyz : (r6.x == 0.0 ? LightData[22].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m204.xyz)) * (1.0 - sqr(q39.x)), 0) * l40.xyz) + r1.xyz;			// partial precision
    }


    if (12 != r2.w) {
      r6.xyz = (2 * r1.w) + const_43.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[27].xyzw : (r6.y == 0.0 ? LightData[26].xyzw : (r6.x == 0.0 ? LightData[25].xyzw : r9.y)));
      q41.xyz = r0.xyz - IN.texcoord_6.xyz;
      q42.x = saturate(length(q41.xyz) / r0.w);
      m208.xyz = mul(TanSpaceProj, q41.xyz);
      l43.xyz = (r6.z == 0.0 ? LightData[26].xyz : (r6.y == 0.0 ? LightData[25].xyz : (r6.x == 0.0 ? LightData[24].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m208.xyz)) * (1.0 - sqr(q42.x)), 0) * l43.xyz) + r1.xyz;			// partial precision
    }


    if (13 != r2.w) {
      r6.xyz = (2 * r1.w) + const_44.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[29].xyzw : (r6.y == 0.0 ? LightData[28].xyzw : (r6.x == 0.0 ? LightData[27].xyzw : r9.y)));
      q44.xyz = r0.xyz - IN.texcoord_6.xyz;
      q45.x = saturate(length(q44.xyz) / r0.w);
      m212.xyz = mul(TanSpaceProj, q44.xyz);
      l46.xyz = (r6.z == 0.0 ? LightData[28].xyz : (r6.y == 0.0 ? LightData[27].xyz : (r6.x == 0.0 ? LightData[26].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m212.xyz)) * (1.0 - sqr(q45.x)), 0) * l46.xyz) + r1.xyz;			// partial precision
    }


    if (14 != r2.w) {
      l47.xyz = LightData[29].xyz - IN.texcoord_6.xyz;
      m215.xyz = mul(TanSpaceProj, l47.xyz);
      r0.w = dot(r2.xyz, normalize(m215.xyz));			// partial precision
      r2.xy = (2 * r1.w) + const_45.yz;
      r1.xyz = (max(r0.w * (1.0 - sqr(saturate(length(l47.xyz) / LightData[29].w))), 0) * (r2.y == 0.0 ? LightData[29].xyz : (r2.x == 0.0 ? LightData[28].xyz : r9.y))) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(GlowMap, IN.BaseUV.xy);			// partial precision
    q50.xyz = (ToggleADTS.x * ((r0.xyz * MatEmit.rgb) + AmbientColor.rgb)) + (r9.z - ToggleADTS.x);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q100.xyz = (r1.xyz + q50.xyz) * (r0.xyz * IN.color_0.rgb);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q100.xyz)) + q100.xyz;			// partial precision

    return OUT;
};

// approximately 459 instruction slots used (5 texture, 454 arithmetic)
