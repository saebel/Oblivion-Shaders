//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3002.pso /Fcshaderdump19/SM3002.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 HairTint : register(c2);
sampler2D LayerMap : register(s5);
float4 LightData[30] : register(c9);
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
//   LayerMap        texture_5       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float2 color_0 : COLOR0;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float3 texcoord_4 : TEXCOORD4_centroid;
    float3 texcoord_5 : TEXCOORD5_centroid;
    float3 texcoord_6 : TEXCOORD6_centroid;
    float4 texcoord_7 : TEXCOORD7_centroid;
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

    const float4 const_1 = {-0.5, 0, 1, 15};
    const int4 const_39 = {2, -8, -9, -10};
    const int4 const_4 = {-1, -2, 0, 2};
    const int4 const_40 = {2, -10, -11, -12};
    const int4 const_41 = {2, -12, -13, -14};
    const int4 const_42 = {2, -18, -19, -20};
    const int4 const_43 = {2, -20, -21, -22};
    const int4 const_44 = {2, -24, -25, -26};
    const int4 const_45 = {2, -22, -23, -24};
    const int4 const_46 = {2, -28, -29, 0};
    const int4 const_47 = {2, -26, -27, -28};
    const int4 const_48 = {2, -6, -7, -8};
    const int4 const_49 = {2, -14, -15, -16};
    const int4 const_50 = {2, -16, -17, -18};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -4, -5, -6};

    float3 l245;
    float3 l33;
    float3 l45;
    float3 l47;
    float3 l49;
    float3 l5;
    float3 l51;
    float3 l53;
    float3 l55;
    float3 l57;
    float3 l59;
    float3 l61;
    float3 l63;
    float3 l65;
    float3 l67;
    float3 l8;
    float3 m126;
    float3 m129;
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
    float3 m180;
    float1 q0;
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
    float3 q2;
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
    float3 q3;
    float1 q30;
    float3 q31;
    float1 q32;
    float3 q35;
    float1 q4;
    float3 q6;
    float1 q7;
    float3 q70;
    float3 q9;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;

