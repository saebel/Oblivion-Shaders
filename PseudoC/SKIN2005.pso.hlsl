//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2005.pso /Fcshaderdump19/SKIN2005.pso.dis
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
    float4 texcoord_4 : TEXCOORD4;
    float3 texcoord_7 : TEXCOORD7_centroid;
    float4 texcoord_6 : TEXCOORD6;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D AttenuationMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r1.x = IN.texcoord_4.z;
    r1.y = IN.texcoord_4.w;
    r0.x = IN.texcoord_6.z;
    r0.y = IN.texcoord_6.w;
    r3 = tex2D(AttenuationMap, r1);			// partial precision
    r4 = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r5 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r1 = tex2D(ShadowMaskMap, r0);			// partial precision
    r2 = tex2D(ShadowMap, IN.texcoord_6);			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.xyz = normalize(IN.texcoord_7);			// partial precision
    r5.xyz = r5 + -0.5;
    r5.xyz = r5 + r5;			// partial precision
    r6.xyz = normalize(r5);			// partial precision
    r0.x = dot(r6, r0);			// partial precision
    r1.w = max(r0.x, 0);			// partial precision
    r1.w = 1 - r1.w;			// partial precision
    r2.w = r1.w * r1.w;			// partial precision
    r1.w = r1.w * r2.w;			// partial precision
    r5.xyz = r1.w * PSLightColor[1];			// partial precision
    r0.xyz = r1.w * PSLightColor[0];			// partial precision
    r5.xyz = r5 * --0.5;			// partial precision
    r7.xyz = normalize(IN.texcoord_2);			// partial precision
    r1.w = 1 - r4.x;			// partial precision
    r7.x = dot(r6, r7);			// partial precision
    r4.x = dot(r6, IN.texcoord_1);			// partial precision
    r2.w = max(r7.x, 0);			// partial precision
    r1.w = saturate(r1.w - r3.x);			// partial precision
    r3.xyz = (r2.w * PSLightColor[1]) + r5;			// partial precision
    r3.xyz = r1.w * r3;			// partial precision
    r2.xyz = r2 + -1;			// partial precision
    r1.xyz = (r1.x * r2) + 1;			// partial precision
    r1.w = max(r4.x, 0);			// partial precision
    r0.xyz = r0 * --0.5;			// partial precision
    r0.xyz = (r1.w * PSLightColor[0]) + r0;			// partial precision
    r0.xyz = (r1 * r0) + r3;			// partial precision
    r0.xyz = r0 + AmbientColor;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 44 instruction slots used (6 texture, 38 arithmetic)
