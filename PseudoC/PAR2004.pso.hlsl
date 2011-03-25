//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2004.pso /Fcshaderdump19/PAR2004.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
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
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_5       1
//

    const float4 const_0 = {0.04, -0.02, -0.5, 1};
    const int4 const_4 = {0, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D AttenuationMap;
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.x = dot(IN.texcoord_6, IN.texcoord_6);			// partial precision
    r1.x = IN.texcoord_4.z;			// partial precision
    r1.y = IN.texcoord_4.w;			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_6;			// partial precision
    r0.w = (r0.w * const_0.x) + const_0.y;			// partial precision
    r0.xy = (r0.w * r0) + IN.texcoord_0;
    r1 = tex2D(AttenuationMap, r1);			// partial precision
    r2 = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r3 = tex2D(NormalMap, r0);			// partial precision
    r0 = tex2D(BaseMap, r0);			// partial precision
    r3.xyz = r3 + const_0.z;
    r4.xyz = r3 + r3;			// partial precision
    r3.xyz = normalize(r4);			// partial precision
    r4.xyz = normalize(IN.texcoord_2);			// partial precision
    r4.x = saturate(dot(r3, r4));			// partial precision
    r0.w = const_0.w - r2.x;			// partial precision
    r2.x = saturate(dot(r3, IN.texcoord_1));			// partial precision
    r0.w = saturate(r0.w - r1.x);			// partial precision
    r1.xyz = r4.x * PSLightColor[1];			// partial precision
    r1.xyz = r0.w * r1;			// partial precision
    r1.xyz = (r2.x * PSLightColor[0]) + r1;			// partial precision
    r1.xyz = r1 + AmbientColor;			// partial precision
    r2.xyz = max(r1, const_4.x);			// partial precision
    r1.xyz = r0 * IN.color_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r1.xyz = (-r0 * r2) + IN.color_1;			// partial precision
    r0.xyz = r2 * r0;			// partial precision
    r1.xyz = (IN.color_1.a * r1) + r0;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    r0.w = AmbientColor.a;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 37 instruction slots used (5 texture, 32 arithmetic)
