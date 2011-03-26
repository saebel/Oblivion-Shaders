//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR1005.vso /Fcshaderdump19/HAIR1005.vso.dis
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
//   LightPosition[2] const_18       1
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
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    r0.xyz = LightPosition[0] - IN.position;
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r1.x = dot(r0, r0);	// normalize + length
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.w = 1.0 / sqrt(r1.x);
    r2.xyz = r0 * r0.w;
    r1.xyz = EyePosition - IN.position;
    r0.w = 1.0 / r0.w;
    r3.x = dot(r1, r1);	// normalize + length
    r0.x = dot(IN.tangent, r2);
    r1.w = 1.0 / sqrt(r3.x);
    r0.y = dot(IN.binormal, r2);
    r1.xyz = (r1.w * r1) + r2;
    r0.z = dot(IN.normal, r2);
    r3.x = dot(r1, r1);	// normalize + length
    r2.x = dot(r0, r0);	// normalize + length
    r2.w = 1.0 / sqrt(r3.x);
    r1.w = 1.0 / sqrt(r2.x);
    r1.xyz = r1 * r2.w;
    OUT.texcoord_2.xyz = r0 * r1.w;
    r0.x = dot(IN.tangent, r1);
    r0.y = dot(IN.binormal, r1);
    r0.z = dot(IN.normal, r1);
    r1.x = dot(r0, r0);	// normalize + length
    r2.w = 1.0 / LightPosition[0].w;
    r1.w = 1.0 / sqrt(r1.x);
    r0.w = r0.w * r2.w;
    OUT.texcoord_3.xyz = r0 * r1.w;
    r0.w = max(r0.w, 0);
    r0.w = min(r0.w, 1);
    r0.xyz = LightPosition[2] - IN.position;
    r0.w = 1 - r0.w;
    r1.x = dot(r0, r0);	// normalize + length
    OUT.color_0.a = r0.w * r0.w;
    r0.w = 1.0 / sqrt(r1.x);
    r0.xyz = r0 * r0.w;
    r0.w = 1.0 / r0.w;
    r0.x = dot(IN.normal, r0);
    r2.w = 1.0 / LightPosition[2].w;
    r1.w = max(r0.x, 0);
    r0.w = r0.w * r2.w;
    r1.w = min(r1.w, 1);
    r0.w = max(r0.w, 0);
    r1.xyz = r1.w * LightColor[1];
    r0.w = min(r0.w, 1);
    r0.w = 1 - r0.w;
    r0.xyz = LightPosition[1] - IN.position;
    r0.w = r0.w * r0.w;
    r2.x = dot(r0, r0);	// normalize + length
    r1.xyz = r1 * r0.w;
    r2.w = 1.0 / sqrt(r2.x);
    r0.w = 1.0 / r2.w;
    r1.w = 1.0 / LightPosition[1].w;
    r0.xyz = r0 * r2.w;
    r0.w = r0.w * r1.w;
    r0.x = dot(IN.normal, r0);
    r0.w = max(r0.w, 0);
    r1.w = max(r0.x, 0);
    r0.w = min(r0.w, 1);
    r1.w = min(r1.w, 1);
    r0.w = 1 - r0.w;
    r0.xyz = r1.w * LightColor[1];
    r0.w = r0.w * r0.w;
    OUT.color_0.rgb = (r0.w * r0) + r1;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xy = IN.texcoord_0;
    OUT.color_1 = IN.color_0;

// approximately 69 instruction slots used
