//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISHIT2000.vso /Fcshaderdump19/ISHIT2000.vso.dis
//
//
// Parameters:
//
//   float4 texRatio0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   texRatio0    texRatio0       1
//

    position input_0;
    texcoord input_1;
    texcoord_0.xy = (texRatio0 * input_1) + texRatio0.zwzw;
    position = input_0;

// approximately 2 instruction slots used
