//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1003.pso /Fcshaderdump19/STB1003.pso.dis
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

    IN.texcoord_0 = tex2D(NormalMap, texcoord_0);
    IN.texcoord_1 = tex2D(NormalMap, texcoord_0);
    IN.texcoord_2 = tex2D(NormalMap, texcoord_0);
    IN.texcoord_3 = tex2D(NormalMap, texcoord_0);
    r0.xyz = saturate(dot(2 * ((IN.texcoord_0) - 0.5), 2 * ((IN.texcoord_3) - 0.5)));
    r1.xyz = IN.texcoord_1 * IN.texcoord_2;
    r0.xyz = r0 * r1;
    r1.xyz = saturate(dot(2 * ((IN.texcoord_0) - 0.5), 2 * ((IN.input_0) - 0.5)));
    r1.xyz = (PSLightColor[0] * r1) + AmbientColor;
    r0.xyz = saturate((PSLightColor[1] * r0) + r1);
  + r0.w = AmbientColor.a;

// approximately 10 instruction slots used (4 texture, 6 arithmetic)
