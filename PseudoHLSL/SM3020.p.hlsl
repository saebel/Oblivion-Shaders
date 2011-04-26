//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3020.pso /Fcshaderdump19/SM3020.pso.dis
//
//
// Parameters:
//
samplerCUBE EnvironmentCubeMap : register(s1);
float4 MatAlpha : register(c3);
sampler2D NormalMap : register(s0);
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   MatAlpha           const_3       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;			// partial precision
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 color_0 : COLOR0;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	envreflect(i, n)	((2 * dot(i, n)) * (i)) - ((n) * dot(i, i))

    const float4 const_0 = {-0.5, 0.5, 1, 0};

    float3 q1;
    float4 r0;
    float4 r1;
    float3 r2;

    r1.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    q1.xyz = normalize(normalize(expand(r1.xyz)) * const_0.yyz);			// partial precision
    r2.xyz = float3(IN.texcoord_1.w, IN.texcoord_2.w, IN.texcoord_3.w);
    r1.z = dot(q1.xyz, normalize(IN.texcoord_3.xyz));			// partial precision
    r1.y = dot(q1.xyz, normalize(IN.texcoord_2.xyz));			// partial precision
    r1.x = dot(q1.xyz, normalize(IN.texcoord_1.xyz));			// partial precision
    r0.xyzw = texCUBE(EnvironmentCubeMap, envreflect(normalize(r1.xyz), normalize(r2.xyz)));			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = ((r1.w * r0.xyz) * MatAlpha.x) * IN.color_0.rgb;			// partial precision

    return OUT;
};

// approximately 41 instruction slots used (2 texture, 39 arithmetic)
