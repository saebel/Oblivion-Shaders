//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2004.pso /Fcshaderdump19/PAR2004.pso.dis
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

    const float4 const_0 = {0.04, -0.02, -0.5, 1};
    const int4 const_4 = {0, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float3 texcoord_6 : TEXCOORD6_centroid;
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D AttenuationMap;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r0.x = dot(IN.texcoord_6.xyz, IN.texcoord_6.xyz);
    r1.x = IN.texcoord_4.z;
    r1.y = IN.texcoord_4.w;
    r1.w = 1.0 / sqrt(r0.x);
    r0.xy = r1.w * IN.texcoord_6.xy;
    r0.w = (r0.w * 0.04) - 0.02;
    r0.xy = (r0.w * r0.xy) + IN.texcoord_0.xy;
    r1.xyzw = tex2D(AttenuationMap, r1.xy);
    r2.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);
    r3.xyzw = tex2D(NormalMap, r0.xy);
    r0.xyzw = tex2D(BaseMap, r0.xy);
    r3.xyz = r3.xyz - 0.5;
    r4.xyz = 2 * r3.xyz;
    r3.xyz = normalize(r4.xyz);
    r4.xyz = normalize(IN.texcoord_2.xyz);
    r4.x = saturate(dot(r3.xyz, r4.xyz));
    r0.w = 1 - r2.x;
    r2.x = saturate(dot(r3.xyz, IN.texcoord_1.xyz));
    r0.w = saturate(r0.w - r1.x);
    r1.xyz = r4.x * PSLightColor[1].rgb;
    r1.xyz = r0.w * r1.xyz;
    r1.xyz = (r2.x * PSLightColor[0].rgb) + r1.xyz;
    r1.xyz = r1.xyz + AmbientColor.rgb;
    r2.xyz = max(r1.xyz, 0);
    r1.xyz = r0.xyz * IN.color_0.rgb;
    r0.xyz = (Toggles.x <= 0.0 ? r0.xyz : r1.xyz);
    r1.xyz = (-r0.xyz * r2.xyz) + IN.color_1.rgb;
    r0.xyz = r2.xyz * r0.xyz;
    r1.xyz = (IN.color_1.a * r1.xyz) + r0.xyz;
    r0.xyz = (Toggles.y <= 0.0 ? r0.xyz : r1.xyz);
    r0.w = AmbientColor.a;
    OUT.color_0.rgba = r0.xyzw;

// approximately 37 instruction slots used (5 texture, 32 arithmetic)