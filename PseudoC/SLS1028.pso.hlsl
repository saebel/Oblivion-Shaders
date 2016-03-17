//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1028.pso /Fcshaderdump19/SLS1028.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D GlowMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   GlowMap      texture_2       1
//

    const float4 const_0 = {-0.5, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    sampler2D GlowMap;
    r2.xyzw = tex2D(NormalMap, IN.texcoord_1.xy);
    r1.xyzw = tex2D(GlowMap, IN.texcoord_2.xy);
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r2.xyz = r2.xyz - 0.5;
    r2.xyz = 2 * r2.xyz;
    r3.xyz = IN.texcoord_3.xyz - 0.5;
    r3.xyz = 2 * r3.xyz;
    r2.x = saturate(dot(r2.xyz, r3.xyz));
    r1.xyz = r1.xyz + AmbientColor.rgb;
    r1.xyz = saturate((r2.x * PSLightColor[0].rgb) + r1.xyz);
    r0.xyz = r0.xyz * IN.color_0.rgb;
    r2.xyz = (-r0.xyz * r1.xyz) + IN.color_1.rgb;
    r2.xyz = r2.xyz * IN.color_1.a;
    r0.w = r0.w * AmbientColor.a;
    r0.xyz = (r0.xyz * r1.xyz) + r2.xyz;
    OUT.color_0.rgba = r0.xyzw;

// approximately 16 instruction slots used (3 texture, 13 arithmetic)