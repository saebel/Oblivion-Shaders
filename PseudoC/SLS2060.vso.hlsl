//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2060.vso /Fcshaderdump19/SLS2060.vso.dis
//
//
// Parameters:
//
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//

    float4 IN.position : POSITION;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    OUT.position.w = dot(ModelViewProj[3], IN.position);

// approximately 4 instruction slots used
