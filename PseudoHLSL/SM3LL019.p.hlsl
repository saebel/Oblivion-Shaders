//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL019.pso /Fcshaderdump19/SM3LL019.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
sampler2D GlowMap : register(s6);
float4 LightData[8] : register(c9);
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

    const int4 const_17 = {2, -6, -7, 0};
    const int4 const_18 = {2, -2, -3, -4};
    const float4 const_2 = {-0.5, 0, 1, -1};
    const int4 const_7 = {4, -1, -2, 0};
    const int4 const_8 = {2, -4, -5, -6};

    float3 eye140;
    float3 l14;
    float3 l17;
    float1 l298;
    float3 l4;
    float3 l53;
    float3 l57;
    float3 l61;
    float3 l73;
    float3 m101;
    float3 m83;
    float3 m91;
    float3 m97;
    float1 q11;
    float1 q13;
    float3 q18;
    float3 q27;
    float3 q3;
    float3 q30;
    float3 q31;
    float3 q34;
    float3 q35;
    float3 q38;
    float3 q44;
    float1 q5;
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
    eye140.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye140.xyz);			// partial precision
    r11.yz = const_2.yz;
    r1.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r1.w) {
      t2.x = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      t1.xyz = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      l73.xyz = mul(TanSpaceProj, LightData[1].xyz);
      l4.xyz = pow(abs(shades(normalize(r5.xyz + l73.xyz), r3.xyz)), ToggleNumLights.z) * LightData[0].xyz;			// partial precision
      r3.w = 1;
      q3.xyz = (t2.x * (t1.xyz - 1)) + 1;			// partial precision
      r0.xyz = q3.xyz * l4.xyz;			// partial precision
      r2.xyz = q3.xyz * (shade(r3.xyz, l73.xyz) * LightData[0].xyz);			// partial precision
    }
    else {
      r3.w = 0;
      r2.xyz = 0;			// partial precision
      r0.xyz = 0;			// partial precision
    }

    q5.x = min(ToggleNumLights.y, 4 - ToggleNumLights.x);			// partial precision
    r2.w = ((q5.x >= 0.0 ? 0 : 1) * (frac(q5.x) <= 0.0 ? 0 : 1)) + (q5.x - frac(q5.x));
    r1.w = (r2.w <= 0.0 ? 0 : 1);

    if (0 != r1.w) {
      r4.x = 2 * r3.w;
      r4.yz = r4.x + const_7.yz;
      q7.xyz = r4.x + const_7.wyz;
      r3.w = r3.w + 1;
      r9.xyz = (q7.xyz >= 0.0 ? q7.xyz : -r4.xyz);
      r1.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : (r9.y <= 0.0 ? LightData[2].xyzw : (r9.x <= 0.0 ? LightData[1].xyzw : r11.y)));
      q27.xyz = r1.xyz - IN.texcoord_6.xyz;
      m83.xyz = mul(TanSpaceProj, q27.xyz);
      q30.xyz = normalize(m83.xyz);			// partial precision
      q9.x = 1.0 - sqr(saturate(length(q27.xyz) / r1.w));			// partial precision
      l53.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));			// partial precision
      r0.xyz = (q9.x * (l53.xyz * pow(abs(shades(normalize(r5.xyz + q30.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q9.x * dot(r3.xyz, q30.xyz), 0) * l53.xyz) + r2.xyz;			// partial precision
    }


    if (1 != r2.w) {
      r9.xyz = (2 * r3.w) + const_18.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q31.xyz = r1.xyz - IN.texcoord_6.xyz;
      m91.xyz = mul(TanSpaceProj, q31.xyz);
      q34.xyz = normalize(m91.xyz);			// partial precision
      q11.x = 1.0 - sqr(saturate(length(q31.xyz) / r1.w));			// partial precision
      l57.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      r0.xyz = (q11.x * (l57.xyz * pow(abs(shades(normalize(r5.xyz + q34.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q11.x * dot(r3.xyz, q34.xyz), 0) * l57.xyz) + r2.xyz;			// partial precision
    }


    if (2 != r2.w) {
      r9.xyz = (2 * r3.w) + const_8.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q35.xyz = r1.xyz - IN.texcoord_6.xyz;
      m97.xyz = mul(TanSpaceProj, q35.xyz);
      q38.xyz = normalize(m97.xyz);			// partial precision
      q13.x = 1.0 - sqr(saturate(length(q35.xyz) / r1.w));			// partial precision
      l61.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      r0.xyz = (q13.x * (l61.xyz * pow(abs(shades(normalize(r5.xyz + q38.xyz), r3.xyz)), ToggleNumLights.z))) + r0.xyz;			// partial precision
      r2.xyz = (max(q13.x * dot(r3.xyz, q38.xyz), 0) * l61.xyz) + r2.xyz;			// partial precision
    }


    if (3 != r2.w) {
      l14.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
      m101.xyz = mul(TanSpaceProj, l14.xyz);
      r5.xyz = r5.xyz + normalize(m101.xyz);			// partial precision
      r1.w = pow(abs(shades(normalize(r5.xyz), r3.xyz)), ToggleNumLights.z);			// partial precision
      l298.x = 1.0 - sqr(saturate(length(l14.xyz) / LightData[7].w));			// partial precision
      r5.xy = (2 * r3.w) + const_17.yz;
      l17.xyz = (r5.y == 0.0 ? LightData[7].xyz : (r5.x == 0.0 ? LightData[6].xyz : r11.y));			// partial precision
      r2.xyz = (max(l298.x * dot(r3.xyz, normalize(m101.xyz)), 0) * l17.xyz) + r2.xyz;			// partial precision
      r0.xyz = (l298.x * (r1.w * l17.xyz)) + r0.xyz;			// partial precision
    }

    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);			// partial precision
    q18.xyz = (ToggleADTS.x * ((r1.xyz * MatEmit.rgb) + AmbientColor.rgb)) + (r11.z - ToggleADTS.x);			// partial precision
    r1.xyz = r2.xyz + q18.xyz;			// partial precision
    r2.xyz = r0.w * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q44.xyz = ((r0.xyz * IN.color_0.rgb) * r1.xyz) + r2.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q44.xyz)) + q44.xyz;			// partial precision

    return OUT;
};

// approximately 221 instruction slots used (5 texture, 216 arithmetic)
