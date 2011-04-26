//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL013.pso /Fcshaderdump19/SM3LL013.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D AnisoMap : register(s4);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
float3 HairTint : register(c2);
sampler2D LayerMap : register(s5);
float4 LightData[8];
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
//   HairTint        const_2       1
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
//   AnisoMap        texture_4       1
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

    const int4 const_17 = {2, -6, -7, 0};
    const int4 const_18 = {-2, -3, -4, 0};
    const int4 const_20 = {-1, -2, 0, 2};
    const float4 const_4 = {-0.05, 0, 0.7, 4};
    const float4 const_7 = {-0.5, 0, 1, -1};
    const int4 const_8 = {-4, -5, -6, 0};

    float3 eye108;
    float3 l11;
    float1 l13;
    float3 l140;
    float3 l16;
    float3 l17;
    float1 l19;
    float3 l22;
    float3 l23;
    float1 l25;
    float3 l30;
    float1 l386;
    float3 l7;
    float3 m116;
    float3 m126;
    float3 m134;
    float3 m141;
    float3 q1;
    float3 q10;
    float3 q12;
    float1 q15;
    float3 q18;
    float3 q2;
    float1 q21;
    float3 q24;
    float1 q27;
    float3 q3;
    float3 q49;
    float3 q56;
    float3 q6;
    float3 q62;
    float3 q66;
    float3 q68;
    float1 q8;
    float4 r0;
    float4 r1;
    float3 r10;
    float3 r11;
    float3 r12;
    float3 r13;
    float3 r14;
    float3 r15;
    float2 r16;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float3 r6;
    float4 r7;
    float3 r8;
    float3 r9;
    float3 t4;
    float1 t5;

