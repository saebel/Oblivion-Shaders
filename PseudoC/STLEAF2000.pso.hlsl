//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/STLEAF2000.pso /Fcshaderdump19/STLEAF2000.pso.dis
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

    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1;			// partial precision
    sampler2D DiffuseMap;
    r0 = tex2D(DiffuseMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0 * IN.texcoord_1;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
