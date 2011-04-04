//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STFROND2000.pso /Fcshaderdump19/STFROND2000.pso.dis
//
//
// Parameters:
//
//   sampler2D DiffuseMap;
//   float SunlightDimmer;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   SunlightDimmer const_0       1
//   DiffuseMap     texture_0       1
//

    float2 texcoord_0 : TEXCOORD0;
    float3 IN.color_0 : COLOR0;
    float3 IN.color_1 : COLOR1;
    sampler2D DiffuseMap;
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r1.xyz = IN.color_1.rgb;
    r1.xyz = (SunlightDimmer.x * r1.xyz) + IN.color_0.rgb;
    r0.xyz = r0.xyz * r1.xyz;
    OUT.color_0.rgba = r0.xyzw;

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
