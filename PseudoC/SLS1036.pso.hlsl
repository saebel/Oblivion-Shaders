//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1036.pso /Fcshaderdump19/SLS1036.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D DiffuseMap;
//   float4 EmittanceColor;
//   sampler2D GlowMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   EmittanceColor const_6       1
//   DiffuseMap     texture_0       1
//   GlowMap        texture_1       1
//

    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    sampler2D DiffuseMap;
    sampler2D GlowMap;
    r1.xyzw = tex2D(GlowMap, IN.texcoord_1.xy);
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r0.xyz = EmittanceColor.rgb;
    r0.xyz = (r1.xyz * r0.xyz) + AmbientColor.rgb;
    OUT.color_0.rgba = r0.xyzw;

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
