//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2029.pso /Fcshaderdump19/PAR2029.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   float4 EmittanceColor;
//   sampler2D GlowMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//   sampler2D ShadowMaskMap;
//   float4 Toggles;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
//   AttenuationMap texture_5       1
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//

    const float4 const_0 = {0.04, -0.02, -0.5, -1};
    const float4 const_4 = {0.2, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D GlowMap;
    sampler2D AttenuationMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.x = dot(IN.texcoord_6, IN.texcoord_6);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_6;			// partial precision
    r0.w = (r0.w * 0.04) + -0.02;			// partial precision
    r1.xy = (r0.w * r0) + IN.texcoord_0;
    r2.x = IN.texcoord_5.z;			// partial precision
    r2.y = IN.texcoord_5.w;			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r4 = tex2D(NormalMap, r1);			// partial precision
    r1 = tex2D(BaseMap, r1);			// partial precision
    r5 = tex2D(AttenuationMap, r2);			// partial precision
    r6 = tex2D(AttenuationMap, IN.texcoord_5);			// partial precision
    r2 = tex2D(ShadowMaskMap, r0);			// partial precision
    r3 = tex2D(ShadowMap, IN.texcoord_7);			// partial precision
    r0 = tex2D(GlowMap, IN.texcoord_0);
    r4.xyz = r4 + -0.5;
    r7.xyz = r4 + r4;			// partial precision
    r4.xyz = normalize(r7);			// partial precision
    r7.xyz = normalize(IN.texcoord_4);			// partial precision
    r7.x = saturate(dot(r4, r7));			// partial precision
    r0.w = pow(abs(r7.x), Toggles.z);			// partial precision
    r7.xyz = normalize(IN.texcoord_2);			// partial precision
    r2.w = r4.w * r0.w;			// partial precision
    r8.x = dot(r4, r7);			// partial precision
    r1.w = r8.x - -0.5;			// partial precision
    r0.w = max(r1.w, 0);			// partial precision
    r1.w = r2.w * r0.w;			// partial precision
    r0.w = 0.2 - r8.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r1.w = -(r6.x + -1);			// partial precision
    r6.xyz = normalize(IN.texcoord_3);			// partial precision
    r1.w = saturate(r1.w - r5.x);			// partial precision
    r5.x = saturate(dot(r4, r6));			// partial precision
    r2.w = pow(abs(r5.x), Toggles.z);			// partial precision
    r7.x = dot(r4, IN.texcoord_1);			// partial precision
    r3.w = r4.w * r2.w;			// partial precision
    r4.w = r7.x - -0.5;			// partial precision
    r2.w = max(r4.w, 0);			// partial precision
    r2.w = r3.w * r2.w;			// partial precision
    r4.xyz = r0.w * PSLightColor[1];			// partial precision
    r0.w = 0.2 - r7.x;			// partial precision
    r6.xyz = saturate(r1.w * r4);			// partial precision
    r0.w = (r0.w >= 0.0 ? r3.w : r2.w);			// partial precision
    r5.xyz = saturate(r0.w * PSLightColor[0]);			// partial precision
    r3.xyz = r3 + -1;			// partial precision
    r4.xyz = (r2.x * r3) - -1;			// partial precision
    r2.xyz = (r4 * r5) + r6;			// partial precision
    r3.xyz = r1 * IN.color_0;			// partial precision
    r0.w = saturate(r8.x);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r3 : r1);			// partial precision
    r3.xyz = r0.w * PSLightColor[1];			// partial precision
    r0.w = saturate(r7.x);			// partial precision
    r5.xyz = r1.w * r3;			// partial precision
    r3.xyz = r0.w * PSLightColor[0];			// partial precision
    r3.xyz = (r4 * r3) + r5;			// partial precision
    r4.xyz = AmbientColor;
    r0.xyz = (r0 * EmittanceColor) + r4;			// partial precision
    r3.xyz = r3 + r0;			// partial precision
    r0.xyz = max(r3, 0);			// partial precision
    r0.xyz = (r1 * r0) + r2;			// partial precision
    r1.xyz = lerp(IN.color_1, r0, IN.color_1.a);			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    r0.w = AmbientColor.a;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 79 instruction slots used (8 texture, 71 arithmetic)
