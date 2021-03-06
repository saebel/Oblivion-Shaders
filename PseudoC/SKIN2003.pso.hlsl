//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2003.pso /Fcshaderdump19/SKIN2003.pso.dis
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
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   FaceGenMap0    texture_2       1
//   FaceGenMap1    texture_3       1
//   AttenuationMap texture_5       1
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//

    const float4 const_0 = {-0.5, 2, -1, 1};
    const int4 const_4 = {0, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D FaceGenMap0;
    sampler2D FaceGenMap1;
    sampler2D AttenuationMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r1.x = IN.texcoord_4.z;			// partial precision
    r1.y = IN.texcoord_4.w;			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r5.xyzw = tex2D(AttenuationMap, r1.xy);			// partial precision
    r6.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r7.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r3.xyzw = tex2D(ShadowMaskMap, r0.xy);			// partial precision
    r4.xyzw = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r2.xyzw = tex2D(FaceGenMap1, IN.texcoord_0.xy);			// partial precision
    r1.xyzw = tex2D(FaceGenMap0, IN.texcoord_0.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r8.xyz = normalize(IN.texcoord_6.xyz);			// partial precision
    r7.xyz = r7.xyz - 0.5;
    r7.xyz = 2 * r7.xyz;			// partial precision
    r9.xyz = normalize(r7.xyz);			// partial precision
    r7.x = dot(r9.xyz, r8.xyz);			// partial precision
    r1.w = max(r7.x, 0);			// partial precision
    r1.w = 1 - r1.w;			// partial precision
    r2.w = r1.w * r1.w;			// partial precision
    r1.w = r1.w * r2.w;			// partial precision
    r8.xyz = r1.w * PSLightColor[1].rgb;			// partial precision
    r7.xyz = r1.w * PSLightColor[0].rgb;			// partial precision
    r8.xyz = r8.xyz * 0.5;			// partial precision
    r10.xyz = normalize(IN.texcoord_2.xyz);			// partial precision
    r1.w = 1 - r6.x;			// partial precision
    r10.x = dot(r9.xyz, r10.xyz);			// partial precision
    r6.x = dot(r9.xyz, IN.texcoord_1.xyz);			// partial precision
    r2.w = max(r10.x, 0);			// partial precision
    r1.w = saturate(r1.w - r5.x);			// partial precision
    r5.xyz = (r2.w * PSLightColor[1].rgb) + r8.xyz;			// partial precision
    r5.xyz = r1.w * r5.xyz;			// partial precision
    r4.xyz = r4.xyz - 1;			// partial precision
    r4.xyz = (r3.x * r4.xyz) + 1;			// partial precision
    r1.w = max(r6.x, 0);			// partial precision
    r3.xyz = r7.xyz * 0.5;			// partial precision
    r3.xyz = (r1.w * PSLightColor[0].rgb) + r3.xyz;			// partial precision
    r3.xyz = (r4.xyz * r3.xyz) + r5.xyz;			// partial precision
    r4.xyz = r3.xyz + AmbientColor.rgb;			// partial precision
    r3.xyz = max(r4.xyz, 0);			// partial precision
    r2.xyz = 2 * r2.xyz;			// partial precision
    r1.xyz = r1.xyz - 0.5;			// partial precision
    r0.xyz = (2 * r1.xyz) + r0.xyz;			// partial precision
    r0.xyz = r2.xyz * r0.xyz;			// partial precision
    r0.xyz = 2 * r0.xyz;			// partial precision
    r1.xyz = r0.xyz * IN.color_0.rgb;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r0.xyz : r1.xyz);			// partial precision
    r1.xyz = (-r0.xyz * r3.xyz) + IN.color_1.rgb;			// partial precision
    r0.xyz = r3.xyz * r0.xyz;			// partial precision
    r1.xyz = (IN.color_1.a * r1.xyz) + r0.xyz;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r0.xyz : r1.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 59 instruction slots used (8 texture, 51 arithmetic)