#define	TanSpaceProj	float3x3(r12.xyz, r11.xyz, r10.xyz)
#define	TanSpaceProj	float3x3(r12.xyz, r11.xyz, r10.xyz)

    r1.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r5.xyz = normalize(expand(r1.xyz));			// partial precision
    r0.xyz = r5.xyz * 0.5;			// partial precision
    q1.xyz = r0.xyz + const_7.yyz;			// partial precision
    r0.w = r0.z + 1;			// partial precision
    r0.xyz = q1.xyz / sqrt(dot(r0.xyw, q1.xyz));			// partial precision
    r0.w = r0.x - 0.05;			// partial precision
    q2.xyz = r0.xyz + const_4.xyy;			// partial precision
    r8.xyz = q2.xyz / sqrt(dot(r0.wyz, q2.xyz));			// partial precision
    r10.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r11.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r12.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r4.xyz = mul(TanSpaceProj, LightData[1].xyz);
    eye108.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r9.xyz = normalize(eye108.xyz);			// partial precision
    q3.xyz = normalize(r4.xyz + r9.xyz);			// partial precision
    r2.x = dot(r8.xyz, r4.xyz);			// partial precision
    r2.y = dot(r8.xyz, q3.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r2.xy);			// partial precision
    r3.x = dot(r0.xyz, r4.xyz);			// partial precision
    r3.y = dot(r0.xyz, q3.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r6.xyz = const_7.xyz;
    r4.w = (ToggleNumLights.x <= 0.0 ? r6.y : r6.z);

    if (0 != r4.w) {
      t5.x = tex2D(ShadowMask, IN.texcoord_1.zw);			// partial precision
      t4.xyz = tex2D(ShadowMap, IN.texcoord_1.xy);			// partial precision
      r0.w = 1;
      q6.xyz = (t5.x * (t4.xyz - 1)) + 1;			// partial precision
      l7.xyz = ((r2.w * (2 * ((IN.color_0.g * (r6.x + HairTint.rgb)) + 0.5))) + (r3.w * 0.7)) * LightData[0].xyz;			// partial precision
      r1.xyz = (max(r4.z, 0) * l7.xyz) * q6.xyz;			// partial precision
      r4.xyz = q6.xyz * (shade(r5.xyz, r4.xyz) * LightData[0].xyz);			// partial precision
    }
    else {
      r0.w = 0;			// partial precision
      r4.xyz = r0.w;			// partial precision
      r1.xyz = r0.w;			// partial precision
    }

    q8.x = min(ToggleNumLights.y, 4 - ToggleNumLights.x);			// partial precision
    r13.x = 2 * r0.w;
    r13.yz = r13.x + const_20.xy;
    q10.xyz = r13.x + const_20.zxy;
    r14.xyz = (q10.xyz >= 0.0 ? q10.xyz : -r13.xyz);
    l11.xyz = (r14.z <= 0.0 ? LightData[3].xyz : (r14.y <= 0.0 ? LightData[2].xyz : (r14.x <= 0.0 ? LightData[1].xyz : r6.y)));
    r15.xyz = l11.xyz - IN.texcoord_6.xyz;
    m116.xyz = mul(TanSpaceProj, r15.xyz);
    r7.xyz = normalize(m116.xyz);			// partial precision
    q12.xyz = normalize(r9.xyz + r7.xyz);			// partial precision
    r16.x = dot(r8.xyz, r7.xyz);			// partial precision
    r16.y = dot(r8.xyz, q12.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r16.xy);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, q12.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision
    r4.w = ((q8.x >= 0.0 ? 0 : 1) * (frac(q8.x) <= 0.0 ? 0 : 1)) + (q8.x - frac(q8.x));
    r5.w = (r4.w <= 0.0 ? 0 : 1);

    if (0 != r5.w) {
      r2.xyz = r13.x + const_20.zxy;
      r5.w = r0.w + 1;
      l16.xyz = (r2.z == 0.0 ? LightData[2].xyz : (r2.y == 0.0 ? LightData[1].xyz : (r2.x == 0.0 ? LightData[0].xyz : r6.y)));			// partial precision
      q49.xyz = (r2.w * ((0.3 * ((IN.color_0.g * (r6.x + HairTint.rgb)) + 0.5)) + 0.2)) + (r3.w * 0.7);			// partial precision
      l13.x = (r14.z <= 0.0 ? LightData[3].w : (r14.y <= 0.0 ? LightData[2].w : (r14.x <= 0.0 ? LightData[1].w : r6.y)));			// partial precision
      q15.x = 1.0 - sqr(saturate(length(r15.xyz) / l13.x));			// partial precision
      r1.xyz = (max(r7.z, 0) * ((q15.x * l16.xyz) * q49.xyz)) + r1.xyz;			// partial precision
      r4.xyz = (max(dot(r5.xyz, r7.xyz) * q15.x, 0) * l16.xyz) + r4.xyz;			// partial precision
    }
    else {
      r5.w = r0.w;
    }

    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_18.xyz;
    l17.xyz = (r13.z == 0.0 ? LightData[5].xyz : (r13.y == 0.0 ? LightData[4].xyz : (r13.x == 0.0 ? LightData[3].xyz : r6.y)));
    r14.xyz = l17.xyz - IN.texcoord_6.xyz;
    m126.xyz = mul(TanSpaceProj, r14.xyz);
    r7.xyz = normalize(m126.xyz);			// partial precision
    q18.xyz = normalize(r9.xyz + r7.xyz);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r15.y = dot(r8.xyz, q18.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, q18.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision

    if (1 != r4.w) {
      r2.xyz = r7.w + const_18.xyz;
      r5.w = r5.w + 1;
      l22.xyz = (r2.z == 0.0 ? LightData[4].xyz : (r2.y == 0.0 ? LightData[3].xyz : (r2.x == 0.0 ? LightData[2].xyz : r6.y)));			// partial precision
      q56.xyz = (r2.w * ((0.3 * ((IN.color_0.g * (r6.x + HairTint.rgb)) + 0.5)) + 0.2)) + (r3.w * 0.7);			// partial precision
      l19.x = (r13.z == 0.0 ? LightData[5].w : (r13.y == 0.0 ? LightData[4].w : (r13.x == 0.0 ? LightData[3].w : r6.y)));			// partial precision
      q21.x = 1.0 - sqr(saturate(length(r14.xyz) / l19.x));			// partial precision
      r1.xyz = (max(r7.z, 0) * ((q21.x * l22.xyz) * q56.xyz)) + r1.xyz;			// partial precision
      r4.xyz = (max(dot(r5.xyz, r7.xyz) * q21.x, 0) * l22.xyz) + r4.xyz;			// partial precision
    }

    r7.w = 2 * r5.w;
    r13.xyz = r7.w + const_8.xyz;
    l23.xyz = (r13.z == 0.0 ? LightData[7].xyz : (r13.y == 0.0 ? LightData[6].xyz : (r13.x == 0.0 ? LightData[5].xyz : r6.y)));
    r14.xyz = l23.xyz - IN.texcoord_6.xyz;
    m134.xyz = mul(TanSpaceProj, r14.xyz);
    r7.xyz = normalize(m134.xyz);			// partial precision
    q24.xyz = normalize(r9.xyz + r7.xyz);			// partial precision
    r15.x = dot(r8.xyz, r7.xyz);			// partial precision
    r15.y = dot(r8.xyz, q24.xyz);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r15.xy);			// partial precision
    r3.x = dot(r0.xyz, r7.xyz);			// partial precision
    r3.y = dot(r0.xyz, q24.xyz);			// partial precision
    r3.xyzw = tex2D(AnisoMap, r3.xy);			// partial precision

    if (2 != r4.w) {
      r2.xyz = r7.w + const_8.xyz;
      r5.w = r5.w + 1;
      l140.xyz = (r2.z == 0.0 ? LightData[6].xyz : (r2.y == 0.0 ? LightData[5].xyz : (r2.x == 0.0 ? LightData[4].xyz : r6.y)));			// partial precision
      q62.xyz = (r2.w * ((0.3 * ((IN.color_0.g * (r6.x + HairTint.rgb)) + 0.5)) + 0.2)) + (r3.w * 0.7);			// partial precision
      l25.x = (r13.z == 0.0 ? LightData[7].w : (r13.y == 0.0 ? LightData[6].w : (r13.x == 0.0 ? LightData[5].w : r6.y)));			// partial precision
      q27.x = 1.0 - sqr(saturate(length(r14.xyz) / l25.x));			// partial precision
      r1.xyz = (max(r7.z, 0) * ((q27.x * l140.xyz) * q62.xyz)) + r1.xyz;			// partial precision
      r4.xyz = (max(dot(r5.xyz, r7.xyz) * q27.x, 0) * l140.xyz) + r4.xyz;			// partial precision
    }

    r7.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
    m141.xyz = mul(TanSpaceProj, r7.xyz);
    r3.xyz = normalize(m141.xyz);			// partial precision
    r9.xyz = r9.xyz + r3.xyz;			// partial precision
    r2.xyz = normalize(r9.xyz);			// partial precision
    r9.x = dot(r8.xyz, r3.xyz);			// partial precision
    r9.y = dot(r8.xyz, r2.xyz);			// partial precision
    r2.y = dot(r0.xyz, r2.xyz);			// partial precision
    r2.x = dot(r0.xyz, r3.xyz);			// partial precision
    r0.xyzw = tex2D(AnisoMap, r9.xy);			// partial precision
    r2.xyzw = tex2D(AnisoMap, r2.xy);			// partial precision

    if (3 != r4.w) {
      r3.w = dot(r5.xyz, r3.xyz);			// partial precision
      l386.x = 1.0 - sqr(saturate(length(r7.xyz) / LightData[7].w));			// partial precision
      q66.xyz = (r0.w * ((0.3 * ((IN.color_0.g * (r6.x + HairTint.rgb)) + 0.5)) + 0.2)) + (r2.w * 0.7);			// partial precision
      r3.xy = (2 * r5.w) + const_17.yz;
      l30.xyz = (r3.y == 0.0 ? LightData[7].xyz : (r3.x == 0.0 ? LightData[6].xyz : r6.y));			// partial precision
      r1.xyz = (max(r3.z, 0) * ((l386.x * l30.xyz) * q66.xyz)) + r1.xyz;			// partial precision
      r4.xyz = (max(r3.w * l386.x, 0) * l30.xyz) + r4.xyz;			// partial precision
    }

    r2.xyzw = tex2D(LayerMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r3.xyz = r1.xyz * IN.color_0.g;			// partial precision
    r1.xyz = lerp(r0.xyz, r2.xyz, r2.w);			// partial precision
    r0.xyz = r4.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r6.z - ToggleADTS.x));			// partial precision
    q68.xyz = (((2 * ((IN.color_0.g * (r6.x + HairTint.rgb)) + 0.5)) * r1.xyz) * r0.xyz) + (r1.w * r3.xyz);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q68.xyz)) + q68.xyz;			// partial precision

    return OUT;
};

// approximately 297 instruction slots used (15 texture, 282 arithmetic)
