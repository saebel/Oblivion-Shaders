//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYCLOUDSI.vso /Fcshaderdump19/SKYCLOUDSI.vso.dis
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

    const float4 ModelViewProj[2] = {0.999998987, 1, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 OUT.position : POSITION;
    float2 OUT.texcoord_0 : TEXCOORD0;
    float2 OUT.texcoord_1 : TEXCOORD1;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.zw = r0.w * ModelViewProj[2].xy;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;

// approximately 6 instruction slots used
