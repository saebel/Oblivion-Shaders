//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/REFRACT2000.vso /Fcshaderdump19/REFRACT2000.vso.dis
//
//
// Parameters:
//
//   float4 texRatio0;
//   float4 texRatio1;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   texRatio0    const_6       1
//   texRatio1    const_7       1
//

    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    OUT.texcoord_0.xy = (IN.texcoord_0 * texRatio0) + texRatio0.zwzw;
    OUT.texcoord_1.xy = (IN.texcoord_0 * texRatio1) + texRatio1.zwzw;
    OUT.position = IN.position;

// approximately 3 instruction slots used
