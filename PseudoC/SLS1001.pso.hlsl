//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1001.pso /Fcshaderdump19/SLS1001.pso.dis
//
//
// Parameters:
//
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
//   PSLightColor[0]  const_2        1
//   NormalMap     texture_0       1
//   AttMapXY      texture_1       1
//   AttMapZ       texture_2       1
//   NormalCubeMap texture_3       1
//

    const float4 const_0 = {-0.5, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    sampler2D NormalMap;
    sampler2D AttMapXY;
    sampler2D AttMapZ;
    samplerCUBE NormalCubeMap;
    r3.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r2.xyzw = texCUBE(NormalCubeMap, IN.texcoord_3.xyz);
    r0.xyzw = tex2D(AttMapXY, IN.texcoord_1.xy);
    r1.xyzw = tex2D(AttMapZ, IN.texcoord_2.xy);
    r3.xyz = r3.xyz - 0.5;
    r3.xyz = 2 * r3.xyz;
    r2.xyz = r2.xyz - 0.5;
    r2.xyz = 2 * r2.xyz;
    r2.x = saturate(dot(r3.xyz, r2.xyz));
    r2.xyz = r2.x * PSLightColor[0].rgb;
    r0.xyz = r0.xyz * r1.xyz;
    r0.xyz = r2.xyz * r0.xyz;
    r0.w = PSLightColor[0].a;
    OUT.color_0.rgba = r0.xyzw;

// approximately 14 instruction slots used (4 texture, 10 arithmetic)