//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2052.vso /Fcshaderdump19/SLS2052.vso.dis
//
//
// Parameters:
//
//   float4 LightPosition[3];
//   row_major float4x4 ModelViewProj;
//   row_major float4x4 WorldViewTranspose;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   ModelViewProj[0]      const_0        1
//   ModelViewProj[1]      const_1        1
//   ModelViewProj[2]      const_2        1
//   ModelViewProj[3]      const_3        1
//   WorldViewTranspose[0] const_4        1
//   WorldViewTranspose[1] const_5        1
//   WorldViewTranspose[2] const_6        1
//   LightPosition[0]      const_16       1
//

    float4 IN.position : POSITION;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_1.x = dot(WorldViewTranspose[0].xyzw, IN.position.xyzw);
    OUT.texcoord_1.y = dot(WorldViewTranspose[1].xyzw, IN.position.xyzw);
    OUT.texcoord_1.z = dot(WorldViewTranspose[2].xyzw, IN.position.xyzw);
    OUT.texcoord_1.w = LightPosition[0].w;

// approximately 8 instruction slots used
