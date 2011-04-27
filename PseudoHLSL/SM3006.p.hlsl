//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3006.pso /Fcshaderdump19/SM3006.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
sampler2D FaceGenMap0 : register(s4);
sampler2D FaceGenMap1 : register(s5);
float4 LightData[20] : register(c9);
float3 MatAlpha : register(c3);
sampler2D NormalMap : register(s1);
float4 ToggleADTS : register(c5);
float4 ToggleNumLights : register(c6);
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    const_0       1
//   EyePosition     const_1       1
//   MatAlpha        const_3       1
//   ToggleADTS      const_5       1
//   ToggleNumLights const_6       1
//   LightData[0]       const_9         1
//   LightData[1]       const_10         1
//   LightData[2]       const_11         1
//   LightData[3]       const_12         1
//   LightData[4]       const_13         1
//   LightData[5]       const_14         1
//   LightData[6]       const_15         1
//   LightData[7]       const_16         1
//   LightData[8]       const_17        1
//   LightData[9]       const_18        1
//   LightData[10]       const_19        1
//   LightData[11]       const_20        1
//   LightData[12]       const_21        1
//   LightData[13]       const_22        1
//   LightData[14]       const_23        1
//   LightData[15]       const_24        1
//   LightData[16]       const_25       1
//   LightData[17]       const_26       1
//   LightData[18]       const_27       1
//   LightData[19]       const_28       1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   FaceGenMap0     texture_4       1
//   FaceGenMap1     texture_5       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float3 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
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

    const int4 const_2 = {10, -1, -2, 0};
    const int4 const_29 = {2, -10, -11, -12};
    const int4 const_30 = {2, -12, -13, -14};
    const float4 const_31 = {-0.5, 0, 1, 0.5};
    const int4 const_32 = {2, -16, -17, -18};
    const int4 const_33 = {2, -18, -19, 0};
    const int4 const_34 = {2, -2, -3, -4};
    const int4 const_35 = {2, -14, -15, -16};
    const int4 const_4 = {2, -4, -5, -6};
    const int4 const_7 = {2, -6, -7, -8};
    const int4 const_8 = {2, -8, -9, -10};

    float3 eye301;
    float3 l108;
    float3 l13;
    float3 l170;
    float3 l18;
    float3 l23;
    float3 l28;
    float3 l33;
    float3 l38;
    float3 l43;
    float3 l48;
    float3 l50;
    float3 l618;
    float3 l8;
    float3 m178;
    float3 m184;
    float3 m190;
    float3 m196;
    float3 m202;
    float3 m208;
    float3 m214;
    float3 m220;
    float3 m226;
    float3 m229;
    float1 q1;
    float1 q10;
    float3 q11;
    float3 q14;
    float1 q15;
    float3 q16;
    float3 q19;
    float1 q2;
    float1 q20;
    float3 q21;
    float3 q24;
    float1 q25;
    float3 q26;
    float3 q29;
    float1 q30;
    float3 q31;
    float3 q34;
    float1 q35;
    float3 q36;
    float3 q39;
    float1 q4;
    float1 q40;
    float3 q41;
    float3 q44;
    float1 q45;
    float3 q46;
    float3 q49;
    float3 q5;
    float1 q52;
    float3 q55;
    float3 q6;
    float3 q9;
    float4 r0;
    float4 r1;
    float3 r11;
    float4 r2;
    float3 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;
    float3 r9;

