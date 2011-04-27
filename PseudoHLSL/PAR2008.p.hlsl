//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2008.pso /Fcshaderdump19/PAR2008.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);
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
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float3 color_0 : COLOR0;
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
#define	uvtile(w)		(((w) * 0.04) - 0.02)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float3 q10;
    float1 q2;
    float3 q3;
    float1 q7;
    float4 r0;
    float4 r1;
    float2 uv0;

    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    uv0.xy = (uvtile(r0.w) * (IN.texcoord_6.xy / length(IN.texcoord_6.xyz))) + IN.BaseUV.xy;
    r1.xyzw = tex2D(NormalMap, uv0.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, uv0.xy);			// partial precision
    q7.x = r1.w * pow(abs(shades(normalize(expand(r1.xyz)), normalize(IN.texcoord_3.xyz))), Toggles.z);			// partial precision
    q2.x = dot(normalize(expand(r1.xyz)), IN.texcoord_1.xyz);			// partial precision
    q3.xyz = saturate((0.2 >= q2.x ? (q7.x * max(q2.x + 0.5, 0)) : q7.x) * PSLightColor[0].rgb);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r0.xyz : (r0.xyz * IN.color_0.rgb));			// partial precision
    q10.xyz = (r1.xyz * max((saturate(q2.x) * PSLightColor[0].rgb) + AmbientColor.rgb, 0)) + q3.xyz;			// partial precision
    OUT.color_0.a = AmbientColor.a;			// partial precision
    OUT.color_0.rgb = (Toggles.y <= 0.0 ? q10.xyz : lerp(q10.xyz, IN.color_1.rgb, IN.color_1.a));			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (3 texture, 37 arithmetic)
