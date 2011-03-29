//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2004.pso /Fcshaderdump19/SLS2004.pso.dis
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

    const float4 const_0 = {-0.5, -1, 1, 0};
    const int4 const_3 = {20, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0.xyz + -0.5;
    r1.xyz = r0.xyz + r0.xyz;			// partial precision
    r0.xyz = normalize(r1);			// partial precision
    r0.x = saturate(dot(r0.xyz, IN.texcoord_1.xyz));			// partial precision
    r4.xyz = r0.x * PSLightColor[0].rgb;			// partial precision
    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r1.xy = IN.texcoord_0 * 20;
    r2.xyzw = tex2D(ShadowMaskMap, r0);			// partial precision
    r3.xyzw = tex2D(ShadowMap, IN.texcoord_7);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1);
    r3.xyz = r3.xyz + -1;			// partial precision
    r2.xyz = (r2.x * r3) + 1;			// partial precision
    r3.xyz = (r2.xyz * r4.xyz) + AmbientColor.rgb;			// partial precision
    r2.xyz = max(r3.xyz, 0);			// partial precision
    r0.xyz = r0.xyz * r2.xyz;			// partial precision
    r1.w = (r1.x * --0.5) - -0.5;
    r1.xyz = (-r1.w * r0) + IN.color_1;			// partial precision
    r0.xyz = r0.xyz * r1.w;			// partial precision
    r1.xyz = (IN.color_1.a * r1.xyz) + r0.xyz;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 27 instruction slots used (5 texture, 22 arithmetic)
