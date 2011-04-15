//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL006.pso /Fcshaderdump19/SM3LL006.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D BaseMap;
float3 EyePosition;
sampler2D FaceGenMap0;
sampler2D FaceGenMap1;
float4 LightData[8];
float3 MatAlpha;
sampler2D NormalMap;
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
//   BaseMap         texture_0       1
//   NormalMap       texture_1       1
//   FaceGenMap0     texture_4       1
//   FaceGenMap1     texture_5       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 color_0 : COLOR0;
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

    const int4 const_17 = {2, -2, -3, -4};
    const float4 const_2 = {-0.5, 0, 1, 0.5};
    const int4 const_4 = {4, -1, -2, 0};
    const int4 const_7 = {2, -4, -5, -6};
    const int4 const_8 = {2, -6, -7, 0};

    float3 eye139;
    float3 l13;
    float3 l18;
    float3 l20;
    float3 l282;
    float3 l48;
    float3 l8;
    float3 l80;
    float3 m100;
    float3 m104;
    float3 m88;
    float3 m94;
    float1 q1;
    float1 q10;
    float3 q11;
    float3 q14;
    float1 q15;
    float3 q16;
    float3 q19;
    float1 q2;
    float1 q22;
    float3 q25;
    float1 q4;
    float3 q5;
    float3 q6;
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

