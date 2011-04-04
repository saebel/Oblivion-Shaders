//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SKYTEX.pso /Fcshaderdump19/SKYTEX.pso.dis
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

    float2 IN.texcoord_0 : TEXCOORD0;
    float2 IN.texcoord_1 : TEXCOORD1;
    float4 IN.color_0 : COLOR0;
    sampler2D TexMap;
    sampler2D TexMapBlend;
    r2.xyzw = tex2D(TexMap, IN.texcoord_0.xy);
    r1.xyzw = tex2D(TexMapBlend, IN.texcoord_1.xy);
    r0.xyzw = lerp(r1.xyzw, r2.xyzw, Params.x);
    r0.xyz = r0.xyz * IN.color_0.rgb;
    OUT.color_0.a = r0.w * IN.color_0.a;
    OUT.color_0.rgb = r0.xyz * Params.y;

// approximately 7 instruction slots used (2 texture, 5 arithmetic)
