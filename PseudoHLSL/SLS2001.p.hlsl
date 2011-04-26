//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2001.pso /Fcshaderdump19/SLS2001.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4];
sampler2D ShadowMap : register(s6);
float4 Toggles : register(c7);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   Toggles      const_7       1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   ShadowMap    texture_6       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float texcoord_7 : TEXCOORD7_centroid;			// partial precision
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

    float3 q0;
    float3 q1;
    float3 q2;
    float3 q3;
    float4 r0;
    float3 r1;
    float4 r2;

    r0.xyzw = 0.1 - IN.texcoord_7.x;
    clip(r0.xyzw);
    r1.xyz = tex2D(ShadowMap, IN.BaseUV.xy * 20);
    r2.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q0.xyz = (shades(normalize(expand(r2.xyz)), IN.texcoord_1.xyz) * PSLightColor[0].rgb) + AmbientColor.rgb;			// partial precision
    q1.xyz = r0.xyz * max(q0.xyz, 0);			// partial precision
    q2.xyz = q1.xyz * compress(r1.x);			// partial precision
    q3.xyz = (Toggles.y <= 0.0 ? q2.xyz : ((IN.color_1.a * (IN.color_1.rgb - (compress(r1.x) * q1.xyz))) + q2.xyz));			// partial precision
    OUT.color_0.a = r0.w * AmbientColor.a;			// partial precision
    OUT.color_0.rgb = q3.xyz;			// partial precision

    return OUT;
};

// approximately 24 instruction slots used (4 texture, 20 arithmetic)
