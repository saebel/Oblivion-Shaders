//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL018.pso /Fcshaderdump19/SM3LL018.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
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

    const float4 const_1 = {-0.5, 0, 1, -1};
    const int4 const_17 = {2, -4, -5, -6};
    const int4 const_2 = {4, -1, -2, 0};
    const int4 const_7 = {2, -6, -7, 0};
    const int4 const_8 = {2, -2, -3, -4};

    float3 l10;
    float3 l13;
    float3 l14;
    float3 l52;
    float3 l7;
    float3 m61;
    float3 m65;
    float3 m69;
    float3 m72;
    float3 q11;
    float1 q12;
    float3 q17;
    float1 q2;
    float3 q34;
    float3 q4;
    float3 q5;
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
      l52.xyz = mul(TanSpaceProj, LightData[1].xyz);
      r1.w = 1;
      r1.xyz = ((t1.x * (t0.xyz - 1)) + 1) * (shade(r2.xyz, l52.xyz) * LightData[0].xyz);			// partial precision
    }
    else {
      r1.xyz = 0;			// partial precision
      r1.w = 0;
    }

    q2.x = min(ToggleNumLights.y, 4 - ToggleNumLights.x);			// partial precision
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
      m61.xyz = mul(TanSpaceProj, q5.xyz);
      l7.xyz = (r6.z <= 0.0 ? LightData[2].xyz : (r6.y <= 0.0 ? LightData[1].xyz : (r6.x <= 0.0 ? LightData[0].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m61.xyz)) * (1.0 - sqr(q6.x)), 0) * l7.xyz) + r1.xyz;			// partial precision
    }


    if (1 != r2.w) {
      r6.xyz = (2 * r1.w) + const_8.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[5].xyzw : (r6.y == 0.0 ? LightData[4].xyzw : (r6.x == 0.0 ? LightData[3].xyzw : r9.y)));
      q8.xyz = r0.xyz - IN.texcoord_6.xyz;
      q9.x = saturate(length(q8.xyz) / r0.w);
      m65.xyz = mul(TanSpaceProj, q8.xyz);
      l10.xyz = (r6.z == 0.0 ? LightData[4].xyz : (r6.y == 0.0 ? LightData[3].xyz : (r6.x == 0.0 ? LightData[2].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m65.xyz)) * (1.0 - sqr(q9.x)), 0) * l10.xyz) + r1.xyz;			// partial precision
    }


    if (2 != r2.w) {
      r6.xyz = (2 * r1.w) + const_17.yzw;
      r1.w = r1.w + 1;
      r0.xyzw = (r6.z == 0.0 ? LightData[7].xyzw : (r6.y == 0.0 ? LightData[6].xyzw : (r6.x == 0.0 ? LightData[5].xyzw : r9.y)));
      q11.xyz = r0.xyz - IN.texcoord_6.xyz;
      q12.x = saturate(length(q11.xyz) / r0.w);
      m69.xyz = mul(TanSpaceProj, q11.xyz);
      l13.xyz = (r6.z == 0.0 ? LightData[6].xyz : (r6.y == 0.0 ? LightData[5].xyz : (r6.x == 0.0 ? LightData[4].xyz : r9.y)));			// partial precision
      r1.xyz = (max(dot(r2.xyz, normalize(m69.xyz)) * (1.0 - sqr(q12.x)), 0) * l13.xyz) + r1.xyz;			// partial precision
    }


    if (3 != r2.w) {
      l14.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
      m72.xyz = mul(TanSpaceProj, l14.xyz);
      r0.w = dot(r2.xyz, normalize(m72.xyz));			// partial precision
      r2.xy = (2 * r1.w) + const_7.yz;
      r1.xyz = (max(r0.w * (1.0 - sqr(saturate(length(l14.xyz) / LightData[7].w))), 0) * (r2.y == 0.0 ? LightData[7].xyz : (r2.x == 0.0 ? LightData[6].xyz : r9.y))) + r1.xyz;			// partial precision
    }

    r0.xyzw = tex2D(GlowMap, IN.BaseUV.xy);			// partial precision
    q17.xyz = (ToggleADTS.x * ((r0.xyz * MatEmit.rgb) + AmbientColor.rgb)) + (r9.z - ToggleADTS.x);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q34.xyz = (r1.xyz + q17.xyz) * (r0.xyz * IN.color_0.rgb);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q34.xyz)) + q34.xyz;			// partial precision

    return OUT;
};

// approximately 162 instruction slots used (5 texture, 157 arithmetic)
