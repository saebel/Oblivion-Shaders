//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SKYSICLOUDS.pso /Fcshaderdump19/SKYSICLOUDS.pso.dis
//
//
// Parameters:
//
//   float2 Params;
//   sampler2D TexMap;
//   sampler2D TexMapBlend;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Params       const_4       1
//   TexMap       texture_0       1
//   TexMapBlend  texture_1       1
//

    const int4 const_0 = {0, 0, 0, 0};
    float2 IN.texcoord_0 : TEXCOORD0;
    float2 IN.texcoord_1 : TEXCOORD1;
    sampler2D TexMap;
    sampler2D TexMapBlend;
    r1.xyzw = tex2D(TexMapBlend, IN.texcoord_1.xy);
    r0.xyzw = tex2D(TexMap, IN.texcoord_0.xy);
    r0.z = r1.w - r0.w;
    OUT.color_0.a = (Params.x * r0.z) + r0.w;
    OUT.color_0.rgb = 0;

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
