//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3019.pso /Fcshaderdump19/SM3019.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
sampler2D GlowMap : register(s6);
float4 LightData[16] : register(c9);
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
//   EyePosition     const_1       1
//   MatAlpha        const_3       1
//   MatEmit         const_4       1
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

    const float4 const_2 = {-0.5, 0, 1, -1};
    const int4 const_25 = {2, -4, -5, -6};
    const int4 const_26 = {2, -8, -9, -10};
    const int4 const_27 = {2, -10, -11, -12};
    const int4 const_28 = {2, -14, -15, 0};
    const int4 const_29 = {2, -12, -13, -14};
    const int4 const_30 = {2, -6, -7, -8};
    const int4 const_7 = {8, -1, -2, 0};
    const int4 const_8 = {2, -2, -3, -4};

    float3 eye228;
    float3 l101;
    float3 l113;
    float3 l22;
    float3 l25;
    float3 l4;
    float1 l502;
    float3 l77;
    float3 l81;
    float3 l85;
    float3 l89;
    float3 l93;
    float3 l97;
    float3 m123;
    float3 m131;
    float3 m137;
    float3 m143;
    float3 m149;
    float3 m155;
    float3 m161;
    float3 m165;
    float1 q11;
    float1 q13;
    float1 q15;
    float1 q17;
    float1 q19;
    float1 q21;
    float3 q26;
    float3 q3;
    float3 q35;
    float3 q38;
    float3 q39;
    float3 q42;
    float3 q43;
    float3 q46;
    float3 q47;
    float1 q5;
    float3 q50;
    float3 q51;
    float3 q54;
    float3 q55;
    float3 q58;
    float3 q59;
    float3 q62;
    float3 q68;
    float3 q7;
    float1 q9;
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

