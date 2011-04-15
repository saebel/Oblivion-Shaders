//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2004.pso /Fcshaderdump19/SLS2004.pso.dis
//
//
// Parameters:
//
float4 AmbientColor;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
sampler2D ShadowMaskMap;
float4 Toggles;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  const_1       1
//   PSLightColor[0]  const_2        1
//   Toggles       const_7       1
//   BaseMap       texture_0       1
//   NormalMap     texture_1       1
//   ShadowMap     texture_6       1
//   ShadowMaskMap texture_7       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float4 texcoord_7 : TEXCOORD7;
    float4 color_1 : COLOR1;
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

    float3 q2;
    float3 q3;
    float3 q4;
    float4 r0;
    float3 r1;
    float3 r4;
    float3 t0;
    float1 t1;

    t1.x = tex2D(ShadowMaskMap, IN.texcoord_7.zw);
    t0.xyz = tex2D(ShadowMap, IN.texcoord_7.xy);
    r1.xyz = tex2D(ShadowMap, IN.BaseUV.xy * 20);
    r0.xyzw = tex2D(NormalMap, IN.BaseUV.xy);
    r4.xyz = shades(normalize(expand(r0.xyz)), IN.texcoord_1.xyz) * PSLightColor[0].rgb;
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);
    q2.xyz = r0.xyz * max((((t1.x * (t0.xyz - 1)) + 1) * r4.xyz) + AmbientColor.rgb, 0);
    q3.xyz = q2.xyz * compress(r1.x);
    q4.xyz = (Toggles.y <= 0.0 ? q3.xyz : ((IN.color_1.a * (IN.color_1.rgb - (compress(r1.x) * q2.xyz))) + q3.xyz));
    OUT.color_0.a = r0.w * AmbientColor.a;
    OUT.color_0.rgb = q4.xyz;

    return OUT;
};

// approximately 27 instruction slots used (5 texture, 22 arithmetic)