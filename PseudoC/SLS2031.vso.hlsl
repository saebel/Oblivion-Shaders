//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2031.vso /Fcshaderdump19/SLS2031.vso.dis
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

    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r0.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r1.xyz = EyePosition.xyz - IN.position.xyz;
    r0.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r3.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r3.x);
    r1.xyz = (r1.w * r1.xyz) + LightDirection[0].xyz;
    r2.xyz = normalize(r0.xyz);
    OUT.texcoord_1.xyz = r2.xyz;
    r0.xyz = normalize(r1.xyz);
    OUT.texcoord_3.x = dot(IN.tangent.xyz, r0.xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, r0.xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, r0.xyz);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

// approximately 22 instruction slots used
