//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS2077.pso /Fcshaderdump19/SLS2077.pso.dis
//
//
// Parameters:
//
sampler2D BaseMap : register(s0);
float4 PSLightColor[4];
sampler2D ShadowMap : register(s6);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   ShadowMap    texture_6       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const int4 const_3 = {1, -1, 0, 0};
    const int4 const_4 = {0, 1, 0, 0};

    float1 q1;
    float2 q3;
    float1 q5;
    float1 q6;
    float3 q7;
    float4 r0;
    float3 r1;
    float4 r2;

    q1.x = saturate(length(IN.texcoord_6.xyz - IN.texcoord_2.xyz) / (IN.texcoord_2.w * 0.5));
    r0.xy = compress(IN.texcoord_1.xy / IN.texcoord_1.w);	// [-1,+1] to [0,1]
    r1.x = saturate(r0.x >= 0.0 ? r0.x : 0);
    r1.y = saturate(1 >= r0.y ? (1 - r0.y) : 0);
    r2.xyz = tex2D(ShadowMap, r1.xy);
    q3.xy = saturate((0.01 / ((sqrt(q1.x) <= 0.0 ? 1 : (1 - sqrt(q1.x))) * 15)) + ((const_3.xy * r0.xy) + const_4.xy));
    r1.xyz = tex2D(ShadowMap, q3.xy);
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    r2.w = ((-0.000195312503 - (r1.x - (IN.texcoord_1.z / IN.texcoord_2.w))) >= 0.0 ? 0 : 1);			// partial precision
    q5.x = saturate(((-0.000195312503 - (r2.x - (IN.texcoord_1.z / IN.texcoord_2.w))) >= 0.0 ? 0 : 1) + r2.w);			// partial precision
    q6.x = 1 - ((PSLightColor[0].a * (q5.x - 1)) + 1);			// partial precision
    q7.xyz = lerp(lerp(((q6.x * 0.6) * -PSLightColor[0].rgb) + 1, 1, sqr(q1.x)), 1, IN.texcoord_3.w);			// partial precision
    OUT.color_0.a = min(min(r0.w, 1), q6.x);			// partial precision
    OUT.color_0.rgb = q7.xyz;			// partial precision

    return OUT;
};

// approximately 49 instruction slots used (3 texture, 46 arithmetic)
