//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3007.pso /Fcshaderdump19/SM3007.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
sampler2D FaceGenMap0 : register(s4);
sampler2D FaceGenMap1 : register(s5);
float4 LightData[16] : register(c9);
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

    const float4 const_2 = {-0.5, 0, 1, 0.5};
    const int4 const_25 = {2, -10, -11, -12};
    const int4 const_26 = {2, -8, -9, -10};
    const int4 const_27 = {2, -6, -7, -8};
    const int4 const_28 = {2, -14, -15, 0};
    const int4 const_29 = {2, -12, -13, -14};
    const int4 const_4 = {8, -1, -2, 0};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -4, -5, -6};

    float3 eye281;
    float3 l158;
    float3 l225;
    float3 l231;
    float3 l238;
    float3 l245;
    float3 l252;
    float3 l259;
    float3 l266;
    float3 l47;
    float3 l50;
    float1 l615;
    float3 m165;
    float3 m171;
    float3 m178;
    float3 m185;
    float3 m192;
    float3 m199;
    float3 m206;
    float3 m212;
    float1 q1;
    float1 q12;
    float1 q13;
    float3 q15;
    float3 q16;
    float1 q18;
    float1 q19;
    float1 q2;
    float3 q21;
    float3 q213;
    float1 q216;
    float3 q22;
    float1 q24;
    float1 q25;
    float3 q27;
    float3 q28;
    float3 q287;
    float3 q294;
    float1 q30;
    float3 q302;
    float1 q31;
    float3 q310;
    float3 q318;
    float3 q326;
    float3 q33;
    float3 q334;
    float3 q34;
    float1 q36;
    float1 q37;
    float3 q39;
    float3 q4;
    float3 q40;
    float1 q42;
    float1 q43;
    float3 q45;
    float3 q46;
    float3 q51;
    float1 q6;
    float1 q7;
    float3 q8;
    float3 q9;
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

