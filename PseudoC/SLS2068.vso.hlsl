//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2068.vso /Fcshaderdump19/SLS2068.vso.dis
//
//
// Parameters:
//
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
//

    const float4 const_7 = {0.5, 5, -4.4, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.x = dot(WorldViewTranspose[0].xyz, IN.normal.xyz);
    r0.y = dot(WorldViewTranspose[1].xyz, IN.normal.xyz);
    r0.z = dot(WorldViewTranspose[2].xyz, IN.normal.xyz);
    OUT.texcoord_0.xyz = (0.5 * r0) + 0.5;
    r0.y = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.texcoord_1.x = (r0.y * 5) + -4.4;
    OUT.position.z = r0.y;

// approximately 10 instruction slots used
