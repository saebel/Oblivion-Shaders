//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3022.vso /Fcshaderdump19/SM3022.vso.dis
//
//
// Parameters:
//
//   float3 EyePosition;
//   row_major float4x4 ModelViewProj;
//   float Time;
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
//   WorldViewTranspose[0] const_5        1
//   WorldViewTranspose[1] const_6        1
//   WorldViewTranspose[2] const_7        1
//   EyePosition        const_14      1
//   Time               const_19      1
//

    const float4 const_4 = {(1.0 / 300), 0.02, 1, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 OUT.position : POSITION;
    float4 OUT.texcoord_0 : TEXCOORD0;
    float OUT.texcoord_1 : TEXCOORD1;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.xyz = EyePosition.xyz - IN.position;
    r1.xyz = normalize(r0);
    r0.xyzw = (1.0 / 300) * IN.position;
    OUT.texcoord_1.x = dot(IN.normal.xyz, r1.xyz);
    r1.y = dot(WorldViewTranspose[2].xyzw, r0.xyzw);
    r1.w = r1.y * 0.02;
    OUT.texcoord_0.z = r1.y;
    r1.x = dot(WorldViewTranspose[0].xyzw, r0.xyzw);
    r1.y = dot(WorldViewTranspose[1].xyzw, r0.xyzw);
    OUT.texcoord_0.w = max(r1.w, 1);
    OUT.texcoord_0.xy = r1.xy - Time.x;

// approximately 17 instruction slots used
