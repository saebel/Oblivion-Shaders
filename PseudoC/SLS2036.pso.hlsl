//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2036.pso /Fcshaderdump19/SLS2036.pso.dis
//
//
// Parameters:
//
//   sampler2D AttenuationMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   NormalMap      texture_0       1
//   AttenuationMap texture_3       1
//

    const float4 const_0 = {-0.5, 1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
    sampler2D NormalMap;
    sampler2D AttenuationMap;
    r2.x = IN.texcoord_4.z;
    r2.y = IN.texcoord_4.w;
    r1.x = IN.texcoord_5.z;
    r1.y = IN.texcoord_5.w;
    r0.x = IN.texcoord_6.z;
    r0.y = IN.texcoord_6.w;
    r2.xyzw = tex2D(AttenuationMap, r2);			// partial precision
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r4.xyzw = tex2D(AttenuationMap, r1);			// partial precision
    r5.xyzw = tex2D(AttenuationMap, IN.texcoord_5);			// partial precision
    r6.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyzw = tex2D(AttenuationMap, r0);			// partial precision
    r1.xyzw = tex2D(AttenuationMap, IN.texcoord_6);			// partial precision
    r7.xyz = normalize(IN.texcoord_2);			// partial precision
    r6.xyz = r6.xyz + -0.5;
    r8.xyz = r6.xyz + r6.xyz;			// partial precision
    r6.xyz = normalize(r8);			// partial precision
    r0.w = 1 - r5.x;			// partial precision
    r5.x = saturate(dot(r6.xyz, r7.xyz));			// partial precision
    r0.w = saturate(r0.w - r4.x);			// partial precision
    r4.xyz = r5.x * PSLightColor[1].rgb;			// partial precision
    r4.xyz = r0.w * r4.xyz;			// partial precision
    r5.xyz = normalize(IN.texcoord_1);			// partial precision
    r0.w = 1 - r3.x;			// partial precision
    r3.x = saturate(dot(r6.xyz, r5.xyz));			// partial precision
    r0.w = saturate(r0.w - r2.x);			// partial precision
    r2.xyz = r3.x * PSLightColor[0].rgb;			// partial precision
    r2.xyz = (r0.w * r2.xyz) + r4.xyz;			// partial precision
    r3.xyz = normalize(IN.texcoord_3);			// partial precision
    r0.w = 1 - r1.x;			// partial precision
    r1.x = saturate(dot(r6.xyz, r3.xyz));			// partial precision
    r0.w = saturate(r0.w - r0.x);			// partial precision
    r0.xyz = r1.x * PSLightColor[2].rgb;			// partial precision
    r0.xyz = (r0.w * r0.xyz) + r2.xyz;			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 44 instruction slots used (7 texture, 37 arithmetic)
