//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS2078.pso /Fcshaderdump19/SLS2078.pso.dis
//
//
// Parameters:
//
float4 PSLightColor[4];
sampler2D ShadowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   ShadowMap    texture_6       1
//


// Structures:

struct VS_OUTPUT {
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

    const float4 const_3 = {1, -1, 0.6, 0};
    const float4 const_4 = {-0.01, 0.01, 0, 0};
    const int4 const_5 = {0, 1, 0, 0};

    float1 q1;
    float3 q11;
    float2 q3;
    float1 q4;
    float1 q5;
    float1 q6;
    float1 q7;
    float1 q8;
    float1 q9;
    float4 r0;
    float3 r1;
    float3 r2;
    float3 r3;
    float3 r4;

    q1.x = saturate(length(IN.texcoord_6.xyz - IN.texcoord_2.xyz) / (IN.texcoord_2.w * 0.5));
    r0.xy = compress(IN.texcoord_1.xy / IN.texcoord_1.w);	// [-1,+1] to [0,1]
    r4.x = saturate(r0.x >= 0.0 ? r0.x : 0);
    r4.y = saturate(1 >= r0.y ? (1 - r0.y) : 0);
    r4.xyz = tex2D(ShadowMap, r4.xy);
    q4.x = 1.0 / ((sqrt(q1.x) <= 0.0 ? 1 : (1 - sqrt(q1.x))) * 15);			// partial precision
    q3.xy = (const_3.xy * r0.xy) + const_5.xy;
    r1.xyz = tex2D(ShadowMap, saturate(q3.xy - (q4.x * const_4.xy)));
    r0.xyz = tex2D(ShadowMap, saturate(q3.xy - (q4.x * 0.01)));
    r2.xyz = tex2D(ShadowMap, saturate(q3.xy + (q4.x * const_4.xy)));
    r3.xyz = tex2D(ShadowMap, saturate(q3.xy + (q4.x * 0.01)));
    r0.w = ((-0.000195312503 - (r4.x - (IN.texcoord_1.z / IN.texcoord_2.w))) >= 0.0 ? 0 : 1);			// partial precision
    q5.x = r0.w + ((-0.000195312503 - (r3.x - (IN.texcoord_1.z / IN.texcoord_2.w))) >= 0.0 ? 0 : 1);			// partial precision
    q6.x = q5.x + ((-0.000195312503 - (r2.x - (IN.texcoord_1.z / IN.texcoord_2.w))) >= 0.0 ? 0 : 1);			// partial precision
    q7.x = q6.x + ((-0.000195312503 - (r1.x - (IN.texcoord_1.z / IN.texcoord_2.w))) >= 0.0 ? 0 : 1);			// partial precision
    q8.x = q7.x + ((-0.000195312503 - (r0.x - (IN.texcoord_1.z / IN.texcoord_2.w))) >= 0.0 ? 0 : 1);			// partial precision
    q9.x = (PSLightColor[0].a * (saturate(q8.x / 4) - 1)) + 1;			// partial precision
    q11.xyz = lerp(1, lerp(1, (((1 - q9.x) * 0.6) * -PSLightColor[0].rgb) + 1, sqr(q1.x)), IN.texcoord_3.w);			// partial precision
    OUT.color_0.a = (q9.x <= 0.0 ? 1 : (1 - q9.x));			// partial precision
    OUT.color_0.rgb = q11.xyz;			// partial precision

    return OUT;
};

// approximately 66 instruction slots used (5 texture, 61 arithmetic)
