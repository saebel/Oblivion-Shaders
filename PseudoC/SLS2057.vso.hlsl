//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2057.vso /Fcshaderdump19/SLS2057.vso.dis
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
//

    const float4 const_6 = {0.1, -0.1, (1.0 / 750), 0.8};
    const int4 const_7 = {1, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    r0.x = dot(WorldViewTranspose[0], IN.normal);
    r0.y = dot(WorldViewTranspose[1], IN.normal);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.xy = min(r0, 0.1);
    OUT.texcoord_1.xy = max(r0, -0.1);
    r0.y = dot(ModelViewProj[2], IN.position);
    r0.w = (r0.y * (1.0 / 750)) + 0.8;
    OUT.position.z = r0.y;
    OUT.texcoord_0.z = max(r0.w, 1);
    OUT.texcoord_0.xy = IN.texcoord_0;

// approximately 12 instruction slots used
