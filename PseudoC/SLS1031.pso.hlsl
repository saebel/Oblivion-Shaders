//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1031.pso /Fcshaderdump19/SLS1031.pso.dis
//
//
// Parameters:
//
//   sampler2D DiffuseMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   DiffuseMap   texture_0       1
//

    float2 texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    sampler2D DiffuseMap;
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r0.w = r0.w * IN.color_0.a;
    r0.xyz = IN.color_0.rgb;
    OUT.color_0.rgba = r0.xyzw;

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
