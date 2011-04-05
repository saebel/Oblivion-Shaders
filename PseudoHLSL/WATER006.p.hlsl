//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER006.pso /Fcshaderdump19/WATER006.pso.dis
//
//
// Parameters:

float4 DeepColor;
sampler2D DetailMap;
float4 EyePos;
float4 FogColor;
float4 FogParam;
float FresnelRI;
sampler2D NormalMap;
float4 ReflectionColor;
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
//   FogParam        const_9       1
//   FogColor        const_10      1
//   FresnelRI       const_11      1
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
//



// Structures:

struct VS_OUTPUT {
    float3 texcoord_1 : TEXCOORD1_centroid;
    float2 texcoord_6 : TEXCOORD6;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_4 = {0.1, (1.0 / 1600), 0.75, 0};
    const float4 const_12 = {2, -1, 0, -(1.0 / 8192)};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;

    r4.xy = IN.texcoord_6.xy + Scroll.xy;
    r0.xyzw = tex2D(NormalMap, r4.xy);
    r2.w = saturate(1 - (length(EyePos.xy - IN.texcoord_1.xy) / 8192));
    r2.xyz = (2 * r0.xyz) - 1;
    r2.xy = (r2.w * r2.w) * r2.xy;
    r0.xyz = normalize(r2.xyz);
    r1.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    r1.w = 1.0 / length(r1.xyz);
    r2.xyz = r1.xyz * r1.w;
    r3.w = 1 - saturate(dot(r2.xyz, r0.xyz));
    r3.xyz = (saturate(dot(r2.xyz, -r0.xyz)) * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb;			// partial precision
    r4.w = r3.w * r3.w;
    r1.xyz = ((((1 - FresnelRI.x) * (r3.w * (r4.w * r4.w))) + FresnelRI.x) * ((((1 - VarAmounts.y) * (ReflectionColor.rgb - r3.xyz)) + r3.xyz) * VarAmounts.y)) + r3.xyz;
    r3.xy = (0.1 * r0.xy) + r4.xy;
    r0.xyz = pow(abs(saturate(dot((-(2 * dot(-r2.xyz, r0.xyz)) * r0.xyz) - r2.xyz, SunDir.xyz))), VarAmounts.x) * SunColor.rgb;
    r2.xyz = saturate(saturate(SunDir.w) * r0) + r1.xyz);
    r0.xyzw = tex2D(DetailMap, r3.xy);
    r0.w = saturate((((1.0 / r1.w) - 1) / 1600) + 0.75);
    r1.xyz = lerp(r0.xyz, r2.xyz, r2.w * VarAmounts.w);
    r0.xyz = ((1 - saturate((FogParam.x - (1.0 / r1.w)) / FogParam.y)) * (FogColor.rgb - r1.xyz)) + r1.xyz;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 59 instruction slots used (2 texture, 57 arithmetic)
