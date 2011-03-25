//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1003.vso /Fcshaderdump19/SLS1003.vso.dis
//
//
// Parameters:
//
//   float4 LightPosition[3];
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
//   LightPosition[0] const_16       1
//

    const float4 const_4 = {0.5, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    r0.xyz = LightPosition[0] - IN.position;
    r1.x = dot(r0, r0);	// normalize + length
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    r0.w = 1.0 / sqrt(r1.x);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    r2.xyz = r0 * r0.w;
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r1.x = dot(IN.tangent, r2);
    r1.y = dot(IN.binormal, r2);
    r1.z = dot(IN.normal, r2);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r2.x = dot(r1, r1);	// normalize + length
    r1.w = 1.0 / sqrt(r2.x);
    r0.w = 1.0 / LightPosition[0].w;
    OUT.texcoord_3.xyz = r1 * r1.w;
    r0.xyz = r0 * r0.w;
    OUT.texcoord_1.xy = (const_4.x * r0) + const_4.x;
    OUT.texcoord_2.x = (r0.z * const_4.x) + const_4.x;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_2.y = const_4.x;

// approximately 20 instruction slots used
