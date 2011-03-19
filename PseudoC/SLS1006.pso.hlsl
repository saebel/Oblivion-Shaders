//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1006.pso /Fcshaderdump19/SLS1006.pso.dis
//
//
// Parameters:
//
//   sampler2D DiffuseMap;
//   float4 EmittanceColor;
//   sampler2D LayerMap;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   EmittanceColor EmittanceColor       1
//   DiffuseMap     DiffuseMap       1
//   LayerMap       LayerMap       1
//

    const_0 = {-0.5, 0.5, 0, 0};
    texcoord input_0.xy;
    color input_0.xy;
    sampler DiffuseMap;
    sampler LayerMap;
    r1 = LayerMap[texcoord_0];
    r0 = DiffuseMap[texcoord_0];
    r2.w = const_0.x;
    r2.xyz = r2.w - EmittanceColor;
    r2.xyz = (input_0.y * r2) - const_0.y;
    r3.xyz = r2 - r2;
    r2.xyz = r1.w * (r1 - r0) + r0;
    r0.xyz = r3 * r2;
    rendertarget_0 = r0;

// approximately 10 instruction slots used (2 texture, 8 arithmetic)