#define	TanSpaceProj	float3x3(r8.xyz, r7.xyz, r6.xyz)
#define	TanSpaceProj	float3x3(r8.xyz, r7.xyz, r6.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r3.xyz = normalize(expand(r0.xyz));			// partial precision
    r6.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r7.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r8.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    eye228.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye228.xyz);			// partial precision
    r11.yz = const_2.yz;
    r1.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r1.w) {
      t2.x = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      t1.xyz = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      l113.xyz = mul(TanSpaceProj, LightData[1].xyz);
      l4.xyz = pow(abs(shades(normalize(r5.xyz + l113.xyz), r3.xyz)), ToggleNumLights.z) * LightData[0].xyz;			// partial precision
      r3.w = 1;
      q3.xyz = (t2.x * (t1.xyz - 1)) + 1;			// partial precision
      r0.xyz = q3.xyz * l4.xyz;			// partial precision
      r2.xyz = q3.xyz * (shade(r3.xyz, l113.xyz) * LightData[0].xyz);			// partial precision
    }
    else {
      r3.w = 0;
      r2.xyz = 0;			// partial precision
      r0.xyz = 0;			// partial precision
    }

    q5.x = min(ToggleNumLights.y, 8 - ToggleNumLights.x);			// partial precision
    r2.w = ((q5.x >= 0.0 ? 0 : 1) * (frac(q5.x) <= 0.0 ? 0 : 1)) + (q5.x - frac(q5.x));
    r1.w = (r2.w <= 0.0 ? 0 : 1);

    if (0 != r1.w) {
      r4.x = 2 * r3.w;
      r4.yz = r4.x + const_7.yz;
      q7.xyz = r4.x + const_7.wyz;
      r3.w = r3.w + 1;
      r9.xyz = (q7.xyz >= 0.0 ? q7.xyz : -r4.xyz);
      r1.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : (r9.y <= 0.0 ? LightData[2].xyzw : (r9.x <= 0.0 ? LightData[1].xyzw : r11.y)));
      q35.xyz = r1.xyz - IN.texcoord_6.xyz;
      m123.xyz = mul(TanSpaceProj, q35.xyz);
      q38.xyz = normalize(m123.xyz);			// partial precision
      q9.x = 1.0 - sqr(saturate(length(q35.xyz) / r1.w));			// partial precision
      l77.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));			// partial precision
      r0.xyz = (q9.x * (l77.xyz * pow(abs(shades(normalize(r5.xyz + q38.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q9.x * dot(r3.xyz, q38.xyz), 0) * l77.xyz) + r2.xyz;			// partial precision
    }


    if (1 != r2.w) {
      r9.xyz = (2 * r3.w) + const_8.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q39.xyz = r1.xyz - IN.texcoord_6.xyz;
      m131.xyz = mul(TanSpaceProj, q39.xyz);
      q42.xyz = normalize(m131.xyz);			// partial precision
      q11.x = 1.0 - sqr(saturate(length(q39.xyz) / r1.w));			// partial precision
      l81.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      r0.xyz = (q11.x * (l81.xyz * pow(abs(shades(normalize(r5.xyz + q42.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q11.x * dot(r3.xyz, q42.xyz), 0) * l81.xyz) + r2.xyz;			// partial precision
    }


    if (2 != r2.w) {
      r9.xyz = (2 * r3.w) + const_25.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q43.xyz = r1.xyz - IN.texcoord_6.xyz;
      m137.xyz = mul(TanSpaceProj, q43.xyz);
      q46.xyz = normalize(m137.xyz);			// partial precision
      q13.x = 1.0 - sqr(saturate(length(q43.xyz) / r1.w));			// partial precision
      l85.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      r0.xyz = (q13.x * (l85.xyz * pow(abs(shades(normalize(r5.xyz + q46.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q13.x * dot(r3.xyz, q46.xyz), 0) * l85.xyz) + r2.xyz;			// partial precision
    }


    if (3 != r2.w) {
      r9.xyz = (2 * r3.w) + const_30.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[9].xyzw : (r9.y == 0.0 ? LightData[8].xyzw : (r9.x == 0.0 ? LightData[7].xyzw : r11.y)));
      q47.xyz = r1.xyz - IN.texcoord_6.xyz;
      m143.xyz = mul(TanSpaceProj, q47.xyz);
      q50.xyz = normalize(m143.xyz);			// partial precision
      q15.x = 1.0 - sqr(saturate(length(q47.xyz) / r1.w));			// partial precision
      l89.xyz = (r9.z == 0.0 ? LightData[8].xyz : (r9.y == 0.0 ? LightData[7].xyz : (r9.x == 0.0 ? LightData[6].xyz : r11.y)));			// partial precision
      r0.xyz = (q15.x * (l89.xyz * pow(abs(shades(normalize(r5.xyz + q50.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q15.x * dot(r3.xyz, q50.xyz), 0) * l89.xyz) + r2.xyz;			// partial precision
    }


    if (4 != r2.w) {
      r9.xyz = (2 * r3.w) + const_26.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[11].xyzw : (r9.y == 0.0 ? LightData[10].xyzw : (r9.x == 0.0 ? LightData[9].xyzw : r11.y)));
      q51.xyz = r1.xyz - IN.texcoord_6.xyz;
      m149.xyz = mul(TanSpaceProj, q51.xyz);
      q54.xyz = normalize(m149.xyz);			// partial precision
      q17.x = 1.0 - sqr(saturate(length(q51.xyz) / r1.w));			// partial precision
      l93.xyz = (r9.z == 0.0 ? LightData[10].xyz : (r9.y == 0.0 ? LightData[9].xyz : (r9.x == 0.0 ? LightData[8].xyz : r11.y)));			// partial precision
      r0.xyz = (q17.x * (l93.xyz * pow(abs(shades(normalize(r5.xyz + q54.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q17.x * dot(r3.xyz, q54.xyz), 0) * l93.xyz) + r2.xyz;			// partial precision
    }


    if (5 != r2.w) {
      r9.xyz = (2 * r3.w) + const_27.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[13].xyzw : (r9.y == 0.0 ? LightData[12].xyzw : (r9.x == 0.0 ? LightData[11].xyzw : r11.y)));
      q55.xyz = r1.xyz - IN.texcoord_6.xyz;
      m155.xyz = mul(TanSpaceProj, q55.xyz);
      q58.xyz = normalize(m155.xyz);			// partial precision
      q19.x = 1.0 - sqr(saturate(length(q55.xyz) / r1.w));			// partial precision
      l97.xyz = (r9.z == 0.0 ? LightData[12].xyz : (r9.y == 0.0 ? LightData[11].xyz : (r9.x == 0.0 ? LightData[10].xyz : r11.y)));			// partial precision
      r0.xyz = (q19.x * (l97.xyz * pow(abs(shades(normalize(r5.xyz + q58.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q19.x * dot(r3.xyz, q58.xyz), 0) * l97.xyz) + r2.xyz;			// partial precision
    }


    if (6 != r2.w) {
      r9.xyz = (2 * r3.w) + const_29.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[15].xyzw : (r9.y == 0.0 ? LightData[14].xyzw : (r9.x == 0.0 ? LightData[13].xyzw : r11.y)));
      q59.xyz = r1.xyz - IN.texcoord_6.xyz;
      m161.xyz = mul(TanSpaceProj, q59.xyz);
      q62.xyz = normalize(m161.xyz);			// partial precision
      q21.x = 1.0 - sqr(saturate(length(q59.xyz) / r1.w));			// partial precision
      l101.xyz = (r9.z == 0.0 ? LightData[14].xyz : (r9.y == 0.0 ? LightData[13].xyz : (r9.x == 0.0 ? LightData[12].xyz : r11.y)));			// partial precision
      r0.xyz = (q21.x * (l101.xyz * pow(abs(shades(normalize(r5.xyz + q62.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q21.x * dot(r3.xyz, q62.xyz), 0) * l101.xyz) + r2.xyz;			// partial precision
    }


    if (7 != r2.w) {
      l22.xyz = LightData[15].xyz - IN.texcoord_6.xyz;
      m165.xyz = mul(TanSpaceProj, l22.xyz);
      r5.xyz = r5.xyz + normalize(m165.xyz);			// partial precision
      r1.w = pow(abs(shades(normalize(r5.xyz), r3.xyz)), ToggleNumLights.z);			// partial precision
      l502.x = 1.0 - sqr(saturate(length(l22.xyz) / LightData[15].w));			// partial precision
      r5.xy = (2 * r3.w) + const_28.yz;
      l25.xyz = (r5.y == 0.0 ? LightData[15].xyz : (r5.x == 0.0 ? LightData[14].xyz : r11.y));			// partial precision
      r2.xyz = (max(l502.x * dot(r3.xyz, normalize(m165.xyz)), 0) * l25.xyz) + r2.xyz;			// partial precision
      r0.xyz = (l502.x * (r1.w * l25.xyz)) + r0.xyz;			// partial precision
    }

    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);			// partial precision
    q26.xyz = (ToggleADTS.x * ((r1.xyz * MatEmit.rgb) + AmbientColor.rgb)) + (r11.z - ToggleADTS.x);			// partial precision
    r1.xyz = r2.xyz + q26.xyz;			// partial precision
    r2.xyz = r0.w * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q68.xyz = ((r0.xyz * IN.color_0.rgb) * r1.xyz) + r2.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q68.xyz)) + q68.xyz;			// partial precision

    return OUT;
};

// approximately 369 instruction slots used (5 texture, 364 arithmetic)
