//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2004.vso /Fcshaderdump19/SKIN2004.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
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
//   FogParam       const_23      1
//   FogColor       const_24      1
//   EyePosition    const_25      1
//

    const float4 const_4 = {0.5, 0, 1, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r1.x = dot(IN.tangent, LightDirection[0]);
    r1.y = dot(IN.binormal, LightDirection[0]);
    r0.xyz = EyePosition - IN.position;
    r1.z = dot(IN.normal, LightDirection[0]);
    r2.xyz = normalize(r0);
    r0.x = dot(IN.tangent, r2);
    r0.y = dot(IN.binormal, r2);
    r0.z = dot(IN.normal, r2);
    r4.xyz = normalize(r1);
    OUT.texcoord_1.xyz = r4;
    r4.xyz = normalize(r0);
    OUT.texcoord_6.xyz = r4;
    r1.xyz = LightPosition[1] - IN.position;
    r2.xyz = normalize(r1);
    r0.x = dot(ModelViewProj[0], IN.position);
    r0.y = dot(ModelViewProj[1], IN.position);
    r0.z = dot(ModelViewProj[2], IN.position);
    OUT.texcoord_2.x = dot(IN.tangent, r2);
    r3.x = dot(r0, r0);	// normalize + length
    OUT.texcoord_2.y = dot(IN.binormal, r2);
    r0.w = 1.0 / sqrt(r3.x);
    OUT.texcoord_2.z = dot(IN.normal, r2);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = 1.0 / LightPosition[1].w;
    r0.w = r0.w * r2.w;
    r1.xyz = r1 * r1.w;
    r0.w = max(r0.w, const_4.y);
    OUT.texcoord_4.xyz = (const_4.x * r1) + const_4.x;
    r0.w = min(r0.w, const_4.z);
    OUT.position.xyz = r0;
    OUT.color_1.a = const_4.z - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4.w = const_4.x;
    OUT.color_0 = IN.color_0;
    OUT.color_1.rgb = FogColor;

// approximately 46 instruction slots used
