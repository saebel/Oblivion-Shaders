//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL007.pso /Fcshaderdump19/SM3LL007.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 EyePosition : register(c1);
sampler2D FaceGenMap0 : register(s4);
sampler2D FaceGenMap1 : register(s5);
float4 LightData[8];
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

    const int4 const_17 = {2, -4, -5, -6};
    const float4 const_2 = {-0.5, 0, 1, 0.5};
    const int4 const_4 = {4, -1, -2, 0};
    const int4 const_7 = {2, -2, -3, -4};
    const int4 const_8 = {2, -6, -7, 0};

    float3 eye153;
    float3 l125;
    float3 l131;
    float3 l138;
    float3 l23;
    float3 l26;
    float1 l331;
    float3 l86;
    float3 m106;
    float3 m112;
    float3 m93;
    float3 m99;
    float1 q1;
    float3 q113;
    float1 q116;
    float1 q12;
    float1 q13;
    float3 q15;
    float3 q159;
    float3 q16;
    float3 q166;
    float3 q174;
    float1 q18;
    float1 q19;
    float1 q2;
    float3 q21;
    float3 q22;
    float3 q27;
    float3 q4;
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
    eye153.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye153.xyz);			// partial precision
    r11.yz = const_2.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r0.w) {
      l86.xyz = mul(TanSpaceProj, LightData[1].xyz);
      r3.xyz = pow(abs(shades(normalize(r5.xyz + l86.xyz), r1.xyz)), ToggleNumLights.z) * LightData[0].xyz;			// partial precision
      q1.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r4.xyz = max((0.5 * ((q1.x * sqr(q1.x)) * LightData[0].xyz)) + dot(r1.xyz, l86.xyz), 0) * LightData[0].xyz;			// partial precision
      r2.w = 1;
    }
    else {
      r4.xyz = 0;			// partial precision
      r3.xyz = 0;			// partial precision
      r2.w = 0;
    }

    q2.x = min(ToggleNumLights.y, 4 - ToggleNumLights.x);			// partial precision
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
      q159.xyz = r0.xyz - IN.texcoord_6.xyz;
      m93.xyz = mul(TanSpaceProj, q159.xyz);
      q8.xyz = normalize(m93.xyz);			// partial precision
      q6.x = 1.0 - sqr(saturate(length(q159.xyz) / r0.w));			// partial precision
      l125.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));			// partial precision
      q9.xyz = q6.x * ((shade(r1.xyz, q8.xyz) * l125.xyz) + ((l125.xyz * (q7.x * sqr(q7.x))) * 0.5));			// partial precision
      r4.xyz = r4.xyz + max(q9.xyz, 0);			// partial precision
      r3.xyz = (q6.x * (l125.xyz * pow(abs(shades(normalize(r5.xyz + q8.xyz), r1.xyz)), ToggleNumLights.z))) + r3.xyz;			// partial precision
    }


    if (1 != r3.w) {
      q13.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q166.xyz = r0.xyz - IN.texcoord_6.xyz;
      m99.xyz = mul(TanSpaceProj, q166.xyz);
      q12.x = 1.0 - sqr(saturate(length(q166.xyz) / r0.w));			// partial precision
      l131.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));			// partial precision
      q16.xyz = l131.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m99.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q15.xyz = (shade(r1.xyz, normalize(m99.xyz)) * l131.xyz) + ((l131.xyz * (q13.x * sqr(q13.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q12.x * q15.xyz, 0);			// partial precision
      r3.xyz = (q12.x * q16.xyz) + r3.xyz;			// partial precision
    }


    if (2 != r3.w) {
      q19.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r9.xyz = (2 * r2.w) + const_17.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q174.xyz = r0.xyz - IN.texcoord_6.xyz;
      m106.xyz = mul(TanSpaceProj, q174.xyz);
      q18.x = 1.0 - sqr(saturate(length(q174.xyz) / r0.w));			// partial precision
      l138.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));			// partial precision
      q22.xyz = l138.xyz * pow(abs(shades(normalize(r5.xyz + normalize(m106.xyz)), r1.xyz)), ToggleNumLights.z);			// partial precision
      q21.xyz = (shade(r1.xyz, normalize(m106.xyz)) * l138.xyz) + ((l138.xyz * (q19.x * sqr(q19.x))) * 0.5);			// partial precision
      r4.xyz = r4.xyz + max(q18.x * q21.xyz, 0);			// partial precision
      r3.xyz = (q18.x * q22.xyz) + r3.xyz;			// partial precision
    }


    if (3 != r3.w) {
      l23.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
      m112.xyz = mul(TanSpaceProj, l23.xyz);
      q113.xyz = normalize(m112.xyz);			// partial precision
      r6.xyz = r5.xyz + q113.xyz;			// partial precision
      l331.x = 1.0 - sqr(saturate(length(l23.xyz) / LightData[7].w));			// partial precision
      q116.x = 1 - shade(r1.xyz, r5.xyz);			// partial precision
      r5.xy = (2 * r2.w) + const_8.yz;
      l26.xyz = (r5.y == 0.0 ? LightData[7].xyz : (r5.x == 0.0 ? LightData[6].xyz : r11.y));			// partial precision
      r4.xyz = r4.xyz + max(l331.x * ((shade(r1.xyz, q113.xyz) * l26.xyz) + ((l26.xyz * (q116.x * sqr(q116.x))) * 0.5)), 0);			// partial precision
      r3.xyz = (l331.x * (l26.xyz * pow(abs(shades(normalize(r6.xyz), r1.xyz)), ToggleNumLights.z))) + r3.xyz;			// partial precision
    }

    r2.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);			// partial precision
    r1.xyz = r0.xyz - 0.5;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r1.xyz = 2 * ((((2 * r1.xyz) + r0.xyz) * (2 * r2.xyz)) * IN.color_0.rgb);			// partial precision
    q27.xyz = (r1.xyz * (r4.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)))) + (r1.w * r3.xyz);			// partial precision
    OUT.color_0.a = r0.w * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q27.xyz)) + q27.xyz;			// partial precision

    return OUT;
};

// approximately 263 instruction slots used (4 texture, 259 arithmetic)
