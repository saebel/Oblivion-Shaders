//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1029.pso /Fcshaderdump19/SLS1029.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AttMapXY;
//   sampler2D AttMapZ;
//   samplerCUBE NormalCubeMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  const_1       1
//   PSLightColor[0]  const_2        1
//   PSLightColor[1]  const_3        1
//   NormalMap     texture_0       1
//   AttMapXY      texture_1       1
//   AttMapZ       texture_2       1
//   NormalCubeMap texture_3       1
//

    const float4 const_0 = {-0.5, 0, 0, 0};
    float3 IN.color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    sampler2D NormalMap;
    sampler2D AttMapXY;
    sampler2D AttMapZ;
    samplerCUBE NormalCubeMap;
    r2 = tex2D(AttMapXY, IN.texcoord_1);
    r3 = tex2D(AttMapZ, IN.texcoord_2);
    r1 = texCUBE(NormalCubeMap, IN.texcoord_3);
    r0 = tex2D(NormalMap, IN.texcoord_0);
    r2.xyz = r2 * r3;
    r1.xyz = r1 + const_0.x;
    r3.xyz = r1 + r1;
    r0.xyz = r0 + const_0.x;
    r1.xyz = r0 + r0;
    r0.x = saturate(dot(r1, r3));
    r0.xyz = r2 * r0.x;
    r2.xyz = IN.color_0 + const_0.x;
    r2.xyz = r2 + r2;
    r2.x = saturate(dot(r1, r2));
    r1.xyz = AmbientColor;
    r1.xyz = (r2.x * PSLightColor[0]) + r1;
    r0.xyz = saturate((PSLightColor[1] * r0) + r1);
    r0.w = AmbientColor.a;
    OUT.color_0 = r0;

// approximately 19 instruction slots used (4 texture, 15 arithmetic)
