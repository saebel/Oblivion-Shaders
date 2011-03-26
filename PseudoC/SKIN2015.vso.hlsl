//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2015.vso /Fcshaderdump19/SKIN2015.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 EyePosition;
//   float3 LightDirection[3];
//   float4 LightPosition[3];
//   row_major float4x4 ShadowProj;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//   row_major float4x4 SkinModelViewProj;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   SkinModelViewProj[0]   const_1        1
//   SkinModelViewProj[1]   const_2        1
//   SkinModelViewProj[2]   const_3        1
//   SkinModelViewProj[3]   const_4        1
//   LightDirection[0]      const_13       1
//   LightPosition[0]       const_16       1
//   LightPosition[1]       const_17       1
//   LightPosition[2]       const_18       1
//   EyePosition         const_25      1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
//   Bones[0]               const_42      18
//   Bones[1]               const_43      18
//   Bones[2]               const_44      18
//

    const float4 const_0 = {1, 765.01001, 0, 0.5};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r0 = IN.blendindices.zyxw * 765.01001;
    r0 = frac(r0);
    r2.x = dot(IN.blendweight, 1);
    r1 = (IN.blendindices.zyxw * 765.01001) - r0;
    r0 = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    offset = r1;
    r1.w = 1 - r2.x;
    r1.x = dot(Bones[0 + offset.y], r0);
    r1.y = dot(Bones[1 + offset.y], r0);
    r1.z = dot(Bones[2 + offset.y], r0);
    r2.xyz = r1 * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], r0);
    r1.y = dot(Bones[1 + offset.x], r0);
    r1.z = dot(Bones[2 + offset.x], r0);
    r2.xyz = (IN.blendweight.x * r1) + r2;
    r1.x = dot(Bones[0 + offset.z], r0);
    r1.y = dot(Bones[1 + offset.z], r0);
    r1.z = dot(Bones[2 + offset.z], r0);
    r2.xyz = (IN.blendweight.z * r1) + r2;
    r1.x = dot(Bones[0 + offset.w], r0);
    r1.y = dot(Bones[1 + offset.w], r0);
    r1.z = dot(Bones[2 + offset.w], r0);
    r0.xyz = (r1.w * r1) + r2;
    r0.w = 1;
    OUT.position.x = dot(SkinModelViewProj[0], r0);
    OUT.position.y = dot(SkinModelViewProj[1], r0);
    r1.x = dot(Bones[0 + offset.y], IN.tangent);
    r1.y = dot(Bones[1 + offset.y], IN.tangent);
    r1.z = dot(Bones[2 + offset.y], IN.tangent);
    r2.xyz = r1 * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], IN.tangent);
    r1.y = dot(Bones[1 + offset.x], IN.tangent);
    r1.z = dot(Bones[2 + offset.x], IN.tangent);
    r2.xyz = (IN.blendweight.x * r1) + r2;
    r1.x = dot(Bones[0 + offset.z], IN.tangent);
    r1.y = dot(Bones[1 + offset.z], IN.tangent);
    r1.z = dot(Bones[2 + offset.z], IN.tangent);
    r2.xyz = (IN.blendweight.z * r1) + r2;
    r1.x = dot(Bones[0 + offset.w], IN.tangent);
    r1.y = dot(Bones[1 + offset.w], IN.tangent);
    r1.z = dot(Bones[2 + offset.w], IN.tangent);
    OUT.position.z = dot(SkinModelViewProj[2], r0);
    r1.xyz = (r1.w * r1) + r2;
    OUT.position.w = dot(SkinModelViewProj[3], r0);
    r5.xyz = normalize(r1);
    r1.x = dot(r5, LightDirection[0]);
    r2.x = dot(Bones[0 + offset.y], IN.binormal);
    r2.y = dot(Bones[1 + offset.y], IN.binormal);
    r2.z = dot(Bones[2 + offset.y], IN.binormal);
    r3.xyz = r2 * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], IN.binormal);
    r2.y = dot(Bones[1 + offset.x], IN.binormal);
    r2.z = dot(Bones[2 + offset.x], IN.binormal);
    r3.xyz = (IN.blendweight.x * r2) + r3;
    r2.x = dot(Bones[0 + offset.z], IN.binormal);
    r2.y = dot(Bones[1 + offset.z], IN.binormal);
    r2.z = dot(Bones[2 + offset.z], IN.binormal);
    r3.xyz = (IN.blendweight.z * r2) + r3;
    r2.x = dot(Bones[0 + offset.w], IN.binormal);
    r2.y = dot(Bones[1 + offset.w], IN.binormal);
    r2.z = dot(Bones[2 + offset.w], IN.binormal);
    r6.xyz = (r1.w * r2) + r3;
    r2.x = dot(Bones[0 + offset.y], IN.normal);
    r2.y = dot(Bones[1 + offset.y], IN.normal);
    r2.z = dot(Bones[2 + offset.y], IN.normal);
    r3.xyz = r2 * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], IN.normal);
    r2.y = dot(Bones[1 + offset.x], IN.normal);
    r2.z = dot(Bones[2 + offset.x], IN.normal);
    r3.xyz = (IN.blendweight.x * r2) + r3;
    r2.x = dot(Bones[0 + offset.z], IN.normal);
    r2.y = dot(Bones[1 + offset.z], IN.normal);
    r2.z = dot(Bones[2 + offset.z], IN.normal);
    r3.xyz = (IN.blendweight.z * r2) + r3;
    r2.x = dot(Bones[0 + offset.w], IN.normal);
    r2.y = dot(Bones[1 + offset.w], IN.normal);
    r2.z = dot(Bones[2 + offset.w], IN.normal);
    r4.xyz = normalize(r6);
    r3.xyz = (r1.w * r2) + r3;
    r1.y = dot(r4, LightDirection[0]);
    r2.xyz = normalize(r3);
    r1.z = dot(r2, LightDirection[0]);
    r3.xyz = EyePosition - r0;
    r6.xyz = normalize(r3);
    r3.x = dot(r5, r6);
    r3.y = dot(r4, r6);
    r3.z = dot(r2, r6);
    r6.xyz = normalize(r1);
    OUT.texcoord_1.xyz = r6;
    r1.x = dot(r3, r3);	// normalize + length
    r1.w = 1.0 / sqrt(r1.x);
    r1.xyz = LightPosition[1] - r0;
    OUT.texcoord_7.xyz = r3 * r1.w;
    r3.xyz = normalize(r1);
    OUT.texcoord_2.x = dot(r5, r3);
    OUT.texcoord_2.y = dot(r4, r3);
    OUT.texcoord_2.z = dot(r2, r3);
    r1.w = 1.0 / LightPosition[1].w;
    r3.xyz = r1 * r1.w;
    r1.xyz = LightPosition[2] - r0;
    OUT.texcoord_4.xyz = (0.5 * r3) + 0.5;
    r3.xyz = normalize(r1);
    OUT.texcoord_3.x = dot(r5, r3);
    OUT.texcoord_3.y = dot(r4, r3);
    OUT.texcoord_3.z = dot(r2, r3);
    r1.w = 1.0 / LightPosition[2].w;
    r1.xyz = r1 * r1.w;
    r2.x = dot(ShadowProj[0], r0);
    r2.y = dot(ShadowProj[1], r0);
    r0.w = dot(ShadowProj[3], r0);
    OUT.texcoord_5.xyz = (0.5 * r1) + 0.5;
    r1.xy = (r0.w * ShadowProjTransform) + r2;
    r0.xy = r2 - ShadowProjData;
    r2.y = r0.w * ShadowProjTransform.w;
    r1.w = 1.0 / r2.y;
    r0.w = 1.0 / ShadowProjData.w;
    OUT.texcoord_6.xy = r1 * r1.w;
    OUT.texcoord_6.z = r0.x * r0.w;
    OUT.texcoord_6.w = (r0.y * -r0.w) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_5.w = 0.5;

// approximately 136 instruction slots used
