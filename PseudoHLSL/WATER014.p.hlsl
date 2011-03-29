//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER014.pso /Fcshaderdump19/WATER014.pso.dis
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
float2 Scroll;
float4 ShallowColor;
float4 VarAmounts;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Scroll       const_0       1
//   EyePos       const_1       1
//   ShallowColor const_5       1
//   DeepColor    const_6       1
//   VarAmounts   const_8       1
//   FogParam     const_9       1
//   FogColor     const_10      1
//   FresnelRI    const_11      1
//   NormalMap    texture_1       1
//   DetailMap    texture_2       1
//



// Structures:

struct VS_OUTPUT {
    float3 texcoord_1 : TEXCOORD1_centroid;
    float2 texcoord_6 : TEXCOORD6;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_2 = {0.1, 0.2, 0, 0};
    const float4 const_3 = {2, -1, 0, -(1.0 / 8192)};

    r0.xy = EyePos.xy - IN.texcoord_1;
    r0.w = dot(r0.xy, r0.xy) + 0;
    r0.w = 1.0 / sqrt(r0.w);
    r0.w = 1.0 / r0.w;
    r1.w = saturate((r0.w * -(1.0 / 8192)) - -1);
    r0.xyzw = tex2D(NormalMap, r1);
    r0.xyz = (2 * r0) + -1;
    r1.xy = IN.texcoord_6 + Scroll.xy;
    r2.w = r1.w * r1.w;
    r0.xy = r2.w * r0.xy;
    r2.xyz = normalize(r0);
    r0.xy = (0.1 * r2.xy) + r1.xy;
    r0.xyzw = tex2D(DetailMap, r0);
    r1.xyz = EyePos.xyz - IN.texcoord_1;
    r3.w = saturate(r2.y + r2.y);
    r3.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r2.w = 1.0 / sqrt(r3.x);
    r0.w = 1.0 / r2.w;
    r0.w = FogParam.x - r0.w;
    r1.xyz = r1.xyz * r2.w;
    r1.x = saturate(dot(r1.xyz, r2.xyz));
    r1.z = -1;
    r3.xyz = DeepColor.rgb;
    r3.xyz = ShallowColor.rgb - r3.xyz;
    r4.w = r1.w * VarAmounts.w;
    r4.xyz = (r3.w * r3.xyz) + DeepColor.rgb;			// partial precision
    r3.w = 1.0 / FogParam.y;
    r0.w = saturate(r0.w * r3.w);
    r0.w = -(r0.w + -1);
    r3.xyz = lerp(r0, r4, r4.w);
    r0.xyz = FogColor.rgb - r3.xyz;
    r0.xyz = (r0.w * r0.xyz) + r3.xyz;
    r0.w = -(r1.x + -1);
    r2.w = r1.w * r0.x;
    r0.x = (r2.w * 0.2) + r0.x;
    r1.w = r0.w * r0.w;
    r1.w = r1.w * r1.w;
    r1.w = r0.w * r1.w;
    r0.w = -(r1.z + FresnelRI.x);
    r1.w = (r0.w * r1.w) + FresnelRI.x;
    r0.w = max(VarAmounts.z, r1.w);
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 45 instruction slots used (2 texture, 43 arithmetic)
