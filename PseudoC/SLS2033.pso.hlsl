//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2033.pso /Fcshaderdump19/SLS2033.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//   sampler2D ShadowMaskMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_4       1
//   ShadowMap      texture_5       1
//   ShadowMaskMap  texture_6       1
//

    const float4 const_0 = {-0.5, -1, 1, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D AttenuationMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r2.x = IN.texcoord_6.z;
    r2.y = IN.texcoord_6.w;
    r1.x = IN.texcoord_4.z;
    r1.y = IN.texcoord_4.w;
    r0.x = IN.texcoord_5.z;
    r0.y = IN.texcoord_5.w;
    r6.xyzw = tex2D(ShadowMaskMap, r2.xy);
    r7.xyzw = tex2D(ShadowMap, IN.texcoord_6.xy);
    r3.xyzw = tex2D(AttenuationMap, r1.xy);
    r4.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);
    r5.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r1.xyzw = tex2D(AttenuationMap, r0.xy);
    r2.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r0.xyz = r7.xyz - 1;
    r6.xyz = (r6.x * r0.xyz) + 1;
    r7.xyz = normalize(IN.texcoord_2.xyz);
    r0.xyz = r5.xyz - 0.5;
    r5.xyz = 2 * r0.xyz;
    r0.xyz = normalize(r5.xyz);
    r1.w = 1 - r4.x;
    r4.x = saturate(dot(r0.xyz, r7.xyz));
    r1.w = saturate(r1.w - r3.x);
    r3.xyz = r4.x * PSLightColor[1].rgb;
    r4.xyz = r1.w * r3.xyz;
    r3.x = saturate(dot(r0.xyz, IN.texcoord_1.xyz));
    r3.xyz = r3.x * PSLightColor[0].rgb;
    r3.xyz = (r6.xyz * r3.xyz) + r4.xyz;
    r4.xyz = normalize(IN.texcoord_3.xyz);
    r1.w = 1 - r2.x;
    r0.x = saturate(dot(r0.xyz, r4.xyz));
    r1.w = saturate(r1.w - r1.x);
    r0.xyz = r0.x * PSLightColor[2].rgb;
    r0.xyz = (r1.w * r0.xyz) + r3.xyz;
    r0.xyz = r0.xyz + AmbientColor.rgb;
    OUT.color_0.rgba = r0.xyzw;

// approximately 42 instruction slots used (8 texture, 34 arithmetic)