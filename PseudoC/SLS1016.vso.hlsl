//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1016.vso /Fcshaderdump19/SLS1016.vso.dis
//
//
// Parameters:
//
//   float3 LightDirection[3];
//   float4 LightPosition[3];
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
//   LightPosition[0]  const_16       1
//   LightPosition[1]  const_17       1
//

    const float4 const_4 = {0.5, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.xyz = LightPosition[1].xyz - IN.position.xyz;
    r2.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r2.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r0.w = 1.0 / sqrt(r1.x);
    r2.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r1.xyz = r0.xyz * r0.w;
    OUT.color_0.rgb = (0.5 * r2.xyz) + 0.5;
    OUT.texcoord_3.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, r1.xyz);
    r0.w = 1.0 / LightPosition[1].w;
    OUT.texcoord_3.z = dot(IN.normal.xyz, r1.xyz);
    r0.xyz = r0.xyz * r0.w;
    OUT.texcoord_1.xy = (0.5 * r0.xy) + 0.5;
    OUT.texcoord_2.x = (r0.z * 0.5) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.y = 0.5;

// approximately 21 instruction slots used
