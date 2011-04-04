//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1007.pso /Fcshaderdump19/STB1007.pso.dis
//
//
// Parameters:
//
//   float3 LightColor[3];
//   sampler2D NormalMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   LightColor   const_0       1
//   NormalMap    texture_0       1
//

    const int4 const_1 = {1, 0, 0, 0};
    IN.texcoord_0.xyzw = tex2D(NormalMap, texcoord_0.xy);
    texcoord IN.texcoord_1
    r0.xyzw = saturate(dot(2 * ((IN.texcoord_0.xyz) - 0.5), 2 * ((IN.texcoord_1.xyz) - 0.5)));
    r0.w = r0.w * r0.w;
    r0.w = r0.w * r0.w;
    r1.w = r0.w * r0.w;
    IN.texcoord_1.xyzw = dot(const_1.xyz, LightColor.rgb);
    r1.w = r1.w * IN.texcoord_1.w;
    r0.w = IN.texcoord_0.w * r0.w;
  + r0.xyz = IN.texcoord_0.w * r1.w;

// approximately 9 instruction slots used (2 texture, 7 arithmetic)
