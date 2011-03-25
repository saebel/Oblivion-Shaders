//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2008.pso /Fcshaderdump19/SLS2008.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
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
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//

    const float4 const_0 = {-0.5, 0.5, -1, 1};
    const int4 const_3 = {0, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float2 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D GlowMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r0 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0 + const_0.x;
    r1.xyz = r0 + r0;			// partial precision
    r0.xyz = normalize(r1);			// partial precision
    r0.x = saturate(dot(r0, IN.texcoord_1));			// partial precision
    r4.xyz = r0.x * PSLightColor[0];			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r2 = tex2D(ShadowMaskMap, r0);			// partial precision
    r3 = tex2D(ShadowMap, IN.texcoord_7);			// partial precision
    r1 = tex2D(GlowMap, IN.texcoord_0);			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r3.xyz = r3 + const_0.z;			// partial precision
    r2.xyz = (r2.x * r3) + const_0.w;			// partial precision
    r3.xyz = (r2 * r4) + AmbientColor;			// partial precision
    r2.xyz = max(r3, const_3.x);			// partial precision
    r2.w = const_0.x;
    r3.xyz = r2.w + EmittanceColor;
    r3.xyz = (IN.color_0.g * r3) + const_0.y;
    r4.xyz = r3 + r3;			// partial precision
    r3.xyz = lerp(r1, r0, r1.w);			// partial precision
    r0.xyz = r4 * r3;			// partial precision
    r1.xyz = (-r0 * r2) + IN.color_1;			// partial precision
    r0.xyz = r2 * r0;			// partial precision
    r1.xyz = (IN.color_1.a * r1) + r0;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 31 instruction slots used (5 texture, 26 arithmetic)