#define	TanSpaceProj	float3x3(r4.xyz, r7.xyz, r6.xyz)
#define	TanSpaceProj	float3x3(r4.xyz, r7.xyz, r6.xyz)

    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);
    r1.xyz = normalize(expand(r0.xyz));
    r6.xyz = normalize(IN.texcoord_5.xyz);
    r7.xyz = normalize(IN.texcoord_4.xyz);
    r4.xyz = normalize(IN.texcoord_3.xyz);
    eye139.xyz = mul(TanSpaceProj, EyePosition.xyz - IN.texcoord_6.xyz);
    r5.xyz = normalize(eye139.xyz);
    r11.yz = const_2.yz;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.y : r11.z);

    if (0 != r0.w
      l80.xyz = mul(TanSpaceProj, LightData[1].xyz);
      q1.x = 1 - shade(r1.xyz, r5.xyz);
      r2.xyz = max((0.5 * ((q1.x * sqr(q1.x)) * LightData[0].xyz)) + dot(r1.xyz, l80.xyz), 0) * LightData[0].xyz;
      r2.w = 1;
    }
    else {
      r2.xyz = 0;
      r2.w = 0;
    }

    q2.x = min(ToggleNumLights.y, 4 - ToggleNumLights.x);
    r1.w = ((q2.x >= 0.0 ? 0 : 1) * (frac(q2.x) <= 0.0 ? 0 : 1)) + (q2.x - frac(q2.x));
    r0.w = (r1.w <= 0.0 ? 0 : 1);

    if (0 != r0.w
      r3.x = 2 * r2.w;
      r3.yz = r3.x + const_4.yz;
      q5.xyz = r3.x + const_4.wyz;
      r2.w = r2.w + 1;
      q4.x = 1 - shade(r1.xyz, r5.xyz);
      r9.xyz = (q5.xyz >= 0.0 ? q5.xyz : -r3.xyz);
      r0.xyzw = (r9.z <= 0.0 ? LightData[3].xyzw : (r9.y <= 0.0 ? LightData[2].xyzw : (r9.x <= 0.0 ? LightData[1].xyzw : r11.y)));
      q6.xyz = r0.xyz - IN.texcoord_6.xyz;
      m88.xyz = mul(TanSpaceProj, q6.xyz);
      l8.xyz = (r9.z <= 0.0 ? LightData[2].xyz : (r9.y <= 0.0 ? LightData[1].xyz : (r9.x <= 0.0 ? LightData[0].xyz : r11.y)));
      q9.xyz = (shade(r1.xyz, normalize(m88.xyz)) * l8.xyz) + (((q4.x * sqr(q4.x)) * l8.xyz) * 0.5);
      r2.xyz = r2.xyz + max(q9.xyz * (1.0 - sqr(saturate(length(q6.xyz) / r0.w))), 0);
    }


    if (1 != r1.w
      q10.x = 1 - shade(r1.xyz, r5.xyz);
      r9.xyz = (2 * r2.w) + const_17.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[5].xyzw : (r9.y == 0.0 ? LightData[4].xyzw : (r9.x == 0.0 ? LightData[3].xyzw : r11.y)));
      q11.xyz = r0.xyz - IN.texcoord_6.xyz;
      m94.xyz = mul(TanSpaceProj, q11.xyz);
      l13.xyz = (r9.z == 0.0 ? LightData[4].xyz : (r9.y == 0.0 ? LightData[3].xyz : (r9.x == 0.0 ? LightData[2].xyz : r11.y)));
      q14.xyz = (shade(r1.xyz, normalize(m94.xyz)) * l13.xyz) + (((q10.x * sqr(q10.x)) * l13.xyz) * 0.5);
      r2.xyz = r2.xyz + max(q14.xyz * (1.0 - sqr(saturate(length(q11.xyz) / r0.w))), 0);
    }


    if (2 != r1.w
      q15.x = 1 - shade(r1.xyz, r5.xyz);
      r9.xyz = (2 * r2.w) + const_7.yzw;
      r2.w = r2.w + 1;
      r0.xyzw = (r9.z == 0.0 ? LightData[7].xyzw : (r9.y == 0.0 ? LightData[6].xyzw : (r9.x == 0.0 ? LightData[5].xyzw : r11.y)));
      q16.xyz = r0.xyz - IN.texcoord_6.xyz;
      m100.xyz = mul(TanSpaceProj, q16.xyz);
      l18.xyz = (r9.z == 0.0 ? LightData[6].xyz : (r9.y == 0.0 ? LightData[5].xyz : (r9.x == 0.0 ? LightData[4].xyz : r11.y)));
      q19.xyz = (shade(r1.xyz, normalize(m100.xyz)) * l18.xyz) + (((q15.x * sqr(q15.x)) * l18.xyz) * 0.5);
      r2.xyz = r2.xyz + max(q19.xyz * (1.0 - sqr(saturate(length(q16.xyz) / r0.w))), 0);
    }


    if (3 != r1.w
      l20.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
      m104.xyz = mul(TanSpaceProj, l20.xyz);
      r1.w = shade(r1.xyz, normalize(m104.xyz));
      q22.x = 1 - shade(r1.xyz, r5.xyz);
      r1.xy = (2 * r2.w) + const_8.yz;
      l48.xyz = (r1.y == 0.0 ? LightData[7].xyz : (r1.x == 0.0 ? LightData[6].xyz : r11.y));
      l282.xyz = ((r1.w * l48.xyz) + (((q22.x * sqr(q22.x)) * l48.xyz) * 0.5)) * (1.0 - sqr(saturate(length(l20.xyz) / LightData[7].w)));
      r2.xyz = r2.xyz + max(l282.xyz, 0);
    }

    r0.xyzw = tex2D(FaceGenMap0, IN.BaseUV.xy);
    r1.xyz = r0.xyz - 0.5;
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    r0.xyz = (2 * r1.xyz) + r0.xyz;
    r1.xyzw = tex2D(FaceGenMap1, IN.BaseUV.xy);
    r1.xyz = 2 * ((r0.xyz * (2 * r1.xyz)) * IN.color_0.rgb);
    q25.xyz = r1.xyz * (r2.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r11.z - ToggleADTS.x)));
    OUT.color_0.a = r0.w * MatAlpha.x;
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q25.xyz)) + q25.xyz;

    return OUT;
};

// approximately 212 instruction slots used (4 texture, 208 arithmetic)