//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR1000.pso /Fcshaderdump19/HAIR1000.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D AnisoMap;
//   sampler2D DiffuseMap;
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
//   DiffuseMap   texture_0       1
//   NormalMap    texture_1       1
//   AnisoMap     texture_3       1
//

    IN.texcoord_0 = tex2D(DiffuseMap, texcoord_0);
    IN.texcoord_1 = tex2D(DiffuseMap, texcoord_0);
    texm3x2pad IN.texcoord_2, 2 * ((IN.texcoord_1) - 0.5)
    texm3x2IN.texcoord_3 = tex2D(DiffuseMap, texcoord_0);, 2 * ((IN.texcoord_1) - 0.5)
    r0 = IN.texcoord_3 * IN.input_0.w;
    r1.xyz = r0.w * PSLightColor[0];
    r0.xyz = saturate((PSLightColor[0] * r0) + IN.input_0);
    r0.xyz = saturate(r0 + AmbientColor);
    r0.xyz = IN.texcoord_0 * r0;
    mul_x2 r0.xyz, r0, const_7
    r1.xyz = IN.texcoord_1.w * r1;
  + r0.w = IN.texcoord_0.w * AmbientColor.a;
    r0.xyz = (IN.texcoord_0 * r1) + r0;

// approximately 12 instruction slots used (4 texture, 8 arithmetic)
