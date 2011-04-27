//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL016.pso /Fcshaderdump19/SM3LL016.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
sampler2D FaceGenMap0 : register(s4);
sampler2D FaceGenMap1 : register(s5);
float4 LightData[8] : register(c9);
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

    const int4 const_17 = {2, -6, -7, 0};
    const int4 const_2 = {4, -1, -2, 0};
    const float4 const_4 = {-0.5, 0, 1, -1};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -4, -5, -6};

    float3 eye158;
    float3 l11;
    float3 l16;
    float3 l21;
    float3 l23;
    float3 l4;
    float3 l55;
    float3 l91;
    float3 m102;
    float3 m108;
    float3 m114;
    float3 m120;
    float3 q12;
    float1 q13;
    float3 q14;
    float3 q17;
    float1 q18;
    float3 q19;
    float1 q2;
    float3 q22;
    float1 q25;
    float3 q27;
    float3 q28;
    float1 q5;
    float3 q7;
    float1 q8;
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
    float1 t1;
    float3 t3;

#define	TanSpaceProj	float3x3(r4.xyz, r7.xyz, r6.xyz)
#define	TanSpaceProj	float3x3(r4.xyz, r7.xyz, r6.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r3.xyz = normalize(expand(r0.xyz));			// partial precision
    r6.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r7.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r4.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    eye158.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye158.xyz);			// partial precision
    r11.yz = const_4.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r0.w) {
      t1.x = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      l91.xyz = mul(TanSpaceProj, LightData[1].xyz);
      t3.xyz = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      q2.x = 1 - shade(r3.xyz, r5.xyz);			// partial precision
      l4.xyz = max((0.5 * ((q2.x * sqr(q2.x)) * LightData[0].xyz)) + dot(r3.xyz, l91.xyz), 0) * LightData[0].xyz;			// partial precision
      r2.xyz = l4.xyz * ((t1.x * (t3.xyz - 1)) + 1);			// partial precision
      r2.w = 1;
    }
    else {
      r2.xyz = 0;			// partial precision
      r2.w = 0;
    }

    q5.x = min(ToggleNumLights.y, 4 - ToggleNumLights.x);			// partial precision
    r1.w = ((q5.x >= 0.0 ? 0 : 1) * (frac(q5.x) <= 0.0 ? 0 : 1)) + (q5.x - frac(q5.x));
    r0.w = (r1.w <= 0.0 ? 0 : 1);

    if (0 != r0.w) {
      r1.x = 2 * r2.w;
      r2.w = r2.w + 1;
      r1.yz = r1.x + const_2.yz;
      q7.xyz = r1.x + const_2.wyz;
      q8.x = 1 - shade(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (q7.xyz >= 0.0 ? q7.xyz : -r1.xyz);
      r0.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : (r9.y <= 0.0 ? LightData[2].xyzw : (r9.x <= 0.0 ? LightData[1].xyzw : r11.y)));
      q9.xyz = r0.xyz - IN.texcoord_6.xyz;
      m102.xyz = mul(TanSpaceProj, q9.xyz);
      l11.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));			// partial precision
      q12.xyz = (shade(r3.xyz, normalize(m102.xyz)) * l11.xyz) + (((q8.x * sqr(q8.x)) * l11.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q12.xyz * (1.0 - sqr(saturate(length(q9.xyz) / r0.w))), 0);			// partial precision
    }


    if (1 != r1.w) {
      q13.x = 1 - shade(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q14.xyz = r0.xyz - IN.texcoord_6.xyz;
      m108.xyz = mul(TanSpaceProj, q14.xyz);
      l16.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      q17.xyz = (shade(r3.xyz, normalize(m108.xyz)) * l16.xyz) + (((q13.x * sqr(q13.x)) * l16.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q17.xyz * (1.0 - sqr(saturate(length(q14.xyz) / r0.w))), 0);			// partial precision
    }


    if (2 != r1.w) {
      q18.x = 1 - shade(r3.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_8.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q19.xyz = r0.xyz - IN.texcoord_6.xyz;
      m114.xyz = mul(TanSpaceProj, q19.xyz);
      l21.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      q22.xyz = (shade(r3.xyz, normalize(m114.xyz)) * l21.xyz) + (((q18.x * sqr(q18.x)) * l21.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q22.xyz * (1.0 - sqr(saturate(length(q19.xyz) / r0.w))), 0);			// partial precision
    }


    if (3 != r1.w) {
      l23.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
      m120.xyz = mul(TanSpaceProj, l23.xyz);
      q25.x = 1 - shade(r3.xyz, r5.xyz);			// partial precision
      r1.xy = (2 * r2.w) + const_17.yz;
      l55.xyz = (r1.y == 0.0 ? LightData[7].xyz : (r1.x == 0.0 ? LightData[6].xyz : r11.y));			// partial precision
      q27.xyz = (shade(r3.xyz, normalize(m120.xyz)) * l55.xyz) + (((q25.x * sqr(q25.x)) * l55.xyz) * 0.5);			// partial precision
      r2.xyz = r2.xyz + max(q27.xyz * (1.0 - sqr(saturate(length(l23.xyz) / LightData[7].w))), 0);			// partial precision
    }

    r0.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r0.xyz = (2 * r1.xyz) + r0.xyz;			// partial precision
    r1.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);			// partial precision
    r1.xyz = 2 * ((r0.xyz * (2 * r1.xyz)) * IN.color_0.rgb);			// partial precision
    q28.xyz = r1.xyz * (r2.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)));			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q28.xyz)) + q28.xyz;			// partial precision

    return OUT;
};

// approximately 217 instruction slots used (6 texture, 211 arithmetic)
