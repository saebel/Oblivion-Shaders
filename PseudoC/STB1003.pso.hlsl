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

    IN.texcoord_0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    IN.texcoord_1.xyzw = tex2D(AttMapXY, IN.texcoord_1.xy);
    IN.texcoord_2.xyzw = tex2D(AttMapZ, IN.texcoord_2.xy);
    IN.texcoord_3.xyzw = texCUBE(NormalCubeMap, IN.texcoord_3.xyz);
    r0.xyz = saturate(dot(2 * ((IN.texcoord_0.xyz) - 0.5), 2 * ((IN.texcoord_3.xyz) - 0.5)));
    r1.xyz = IN.texcoord_1.xyz * IN.texcoord_2.xyz;
    r0.xyz = r0.xyz * r1.xyz;
    r1.xyz = saturate(dot(2 * ((IN.texcoord_0.xyz) - 0.5), 2 * ((IN.input_0.xyz) - 0.5)));
    r1.xyz = (PSLightColor[0].rgb * r1.xyz) + AmbientColor.rgb;
    r0.xyz = saturate((PSLightColor[1].rgb * r0.xyz) + r1.xyz);
  + r0.w = AmbientColor.a;

// approximately 10 instruction slots used (4 texture, 6 arithmetic)