//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1037.pso /Fcshaderdump19/SLS1037.pso.dis
//
//
// Parameters:
//
//   float4 EmittanceColor;
//   sampler2D GlowMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   EmittanceColor const_6       1
//   GlowMap        texture_0       1
//

    const int4 const_0 = {0, 0, 0, 0};
    float2 texcoord_1 : TEXCOORD1;
    sampler2D GlowMap;
    r0.xyzw = tex2D(GlowMap, IN.texcoord_1.xy);
    r0.w = r0.x * EmittanceColor.r;
    r0.xyz = 0;
    OUT.color_0.rgba = r0.xyzw;

// approximately 4 instruction slots used (1 texture, 3 arithmetic)
