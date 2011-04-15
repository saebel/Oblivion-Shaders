//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3017.pso /Fcshaderdump19/SM3017.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D BaseMap;
float3 EyePosition;
sampler2D FaceGenMap0;
sampler2D FaceGenMap1;
float4 LightData[16];
float3 MatAlpha;
sampler2D NormalMap;
sampler2D ShadowMap;
sampler2D ShadowMask;
float4 ToggleADTS;
float4 ToggleNumLights;
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
//   LightData[0]       const_9        1
//   LightData[1]       const_10        1
//   LightData[2]       const_11        1
//   LightData[3]       const_12        1
//   LightData[4]       const_13        1
//   LightData[5]       const_14        1
//   LightData[6]       const_15        1
//   LightData[7]       const_16        1
//   LightData[8]       const_17       1
//   LightData[9]       const_18       1
//   LightData[10]       const_19       1
//   LightData[11]       const_20       1
//   LightData[12]       const_21       1
//   LightData[13]       const_22       1
//   LightData[14]       const_23       1
//   LightData[15]       const_24       1
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   ShadowMap       texture_2       1
//   ShadowMask      texture_3       1
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

    const float4 const_2 = {-0.5, 0, 1, -1};
    const int4 const_25 = {2, -8, -9, -10};
    const int4 const_26 = {2, -10, -11, -12};
    const int4 const_27 = {2, -12, -13, -14};
    const int4 const_28 = {2, -14, -15, 0};
    const int4 const_29 = {2, -4, -5, -6};
    const int4 const_4 = {8, -1, -2, 0};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -6, -7, -8};

    float3 eye303;
    float3 l171;
    float3 l246;
    float3 l253;
    float3 l260;
    float3 l267;
    float3 l274;
    float3 l281;
    float3 l288;
    float3 l5;
    float3 l51;
    float3 l54;
    float1 l657;
    float3 m182;
    float3 m189;
    float3 m196;
    float3 m203;
    float3 m210;
    float3 m217;
    float3 m224;
    float3 m230;
    float1 q10;
    float1 q11;
    float3 q13;
    float3 q14;
    float1 q16;
    float1 q17;
    float3 q19;
    float3 q20;
    float1 q22;
    float1 q23;
    float3 q231;
    float1 q234;
    float3 q25;
    float3 q26;
    float1 q28;
    float1 q29;
    float3 q3;
    float3 q31;
    float3 q312;
    float3 q32;
    float3 q320;
    float3 q328;
    float3 q336;
    float1 q34;
    float3 q344;
    float1 q35;
    float3 q352;
    float3 q360;
    float3 q37;
    float3 q38;
    float1 q4;
    float1 q40;
    float1 q41;
    float3 q43;
    float3 q44;
    float1 q46;
    float1 q47;
    float3 q49;
    float3 q50;
    float3 q55;
    float1 q6;
    float3 q8;
    float4 r0;
    float4 r1;
    float3 r11;
    float4 r2;
    float4 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;
    float3 r8;
    float3 r9;
    float3 t1;
    float1 t2;

