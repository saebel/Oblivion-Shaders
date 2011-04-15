//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa SLS2049.pso /FcSLS2049.pso.dis
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
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  const_1       1
//   PSLightColor[0]  const_2        1
//   PSLightColor[1]  const_3        1
//   PSLightColor[2]  const_4        1
//   BaseMap       texture_0       1
//   NormalMap     texture_1       1
//   ShadowMap     texture_2       1
//   ShadowMaskMap texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float2 NormalUV : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float4 color_0 : COLOR0;
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

    float1 q0;
    float4 r0;
    float3 r2;
    float4 r3;
    float1 t2;

    t2.x = tex2D(ShadowMaskMap, IN.texcoord_4.zw);			// partial precision
    r2.xyz = tex2D(ShadowMap, IN.texcoord_4.xy);			// partial precision
    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    r3.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r0.x = shades((IN.texcoord_3.xyz * 2) - 1, normalize(expand(r0.xyz)));			// partial precision
    q0.x = dot(PSLightColor[1].rgba, IN.color_0.rgba) + dot(PSLightColor[2].rgba, IN.color_1.rgba);			// partial precision
    r0.xyz = (((t2.x * (r2.x - 1)) + 1) * (r0.x * PSLightColor[0].rgb)) + AmbientColor.rgb;			// partial precision
    OUT.color_0.a = saturate(((q0.x * 2) + r3.w) - 1);			// partial precision
    OUT.color_0.rgb = (r3.xyz * r0.xyz) * IN.texcoord_2.xyz;			// partial precision

    return OUT;
};

// approximately 24 instruction slots used (4 texture, 20 arithmetic)