#define	TanSpaceProj	float3x3(r6.xyz, r7.xyz, r2.xyz)
#define	TanSpaceProj	float3x3(r6.xyz, r7.xyz, r2.xyz)

    r1.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r1.xyz = normalize(expand(r1.xyz));			// partial precision
    r2.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r7.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r6.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    eye281.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye281.xyz);			// partial precision
    r11.yz = const_2.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r0.w) {
      l158.xyz = mul(TanSpaceProj, LightData[1].xyz);
      r3.xyz = pow(abs(shades(normalize(r5.xyz + l158.xyz), r1.xyz)), ToggleNumLights.z) * LightData[0].xyz;			// partial precision
      q1.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r4.xyz = max((0.5 * ((q1.x * sqr(q1.x)) * LightData[0].xyz)) + dot(r1.xyz, l158.xyz), 0) * LightData[0].xyz;			// partial precision
      r2.w = 1;
    }
    else {
      r4.xyz = 0;			// partial precision
      r3.xyz = 0;			// partial precision
      r2.w = 0;
    }

    q2.x = min(ToggleNumLights.y, 8 - ToggleNumLights.x);			// partial precision
    r3.w = ((q2.x >= 0.0 ? 0 : 1) * (frac(q2.x) <= 0.0 ? 0 : 1)) + (q2.x - frac(q2.x));
    r0.w = (r3.w <= 0.0 ? 0 : 1);

    if (0 != r0.w) {
      r8.x = 2 * r2.w;
      r8.yz = r8.x + const_4.yz;
      q4.xyz = r8.x + const_4.wyz;
      r2.w = r2.w + 1;
      q7.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (q4.xyz >= 0.0 ? q4.xyz : -r8.xyz);
      r0.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : (r9.y <= 0.0 ? LightData[2].xyzw : (r9.x <= 0.0 ? LightData[1].xyzw : r11.y)));
      q287.xyz = r0.xyz - IN.texcoord_6.xyz;
      m165.xyz = mul(TanSpaceProj, q287.xyz);
      q8.xyz = normalize(m165.xyz);			// partial precision
      q6.x = 1.0 - sqr(saturate(length(q287.xyz) / r0.w));			// partial precision
      l225.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));			// partial precision
      q9.xyz = q6.x * ((shade(r1.xyz, q8.xyz) * l225.xyz) + ((l225.xyz * (q7.x * sqr(q7.x))) * 0.5));			// partial precision
      r4.xyz = r4.xyz + max(q9.xyz, 0);			// partial precision
      r3.xyz = (q6.x * (l225.xyz * pow(abs(shades(normalize(r5.xyz + q8.xyz), r1.xyz)), ToggleNumLights.z))) + r3.xyz;			// partial precision
    }


    if (1 != r3.w) {
      q13.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q294.xyz = r0.xyz - IN.texcoord_6.xyz;
      m171.xyz = mul(TanSpaceProj, q294.xyz);
      q12.x = 1.0 - sqr(saturate(length(q294.xyz) / r0.w));			// partial precision
      l231.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      q16.xyz = l231.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m171.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q15.xyz = (shade(r1.xyz, normalize(m171.xyz)) * l231.xyz) + ((l231.xyz * (q13.x * sqr(q13.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q12.x * q15.xyz, 0);			// partial precision
      r3.xyz = (q12.x * q16.xyz) + r3.xyz;			// partial precision
    }


    if (2 != r3.w) {
      q19.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_8.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q302.xyz = r0.xyz - IN.texcoord_6.xyz;
      m178.xyz = mul(TanSpaceProj, q302.xyz);
      q18.x = 1.0 - sqr(saturate(length(q302.xyz) / r0.w));			// partial precision
      l238.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      q22.xyz = l238.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m178.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q21.xyz = (shade(r1.xyz, normalize(m178.xyz)) * l238.xyz) + ((l238.xyz * (q19.x * sqr(q19.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q18.x * q21.xyz, 0);			// partial precision
      r3.xyz = (q18.x * q22.xyz) + r3.xyz;			// partial precision
    }


    if (3 != r3.w) {
      q25.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_27.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[9].xyzw : (r9.y == 0.0 ? LightData[8].xyzw : (r9.x == 0.0 ? LightData[7].xyzw : r11.y)));
      q310.xyz = r0.xyz - IN.texcoord_6.xyz;
      m185.xyz = mul(TanSpaceProj, q310.xyz);
      q24.x = 1.0 - sqr(saturate(length(q310.xyz) / r0.w));			// partial precision
      l245.xyz = (r9.z == 0.0 ? LightData[8].xyz : (r9.y == 0.0 ? LightData[7].xyz : (r9.x == 0.0 ? LightData[6].xyz : r11.y)));			// partial precision
      q28.xyz = l245.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m185.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q27.xyz = (shade(r1.xyz, normalize(m185.xyz)) * l245.xyz) + ((l245.xyz * (q25.x * sqr(q25.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q24.x * q27.xyz, 0);			// partial precision
      r3.xyz = (q24.x * q28.xyz) + r3.xyz;			// partial precision
    }


    if (4 != r3.w) {
      r9.xyz = (2 * r2.w) + const_26.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[11].xyzw : (r9.y == 0.0 ? LightData[10].xyzw : (r9.x == 0.0 ? LightData[9].xyzw : r11.y)));
      q318.xyz = r0.xyz - IN.texcoord_6.xyz;
      q31.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      m192.xyz = mul(TanSpaceProj, q318.xyz);
      q30.x = 1.0 - sqr(saturate(length(q318.xyz) / r0.w));			// partial precision
      l252.xyz = (r9.z == 0.0 ? LightData[10].xyz : (r9.y == 0.0 ? LightData[9].xyz : (r9.x == 0.0 ? LightData[8].xyz : r11.y)));			// partial precision
      q34.xyz = l252.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m192.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q33.xyz = (shade(r1.xyz, normalize(m192.xyz)) * l252.xyz) + ((l252.xyz * (q31.x * sqr(q31.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q30.x * q33.xyz, 0);			// partial precision
      r3.xyz = (q30.x * q34.xyz) + r3.xyz;			// partial precision
    }


    if (5 != r3.w) {
      q37.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_25.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[13].xyzw : (r9.y == 0.0 ? LightData[12].xyzw : (r9.x == 0.0 ? LightData[11].xyzw : r11.y)));
      q326.xyz = r0.xyz - IN.texcoord_6.xyz;
      m199.xyz = mul(TanSpaceProj, q326.xyz);
      q36.x = 1.0 - sqr(saturate(length(q326.xyz) / r0.w));			// partial precision
      l259.xyz = (r9.z == 0.0 ? LightData[12].xyz : (r9.y == 0.0 ? LightData[11].xyz : (r9.x == 0.0 ? LightData[10].xyz : r11.y)));			// partial precision
      q40.xyz = l259.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m199.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q39.xyz = (shade(r1.xyz, normalize(m199.xyz)) * l259.xyz) + ((l259.xyz * (q37.x * sqr(q37.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q36.x * q39.xyz, 0);			// partial precision
      r3.xyz = (q36.x * q40.xyz) + r3.xyz;			// partial precision
    }


    if (6 != r3.w) {
      q43.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_29.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[15].xyzw : (r9.y == 0.0 ? LightData[14].xyzw : (r9.x == 0.0 ? LightData[13].xyzw : r11.y)));
      q334.xyz = r0.xyz - IN.texcoord_6.xyz;
      m206.xyz = mul(TanSpaceProj, q334.xyz);
      q42.x = 1.0 - sqr(saturate(length(q334.xyz) / r0.w));			// partial precision
      l266.xyz = (r9.z == 0.0 ? LightData[14].xyz : (r9.y == 0.0 ? LightData[13].xyz : (r9.x == 0.0 ? LightData[12].xyz : r11.y)));			// partial precision
      q46.xyz = l266.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m206.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q45.xyz = (shade(r1.xyz, normalize(m206.xyz)) * l266.xyz) + ((l266.xyz * (q43.x * sqr(q43.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q42.x * q45.xyz, 0);			// partial precision
      r3.xyz = (q42.x * q46.xyz) + r3.xyz;			// partial precision
    }


    if (7 != r3.w) {
      l47.xyz = LightData[15].xyz - IN.texcoord_6.xyz;
      m212.xyz = mul(TanSpaceProj, l47.xyz);
      q213.xyz = normalize(m212.xyz);			// partial precision
      r6.xyz = r5.xyz + q213.xyz;			// partial precision
      l615.x = 1.0 - sqr(saturate(length(l47.xyz) / LightData[15].w));			// partial precision
      q216.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r5.xy = (2 * r2.w) + const_28.yz;
      l50.xyz = (r5.y == 0.0 ? LightData[15].xyz : (r5.x == 0.0 ? LightData[14].xyz : r11.y));			// partial precision
      r4.xyz = r4.xyz + max(l615.x * ((shade(r1.xyz, q213.xyz) * l50.xyz) + ((l50.xyz * (q216.x * sqr(q216.x))) * 0.5)), 0);			// partial precision
      r3.xyz = (l615.x * (l50.xyz * pow(abs(shades(normalize(r6.xyz), r1.xyz)), ToggleNumLights.z))) + r3.xyz;			// partial precision
    }

    r2.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r1.xyz = 2 * ((((2 * r1.xyz) + r0.xyz) * (2 * r2.xyz)) * IN.color_0.rgb);			// partial precision
    q51.xyz = (r1.xyz * (r4.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)))) + (r1.w * r3.xyz);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q51.xyz)) + q51.xyz;			// partial precision

    return OUT;
};

// approximately 447 instruction slots used (4 texture, 443 arithmetic)