#define	TanSpaceProj	float3x3(r6.xyz, r8.xyz, r7.xyz)
#define	TanSpaceProj	float3x3(r6.xyz, r8.xyz, r7.xyz)

    r1.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r1.xyz = normalize(expand(r1.xyz));			// partial precision
    r7.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r8.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r6.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    eye303.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye303.xyz);			// partial precision
    r11.yz = const_2.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r0.w) {
      t2.x = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      t1.xyz = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      l171.xyz = mul(TanSpaceProj, LightData[1].xyz);
      q4.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      l5.xyz = max((0.5 * ((q4.x * sqr(q4.x)) * LightData[0].xyz)) + dot(r1.xyz, l171.xyz), 0) * LightData[0].xyz;			// partial precision
      r2.w = 1;
      q3.xyz = (t2.x * (t1.xyz - 1)) + 1;			// partial precision
      r4.xyz = q3.xyz * l5.xyz;			// partial precision
      r3.xyz = q3.xyz * (pow(abs(shades(normalize(r5.xyz + l171.xyz), r1.xyz)), ToggleNumLights.z) * LightData[0].xyz);			// partial precision
    }
    else {
      r4.xyz = 0;			// partial precision
      r3.xyz = 0;			// partial precision
      r2.w = 0;
    }

    q6.x = min(ToggleNumLights.y, 8 - ToggleNumLights.x);			// partial precision
    r3.w = ((q6.x >= 0.0 ? 0 : 1) * (frac(q6.x) <= 0.0 ? 0 : 1)) + (q6.x - frac(q6.x));
    r0.w = (r3.w <= 0.0 ? 0 : 1);

    if (0 != r0.w) {
      r2.x = 2 * r2.w;
      r2.yz = r2.x + const_4.yz;
      q8.xyz = r2.x + const_4.wyz;
      r2.w = r2.w + 1;
      q11.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (q8.xyz >= 0.0 ? q8.xyz : -r2.xyz);
      r0.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : (r9.y <= 0.0 ? LightData[2].xyzw : (r9.x <= 0.0 ? LightData[1].xyzw : r11.y)));
      q312.xyz = r0.xyz - IN.texcoord_6.xyz;
      m182.xyz = mul(TanSpaceProj, q312.xyz);
      q10.x = 1.0 - sqr(saturate(length(q312.xyz) / r0.w));			// partial precision
      l246.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));			// partial precision
      q14.xyz = l246.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m182.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q13.xyz = (shade(r1.xyz, normalize(m182.xyz)) * l246.xyz) + ((l246.xyz * (q11.x * sqr(q11.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q10.x * q13.xyz, 0);			// partial precision
      r3.xyz = (q10.x * q14.xyz) + r3.xyz;			// partial precision
    }


    if (1 != r3.w) {
      q17.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q320.xyz = r0.xyz - IN.texcoord_6.xyz;
      m189.xyz = mul(TanSpaceProj, q320.xyz);
      q16.x = 1.0 - sqr(saturate(length(q320.xyz) / r0.w));			// partial precision
      l253.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      q20.xyz = l253.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m189.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q19.xyz = (shade(r1.xyz, normalize(m189.xyz)) * l253.xyz) + ((l253.xyz * (q17.x * sqr(q17.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q16.x * q19.xyz, 0);			// partial precision
      r3.xyz = (q16.x * q20.xyz) + r3.xyz;			// partial precision
    }


    if (2 != r3.w) {
      q23.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_29.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q328.xyz = r0.xyz - IN.texcoord_6.xyz;
      m196.xyz = mul(TanSpaceProj, q328.xyz);
      q22.x = 1.0 - sqr(saturate(length(q328.xyz) / r0.w));			// partial precision
      l260.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      q26.xyz = l260.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m196.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q25.xyz = (shade(r1.xyz, normalize(m196.xyz)) * l260.xyz) + ((l260.xyz * (q23.x * sqr(q23.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q22.x * q25.xyz, 0);			// partial precision
      r3.xyz = (q22.x * q26.xyz) + r3.xyz;			// partial precision
    }


    if (3 != r3.w) {
      q29.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_8.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[9].xyzw : (r9.y == 0.0 ? LightData[8].xyzw : (r9.x == 0.0 ? LightData[7].xyzw : r11.y)));
      q336.xyz = r0.xyz - IN.texcoord_6.xyz;
      m203.xyz = mul(TanSpaceProj, q336.xyz);
      q28.x = 1.0 - sqr(saturate(length(q336.xyz) / r0.w));			// partial precision
      l267.xyz = (r9.z == 0.0 ? LightData[8].xyz : (r9.y == 0.0 ? LightData[7].xyz : (r9.x == 0.0 ? LightData[6].xyz : r11.y)));			// partial precision
      q32.xyz = l267.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m203.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q31.xyz = (shade(r1.xyz, normalize(m203.xyz)) * l267.xyz) + ((l267.xyz * (q29.x * sqr(q29.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q28.x * q31.xyz, 0);			// partial precision
      r3.xyz = (q28.x * q32.xyz) + r3.xyz;			// partial precision
    }


    if (4 != r3.w) {
      q35.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_25.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[11].xyzw : (r9.y == 0.0 ? LightData[10].xyzw : (r9.x == 0.0 ? LightData[9].xyzw : r11.y)));
      q344.xyz = r0.xyz - IN.texcoord_6.xyz;
      q34.x = 1.0 - sqr(saturate(length(q344.xyz) / r0.w));			// partial precision
      m210.xyz = mul(TanSpaceProj, q344.xyz);
      l274.xyz = (r9.z == 0.0 ? LightData[10].xyz : (r9.y == 0.0 ? LightData[9].xyz : (r9.x == 0.0 ? LightData[8].xyz : r11.y)));			// partial precision
      q38.xyz = l274.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m210.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q37.xyz = (shade(r1.xyz, normalize(m210.xyz)) * l274.xyz) + ((l274.xyz * (q35.x * sqr(q35.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q34.x * q37.xyz, 0);			// partial precision
      r3.xyz = (q34.x * q38.xyz) + r3.xyz;			// partial precision
    }


    if (5 != r3.w) {
      q41.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_26.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[13].xyzw : (r9.y == 0.0 ? LightData[12].xyzw : (r9.x == 0.0 ? LightData[11].xyzw : r11.y)));
      q352.xyz = r0.xyz - IN.texcoord_6.xyz;
      m217.xyz = mul(TanSpaceProj, q352.xyz);
      q40.x = 1.0 - sqr(saturate(length(q352.xyz) / r0.w));			// partial precision
      l281.xyz = (r9.z == 0.0 ? LightData[12].xyz : (r9.y == 0.0 ? LightData[11].xyz : (r9.x == 0.0 ? LightData[10].xyz : r11.y)));			// partial precision
      q44.xyz = l281.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m217.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q43.xyz = (shade(r1.xyz, normalize(m217.xyz)) * l281.xyz) + ((l281.xyz * (q41.x * sqr(q41.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q40.x * q43.xyz, 0);			// partial precision
      r3.xyz = (q40.x * q44.xyz) + r3.xyz;			// partial precision
    }


    if (6 != r3.w) {
      q47.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_27.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[15].xyzw : (r9.y == 0.0 ? LightData[14].xyzw : (r9.x == 0.0 ? LightData[13].xyzw : r11.y)));
      q360.xyz = r0.xyz - IN.texcoord_6.xyz;
      m224.xyz = mul(TanSpaceProj, q360.xyz);
      q46.x = 1.0 - sqr(saturate(length(q360.xyz) / r0.w));			// partial precision
      l288.xyz = (r9.z == 0.0 ? LightData[14].xyz : (r9.y == 0.0 ? LightData[13].xyz : (r9.x == 0.0 ? LightData[12].xyz : r11.y)));			// partial precision
      q50.xyz = l288.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m224.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q49.xyz = (shade(r1.xyz, normalize(m224.xyz)) * l288.xyz) + ((l288.xyz * (q47.x * sqr(q47.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q46.x * q49.xyz, 0);			// partial precision
      r3.xyz = (q46.x * q50.xyz) + r3.xyz;			// partial precision
    }


    if (7 != r3.w) {
      l51.xyz = LightData[15].xyz - IN.texcoord_6.xyz;
      m230.xyz = mul(TanSpaceProj, l51.xyz);
      q231.xyz = normalize(m230.xyz);			// partial precision
      r6.xyz = r5.xyz + q231.xyz;			// partial precision
      l657.x = 1.0 - sqr(saturate(length(l51.xyz) / LightData[15].w));			// partial precision
      q234.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r5.xy = (2 * r2.w) + const_28.yz;
      l54.xyz = (r5.y == 0.0 ? LightData[15].xyz : (r5.x == 0.0 ? LightData[14].xyz : r11.y));			// partial precision
      r4.xyz = r4.xyz + max(l657.x * ((shade(r1.xyz, q231.xyz) * l54.xyz) + ((l54.xyz * (q234.x * sqr(q234.x))) * 0.5)), 0);			// partial precision
      r3.xyz = (l657.x * (l54.xyz * pow(abs(shades(normalize(r6.xyz), r1.xyz)), ToggleNumLights.z))) + r3.xyz;			// partial precision
    }

    r2.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r1.xyz = 2 * ((((2 * r1.xyz) + r0.xyz) * (2 * r2.xyz)) * IN.color_0.rgb);			// partial precision
    q55.xyz = (r1.xyz * (r4.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)))) + (r1.w * r3.xyz);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q55.xyz)) + q55.xyz;			// partial precision

    return OUT;
};

// approximately 453 instruction slots used (6 texture, 447 arithmetic)
