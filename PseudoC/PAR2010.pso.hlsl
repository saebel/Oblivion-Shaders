//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2010.pso /Fcshaderdump19/PAR2010.pso.dis
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

    const float4 const_0 = {0.04, -0.02, -0.5, -1};
    const float4 const_3 = {0.2, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    sampler2D ShadowMaskMap;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.x = dot(IN.texcoord_6.xyz, IN.texcoord_6.xyz);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_6.xy;			// partial precision
    r0.w = (r0.w * 0.04) - 0.02;			// partial precision
    r0.xy = (r0.w * r0.xy) + IN.texcoord_0.xy;
    r1.x = IN.texcoord_7.z;			// partial precision
    r1.y = IN.texcoord_7.w;			// partial precision
    r3.xyzw = tex2D(NormalMap, r0.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, r0.xy);			// partial precision
    r1.xyzw = tex2D(ShadowMaskMap, r1.xy);			// partial precision
    r2.xyzw = tex2D(ShadowMap, IN.texcoord_7.xy);			// partial precision
    r3.xyz = r3.xyz - 0.5;
    r4.xyz = 2 * r3.xyz;			// partial precision
    r3.xyz = normalize(r4.xyz);			// partial precision
    r4.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r4.x = saturate(dot(r3.xyz, r4.xyz));			// partial precision
    r0.w = pow(abs(r4.x), Toggles.z);			// partial precision
    r5.x = dot(r3.xyz, IN.texcoord_1.xyz);			// partial precision
    r2.w = r3.w * r0.w;			// partial precision
    r1.w = r5.x - -0.5;			// partial precision
    r0.w = max(r1.w, 0);			// partial precision
    r1.w = r2.w * r0.w;			// partial precision
    r0.w = 0.2 - r5.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r4.xyz = saturate(r0.w * PSLightColor[0].rgb);			// partial precision
    r2.xyz = r2.xyz - 1;			// partial precision
    r3.xyz = (r1.x * r2.xyz) - -1;			// partial precision
    r2.xyz = r4.xyz * r3.xyz;			// partial precision
    r1.xyz = r0.xyz * IN.color_0.rgb;			// partial precision
    r0.w = saturate(r5.x);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r1.xyz : r0.xyz);			// partial precision
    r0.xyz = r0.w * PSLightColor[0].rgb;			// partial precision
    r3.xyz = (r3.xyz * r0.xyz) + AmbientColor.rgb;			// partial precision
    r0.xyz = max(r3.xyz, 0);			// partial precision
    r0.xyz = (r1.xyz * r0.xyz) + r2.xyz;			// partial precision
    r1.xyz = lerp(IN.color_1.rgb, r0.xyz, IN.color_1.a);			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1.xyz : r0.xyz);			// partial precision
    r0.w = AmbientColor.a;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 47 instruction slots used (5 texture, 42 arithmetic)
