//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3035.pso /Fcshaderdump19/SM3035.pso.dis
//
//
// Parameters:
//
float4 FillColor;
sampler2D NormalMap;
float4 RimColor;
sampler2D SourceTexture;
float4 fVars;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   FillColor     const_0       1
//   RimColor      const_1       1
//   fVars         const_2       1
//   NormalMap     texture_0       1
//   SourceTexture texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 NormalUV : TEXCOORD0;
    float2 SourceUV : TEXCOORD1;
    float3 texcoord_3 : TEXCOORD3_centroid;
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
    float4 r0;

    r0.xyzw = tex2D(NormalMap, IN.NormalUV.xy);
    q0.xyz = expand(r0.xyz);	// [0,1] to [-1,+1]
    r0.xyzw = tex2D(SourceTexture, IN.SourceUV.xy);
    r0.w = r0.w * FillColor.a;
    r0.xyz = (r0.xyz + FillColor.rgb) * r0.w;
    r0.xyzw = (pow(abs(1 - shade(q0.xyz, IN.texcoord_3.xyz)), fVars.x) * RimColor.rgba) + r0.xyzw;
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = (IN.color_1.a * (IN.color_1.rgb - r0.xyz)) + r0.xyz;

    return OUT;
};

// approximately 17 instruction slots used (2 texture, 15 arithmetic)
