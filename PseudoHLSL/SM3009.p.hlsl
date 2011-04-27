//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3009.pso /Fcshaderdump19/SM3009.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
sampler2D GlowMap : register(s6);
float4 LightData[20] : register(c9);
float3 MatAlpha : register(c3);
float3 MatEmit : register(c4);
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
//   MatEmit         const_4       1
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

    const float4 const_2 = {-0.5, 0, 1, 10};
    const int4 const_29 = {2, -8, -9, -10};
    const int4 const_30 = {2, -10, -11, -12};
    const int4 const_31 = {2, -16, -17, -18};
    const int4 const_32 = {2, -18, -19, 0};
    const int4 const_33 = {2, -2, -3, -4};
    const int4 const_34 = {2, -4, -5, -6};
    const int4 const_35 = {2, -12, -13, -14};
    const int4 const_36 = {2, -14, -15, -16};
    const int4 const_7 = {-1, -2, 0, 2};
    const int4 const_8 = {2, -6, -7, -8};

    float3 eye282;
    float3 l103;
    float3 l108;
    float3 l113;
    float3 l118;
    float3 l123;
    float3 l128;
    float3 l133;
    float3 l144;
    float3 l31;
    float3 l34;
    float1 l590;
    float3 l93;
    float3 l98;
    float3 m151;
    float3 m157;
    float3 m165;
    float3 m172;
    float3 m179;
    float3 m186;
    float3 m193;
    float3 m200;
    float3 m207;
    float3 m213;
    float1 q1;
    float3 q11;
    float1 q12;
    float3 q14;
    float1 q15;
    float3 q17;
    float1 q18;
    float3 q20;
    float1 q21;
    float3 q23;
    float1 q24;
    float3 q26;
    float1 q27;
    float3 q29;
    float3 q3;
    float1 q30;
    float3 q39;
    float3 q44;
    float3 q49;
    float3 q5;
    float3 q54;
    float3 q59;
    float1 q6;
    float3 q64;
    float3 q69;
    float3 q74;
    float3 q79;
    float3 q8;
    float3 q88;
    float1 q9;
    float4 r0;
    float4 r1;
    float3 r10;
    float4 r2;
    float4 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;
    float3 r8;
    float3 r9;