#define	TanSpaceProj	float3x3(r7.xyz, r6.xyz, r5.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);
    r4.xyz = normalize(expand(r0.xyz));
    r5.xyz = normalize(IN.texcoord_5.xyz);
    r6.xyz = normalize(IN.texcoord_4.xyz);
    r7.xyz = normalize(IN.texcoord_3.xyz);
    l245.xyz = mul(TanSpaceProj, LightData[1].xyz);
    r0.xyz = shade(r4.xyz, l245.xyz) * LightData[0].xyz;
    r2.xyzw = const_1.xyzw;
    q0.x = min(ToggleNumLights.y, r2.w - ToggleNumLights.x);
    r0.w = 1;
    r2.w = (q0.x >= 0.0 ? 0 : (frac(q0.x) <= 0.0 ? 0 : 1)) + (q0.x - frac(q0.x));
    r1.w = (r2.w <= 0.0 ? 0 : 1);
    r0.xyzw = (ToggleNumLights.x <= 0.0 ? r2.y : r0.xyzw);

    if (0 != r1.w
      r3.x = 2 * r0.w;
      r3.yz = r3.x + const_4.xy;
      q2.xyz = r3.x + const_4.zxy;
      r0.w = r0.w + 1;
      r3.xyz = (q2.xyz >= 0.0 ? q2.xyz : -r3.xyz);
      r1.xyzw = (r3.z <= 0.0 ? LightData[3].xyzw : (r3.y <= 0.0 ? LightData[2].xyzw : (r3.x <= 0.0 ? LightData[1].xyzw : r2.y)));
      q3.xyz = r1.xyz - IN.texcoord_6.xyz;
      q4.x = saturate(length(q3.xyz) / r1.w);
      m126.xyz = mul(TanSpaceProj, q3.xyz);
      l5.xyz = (r3.z <= 0.0 ? LightData[2].xyz : (r3.y <= 0.0 ? LightData[1].xyz : (r3.x <= 0.0 ? LightData[0].xyz : r2.y)));
      r0.xyz = (max(dot(r4.xyz, normalize(m126.xyz)) * (1.0 - sqr(q4.x)), 0) * l5.xyz) + r0.xyz;
    }


    if (1 != r2.w
      r3.xyz = (2 * r0.w) + const_7.yzw;
      r1.xyzw = (r3.z == 0.0 ? LightData[5].xyzw : (r3.y == 0.0 ? LightData[4].xyzw : (r3.x == 0.0 ? LightData[3].xyzw : r2.y)));
      q6.xyz = r1.xyz - IN.texcoord_6.xyz;
      q7.x = saturate(length(q6.xyz) / r1.w);
      r1.w = r0.w + 1;
      m129.xyz = mul(TanSpaceProj, q6.xyz);
      l8.xyz = (r3.z == 0.0 ? LightData[4].xyz : (r3.y == 0.0 ? LightData[3].xyz : (r3.x == 0.0 ? LightData[2].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m129.xyz)) * (1.0 - sqr(q7.x)), 0) * l8.xyz) + r0.xyz;
    }
    else {
      r3.xyz = r0.xyz;
      r1.w = r0.w;
    }


    if (2 != r2.w
      r1.xyz = (2 * r1.w) + const_8.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[7].xyzw : (r1.y == 0.0 ? LightData[6].xyzw : (r1.x == 0.0 ? LightData[5].xyzw : r2.y)));
      q9.xyz = r0.xyz - IN.texcoord_6.xyz;
      q10.x = saturate(length(q9.xyz) / r0.w);
      m133.xyz = mul(TanSpaceProj, q9.xyz);
      l45.xyz = (r1.z == 0.0 ? LightData[6].xyz : (r1.y == 0.0 ? LightData[5].xyz : (r1.x == 0.0 ? LightData[4].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m133.xyz)) * (1.0 - sqr(q10.x)), 0) * l45.xyz) + r3.xyz;
    }


    if (3 != r2.w
      r1.xyz = (2 * r1.w) + const_48.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[9].xyzw : (r1.y == 0.0 ? LightData[8].xyzw : (r1.x == 0.0 ? LightData[7].xyzw : r2.y)));
      q11.xyz = r0.xyz - IN.texcoord_6.xyz;
      q12.x = saturate(length(q11.xyz) / r0.w);
      m137.xyz = mul(TanSpaceProj, q11.xyz);
      l47.xyz = (r1.z == 0.0 ? LightData[8].xyz : (r1.y == 0.0 ? LightData[7].xyz : (r1.x == 0.0 ? LightData[6].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m137.xyz)) * (1.0 - sqr(q12.x)), 0) * l47.xyz) + r3.xyz;
    }


    if (4 != r2.w
      r1.xyz = (2 * r1.w) + const_39.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[11].xyzw : (r1.y == 0.0 ? LightData[10].xyzw : (r1.x == 0.0 ? LightData[9].xyzw : r2.y)));
      q13.xyz = r0.xyz - IN.texcoord_6.xyz;
      q14.x = saturate(length(q13.xyz) / r0.w);
      m141.xyz = mul(TanSpaceProj, q13.xyz);
      l49.xyz = (r1.z == 0.0 ? LightData[10].xyz : (r1.y == 0.0 ? LightData[9].xyz : (r1.x == 0.0 ? LightData[8].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m141.xyz)) * (1.0 - sqr(q14.x)), 0) * l49.xyz) + r3.xyz;
    }


    if (5 != r2.w
      r1.xyz = (2 * r1.w) + const_40.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[13].xyzw : (r1.y == 0.0 ? LightData[12].xyzw : (r1.x == 0.0 ? LightData[11].xyzw : r2.y)));
      q15.xyz = r0.xyz - IN.texcoord_6.xyz;
      q16.x = saturate(length(q15.xyz) / r0.w);
      m145.xyz = mul(TanSpaceProj, q15.xyz);
      l51.xyz = (r1.z == 0.0 ? LightData[12].xyz : (r1.y == 0.0 ? LightData[11].xyz : (r1.x == 0.0 ? LightData[10].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m145.xyz)) * (1.0 - sqr(q16.x)), 0) * l51.xyz) + r3.xyz;
    }


    if (6 != r2.w
      r1.xyz = (2 * r1.w) + const_41.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[15].xyzw : (r1.y == 0.0 ? LightData[14].xyzw : (r1.x == 0.0 ? LightData[13].xyzw : r2.y)));
      q17.xyz = r0.xyz - IN.texcoord_6.xyz;
      q18.x = saturate(length(q17.xyz) / r0.w);
      m149.xyz = mul(TanSpaceProj, q17.xyz);
      l53.xyz = (r1.z == 0.0 ? LightData[14].xyz : (r1.y == 0.0 ? LightData[13].xyz : (r1.x == 0.0 ? LightData[12].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m149.xyz)) * (1.0 - sqr(q18.x)), 0) * l53.xyz) + r3.xyz;
    }


    if (7 != r2.w
      r1.xyz = (2 * r1.w) + const_49.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[17].xyzw : (r1.y == 0.0 ? LightData[16].xyzw : (r1.x == 0.0 ? LightData[15].xyzw : r2.y)));
      q19.xyz = r0.xyz - IN.texcoord_6.xyz;
      q20.x = saturate(length(q19.xyz) / r0.w);
      m153.xyz = mul(TanSpaceProj, q19.xyz);
      l55.xyz = (r1.z == 0.0 ? LightData[16].xyz : (r1.y == 0.0 ? LightData[15].xyz : (r1.x == 0.0 ? LightData[14].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m153.xyz)) * (1.0 - sqr(q20.x)), 0) * l55.xyz) + r3.xyz;
    }


    if (8 != r2.w
      r1.xyz = (2 * r1.w) + const_50.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[19].xyzw : (r1.y == 0.0 ? LightData[18].xyzw : (r1.x == 0.0 ? LightData[17].xyzw : r2.y)));
      q21.xyz = r0.xyz - IN.texcoord_6.xyz;
      q22.x = saturate(length(q21.xyz) / r0.w);
      m157.xyz = mul(TanSpaceProj, q21.xyz);
      l57.xyz = (r1.z == 0.0 ? LightData[18].xyz : (r1.y == 0.0 ? LightData[17].xyz : (r1.x == 0.0 ? LightData[16].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m157.xyz)) * (1.0 - sqr(q22.x)), 0) * l57.xyz) + r3.xyz;
    }


    if (9 != r2.w
      r1.xyz = (2 * r1.w) + const_42.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[21].xyzw : (r1.y == 0.0 ? LightData[20].xyzw : (r1.x == 0.0 ? LightData[19].xyzw : r2.y)));
      q23.xyz = r0.xyz - IN.texcoord_6.xyz;
      q24.x = saturate(length(q23.xyz) / r0.w);
      m161.xyz = mul(TanSpaceProj, q23.xyz);
      l59.xyz = (r1.z == 0.0 ? LightData[20].xyz : (r1.y == 0.0 ? LightData[19].xyz : (r1.x == 0.0 ? LightData[18].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m161.xyz)) * (1.0 - sqr(q24.x)), 0) * l59.xyz) + r3.xyz;
    }


    if (10 != r2.w
      r1.xyz = (2 * r1.w) + const_43.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[23].xyzw : (r1.y == 0.0 ? LightData[22].xyzw : (r1.x == 0.0 ? LightData[21].xyzw : r2.y)));
      q25.xyz = r0.xyz - IN.texcoord_6.xyz;
      q26.x = saturate(length(q25.xyz) / r0.w);
      m165.xyz = mul(TanSpaceProj, q25.xyz);
      l61.xyz = (r1.z == 0.0 ? LightData[22].xyz : (r1.y == 0.0 ? LightData[21].xyz : (r1.x == 0.0 ? LightData[20].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m165.xyz)) * (1.0 - sqr(q26.x)), 0) * l61.xyz) + r3.xyz;
    }


    if (11 != r2.w
      r1.xyz = (2 * r1.w) + const_45.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[25].xyzw : (r1.y == 0.0 ? LightData[24].xyzw : (r1.x == 0.0 ? LightData[23].xyzw : r2.y)));
      q27.xyz = r0.xyz - IN.texcoord_6.xyz;
      q28.x = saturate(length(q27.xyz) / r0.w);
      m169.xyz = mul(TanSpaceProj, q27.xyz);
      l63.xyz = (r1.z == 0.0 ? LightData[24].xyz : (r1.y == 0.0 ? LightData[23].xyz : (r1.x == 0.0 ? LightData[22].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m169.xyz)) * (1.0 - sqr(q28.x)), 0) * l63.xyz) + r3.xyz;
    }


    if (12 != r2.w
      r1.xyz = (2 * r1.w) + const_44.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[27].xyzw : (r1.y == 0.0 ? LightData[26].xyzw : (r1.x == 0.0 ? LightData[25].xyzw : r2.y)));
      q29.xyz = r0.xyz - IN.texcoord_6.xyz;
      q30.x = saturate(length(q29.xyz) / r0.w);
      m173.xyz = mul(TanSpaceProj, q29.xyz);
      l65.xyz = (r1.z == 0.0 ? LightData[26].xyz : (r1.y == 0.0 ? LightData[25].xyz : (r1.x == 0.0 ? LightData[24].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m173.xyz)) * (1.0 - sqr(q30.x)), 0) * l65.xyz) + r3.xyz;
    }


    if (13 != r2.w
      r1.xyz = (2 * r1.w) + const_47.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r1.z == 0.0 ? LightData[29].xyzw : (r1.y == 0.0 ? LightData[28].xyzw : (r1.x == 0.0 ? LightData[27].xyzw : r2.y)));
      q31.xyz = r0.xyz - IN.texcoord_6.xyz;
      q32.x = saturate(length(q31.xyz) / r0.w);
      m177.xyz = mul(TanSpaceProj, q31.xyz);
      l67.xyz = (r1.z == 0.0 ? LightData[28].xyz : (r1.y == 0.0 ? LightData[27].xyz : (r1.x == 0.0 ? LightData[26].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m177.xyz)) * (1.0 - sqr(q32.x)), 0) * l67.xyz) + r3.xyz;
    }


    if (14 != r2.w
      l33.xyz = LightData[29].xyz - IN.texcoord_6.xyz;
      m180.xyz = mul(TanSpaceProj, l33.xyz);
      r1.xy = (2 * r1.w) + const_46.yz;
      r3.xyz = (max(dot(r4.xyz, normalize(m180.xyz)) * (1.0 - sqr(saturate(length(l33.xyz) / LightData[29].w))), 0) * (r1.y == 0.0 ? LightData[29].xyz : (r1.x == 0.0 ? LightData[28].xyz : r2.y))) + r3.xyz;
    }

    r1.xyzw = tex2D(LayerMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    q70.xyz = (2 * ((IN.color_0.g * (r2.x + HairTint.rgb)) + 0.5)) * lerp(r0.xyz, r1.xyz, r1.w);
    q35.xyz = q70.xyz * (r3.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r2.z - ToggleADTS.x)));
    OUT.color_0.a = r0.w * MatAlpha.x;
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q35.xyz)) + q35.xyz;

    return OUT;
};

// approximately 454 instruction slots used (3 texture, 451 arithmetic)