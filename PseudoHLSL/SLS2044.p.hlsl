//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2044.pso /Fcshaderdump19/SLS2044.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
samplerCUBE EnvironmentCubeMap : register(s1);
sampler2D NormalMap : register(s0);
float4 Toggles : register(c7);
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   AmbientColor       const_1       1
//   Toggles            const_7       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;			// partial precision
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 color_0 : COLOR0;
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

    float3 q0;
    float4 r0;
    float4 r1;
    float3 r2;

    r1.xyzw = tex2D(NormalMap, IN.NormalUV.xy);			// partial precision
    r2.xyz = normalize(float3(IN.texcoord_1.w, IN.texcoord_2.w, IN.texcoord_3.w));			// partial precision
    r1.xyz = expand(r1.xyz);			// partial precision	// [0,1] to [-1,+1]
    r0.xyz = normalize(r1.xyz);			// partial precision
    r1.z = dot(r0.xyz, IN.texcoord_3.xyz);			// partial precision
    r1.y = dot(r0.xyz, IN.texcoord_2.xyz);			// partial precision
    r1.x = dot(r0.xyz, IN.texcoord_1.xyz);			// partial precision
    r0.xyzw = texCUBE(EnvironmentCubeMap, envreflect(normalize(r1.xyz), r2.xyz));			// partial precision
    q0.xyz = (r1.w * r0.xyz) * AmbientColor.a;			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = (Toggles.x <= 0.0 ? q0.xyz : (q0.xyz * IN.color_0.rgb));			// partial precision

    return OUT;
};

// approximately 30 instruction slots used (2 texture, 28 arithmetic)
