//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1004.pso /Fcshaderdump19/STB1004.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   NormalMap    texture_0       1
//

    IN.texcoord_0.xyzw = tex2D(NormalMap, texcoord_0.xy);
    texcoord IN.texcoord_1
    r0.xyz = saturate(dot(2 * ((IN.texcoord_0.xyz) - 0.5), 2 * ((IN.texcoord_1.xyz) - 0.5)));
    r0.xyz = r0.xyz * PSLightColor[0].rgb;
  + r0.w = PSLightColor[0].a;

// approximately 4 instruction slots used (2 texture, 2 arithmetic)
