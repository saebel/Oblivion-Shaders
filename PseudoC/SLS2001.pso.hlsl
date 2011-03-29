//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2001.pso /Fcshaderdump19/SLS2001.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//   float4 Toggles;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   Toggles      const_7       1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   ShadowMap    texture_6       1
//

    const float4 const_0 = {-0.1, -0.5, 0, 20};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float texcoord_7 : TEXCOORD7_centroid;			// partial precision
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D ShadowMap;
    r0.w = IN.texcoord_7.x + -0.1;			// partial precision
    r0.xyzw = -r0.w;
    r1.xy = IN.texcoord_0 * 20;
    texkill r0
    r2.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r1.xyzw = tex2D(ShadowMap, r1);
    r2.xyz = r2.xyz + -0.5;
    r3.xyz = r2.xyz + r2.xyz;			// partial precision
    r2.xyz = normalize(r3);			// partial precision
    r3.x = saturate(dot(r2.xyz, IN.texcoord_1.xyz));			// partial precision
    r2.xyz = AmbientColor.rgb;
    r3.xyz = (r3.x * PSLightColor[0].rgb) + r2.xyz;			// partial precision
    r2.xyz = max(r3.xyz, 0);			// partial precision
    r0.xyz = r0.xyz * r2.xyz;			// partial precision
    r1.w = (r1.x * --0.5) - -0.5;
    r1.xyz = (-r1.w * r0) + IN.color_1;			// partial precision
    r0.xyz = r0.xyz * r1.w;			// partial precision
    r1.xyz = (IN.color_1.a * r1.xyz) + r0.xyz;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 24 instruction slots used (4 texture, 20 arithmetic)
