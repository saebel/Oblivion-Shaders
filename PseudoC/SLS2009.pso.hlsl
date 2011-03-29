//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2009.pso /Fcshaderdump19/SLS2009.pso.dis
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

    const float4 const_0 = {-0.5, 1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D AttenuationMap;
    r0.x = IN.texcoord_4.z;			// partial precision
    r0.y = IN.texcoord_4.w;			// partial precision
    r1.xyzw = tex2D(AttenuationMap, r0);			// partial precision
    r2.xyzw = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r3.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r3.xyz = r3.xyz + -0.5;
    r4.xyz = r3.xyz + r3.xyz;			// partial precision
    r3.xyz = normalize(r4);			// partial precision
    r4.xyz = normalize(IN.texcoord_2);			// partial precision
    r4.x = saturate(dot(r3.xyz, r4.xyz));			// partial precision
    r1.w = 1 - r2.x;			// partial precision
    r2.x = saturate(dot(r3.xyz, IN.texcoord_1.xyz));			// partial precision
    r1.w = saturate(r1.w - r1.x);			// partial precision
    r1.xyz = r4.x * PSLightColor[1].rgb;			// partial precision
    r1.xyz = r1.w * r1.xyz;			// partial precision
    r1.xyz = (r2.x * PSLightColor[0].rgb) + r1.xyz;			// partial precision
    r1.xyz = r1.xyz + AmbientColor.rgb;			// partial precision
    r2.xyz = max(r1.xyz, 0);			// partial precision
    r1.xyz = r0.xyz * IN.color_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r1.xyz = (-r0 * r2) + IN.color_1;			// partial precision
    r0.xyz = r2.xyz * r0.xyz;			// partial precision
    r1.xyz = (IN.color_1.a * r1.xyz) + r0.xyz;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 31 instruction slots used (4 texture, 27 arithmetic)
