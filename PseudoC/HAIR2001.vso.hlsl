//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2001.vso /Fcshaderdump19/HAIR2001.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 LightColor[3];
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
//   LightColor[0]     const_19       1
//   LightColor[1]     const_20       1
//   EyePosition    const_25      1
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r0.xyz = EyePosition - IN.position;
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r1.x = dot(r0, r0);	// normalize + length
    r2.x = dot(IN.tangent, LightDirection[0]);
    r1.w = 1.0 / sqrt(r1.x);
    r2.y = dot(IN.binormal, LightDirection[0]);
    r1.xyz = (r1.w * r0) + LightDirection[0];
    r2.z = dot(IN.normal, LightDirection[0]);
    r3.xyz = normalize(r1);
    r1.x = dot(IN.tangent, r3);
    r1.y = dot(IN.binormal, r3);
    r1.z = dot(IN.normal, r3);
    r3.xyz = normalize(r2);
    OUT.texcoord_2.xyz = r3;
    r0.xyz = r0 * r1.w;
    r3.xyz = normalize(r1);
    OUT.texcoord_3.xyz = r3;
    r1.x = dot(IN.tangent, r0);
    r1.y = dot(IN.binormal, r0);
    r1.z = dot(IN.normal, r0);
    r0.xyz = LightPosition[1] - IN.position;
    r2.x = dot(r0, r0);	// normalize + length
    r1.w = 1.0 / sqrt(r2.x);
    r0.w = 1.0 / r1.w;
    r2.w = 1.0 / LightPosition[1].w;
    r3.xyz = normalize(r1);
    OUT.texcoord_1.xyz = r3;
    r0.w = r0.w * r2.w;
    r0.xyz = r0 * r1.w;
    r0.w = max(r0.w, const_4.x);
    r0.x = dot(IN.normal, r0);
    r0.w = min(r0.w, const_4.y);
    r1.w = max(r0.x, const_4.x);
    r0.w = const_4.y - r0.w;
    r0.xyz = r1.w * LightColor[1];
    r0.w = r0.w * r0.w;
    OUT.color_0.rgb = r0 * r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0.a = const_4.y;
    OUT.color_1 = IN.color_0;

// approximately 51 instruction slots used
