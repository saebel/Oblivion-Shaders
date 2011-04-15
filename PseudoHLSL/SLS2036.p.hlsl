//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2036.pso /Fcshaderdump19/SLS2036.pso.dis
//
//
// Parameters:
//
sampler2D AttenuationMap;
sampler2D NormalMap;
float4 PSLightColor[4];
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   NormalMap      texture_0       1
//   AttenuationMap texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
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

    float1 att1;
    float1 att2;
    float1 att3;
    float1 att4;
    float1 att6;
    float1 att7;
    float3 q0;
    float3 q10;
    float3 q5;
    float3 r0;
    float3 r2;
    float4 r6;

    r6.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    att6.x = tex2D(AttenuationMap, IN.texcoord_6.xy);			// partial precision
    att3.x = tex2D(AttenuationMap, IN.texcoord_6.zw);			// partial precision
    att4.x = tex2D(AttenuationMap, IN.texcoord_5.zw);			// partial precision
    att1.x = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    att7.x = tex2D(AttenuationMap, IN.texcoord_4.zw);			// partial precision
    att2.x = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    q0.xyz = normalize(expand(r6.xyz));			// partial precision
    r0.xyz = shades(q0.xyz, normalize(IN.texcoord_3.xyz)) * PSLightColor[2].rgb;			// partial precision
    r2.xyz = shades(q0.xyz, normalize(IN.texcoord_1.xyz)) * PSLightColor[0].rgb;			// partial precision
    q5.xyz = saturate((1 - att1.x) - att4.x) * (shades(q0.xyz, normalize(IN.texcoord_2.xyz)) * PSLightColor[1].rgb);			// partial precision
    q10.xyz = (saturate((1 - att6.x) - att3.x) * r0.xyz) + ((saturate((1 - att2.x) - att7.x) * r2.xyz) + q5.xyz);			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = q10.xyz;			// partial precision

    return OUT;
};

// approximately 44 instruction slots used (7 texture, 37 arithmetic)
