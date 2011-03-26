//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2021.pso /Fcshaderdump19/SLS2021.pso.dis
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

    const float4 const_0 = {-0.5, 0.2, 0.5, 0};
    const int4 const_4 = {1, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D AttenuationMap;
    r1 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = normalize(IN.texcoord_4);			// partial precision
    r1.xyz = r1 + -0.5;
    r1.xyz = r1 + r1;			// partial precision
    r4.xyz = normalize(r1);			// partial precision
    r1.x = saturate(dot(r4, r0));			// partial precision
    r0.w = pow(abs(r1.x), Toggles.z);			// partial precision
    r0.xyz = normalize(IN.texcoord_2);			// partial precision
    r3.w = r1.w * r0.w;			// partial precision
    r5.x = dot(r4, r0);			// partial precision
    r2.w = r5.x + 0.5;			// partial precision
    r0.w = max(r2.w, 0);			// partial precision
    r2.w = r3.w * r0.w;			// partial precision
    r0.w = 0.2 - r5.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r3.w : r2.w);			// partial precision
    r1.xyz = r0.w * PSLightColor[1];			// partial precision
    r0.x = IN.texcoord_5.z;			// partial precision
    r0.y = IN.texcoord_5.w;			// partial precision
    r2 = tex2D(AttenuationMap, r0);			// partial precision
    r3 = tex2D(AttenuationMap, IN.texcoord_5);			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r2.w = 1 - r3.x;			// partial precision
    r3.xyz = normalize(IN.texcoord_3);			// partial precision
    r2.w = saturate(r2.w - r2.x);			// partial precision
    r2.x = saturate(dot(r4, r3));			// partial precision
    r3.w = pow(abs(r2.x), Toggles.z);			// partial precision
    r3.x = dot(r4, IN.texcoord_1);			// partial precision
    r4.w = r1.w * r3.w;			// partial precision
    r3.w = r3.x + 0.5;			// partial precision
    r1.w = max(r3.w, 0);			// partial precision
    r3.w = r4.w * r1.w;			// partial precision
    r1.w = 0.2 - r3.x;			// partial precision
    r2.xyz = saturate(r1 * r2.w);			// partial precision
    r1.w = (r1.w >= 0.0 ? r4.w : r3.w);			// partial precision
    r1.xyz = saturate(r1.w * PSLightColor[0]);			// partial precision
    r2.xyz = r2 + r1;			// partial precision
    r1.xyz = r0 * IN.color_0;			// partial precision
    r1.w = saturate(r5.x);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r0.xyz = r1.w * PSLightColor[1];			// partial precision
    r1.w = saturate(r3.x);			// partial precision
    r0.xyz = r2.w * r0;			// partial precision
    r0.xyz = (r1.w * PSLightColor[0]) + r0;			// partial precision
    r3.xyz = r0 + AmbientColor;			// partial precision
    r0.xyz = max(r3, 0);			// partial precision
    r0.xyz = (r1 * r0) + r2;			// partial precision
    r1.xyz = lerp(IN.color_1, r0, IN.color_1.a);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 63 instruction slots used (4 texture, 59 arithmetic)
