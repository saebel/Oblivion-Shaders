//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2003.vso /Fcshaderdump19/HAIR2003.vso.dis
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
//   LightPosition[2]  const_18       1
//   LightColor[0]     const_19       1
//   LightColor[1]     const_20       1
//   LightColor[2]     const_21       1
//   EyePosition    const_25      1
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.xyz = EyePosition.xyz - IN.position;
    r2.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r2.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r0.w = 1.0 / sqrt(r1.x);
    r2.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r1.xyz = (r0.w * r0.xyz) + LightDirection[0].xyz;
    r3.xyz = normalize(r1);
    r1.x = dot(IN.tangent.xyz, r3.xyz);
    r1.y = dot(IN.binormal.xyz, r3.xyz);
    r1.z = dot(IN.normal.xyz, r3.xyz);
    r4.xyz = normalize(r2);
    OUT.texcoord_2.xyz = r4.xyz;
    r0.xyz = r0.xyz * r0.w;
    r4.xyz = normalize(r1);
    OUT.texcoord_3.xyz = r4.xyz;
    r1.x = dot(IN.tangent.xyz, r0.xyz);
    r1.y = dot(IN.binormal.xyz, r0.xyz);
    r1.z = dot(IN.normal.xyz, r0.xyz);
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r0.xyz = LightPosition[2].xyz - IN.position;
    r0.w = 1.0 / sqrt(r2.x);
    r2.x = dot(r0.xyz, r0.xyz);	// normalize + length
    OUT.texcoord_1.xyz = r1.xyz * r0.w;
    r0.w = 1.0 / sqrt(r2.x);
    r0.xyz = r0.xyz * r0.w;
    r0.w = 1.0 / r0.w;
    r0.x = dot(IN.normal.xyz, r0.xyz);
    r2.w = 1.0 / LightPosition[2].w;
    r1.w = max(r0.x, 0);
    r0.w = r0.w * r2.w;
    r1.xyz = r1.w * LightColor[2].rgb;
    r0.w = max(r0.w, 0);
    r0.w = min(r0.w, 1);
    r0.xyz = LightPosition[1].xyz - IN.position;
    r0.w = 1 - r0.w;
    r2.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r3.w = r0.w * r0.w;
    r1.w = 1.0 / sqrt(r2.x);
    r0.w = 1.0 / r1.w;
    r2.w = 1.0 / LightPosition[1].w;
    r1.xyz = r1.xyz * r3.w;
    r0.w = r0.w * r2.w;
    r0.xyz = r0.xyz * r1.w;
    r0.w = max(r0.w, 0);
    r0.x = dot(IN.normal.xyz, r0.xyz);
    r0.w = min(r0.w, 1);
    r1.w = max(r0.x, 0);
    r0.w = 1 - r0.w;
    r0.xyz = r1.w * LightColor[1].rgb;
    r0.w = r0.w * r0.w;
    OUT.color_0.rgb = (r0.w * r0.xyz) + r1.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0.a = 1;
    OUT.color_1.rgba = IN.color_0;

// approximately 65 instruction slots used
