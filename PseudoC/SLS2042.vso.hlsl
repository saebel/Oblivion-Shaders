//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2042.vso /Fcshaderdump19/SLS2042.vso.dis
//
//
// Parameters:
//
//   float3 LightDirection[3];
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
//   LightDirection[0]      const_13       1
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
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.x = dot(IN.tangent, LightDirection[0]);
    r0.y = dot(IN.binormal, LightDirection[0]);
    r0.z = dot(IN.normal, LightDirection[0]);
    r0.w = dot(ShadowProj[3], IN.position);
    OUT.texcoord_3.xyz = (const_4.x * r0) + const_4.x;
    r1.y = r0.w * ShadowProjTransform.w;
    r0.x = dot(ShadowProj[0], IN.position);
    r0.y = dot(ShadowProj[1], IN.position);
    r1.w = 1.0 / r1.y;
    r1.xy = (r0.w * ShadowProjTransform) + r0;
    r0.xy = r0 - ShadowProjData;
    r0.w = 1.0 / ShadowProjData.w;
    OUT.texcoord_4.xy = r1.w * r1;
    OUT.texcoord_4.z = r0.x * r0.w;
    OUT.texcoord_4.w = (r0.y * -r0.w) + const_4.y;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xy = IN.texcoord_0;
    OUT.texcoord_2 = (IN.color_0.xyzx * const_4.yyyz) + const_4.zzzy;

// approximately 22 instruction slots used
