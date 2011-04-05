//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1001.pso /Fcshaderdump19/STB1001.pso.dis
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
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//

    IN.texcoord_0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    IN.texcoord_1.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    texcoord IN.texcoord_3
    r0.xyz = saturate(dot(2 * ((IN.texcoord_1.xyz) - 0.5), 2 * ((IN.texcoord_3.xyz) - 0.5)));
    r0.xyz = saturate((PSLightColor[0].rgb * r0.xyz) + AmbientColor.rgb);
    r1.xyz = IN.texcoord_0.xyz * IN.input_0.xyz;
  + r0.w = IN.texcoord_0.w;
    r0.xyz = r0.xyz * r1.xyz;

// approximately 7 instruction slots used (3 texture, 4 arithmetic)
