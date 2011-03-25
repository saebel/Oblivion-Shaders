//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1027.vso /Fcshaderdump19/SLS1027.vso.dis
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
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 IN.texcoord_2 : TEXCOORD2;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xy = IN.texcoord_0;
    OUT.texcoord_2.xyz = IN.color_0;
    OUT.color_0 = IN.texcoord_1;
    OUT.color_1 = IN.texcoord_2;

// approximately 9 instruction slots used
