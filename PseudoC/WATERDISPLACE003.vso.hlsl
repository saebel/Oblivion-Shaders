//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE003.vso
//    /Fcshaderdump19/WATERDISPLACE003.vso.dis
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
//   texRatio0    const_6       1
//

    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    OUT.texcoord_0.xy = (IN.texcoord_0 * texRatio0) + texRatio0.zwzw;
    OUT.position.xyzw = IN.position;

// approximately 2 instruction slots used
