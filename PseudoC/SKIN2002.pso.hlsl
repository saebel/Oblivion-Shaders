//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2002.pso /Fcshaderdump19/SKIN2002.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttenuationMap;
//   sampler2D BaseMap;
//   sampler2D FaceGenMap0;
//   sampler2D FaceGenMap1;
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
//   FaceGenMap0    texture_2       1
//   FaceGenMap1    texture_3       1
//   AttenuationMap texture_5       1
//

    const float4 const_0 = {-0.5, 2, 0, 1};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D FaceGenMap0;
    sampler2D FaceGenMap1;
    sampler2D AttenuationMap;
    r0.x = IN.texcoord_4.z;			// partial precision
    r0.y = IN.texcoord_4.w;			// partial precision
    r3 = tex2D(AttenuationMap, r0);			// partial precision
    r4 = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r5 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r2 = tex2D(FaceGenMap1, IN.texcoord_0);			// partial precision
    r1 = tex2D(FaceGenMap0, IN.texcoord_0);			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r6.xyz = normalize(IN.texcoord_6);			// partial precision
    r5.xyz = r5 + -0.5;
    r5.xyz = r5 + r5;			// partial precision
    r7.xyz = normalize(r5);			// partial precision
    r5.x = dot(r7, r6);			// partial precision
    r1.w = max(r5.x, 0);			// partial precision
    r1.w = 1 - r1.w;			// partial precision
    r2.w = r1.w * r1.w;			// partial precision
    r1.w = r1.w * r2.w;			// partial precision
    r6.xyz = r1.w * PSLightColor[1];			// partial precision
    r5.xyz = r1.w * PSLightColor[0];			// partial precision
    r6.xyz = r6 * --0.5;			// partial precision
    r8.xyz = normalize(IN.texcoord_2);			// partial precision
    r8.x = dot(r7, r8);			// partial precision
    r7.x = dot(r7, IN.texcoord_1);			// partial precision
    r2.w = max(r8.x, 0);			// partial precision
    r1.w = 1 - r4.x;			// partial precision
    r4.xyz = (r2.w * PSLightColor[1]) + r6;			// partial precision
    r2.w = max(r7.x, 0);			// partial precision
    r5.xyz = r5 * --0.5;			// partial precision
    r1.w = saturate(r1.w - r3.x);			// partial precision
    r3.xyz = (r2.w * PSLightColor[0]) + r5;			// partial precision
    r3.xyz = (r1.w * r4) + r3;			// partial precision
    r4.xyz = r3 + AmbientColor;			// partial precision
    r3.xyz = max(r4, 0);			// partial precision
    r2.xyz = r2 + r2;			// partial precision
    r1.xyz = r1 + -0.5;			// partial precision
    r0.xyz = (2 * r1) + r0;			// partial precision
    r0.xyz = r2 * r0;			// partial precision
    r0.xyz = r0 + r0;			// partial precision
    r1.xyz = r0 * IN.color_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r1.xyz = (-r0 * r3) + IN.color_1;			// partial precision
    r0.xyz = r3 * r0;			// partial precision
    r1.xyz = (IN.color_1.a * r1) + r0;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 52 instruction slots used (6 texture, 46 arithmetic)
