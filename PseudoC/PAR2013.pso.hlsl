//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2013.pso /Fcshaderdump19/PAR2013.pso.dis
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
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_3       1
//   AttenuationMap texture_4       1
//

    const float4 const_0 = {0.04, -0.02, -0.5, 1};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float3 texcoord_7 : TEXCOORD7_centroid;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D GlowMap;
    sampler2D AttenuationMap;
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.x = dot(IN.texcoord_7, IN.texcoord_7);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_7;			// partial precision
    r0.w = (r0.w * 0.04) + -0.02;			// partial precision
    r1.xy = (r0.w * r0) + IN.texcoord_0;
    r0.x = IN.texcoord_4.z;
    r0.y = IN.texcoord_4.w;
    r3 = tex2D(NormalMap, r1);			// partial precision
    r1 = tex2D(AttenuationMap, r0);			// partial precision
    r2 = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r0 = tex2D(GlowMap, IN.texcoord_0);
    r3.xyz = r3 + -0.5;
    r4.xyz = r3 + r3;			// partial precision
    r3.xyz = normalize(r4);			// partial precision
    r4.xyz = normalize(IN.texcoord_2);			// partial precision
    r4.x = saturate(dot(r3, r4));			// partial precision
    r3.x = saturate(dot(r3, IN.texcoord_1));			// partial precision
    r0.w = 1 - r2.x;			// partial precision
    r2.xyz = r4.x * PSLightColor[1];			// partial precision
    r0.w = saturate(r0.w - r1.x);			// partial precision
    r1.xyz = r2 * r0.w;			// partial precision
    r1.xyz = (r3.x * PSLightColor[0]) + r1;			// partial precision
    r2.xyz = EmittanceColor;
    r0.xyz = (r0 * r2) + AmbientColor;			// partial precision
    r0.xyz = r1 + r0;			// partial precision
    r0.w = 1;
    OUT.color_0 = r0;			// partial precision

// approximately 32 instruction slots used (5 texture, 27 arithmetic)
