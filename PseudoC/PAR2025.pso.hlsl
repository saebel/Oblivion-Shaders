//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2025.pso /Fcshaderdump19/PAR2025.pso.dis
//
//
// Parameters:
//
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
//   PSLightColor[0]   const_2        1
//   Toggles        const_7       1
//   NormalMap      texture_0       1
//   BaseMap        texture_1       1
//   AttenuationMap texture_3       1
//

    const float4 const_0 = {0.04, -0.02, -0.5, 1};
    const float4 const_1 = {0.2, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_5 : TEXCOORD5;
    float3 texcoord_7 : TEXCOORD7_centroid;
    sampler2D NormalMap;
    sampler2D BaseMap;
    sampler2D AttenuationMap;
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r0.x = dot(IN.texcoord_7.xyz, IN.texcoord_7.xyz);
    r1.w = 1.0 / sqrt(r0.x);
    r0.xy = r1.w * IN.texcoord_7.xy;
    r0.w = (r0.w * 0.04) - 0.02;
    r1.xy = (r0.w * r0.xy) + IN.texcoord_0.xy;
    r0.x = IN.texcoord_5.z;
    r0.y = IN.texcoord_5.w;
    r2.xyzw = tex2D(NormalMap, r1.xy);
    r0.xyzw = tex2D(AttenuationMap, r0.xy);
    r1.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);
    r2.xyz = r2.xyz - 0.5;
    r3.xyz = 2 * r2.xyz;
    r2.xyz = normalize(r3.xyz);
    r3.xyz = normalize(IN.texcoord_3.xyz);
    r3.x = saturate(dot(r2.xyz, r3.xyz));
    r0.w = pow(abs(r3.x), Toggles.z);
    r3.xyz = normalize(IN.texcoord_1.xyz);
    r2.w = r2.w * r0.w;
    r2.x = dot(r2.xyz, r3.xyz);
    r3.w = r2.x - -0.5;
    r0.w = 0.2 - r2.x;
    r1.w = max(r3.w, 0);
    r1.w = r2.w * r1.w;
    r1.w = (r0.w >= 0.0 ? r1.w : r2.w);
    r0.w = 1 - r1.x;
    r1.xyz = r1.w * PSLightColor[0].rgb;
    r0.w = saturate(r0.w - r0.x);
    r1.xyz = r1.xyz * r0.w;
    r0.xyz = saturate(r1.xyz);
    r0.w = dot(r1.xyz, 1);
    OUT.color_0.rgba = r0.xyzw;

// approximately 40 instruction slots used (4 texture, 36 arithmetic)