#define	TanSpaceProj	float3x3(r4.xyz, r7.xyz, r6.xyz)
#define	TanSpaceProj	float3x3(r4.xyz, r7.xyz, r6.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r1.xyz = normalize(expand(r0.xyz));			// partial precision
    r6.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r7.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r4.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    eye301.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye301.xyz);			// partial precision
    r11.yz = const_31.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r0.w) {
      l170.xyz = mul(TanSpaceProj, LightData[1].xyz);
      q1.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r2.xyz = max((0.5 * ((q1.x * sqr(q1.x)) * LightData[0].xyz)) + dot(r1.xyz, l170.xyz), 0) * LightData[0].xyz;			// partial precision
      r2.w = 1;
    }
    else {
      r2.xyz = 0;			// partial precision
      r2.w = 0;
    }

    q2.x = min(ToggleNumLights.y, 10 - ToggleNumLights.x);			// partial precision
    r1.w = ((q2.x >= 0.0 ? 0 : 1) * (frac(q2.x) <= 0.0 ? 0 : 1)) + (q2.x - frac(q2.x));
    r0.w = (r1.w <= 0.0 ? 0 : 1);

    if (0 != r0.w) {
      r3.x = 2 * r2.w;
      r3.yz = r3.x + const_2.yz;
      q5.xyz = r3.x + const_2.wyz;
      r2.w = r2.w + 1;
      q4.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (q5.xyz >= 0.0 ? q5.xyz : -r3.xyz);
      r0.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : (r9.y <= 0.0 ? LightData[2].xyzw : (r9.x <= 0.0 ? LightData[1].xyzw : r11.y)));
      q6.xyz = r0.xyz - IN.texcoord_6.xyz;
      m178.xyz = mul(TanSpaceProj, q6.xyz);
      l8.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));			// partial precision
      q9.xyz = (shade(r1.xyz, normalize(m178.xyz)) * l8.xyz) + (((q4.x * sqr(q4.x)) * l8.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q9.xyz * (1.0 - sqr(saturate(length(q6.xyz) / r0.w))), 0);			// partial precision
    }


    if (1 != r1.w) {
      q10.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_34.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q11.xyz = r0.xyz - IN.texcoord_6.xyz;
      m184.xyz = mul(TanSpaceProj, q11.xyz);
      l13.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      q14.xyz = (shade(r1.xyz, normalize(m184.xyz)) * l13.xyz) + (((q10.x * sqr(q10.x)) * l13.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q14.xyz * (1.0 - sqr(saturate(length(q11.xyz) / r0.w))), 0);			// partial precision
    }


    if (2 != r1.w) {
      q15.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_4.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q16.xyz = r0.xyz - IN.texcoord_6.xyz;
      m190.xyz = mul(TanSpaceProj, q16.xyz);
      l18.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      q19.xyz = (shade(r1.xyz, normalize(m190.xyz)) * l18.xyz) + (((q15.x * sqr(q15.x)) * l18.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q19.xyz * (1.0 - sqr(saturate(length(q16.xyz) / r0.w))), 0);			// partial precision
    }


    if (3 != r1.w) {
      q20.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[9].xyzw : (r9.y == 0.0 ? LightData[8].xyzw : (r9.x == 0.0 ? LightData[7].xyzw : r11.y)));
      q21.xyz = r0.xyz - IN.texcoord_6.xyz;
      m196.xyz = mul(TanSpaceProj, q21.xyz);
      l23.xyz = (r9.z == 0.0 ? LightData[8].xyz : (r9.y == 0.0 ? LightData[7].xyz : (r9.x == 0.0 ? LightData[6].xyz : r11.y)));			// partial precision
      q24.xyz = (shade(r1.xyz, normalize(m196.xyz)) * l23.xyz) + (((q20.x * sqr(q20.x)) * l23.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q24.xyz * (1.0 - sqr(saturate(length(q21.xyz) / r0.w))), 0);			// partial precision
    }


    if (4 != r1.w) {
      q25.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_8.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[11].xyzw : (r9.y == 0.0 ? LightData[10].xyzw : (r9.x == 0.0 ? LightData[9].xyzw : r11.y)));
      q26.xyz = r0.xyz - IN.texcoord_6.xyz;
      m202.xyz = mul(TanSpaceProj, q26.xyz);
      l28.xyz = (r9.z == 0.0 ? LightData[10].xyz : (r9.y == 0.0 ? LightData[9].xyz : (r9.x == 0.0 ? LightData[8].xyz : r11.y)));			// partial precision
      q29.xyz = (shade(r1.xyz, normalize(m202.xyz)) * l28.xyz) + (((q25.x * sqr(q25.x)) * l28.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q29.xyz * (1.0 - sqr(saturate(length(q26.xyz) / r0.w))), 0);			// partial precision
    }


    if (5 != r1.w) {
      q30.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_29.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[13].xyzw : (r9.y == 0.0 ? LightData[12].xyzw : (r9.x == 0.0 ? LightData[11].xyzw : r11.y)));
      q31.xyz = r0.xyz - IN.texcoord_6.xyz;
      m208.xyz = mul(TanSpaceProj, q31.xyz);
      l33.xyz = (r9.z == 0.0 ? LightData[12].xyz : (r9.y == 0.0 ? LightData[11].xyz : (r9.x == 0.0 ? LightData[10].xyz : r11.y)));			// partial precision
      q34.xyz = (shade(r1.xyz, normalize(m208.xyz)) * l33.xyz) + (((q30.x * sqr(q30.x)) * l33.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q34.xyz * (1.0 - sqr(saturate(length(q31.xyz) / r0.w))), 0);			// partial precision
    }


    if (6 != r1.w) {
      q35.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_30.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[15].xyzw : (r9.y == 0.0 ? LightData[14].xyzw : (r9.x == 0.0 ? LightData[13].xyzw : r11.y)));
      q36.xyz = r0.xyz - IN.texcoord_6.xyz;
      m214.xyz = mul(TanSpaceProj, q36.xyz);
      l38.xyz = (r9.z == 0.0 ? LightData[14].xyz : (r9.y == 0.0 ? LightData[13].xyz : (r9.x == 0.0 ? LightData[12].xyz : r11.y)));			// partial precision
      q39.xyz = (shade(r1.xyz, normalize(m214.xyz)) * l38.xyz) + (((q35.x * sqr(q35.x)) * l38.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q39.xyz * (1.0 - sqr(saturate(length(q36.xyz) / r0.w))), 0);			// partial precision
    }


    if (7 != r1.w) {
      q40.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_35.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[17].xyzw : (r9.y == 0.0 ? LightData[16].xyzw : (r9.x == 0.0 ? LightData[15].xyzw : r11.y)));
      q41.xyz = r0.xyz - IN.texcoord_6.xyz;
      m220.xyz = mul(TanSpaceProj, q41.xyz);
      l43.xyz = (r9.z == 0.0 ? LightData[16].xyz : (r9.y == 0.0 ? LightData[15].xyz : (r9.x == 0.0 ? LightData[14].xyz : r11.y)));			// partial precision
      q44.xyz = (shade(r1.xyz, normalize(m220.xyz)) * l43.xyz) + (((q40.x * sqr(q40.x)) * l43.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q44.xyz * (1.0 - sqr(saturate(length(q41.xyz) / r0.w))), 0);			// partial precision
    }


    if (8 != r1.w) {
      q45.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_32.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[19].xyzw : (r9.y == 0.0 ? LightData[18].xyzw : (r9.x == 0.0 ? LightData[17].xyzw : r11.y)));
      q46.xyz = r0.xyz - IN.texcoord_6.xyz;
      m226.xyz = mul(TanSpaceProj, q46.xyz);
      l48.xyz = (r9.z == 0.0 ? LightData[18].xyz : (r9.y == 0.0 ? LightData[17].xyz : (r9.x == 0.0 ? LightData[16].xyz : r11.y)));			// partial precision
      q49.xyz = (shade(r1.xyz, normalize(m226.xyz)) * l48.xyz) + (((q45.x * sqr(q45.x)) * l48.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q49.xyz * (1.0 - sqr(saturate(length(q46.xyz) / r0.w))), 0);			// partial precision
    }


    if (9 != r1.w) {
      l50.xyz = LightData[19].xyz - IN.texcoord_6.xyz;
      m229.xyz = mul(TanSpaceProj, l50.xyz);
      r1.w = shade(r1.xyz, normalize(m229.xyz));			// partial precision
      q52.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r1.xy = (2 * r2.w) + const_33.yz;
      l108.xyz = (r1.y == 0.0 ? LightData[19].xyz : (r1.x == 0.0 ? LightData[18].xyz : r11.y));			// partial precision
      l618.xyz = ((r1.w * l108.xyz) + (((q52.x * sqr(q52.x)) * l108.xyz) * 0.5)) * (1.0 - sqr(saturate(length(l50.xyz) / LightData[19].w)));			// partial precision
      r2.xyz = r2.xyz + max(l618.xyz, 0);			// partial precision
    }

    r0.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r0.xyz = (2 * r1.xyz) + r0.xyz;			// partial precision
    r1.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);			// partial precision
    r1.xyz = 2 * ((r0.xyz * (2 * r1.xyz)) * IN.color_0.rgb);			// partial precision
    q55.xyz = r1.xyz * (r2.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)));			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q55.xyz)) + q55.xyz;			// partial precision

    return OUT;
};

// approximately 428 instruction slots used (4 texture, 424 arithmetic)
