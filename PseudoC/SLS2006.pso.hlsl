//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2006.pso /Fcshaderdump19/SLS2006.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
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
//

    const float4 const_0 = {-0.5, 0.85, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r1.xyz = r1.xyz - 0.5;
    r2.xyz = 2 * r1.xyz;
    r1.xyz = normalize(r2.xyz);
    r1.x = saturate(dot(r1.xyz, IN.texcoord_1.xyz));
    r1.xyz = r1.x * PSLightColor[0].rgb;
    r2.z = 0.85;
    r1.xyz = (r2.z * r1.xyz) + AmbientColor.rgb;
    r2.xyz = max(r1.xyz, 0);
    r1.xyz = r0.xyz * IN.color_0.rgb;
    r0.xyz = (Toggles.x <= 0.0 ? r0.xyz : r1.xyz);
    r1.xyz = (-r0.xyz * r2.xyz) + IN.color_1.rgb;
    r0.xyz = r2.xyz * r0.xyz;
    r1.xyz = (IN.color_1.a * r1.xyz) + r0.xyz;
    r0.w = r0.w * AmbientColor.a;
    r0.xyz = (Toggles.y <= 0.0 ? r0.xyz : r1.xyz);
    OUT.color_0.rgba = r0.xyzw;

// approximately 20 instruction slots used (2 texture, 18 arithmetic)