#define	TanSpaceProj	float3x3(r9.xyz, r8.xyz, r7.xyz)
#define	TanSpaceProj	float3x3(r9.xyz, r8.xyz, r7.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r4.xyz = normalize(expand(r0.xyz));			// partial precision
    r7.xyz = normalize(IN.texcoord_5.xyz);			// partial precision
    r8.xyz = normalize(IN.texcoord_4.xyz);			// partial precision
    r9.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    eye282.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r6.xyz = normalize(eye282.xyz);			// partial precision
    r3.yzw = const_2.yzw;
    r1.w = (ToggleNumLights.x <= 0.0 ? r3.y : r3.z);

    if (0 != r1.w) {
      l144.xyz = mul(TanSpaceProj, LightData[1].xyz);
      r2.xyz = shade(r4.xyz, l144.xyz) * LightData[0].xyz;			// partial precision
      r0.xyz = pow(abs(shades(normalize(r6.xyz + l144.xyz), r4.xyz)), ToggleNumLights.z) * LightData[0].xyz;			// partial precision
      r2.w = 1;
    }
    else {
      r2.yzw = 0;
      r2.xyz = r2.wyz;			// partial precision
      r0.xyz = r2.w;			// partial precision
    }

    q1.x = min(ToggleNumLights.y, r3.w - ToggleNumLights.x);			// partial precision
    r3.x = ((q1.x >= 0.0 ? 0 : 1) * (frac(q1.x) <= 0.0 ? 0 : 1)) + (q1.x - frac(q1.x));
    r1.w = (r3.x <= 0.0 ? 0 : 1);

    if (0 != r1.w) {
      r3.w = r2.w + 1;
      r5.x = 2 * r2.w;
      r5.yz = r5.x + const_7.xy;
      q3.xyz = r5.x + const_7.zxy;
      r10.xyz = (q3.xyz >= 0.0 ? q3.xyz : -r5.xyz);
      r1.xyzw = (r10.z <= 0.0 ? LightData[3].xyzw : (r10.y <= 0.0 ? LightData[2].xyzw : (r10.x <= 0.0 ? LightData[1].xyzw : r3.y)));
      q39.xyz = r1.xyz - IN.texcoord_6.xyz;
      m151.xyz = mul(TanSpaceProj, q39.xyz);
      q6.x = 1.0 - sqr(saturate(length(q39.xyz) / r1.w));			// partial precision
      l93.xyz = (r10.z <= 0.0 ? LightData[2].xyz : (r10.y <= 0.0 ? LightData[1].xyz : (r10.x <= 0.0 ? LightData[0].xyz : r3.y)));			// partial precision
      q5.xyz = l93.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m151.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q6.x * q5.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q6.x * dot(r4.xyz, normalize(m151.xyz)), 0) * l93.xyz) + r2.xyz;			// partial precision
    }
    else {
      r3.w = r2.w;
    }


    if (1 != r3.x) {
      r10.xyz = (2 * r3.w) + const_33.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[5].xyzw : (r10.y == 0.0 ? LightData[4].xyzw : (r10.x == 0.0 ? LightData[3].xyzw : r3.y)));
      q44.xyz = r1.xyz - IN.texcoord_6.xyz;
      m157.xyz = mul(TanSpaceProj, q44.xyz);
      q9.x = 1.0 - sqr(saturate(length(q44.xyz) / r1.w));			// partial precision
      l98.xyz = (r10.z == 0.0 ? LightData[4].xyz : (r10.y == 0.0 ? LightData[3].xyz : (r10.x == 0.0 ? LightData[2].xyz : r3.y)));			// partial precision
      q8.xyz = l98.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m157.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q9.x * q8.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q9.x * dot(r4.xyz, normalize(m157.xyz)), 0) * l98.xyz) + r2.xyz;			// partial precision
    }


    if (2 != r3.x) {
      r10.xyz = (2 * r3.w) + const_34.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[7].xyzw : (r10.y == 0.0 ? LightData[6].xyzw : (r10.x == 0.0 ? LightData[5].xyzw : r3.y)));
      q49.xyz = r1.xyz - IN.texcoord_6.xyz;
      m165.xyz = mul(TanSpaceProj, q49.xyz);
      q12.x = 1.0 - sqr(saturate(length(q49.xyz) / r1.w));			// partial precision
      l103.xyz = (r10.z == 0.0 ? LightData[6].xyz : (r10.y == 0.0 ? LightData[5].xyz : (r10.x == 0.0 ? LightData[4].xyz : r3.y)));			// partial precision
      q11.xyz = l103.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m165.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q12.x * q11.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q12.x * dot(r4.xyz, normalize(m165.xyz)), 0) * l103.xyz) + r2.xyz;			// partial precision
    }


    if (3 != r3.x) {
      r10.xyz = (2 * r3.w) + const_8.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[9].xyzw : (r10.y == 0.0 ? LightData[8].xyzw : (r10.x == 0.0 ? LightData[7].xyzw : r3.y)));
      q54.xyz = r1.xyz - IN.texcoord_6.xyz;
      m172.xyz = mul(TanSpaceProj, q54.xyz);
      q15.x = 1.0 - sqr(saturate(length(q54.xyz) / r1.w));			// partial precision
      l108.xyz = (r10.z == 0.0 ? LightData[8].xyz : (r10.y == 0.0 ? LightData[7].xyz : (r10.x == 0.0 ? LightData[6].xyz : r3.y)));			// partial precision
      q14.xyz = l108.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m172.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q15.x * q14.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q15.x * dot(r4.xyz, normalize(m172.xyz)), 0) * l108.xyz) + r2.xyz;			// partial precision
    }


    if (4 != r3.x) {
      r10.xyz = (2 * r3.w) + const_29.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[11].xyzw : (r10.y == 0.0 ? LightData[10].xyzw : (r10.x == 0.0 ? LightData[9].xyzw : r3.y)));
      q59.xyz = r1.xyz - IN.texcoord_6.xyz;
      m179.xyz = mul(TanSpaceProj, q59.xyz);
      q18.x = 1.0 - sqr(saturate(length(q59.xyz) / r1.w));			// partial precision
      l113.xyz = (r10.z == 0.0 ? LightData[10].xyz : (r10.y == 0.0 ? LightData[9].xyz : (r10.x == 0.0 ? LightData[8].xyz : r3.y)));			// partial precision
      q17.xyz = l113.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m179.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q18.x * q17.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q18.x * dot(r4.xyz, normalize(m179.xyz)), 0) * l113.xyz) + r2.xyz;			// partial precision
    }


    if (5 != r3.x) {
      r10.xyz = (2 * r3.w) + const_30.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[13].xyzw : (r10.y == 0.0 ? LightData[12].xyzw : (r10.x == 0.0 ? LightData[11].xyzw : r3.y)));
      q64.xyz = r1.xyz - IN.texcoord_6.xyz;
      m186.xyz = mul(TanSpaceProj, q64.xyz);
      q21.x = 1.0 - sqr(saturate(length(q64.xyz) / r1.w));			// partial precision
      l118.xyz = (r10.z == 0.0 ? LightData[12].xyz : (r10.y == 0.0 ? LightData[11].xyz : (r10.x == 0.0 ? LightData[10].xyz : r3.y)));			// partial precision
      q20.xyz = l118.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m186.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q21.x * q20.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q21.x * dot(r4.xyz, normalize(m186.xyz)), 0) * l118.xyz) + r2.xyz;			// partial precision
    }


    if (6 != r3.x) {
      r10.xyz = (2 * r3.w) + const_35.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[15].xyzw : (r10.y == 0.0 ? LightData[14].xyzw : (r10.x == 0.0 ? LightData[13].xyzw : r3.y)));
      q69.xyz = r1.xyz - IN.texcoord_6.xyz;
      m193.xyz = mul(TanSpaceProj, q69.xyz);
      q24.x = 1.0 - sqr(saturate(length(q69.xyz) / r1.w));			// partial precision
      l123.xyz = (r10.z == 0.0 ? LightData[14].xyz : (r10.y == 0.0 ? LightData[13].xyz : (r10.x == 0.0 ? LightData[12].xyz : r3.y)));			// partial precision
      q23.xyz = l123.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m193.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q24.x * q23.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q24.x * dot(r4.xyz, normalize(m193.xyz)), 0) * l123.xyz) + r2.xyz;			// partial precision
    }


    if (7 != r3.x) {
      r10.xyz = (2 * r3.w) + const_36.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[17].xyzw : (r10.y == 0.0 ? LightData[16].xyzw : (r10.x == 0.0 ? LightData[15].xyzw : r3.y)));
      q74.xyz = r1.xyz - IN.texcoord_6.xyz;
      m200.xyz = mul(TanSpaceProj, q74.xyz);
      q27.x = 1.0 - sqr(saturate(length(q74.xyz) / r1.w));			// partial precision
      l128.xyz = (r10.z == 0.0 ? LightData[16].xyz : (r10.y == 0.0 ? LightData[15].xyz : (r10.x == 0.0 ? LightData[14].xyz : r3.y)));			// partial precision
      q26.xyz = l128.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m200.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q27.x * q26.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q27.x * dot(r4.xyz, normalize(m200.xyz)), 0) * l128.xyz) + r2.xyz;			// partial precision
    }


    if (8 != r3.x) {
      r10.xyz = (2 * r3.w) + const_31.yzw;
      r3.w = r3.w + 1;
      r1.xyzw = (r10.z == 0.0 ? LightData[19].xyzw : (r10.y == 0.0 ? LightData[18].xyzw : (r10.x == 0.0 ? LightData[17].xyzw : r3.y)));
      q79.xyz = r1.xyz - IN.texcoord_6.xyz;
      m207.xyz = mul(TanSpaceProj, q79.xyz);
      q30.x = 1.0 - sqr(saturate(length(q79.xyz) / r1.w));			// partial precision
      l133.xyz = (r10.z == 0.0 ? LightData[18].xyz : (r10.y == 0.0 ? LightData[17].xyz : (r10.x == 0.0 ? LightData[16].xyz : r3.y)));			// partial precision
      q29.xyz = l133.xyz * pow(abs(shades(normalize(r6.xyz + normalize(m207.xyz)), r4.xyz)), ToggleNumLights.z);			// partial precision
      r0.xyz = (q30.x * q29.xyz) + r0.xyz;			// partial precision
      r2.xyz = (max(q30.x * dot(r4.xyz, normalize(m207.xyz)), 0) * l133.xyz) + r2.xyz;			// partial precision
    }


    if (9 != r3.x) {
      l31.xyz = LightData[19].xyz - IN.texcoord_6.xyz;
      m213.xyz = mul(TanSpaceProj, l31.xyz);
      r6.xyz = r6.xyz + normalize(m213.xyz);			// partial precision
      r1.xyz = normalize(r6.xyz);			// partial precision
      l590.x = 1.0 - sqr(saturate(length(l31.xyz) / LightData[19].w));			// partial precision
      r6.xy = (2 * r3.w) + const_32.yz;
      l34.xyz = (r6.y == 0.0 ? LightData[19].xyz : (r6.x == 0.0 ? LightData[18].xyz : r3.y));			// partial precision
      r2.xyz = (max(l590.x * dot(r4.xyz, normalize(m213.xyz)), 0) * l34.xyz) + r2.xyz;			// partial precision
      r0.xyz = (l590.x * (pow(abs(shades(r1.xyz, r4.xyz)), ToggleNumLights.z) * l34.xyz)) + r0.xyz;			// partial precision
    }

    r1.xyzw = tex2D(GlowMap, IN.BaseUV.xy);			// partial precision
    r1.xyz = r2.xyz + ((ToggleADTS.x * ((r1.xyz * MatEmit.rgb) + AmbientColor.rgb)) + (r3.z - ToggleADTS.x));			// partial precision
    r2.xyz = r0.w * r0.xyz;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q88.xyz = ((r0.xyz * IN.color_0.rgb) * r1.xyz) + r2.xyz;			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q88.xyz)) + q88.xyz;			// partial precision

    return OUT;
};

// approximately 437 instruction slots used (3 texture, 434 arithmetic)
