//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER015.pso /Fcshaderdump19/WATER015.pso.dis
//
//
// Parameters:
//
float4 DeepColor;
sampler2D DetailMap;
float4 EyePos;
float FresnelRI;
sampler2D NormalMap;
float4 ReflectionColor;
sampler2D ReflectionMap;
float2 Scroll;
float4 ShallowColor;
float4 SunColor;
float4 SunDir;
float4 VarAmounts;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   Scroll          const_0       1
//   EyePos          const_1       1
//   SunDir          const_2       1
//   SunColor        const_3       1
//   ShallowColor    const_5       1
//   DeepColor       const_6       1
//   ReflectionColor const_7       1
//   VarAmounts      const_8       1
//   FresnelRI       const_11      1
//   ReflectionMap   texture_0       1
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
//


// Structures:

struct VS_OUTPUT {
    float3 texcoord_0 : TEXCOORD0_centroid;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4_centroid;
    float4 texcoord_5 : TEXCOORD5_centroid;
    float2 texcoord_6 : TEXCOORD6;
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
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float1 eye16;
    float3 eye6;
    float3 noxel2;
    float2 q0;
    float1 q10;
    float3 q11;
    float1 q18;
    float4 q22;
    float1 q26;
    float1 q4;
    float3 r0;
    float4 r1;
    float3 r2;
    float3 r3;
    float3 t12;
    float3 t5;

    eye6.xyz = normalize(EyePos.xyz - IN.texcoord_1.xyz);
    eye16.x = length(EyePos.xy - IN.texcoord_1.xy);
    q4.x = saturate(1 - (eye16.x / 8192));
    q0.xy = IN.texcoord_6.xy + Scroll.xy;
    noxel2.xyz = tex2D(NormalMap, q0.xy);
    r0.xyz = expand(noxel2.xyz);	// [0,1] to [-1,+1]
    r0.xy = sqr(q4.x) * r0.xy;
    r2.xyz = normalize(r0.xyz);
    t12.xyz = tex2D(DetailMap, (0.1 * r2.xy) + q0.xy);
    q18.x = shades(eye6.xyz, r2.xyz);
    q26.x = pow(abs(shades(reflect(-eye6.xyz, r2.xyz), SunDir.xyz)), VarAmounts.x);
    r1.z = IN.texcoord_0.z;
    r1.w = 1;
    r3.xyz = (q18.x * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb;			// partial precision
    q10.x = ((FresnelRI.x + 1) * ((1 - q18.x) * sqr(sqr(1 - q18.x)))) + FresnelRI.x;
    r1.xy = (((saturate(eye16.x * 0.0002) * 2496) + 4) * r2.xy) + IN.texcoord_0.xy;
    q22.xyzw = mul(float4x4(IN.texcoord_2.xyzw, IN.texcoord_3.xyzw, IN.texcoord_4.xyzw, IN.texcoord_5.xyzw), r1.xyzw);
    t5.xyz = tex2Dproj(ReflectionMap, q22.xyzw);			// partial precision
    q11.xyz = lerp(r3.xyz, (VarAmounts.y * (t5.xyz - ReflectionColor.rgb)) + ReflectionColor.rgb, q10.x);
    OUT.color_0.a = max(VarAmounts.z, q10.x);
    OUT.color_0.rgb = lerp((saturate(SunDir.w) * (q26.x * SunColor.rgb)) + q11.xyz, t12.xyz, q4.x * VarAmounts.w);

    return OUT;
};

// approximately 60 instruction slots used (3 texture, 57 arithmetic)
