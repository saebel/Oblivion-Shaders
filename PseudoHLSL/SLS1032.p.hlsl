//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1032.pso /Fcshaderdump19/SLS1032.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
samplerCUBE EnvironmentCubeMap : register(s3);
sampler2D NormalMap : register(s0);
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   AmbientColor       const_1       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_3       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
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

    r1.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    q0.xyz = expand(r1.xyz);
    r0.z = dot(q0.xyz, IN.texcoord_3.xyz);
    r0.y = dot(q0.xyz, IN.texcoord_2.xyz);
    r0.x = dot(q0.xyz, IN.texcoord_1.xyz);
    r0.xyzw = texCUBE(EnvironmentCubeMap, envreflect(r0.xyz, float3(IN.texcoord_1.w, IN.texcoord_2.w, IN.texcoord_3.w)));
    OUT.color_0.a = 1;
    OUT.color_0.rgb = (r1.w * r0.xyz) * AmbientColor.a;

    return OUT;
};

// approximately 18 instruction slots used (2 texture, 16 arithmetic)