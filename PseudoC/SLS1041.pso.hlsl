//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1041.pso /Fcshaderdump19/SLS1041.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
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
//   PSLightColor[1] const_3        1
//   PSLightColor[2] const_4        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//

    const float4 const_0 = {-0.5, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    r1 = tex2D(NormalMap, IN.texcoord_1);
    r0 = tex2D(BaseMap, IN.texcoord_0);
    r1.xyz = r1 + -0.5;
    r1.xyz = r1 + r1;
    r2.xyz = IN.texcoord_3 + -0.5;
    r2.xyz = r2 + r2;
    r2.x = saturate(dot(r1, r2));
    r1.xyz = PSLightColor[0];
    r1.xyz = saturate((r2.x * r1) + AmbientColor);
    r0.xyz = r0 * IN.texcoord_2;
    r0.w = dot(PSLightColor[1], IN.color_0);
    r1.w = dot(PSLightColor[2], IN.color_1);
    r0.xyz = r1 * r0;
    r0.w = r0.w + r1.w;
    OUT.color_0 = r0;

// approximately 15 instruction slots used (2 texture, 13 arithmetic)
