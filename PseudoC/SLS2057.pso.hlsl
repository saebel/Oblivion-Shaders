//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2057.pso /Fcshaderdump19/SLS2057.pso.dis
//
//
// Parameters:
//
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
//   PSLightColor[0]  const_2        1
//   PSLightColor[1]  const_3        1
//   PSLightColor[2]  const_4        1
//   Toggles       const_7       1
//   NormalMap     texture_1       1
//   ShadowMap     texture_2       1
//   ShadowMaskMap texture_3       1
//

    const float4 const_0 = {-0.5, 0.2, 0.5, 0};
    const int4 const_1 = {-1, 1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    sampler2D NormalMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r0 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r1.xyz = IN.texcoord_3 + -0.5;			// partial precision
    r1.xyz = r1 + r1;			// partial precision
    r0.xyz = r0 + -0.5;
    r2.xyz = r0 + r0;			// partial precision
    r0.xyz = normalize(r2);			// partial precision
    r2.x = saturate(dot(r0, r1));			// partial precision
    r1.xyz = IN.texcoord_2 + -0.5;
    r1.w = pow(abs(r2.x), Toggles.z);			// partial precision
    r1.xyz = r1 + r1;			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r0.x = dot(r0, r1);			// partial precision
    r3.w = r0.x + 0.5;			// partial precision
    r0.w = 0.2 - r0.x;			// partial precision
    r1.w = max(r3.w, 0);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r0.xyz = r0.w * PSLightColor[0];			// partial precision
    r2.xyz = r0 * IN.texcoord_1;
    r0.x = IN.texcoord_4.z;			// partial precision
    r0.y = IN.texcoord_4.w;			// partial precision
    r0 = tex2D(ShadowMaskMap, r0);			// partial precision
    r1 = tex2D(ShadowMap, IN.texcoord_4);			// partial precision
    r1.xyz = r1 + -1;			// partial precision
    r0.xyz = (r0.x * r1) + 1;			// partial precision
    r0.w = dot(PSLightColor[1], IN.color_0);
    r1.w = dot(PSLightColor[2], IN.color_1);
    r0.xyz = r2 * r0;			// partial precision
    r0.w = r0.w + r1.w;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 34 instruction slots used (3 texture, 31 arithmetic)
