//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2068.pso /Fcshaderdump19/SLS2068.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   ShadowMap    texture_2       1
//

    const float4 const_0 = {-0.5, 20, 0.5, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    r1.xyzw = tex2D(NormalMap, IN.texcoord_1.xy);
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r1.xyz = r1.xyz - 0.5;
    r2.xyz = 2 * r1.xyz;
    r1.xyz = normalize(r2.xyz);
    r2.x = saturate(dot(r1.xyz, IN.texcoord_3.xyz));
    r1.xyz = PSLightColor[0].rgb;
    r1.xyz = (r2.x * r1.xyz) + AmbientColor.rgb;
    r0.xyz = r0.xyz * IN.texcoord_2.xyz;
    r1.xyz = r1.xyz * r0.xyz;
    r0.xy = IN.texcoord_0.xy * 20;
    r0.xyzw = tex2D(ShadowMap, r0.xy);
    r0.w = (r0.x * 0.5) + 0.5;
    r0.xyz = r1.xyz * r0.w;
    r0.w = IN.texcoord_2.w;
    OUT.color_0.rgba = r0.xyzw;

// approximately 18 instruction slots used (3 texture, 15 arithmetic)