//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2059.vso /Fcshaderdump19/SLS2059.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
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
//   WorldViewTranspose[0] const_4        1
//   WorldViewTranspose[1] const_5        1
//   WorldViewTranspose[2] const_6        1
//   Time               const_22      1
//   EyePosition        const_25      1
//

    const float4 const_7 = {(1.0 / 300), 0.02, 1, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.xyz = EyePosition - IN.position;
    r1.xyz = normalize(r0);
    r0 = IN.position * const_7.x;
    OUT.texcoord_1.x = dot(IN.normal, r1);
    r1.y = dot(WorldViewTranspose[2], r0);
    r1.w = r1.y * const_7.y;
    OUT.texcoord_0.z = r1.y;
    r1.x = dot(WorldViewTranspose[0], r0);
    r1.y = dot(WorldViewTranspose[1], r0);
    OUT.texcoord_0.w = max(r1.w, const_7.z);
    OUT.texcoord_0.xy = r1 - Time.x;

// approximately 17 instruction slots used
