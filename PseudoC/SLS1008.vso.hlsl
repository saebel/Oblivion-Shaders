//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1008.vso /Fcshaderdump19/SLS1008.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
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
//   EyePosition   const_25      1
//

    const float4 const_4 = {0.5, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    r1.xyz = EyePosition - IN.position;
    r2.x = dot(r1, r1);	// normalize + length
    r0.xyz = LightPosition[0] - IN.position;
    r0.w = 1.0 / sqrt(r2.x);
    r2.x = dot(r0, r0);	// normalize + length
    r1.xyz = r1 * r0.w;
    r0.w = 1.0 / sqrt(r2.x);
    r1.xyz = (r0.w * r0) + r1;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    r2.x = dot(r1, r1);	// normalize + length
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    r0.w = 1.0 / sqrt(r2.x);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r1.xyz = r1 * r0.w;
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    OUT.texcoord_3.x = dot(IN.tangent, r1);
    OUT.texcoord_3.y = dot(IN.binormal, r1);
    OUT.texcoord_3.z = dot(IN.normal, r1);
    r2.xyz = IN.normal;
    r1.x = dot(IN.tangent, r2);
    r1.y = dot(IN.binormal, r2);
    r1.z = dot(IN.normal, IN.normal);
    r0.w = 1.0 / LightPosition[0].w;
    OUT.color_0.rgb = (0.5 * r1) + 0.5;
    r0.xyz = r0 * r0.w;
    OUT.texcoord_1.xy = (0.5 * r0) + 0.5;
    OUT.texcoord_2.x = (r0.z * 0.5) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_2.y = 0.5;

// approximately 29 instruction slots used
