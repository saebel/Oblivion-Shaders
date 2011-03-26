//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2018.pso /Fcshaderdump19/SLS2018.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//   sampler2D ShadowMaskMap;
//   float4 Toggles;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  const_1       1
//   PSLightColor[0]  const_2        1
//   Toggles       const_7       1
//   BaseMap       texture_0       1
//   NormalMap     texture_1       1
//   ShadowMap     texture_6       1
//   ShadowMaskMap texture_7       1
//

    const float4 const_0 = {-0.5, -1, 1, 0.2};
    const int4 const_3 = {0, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r0 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r1.xyz = normalize(IN.texcoord_3);			// partial precision
    r0.xyz = r0 + -0.5;
    r2.xyz = r0 + r0;			// partial precision
    r0.xyz = normalize(r2);			// partial precision
    r2.x = saturate(dot(r0, r1));			// partial precision
    r1.w = pow(abs(r2.x), Toggles.z);			// partial precision
    r0.x = dot(r0, IN.texcoord_1);			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r1.w = r0.x - -0.5;			// partial precision
    r0.w = max(r1.w, 0);			// partial precision
    r1.w = r2.w * r0.w;			// partial precision
    r0.w = 0.2 - r0.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r4.xyz = saturate(r0.w * PSLightColor[0]);			// partial precision
    r3.w = saturate(r0.x);			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r1 = tex2D(ShadowMaskMap, r0);			// partial precision
    r2 = tex2D(ShadowMap, IN.texcoord_7);			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r2.xyz = r2 + -1;			// partial precision
    r3.xyz = (r1.x * r2) + 1;			// partial precision
    r2.xyz = r4 * r3;			// partial precision
    r1.xyz = r3.w * PSLightColor[0];			// partial precision
    r3.xyz = (r3 * r1) + AmbientColor;			// partial precision
    r1.xyz = max(r3, 0);			// partial precision
    r3.xyz = r0 * IN.color_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r3 : r0);			// partial precision
    r0.xyz = (r0 * r1) + r2;			// partial precision
    r1.xyz = lerp(IN.color_1, r0, IN.color_1.a);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 41 instruction slots used (4 texture, 37 arithmetic)
