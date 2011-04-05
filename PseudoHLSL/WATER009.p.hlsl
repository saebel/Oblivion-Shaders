//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER009.pso /Fcshaderdump19/WATER009.pso.dis
//
//
// Parameters:

float2 BlendRadius;
float4 DeepColor;
sampler2D DetailMap;
sampler2D DisplacementMap;
float4 EyePos;
float4 FogColor;
float4 FogParam;
float FresnelRI;
sampler2D NormalMap;
float4 ReflectionColor;
samplerCUBE ReflectionMap;
float2 Scroll;
float4 ShallowColor;
float4 VarAmounts;


// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   Scroll          const_0       1
//   EyePos          const_1       1
//   ShallowColor    const_5       1
//   DeepColor       const_6       1
//   ReflectionColor const_7       1
//   VarAmounts      const_8       1
//   FogParam        const_9       1
//   FogColor        const_10      1
//   FresnelRI       const_11      1
//   BlendRadius     const_12      1
//   ReflectionMap   texture_0       1
//   NormalMap       texture_1       1
//   DetailMap       texture_2       1
//   DisplacementMap texture_4       1
//



// Structures:

struct VS_OUTPUT {
    float3 texcoord_1 : TEXCOORD1_centroid;
    float2 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_2 = {-0.5, 0.1, 0, 0};
    const float4 const_3 = {2, -1, 0, -(1.0 / 8192)};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;

    r0.xyzw = tex2D(DisplacementMap, IN.texcoord_6.xy);
    r1.xy = EyePos.xy - IN.texcoord_1.xy;
    r0.w = dot(r1.xy, r1.xy) + 0;
    r1.xyz = (2 * r0.xyz) - 1;
    r3.w = saturate((sqrt(r0.w) / -8192) + 1);
    r4.x = IN.texcoord_7.z + Scroll.x;
    r4.y = IN.texcoord_7.w + Scroll.y;
    r0.xyzw = tex2D(NormalMap, r4.xy);
    r0.xyz = (2 * r0.xyz) - 1;
    r0.xy = (r3.w * r3.w) * r0.xy;
    r2.w = length(IN.texcoord_6.xy - 0.5);
    r2.xyz = lerp(r1.xyz, r0.xyz, (-(saturate(max(0.1, (2 * r2.w) / BlendRadius.x)) - 1)) * BlendRadius.y);
    r0.xyz = EyePos.xyz - IN.texcoord_1.xyz;
    r1.w = 1.0 / length(r0.xyz);
    r0.xyz = r0.xyz * r1.w;
    r1.xyz = normalize(r2.xyz);
    r2.x = dot(r0.xyz, r1.xyz);
    r0.w = 2 * r2.x;
    r6.w = saturate(r2.x);
    r2.xy = (0.1 * r1.xy) + r4.xy;
    r5.w = 1.0 / r1.w;
    r1.xyzw = texCUBE(ReflectionMap, (-r0.w * r1.xyz) + r0.xyz);			// partial precision
    r0.xyzw = tex2D(DetailMap, r2.xy);
    r0.w = -(r6.w - 1);
    r1.w = r0.w * r0.w;
    r3.xy = const_3.xy;
    r4.w = r3.w * VarAmounts.w;
    r3.w = ((FresnelRI.x - r3.y) * (r0.w * (r1.w * r1.w))) + FresnelRI.x;
    r0.w = (((r3.x * -r2.w) + BlendRadius.x) >= 0.0 ? 0 : max(VarAmounts.z, r3.w));
    r1.xyz = ((r1.xyz * (ReflectionColor.rgb - r3.y)) * ReflectionColor.rgb) * VarAmounts.y;
    r1.xyz = lerp(r0.xyz, saturate(r3.w * r1) + ((r6.w * (ShallowColor.rgb - DeepColor.rgb)) + DeepColor.rgb)), r4.w);
    r0.xyz = ((1 - saturate((FogParam.x - r5.w) / FogParam.y)) * (FogColor.rgb - r1.xyz)) + r1.xyz;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 68 instruction slots used (4 texture, 64 arithmetic)
