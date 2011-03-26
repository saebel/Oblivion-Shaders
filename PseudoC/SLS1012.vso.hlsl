//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1012.vso /Fcshaderdump19/SLS1012.vso.dis
//
//
// Parameters:
//
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
//

    const float4 const_4 = {0.5, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r0.x = dot(IN.tangent, LightDirection[0]);
    r0.y = dot(IN.binormal, LightDirection[0]);
    r0.z = dot(IN.normal, LightDirection[0]);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    OUT.texcoord_3.xyz = (0.5 * r0) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xy = IN.texcoord_0;
    OUT.texcoord_2.xy = IN.texcoord_0;
    OUT.color_0 = IN.color_0;

// approximately 12 instruction slots used
