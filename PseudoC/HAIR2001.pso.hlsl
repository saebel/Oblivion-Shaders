//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2001.pso /Fcshaderdump19/HAIR2001.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AnisoMap;
//   sampler2D DiffuseMap;
//   sampler2D HeightMap;
//   sampler2D LayerMap;
//   sampler2D NormalMap;
//   float4 PSHairTint;
//   float4 PSLightColor[4];
//
//
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

    const float4 const_0 = {0.04, -0.02, -0.5, 0};
    const float4 const_3 = {1, 0.5, 0.15, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 IN.color_0 : COLOR0;
    float2 IN.color_1 : COLOR1;
    sampler2D DiffuseMap;
    sampler2D NormalMap;
    sampler2D HeightMap;
    sampler2D AnisoMap;
    sampler2D LayerMap;
    r0.xyzw = tex2D(HeightMap, IN.texcoord_0.xy);
    r0.w = (r0.x * 0.04) - 0.02;
    r0.xy = IN.texcoord_0.xy;
    r1.xy = (IN.texcoord_1 * r0.w) + r0.xy;
    r0.xyzw = tex2D(NormalMap, r1.xy);
    r0.xyz = r0.xyz - 0.5;
    r0.xyz = 2 * r0.xyz;
    r4.xyz = normalize(r0.xyz);
    r5.x = dot(r4.xyz, IN.texcoord_2.xyz);
    r5.y = dot(r4.xyz, IN.texcoord_3.xyz);
    r1.xyzw = tex2D(LayerMap, r1.xy);
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r2.xyzw = tex2D(AnisoMap, r5.xy);
    r3.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r6.w = max(r5.x, 0);
    r2.x = dot(r4.xyz, IN.texcoord_1.xyz);
    r4.w = max(r2.x, 0);
    r4.w = 1 - r4.w;
    r5.w = r4.w * r4.w;
    r6.w = saturate((r4.w * r5.w) + r6.w);
    r2.xyz = saturate((r6.w * PSLightColor[0])) + IN.color_0.rgb);
    r2.xyz = saturate((r4.w * r5.w)) + r2.xyz);
    r2.xyz = r2.xyz * PSLightColor[0].rgb;
    r2.xyz = (IN.color_0.a * r2.xyz) + AmbientColor.rgb;
    r2.xyz = r2.xyz + IN.color_0.rgb;
    r3.y = -0.5;
    r3.xyz = r3.y + PSHairTint.rgb;
    r3.xyz = (IN.color_1.g * r3.xyz) - -0.5;
    r4.xyz = 2 * r3.xyz;
    r5.xyz = (0.5 * r3.xyz) + 0.15;
    r1.xyz = r1.xyz * r4.xyz;
    r4.w = r4.w * r5.w;
    r2.xyz = r2.xyz * r1.xyz;
    r1.xyz = r4.w * PSLightColor[0].rgb;
    r4.w = max(IN.texcoord_2.z, 0);
    r3.xyz = r4.w * PSLightColor[0].rgb;
    r3.xyz = (IN.color_0.a * r3.xyz) + IN.color_0.rgb;
    r3.xyz = (IN.color_0.a * r1.xyz) + r3.xyz;
    r1.xyz = r3.w * PSLightColor[0].rgb;
    r3.w = r2.w * IN.color_0.a;
    r1.xyz = r5.xyz * r1.xyz;
    r3.xyz = r3.xyz + AmbientColor.rgb;
    r4.w = (r1.x <= 0.0 ? 1 : 0);
    r0.xyz = r0.xyz * r4.xyz;
    r5.w = (r1.y <= 0.0 ? 1 : 0);
    r3.xyz = r3.xyz * r0.xyz;
    r2.w = (r1.z <= 0.0 ? 1 : 0);
    r0.xyz = lerp(r2.xyz, r3.xyz, r1.w);
    r1.w = r4.w * r5.w;
    r1.xyz = (r3.w * r1.xyz) + r0.xyz;
    r1.w = r2.w * r1.w;
    r0.w = r0.w * AmbientColor.a;
    r0.xyz = (r1.w <= 0.0 ? r1.xyz : r0.xyz);
    OUT.color_0.rgba = r0.xyzw;

// approximately 57 instruction slots used (6 texture, 51 arithmetic)
