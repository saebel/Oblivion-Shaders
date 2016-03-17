//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL002.pso /Fcshaderdump19/SM3LL002.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c0);
sampler2D BaseMap : register(s0);
float3 HairTint : register(c2);
sampler2D LayerMap : register(s5);
float4 LightData[8] : register(c9);
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

    const float4 const_1 = {-0.5, 0, 1, 4};
    const int4 const_17 = {-1, -2, 0, 2};
    const int4 const_4 = {2, -2, -3, -4};
    const int4 const_7 = {2, -6, -7, 0};
    const int4 const_8 = {2, -4, -5, -6};

    float3 l11;
    float3 l23;
    float3 l5;
    float3 l8;
    float3 l80;
    float3 m49;
    float3 m52;
    float3 m56;
    float3 m59;
    float1 q0;
    float1 q10;
    float3 q13;
    float3 q2;
    float3 q26;
    float3 q3;
    float1 q4;
    float3 q6;
    float1 q7;
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
    l80.xyz = mul(TanSpaceProj, LightData[1].xyz);
    r0.xyz = shade(r4.xyz, l80.xyz) * LightData[0].xyz;
    r2.xyzw = const_1.xyzw;
    q0.x = min(ToggleNumLights.y, r2.w - ToggleNumLights.x);
    r0.w = 1;
    r2.w = (q0.x >= 0.0 ? 0 : (frac(q0.x) <= 0.0 ? 0 : 1)) + (q0.x - frac(q0.x));
    r1.w = (r2.w <= 0.0 ? 0 : 1);
    r0.xyzw = (ToggleNumLights.x <= 0.0 ? r2.y : r0.xyzw);

    if (0 != r1.w
      r3.x = 2 * r0.w;
      r3.yz = r3.x + const_17.xy;
      q2.xyz = r3.x + const_17.zxy;
      r0.w = r0.w + 1;
      r3.xyz = (q2.xyz >= 0.0 ? q2.xyz : -r3.xyz);
      r1.xyzw = (r3.z <= 0.0 ? LightData[3].xyzw : (r3.y <= 0.0 ? LightData[2].xyzw : (r3.x <= 0.0 ? LightData[1].xyzw : r2.y)));
      q3.xyz = r1.xyz - IN.texcoord_6.xyz;
      q4.x = saturate(length(q3.xyz) / r1.w);
      m49.xyz = mul(TanSpaceProj, q3.xyz);
      l5.xyz = (r3.z <= 0.0 ? LightData[2].xyz : (r3.y <= 0.0 ? LightData[1].xyz : (r3.x <= 0.0 ? LightData[0].xyz : r2.y)));
      r0.xyz = (max(dot(r4.xyz, normalize(m49.xyz)) * (1.0 - sqr(q4.x)), 0) * l5.xyz) + r0.xyz;
    }


    if (1 != r2.w
      r3.xyz = (2 * r0.w) + const_4.yzw;
      r1.xyzw = (r3.z == 0.0 ? LightData[5].xyzw : (r3.y == 0.0 ? LightData[4].xyzw : (r3.x == 0.0 ? LightData[3].xyzw : r2.y)));
      q6.xyz = r1.xyz - IN.texcoord_6.xyz;
      q7.x = saturate(length(q6.xyz) / r1.w);
      r1.w = r0.w + 1;
      m52.xyz = mul(TanSpaceProj, q6.xyz);
      l8.xyz = (r3.z == 0.0 ? LightData[4].xyz : (r3.y == 0.0 ? LightData[3].xyz : (r3.x == 0.0 ? LightData[2].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m52.xyz)) * (1.0 - sqr(q7.x)), 0) * l8.xyz) + r0.xyz;
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
      m56.xyz = mul(TanSpaceProj, q9.xyz);
      l23.xyz = (r1.z == 0.0 ? LightData[6].xyz : (r1.y == 0.0 ? LightData[5].xyz : (r1.x == 0.0 ? LightData[4].xyz : r2.y)));
      r3.xyz = (max(dot(r4.xyz, normalize(m56.xyz)) * (1.0 - sqr(q10.x)), 0) * l23.xyz) + r3.xyz;
    }


    if (3 != r2.w
      l11.xyz = LightData[7].xyz - IN.texcoord_6.xyz;
      m59.xyz = mul(TanSpaceProj, l11.xyz);
      r1.xy = (2 * r1.w) + const_7.yz;
      r3.xyz = (max(dot(r4.xyz, normalize(m59.xyz)) * (1.0 - sqr(saturate(length(l11.xyz) / LightData[7].w))), 0) * (r1.y == 0.0 ? LightData[7].xyz : (r1.x == 0.0 ? LightData[6].xyz : r2.y))) + r3.xyz;
    }

    r1.xyzw = tex2D(LayerMap, IN.BaseUV.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    q26.xyz = (2 * ((IN.color_0.g * (r2.x + HairTint.rgb)) + 0.5)) * lerp(r0.xyz, r1.xyz, r1.w);
    q13.xyz = q26.xyz * (r3.xyz + ((ToggleADTS.x * AmbientColor.rgb) + (r2.z - ToggleADTS.x)));
    OUT.color_0.a = r0.w * MatAlpha.x;
    OUT.color_0.rgb = (IN.texcoord_7.w * (IN.texcoord_7.xyz - q13.xyz)) + q13.xyz;

    return OUT;
};

// approximately 157 instruction slots used (3 texture, 154 arithmetic)