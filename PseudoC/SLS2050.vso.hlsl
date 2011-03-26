//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2050.vso /Fcshaderdump19/SLS2050.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float4 LightPosition[3];
//   row_major float4x4 ModelViewProj;
//   row_major float4x4 ShadowProj;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   ModelViewProj[0]       const_0        1
//   ModelViewProj[1]       const_1        1
//   ModelViewProj[2]       const_2        1
//   ModelViewProj[3]       const_3        1
//   LightPosition[0]       const_16       1
//   EyePosition         const_25      1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
//

    const float4 const_4 = {0.5, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    r0.xyz = LightPosition[0] - IN.position;
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r2.xyz = normalize(r0);
    r3.x = dot(IN.tangent, r2);
    r0.xyz = EyePosition - IN.position;
    r3.y = dot(IN.binormal, r2);
    r1.x = dot(r0, r0);	// normalize + length
    r3.z = dot(IN.normal, r2);
    r0.w = 1.0 / sqrt(r1.x);
    r1.xyz = normalize(r3);
    r0.xyz = (r0.w * r0) + r2;
    OUT.texcoord_2.xyz = (0.5 * r1) + 0.5;
    r1.xyz = normalize(r0);
    r0.x = dot(IN.tangent, r1);
    r0.y = dot(IN.binormal, r1);
    r0.z = dot(IN.normal, r1);
    r0.w = dot(ShadowProj[3], IN.position);
    OUT.texcoord_3.xyz = (0.5 * r0) + 0.5;
    r1.y = r0.w * ShadowProjTransform.w;
    r0.x = dot(ShadowProj[0], IN.position);
    r0.y = dot(ShadowProj[1], IN.position);
    r1.w = 1.0 / r1.y;
    r1.xy = (r0.w * ShadowProjTransform) + r0;
    r0.xy = r0 - ShadowProjData;
    r0.w = 1.0 / ShadowProjData.w;
    OUT.texcoord_4.xy = r1.w * r1;
    OUT.texcoord_4.z = r0.x * r0.w;
    OUT.texcoord_4.w = (r0.y * -r0.w) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xyz = IN.color_0;
    OUT.texcoord_2.w = 1;

// approximately 40 instruction slots used
