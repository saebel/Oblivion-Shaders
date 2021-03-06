//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2006.vso /Fcshaderdump19/HAIR2006.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 LightColor[3];
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
//   LightPosition[1] const_17       1
//   LightColor[0]    const_19       1
//   LightColor[1]    const_20       1
//   EyePosition   const_25      1
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r1.xyz = LightPosition[0].xyz - IN.position.xyz;
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r0.w = 1.0 / sqrt(r0.x);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r2.xyz = r1.xyz * r0.w;
    r0.x = dot(IN.tangent.xyz, r2.xyz);
    r0.y = dot(IN.binormal.xyz, r2.xyz);
    r0.z = dot(IN.normal.xyz, r2.xyz);
    r3.xyz = EyePosition.xyz - IN.position.xyz;
    r2.xyz = normalize(r3.xyz);
    r1.xyz = (r0.w * r1.xyz) + r2.xyz;
    r4.xyz = normalize(r0.xyz);
    OUT.texcoord_2.xyz = r4.xyz;
    r0.xyz = normalize(r1.xyz);
    r0.w = 1.0 / r0.w;
    r1.x = dot(IN.tangent.xyz, r0.xyz);
    r1.y = dot(IN.binormal.xyz, r0.xyz);
    r1.z = dot(IN.normal.xyz, r0.xyz);
    r0.x = dot(IN.tangent.xyz, r2.xyz);
    r0.y = dot(IN.binormal.xyz, r2.xyz);
    r0.z = dot(IN.normal.xyz, r2.xyz);
    r4.xyz = normalize(r1.xyz);
    OUT.texcoord_3.xyz = r4.xyz;
    r4.xyz = normalize(r0.xyz);
    OUT.texcoord_1.xyz = r4.xyz;
    r1.w = 1.0 / LightPosition[0].w;
    r0.w = r0.w * r1.w;
    r0.xyz = LightPosition[1].xyz - IN.position.xyz;
    r0.w = max(r0.w, 0);
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r1.w = min(r0.w, 1);
    r2.w = 1.0 / sqrt(r1.x);
    r0.w = 1.0 / r2.w;
    r3.w = 1.0 / LightPosition[1].w;
    r1.w = 1 - r1.w;
    r0.w = r0.w * r3.w;
    r0.xyz = r0.xyz * r2.w;
    r0.w = max(r0.w, 0);
    r0.x = dot(IN.normal.xyz, r0.xyz);
    r0.w = min(r0.w, 1);
    r2.w = max(r0.x, 0);
    r0.w = 1 - r0.w;
    r0.xyz = r2.w * LightColor[1].rgb;
    r0.w = r0.w * r0.w;
    OUT.color_0.a = r1.w * r1.w;
    OUT.color_0.rgb = r0.xyz * r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_1.rgba = IN.color_0.rgba;

// approximately 61 instruction slots used
