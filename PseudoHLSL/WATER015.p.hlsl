//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER015.pso /Fcshaderdump19/WATER015.pso.dis
//
//
// Parameters:

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

    const float4 const_4 = {0.1, 0.0002, 2496, 4};
    const float4 const_9 = {2, -1, 0, -(1.0 / 8192)};

    float4 r0;
    float4 r1;
    float4 r2;
    float2 r3;
    float3 r4;
    float1 r6;

    r3.xy = IN.texcoord_6.xy + Scroll.xy;
    r0.xyzw = tex2D(NormalMap, r3.xy);
    r1.w = length(EyePos.xy - IN.texcoord_1.xy);
    r0.w = (saturate(r1.w * 0.0002) * 2496) + 4;
    r0.xyz = (2 * r0.xyz) - 1;
    r2.w = saturate((r1.w / -8192) + 1);
    r0.xy = (r2.w * r2.w) * r0.xy;
    r1.w = 1;
    r2.xyz = normalize(r0.xyz);
    r1.xy = (r0.w * r2.xy) + IN.texcoord_0.xy;
    r1.z = IN.texcoord_0.z;
    r0.w = dot(IN.texcoord_5.xyzw, r1.xyzw);
    r0.x = dot(IN.texcoord_2.xyzw, r1.xyzw);
    r0.y = dot(IN.texcoord_3.xyzw, r1.xyzw);
    r0.z = dot(IN.texcoord_4.xyzw, r1.xyzw);
    r0.xyzw = tex2Dproj(ReflectionMap, r0);			// partial precision
    r4.xyz = normalize(EyePos.xyz - IN.texcoord_1.xyz);
    r6.x = saturate(dot(r4.xyz, r2.xyz));
    r0.w = 1 - r6.x;
    r1.xyzw = tex2D(DetailMap, (0.1 * r2.xy) + r3.xy);
    r1.w = r0.w * r0.w;
    r1.w = r0.w * (r1.w * r1.w);
    r0.w = max(VarAmounts.z, r1.w);
    r0.xyz = lerp(r1.xyz, ((saturate(SunDir.w) * (pow(abs(saturate(dot((-(2 * dot(-r4.xyz, r2.xyz)) * r2.xyz) - r4.xyz, SunDir.xyz))), VarAmounts.x) * SunColor.rgb)) + lerp((VarAmounts.y * (r0.xyz - ReflectionColor.rgb)) + ReflectionColor.rgb, ((r6.x * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb), ((1 - FresnelRI.x) * (((1 - FresnelRI.x) * r1.w) + FresnelRI.x)) + FresnelRI.x)), r2.w * VarAmounts.w);
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 60 instruction slots used (3 texture, 57 arithmetic)
