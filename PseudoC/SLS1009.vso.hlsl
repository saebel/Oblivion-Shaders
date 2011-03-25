//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1009.vso /Fcshaderdump19/SLS1009.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 LightDirection[3];
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//   EyePosition    const_25      1
//

    const float4 const_4 = {0.5, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    r0.xyz = EyePosition - IN.position;
    r1.x = dot(r0, r0);	// normalize + length
    r0.w = 1.0 / sqrt(r1.x);
    r0.xyz = (r0.w * r0) + LightDirection[0];
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    r1.x = dot(r0, r0);	// normalize + length
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    r0.w = 1.0 / sqrt(r1.x);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r1.xyz = r0 * r0.w;
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.x = dot(IN.tangent, r1);
    r0.y = dot(IN.binormal, r1);
    r0.z = dot(IN.normal, r1);
    OUT.texcoord_1.xyz = (const_4.x * r0) + const_4.x;
    OUT.texcoord_0.xy = IN.texcoord_0;

// approximately 16 instruction slots used
