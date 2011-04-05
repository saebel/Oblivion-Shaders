//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2002.pso /Fcshaderdump19/HAIR2002.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AnisoMap;
sampler2D DiffuseMap;
sampler2D HeightMap;
sampler2D LayerMap;
sampler2D NormalMap;
float4 PSHairTint;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   PSHairTint   const_24      1
//   DiffuseMap   texture_0       1
//   NormalMap    texture_1       1
//   HeightMap    texture_2       1
//   AnisoMap     texture_3       1
//   LayerMap     texture_5       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 color_0 : COLOR0;
    float2 color_1 : COLOR1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.04, -0.02, -0.5, 0};
    const float4 const_3 = {1, 0.5, 0.15, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;

    r0.xyzw = tex2D(HeightMap, IN.texcoord_0.xy);
    r1.xy = (IN.texcoord_1 * ((r0.x * 0.04) - 0.02)) + IN.texcoord_0.xy;
    r0.xyzw = tex2D(NormalMap, r1.xy);
    r4.xyz = normalize(2 * (r0.xyz - 0.5));	// [0,1] to [-1,+1]
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r0.w = r0.w * AmbientColor.a;
    r3.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r3.xyz = (IN.color_1.g * (PSHairTint.rgb - 0.5)) + 0.5;
    r0.xyz = r0.xyz * (2 * r3.xyz);
    r1.xyzw = tex2D(LayerMap, r1.xy);
    r5.x = dot(r4.xyz, IN.texcoord_2.xyz);
    r5.y = dot(r4.xyz, IN.texcoord_3.xyz);
    r2.xyzw = tex2D(AnisoMap, r5.xy);
    r4.w = 1 - max(dot(r4.xyz, IN.texcoord_1.xyz), 0);
    r5.w = r4.w * r4.w;
    r2.xyz = saturate((r4.w * r5.w) + saturate((saturate((r4.w * r5.w) + max(r5.x, 0)) * PSLightColor[0]) + IN.color_0.rgb));
    r2.xyz = ((IN.color_0.a * (r2.xyz * PSLightColor[0].rgb)) + AmbientColor.rgb) + IN.color_0.rgb;
    r2.xyz = r2.xyz * (r1.xyz * (2 * r3.xyz));
    r5.xyz = (0.5 * r3.xyz) + 0.15;
    r3.xyz = (IN.color_0.a * (max(IN.texcoord_2.z, 0) * PSLightColor[0].rgb)) + IN.color_0.rgb;
    r0.xyz = lerp(r2.xyz, ((((IN.color_0.a * ((r4.w * r5.w) * PSLightColor[0].rgb)) + r3.xyz) + AmbientColor.rgb) * r0.xyz), r1.w);
    r0.xyz = (((r1.z <= 0.0 ? 1 : 0) * ((r1.x <= 0.0 ? 1 : 0) * (r1.y <= 0.0 ? 1 : 0))) <= 0.0 ? (((r2.w * IN.color_0.a) * (r5.xyz * (r3.w * PSLightColor[0].rgb))) + r0.xyz) : r0.xyz);
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 57 instruction slots used (6 texture, 51 arithmetic)
