//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2048.vso /Fcshaderdump19/SLS2048.vso.dis
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

    const float4 const_4 = {0.5, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 IN.texcoord_2 : TEXCOORD2;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.xyz = LightPosition[0] - IN.position;
    r2.xyz = normalize(r0);
    r0.xyz = EyePosition - IN.position;
    r1.x = dot(IN.tangent, r2);
    r3.x = dot(r0, r0);	// normalize + length
    r1.y = dot(IN.binormal, r2);
    r0.w = 1.0 / sqrt(r3.x);
    r1.z = dot(IN.normal, r2);
    r2.xyz = (r0.w * r0) + r2;
    r0.xyz = normalize(r1);
    r1.xyz = normalize(r2);
    OUT.texcoord_2.xyz = (0.5 * r0) + 0.5;
    r0.x = dot(IN.tangent, r1);
    r0.y = dot(IN.binormal, r1);
    r0.z = dot(IN.normal, r1);
    OUT.texcoord_3.xyz = (0.5 * r0) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xyz = IN.color_0;
    OUT.texcoord_2.w = 1;
    OUT.color_0 = IN.texcoord_1;
    OUT.color_1 = IN.texcoord_2;

// approximately 31 instruction slots used
