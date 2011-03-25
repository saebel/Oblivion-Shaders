//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2005.vso /Fcshaderdump19/SLS2005.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
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
//   FogParam            const_23      1
//   FogColor            const_24      1
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

    const float4 const_0 = {1, 765.01001, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r0 = IN.blendindices.zyxw * const_0.y;
    r0 = r0 - floor(r0);
    r1 = (IN.blendindices.zyxw * const_0.y) - r0;
    r0 = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    offset = r1;
    r3.x = dot(IN.blendweight, const_0.x);
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
    r1.w = const_0.x - r3.x;
    r4.xyz = (IN.blendweight.z * r1) + r2;
    r3.x = dot(Bones[0 + offset.w], r0);
    r3.y = dot(Bones[1 + offset.w], r0);
    r3.z = dot(Bones[2 + offset.w], r0);
    r0.x = dot(Bones[0 + offset.y], IN.tangent);
    r0.y = dot(Bones[1 + offset.y], IN.tangent);
    r0.z = dot(Bones[2 + offset.y], IN.tangent);
    r1.xyz = r0 * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.tangent);
    r0.y = dot(Bones[1 + offset.x], IN.tangent);
    r0.z = dot(Bones[2 + offset.x], IN.tangent);
    r1.xyz = (IN.blendweight.x * r0) + r1;
    r0.x = dot(Bones[0 + offset.z], IN.tangent);
    r0.y = dot(Bones[1 + offset.z], IN.tangent);
    r0.z = dot(Bones[2 + offset.z], IN.tangent);
    r2.xyz = (IN.blendweight.z * r0) + r1;
    r1.x = dot(Bones[0 + offset.w], IN.tangent);
    r1.y = dot(Bones[1 + offset.w], IN.tangent);
    r1.z = dot(Bones[2 + offset.w], IN.tangent);
    r0.xyz = (r1.w * r3) + r4;
    r2.xyz = (r1.w * r1) + r2;
    r1.xyz = normalize(r2);
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
    r1.x = dot(r1, LightDirection[0]);
    r5.xyz = (IN.blendweight.z * r2) + r3;
    r2.x = dot(Bones[0 + offset.w], IN.binormal);
    r2.y = dot(Bones[1 + offset.w], IN.binormal);
    r2.z = dot(Bones[2 + offset.w], IN.binormal);
    r3.x = dot(Bones[0 + offset.y], IN.normal);
    r3.y = dot(Bones[1 + offset.y], IN.normal);
    r3.z = dot(Bones[2 + offset.y], IN.normal);
    r4.xyz = r3 * IN.blendweight.y;
    r3.x = dot(Bones[0 + offset.x], IN.normal);
    r3.y = dot(Bones[1 + offset.x], IN.normal);
    r3.z = dot(Bones[2 + offset.x], IN.normal);
    r4.xyz = (IN.blendweight.x * r3) + r4;
    r3.x = dot(Bones[0 + offset.z], IN.normal);
    r3.y = dot(Bones[1 + offset.z], IN.normal);
    r3.z = dot(Bones[2 + offset.z], IN.normal);
    r4.xyz = (IN.blendweight.z * r3) + r4;
    r3.x = dot(Bones[0 + offset.w], IN.normal);
    r3.y = dot(Bones[1 + offset.w], IN.normal);
    r3.z = dot(Bones[2 + offset.w], IN.normal);
    r2.xyz = (r1.w * r2) + r5;
    r4.xyz = (r1.w * r3) + r4;
    r3.xyz = normalize(r2);
    r2.xyz = normalize(r4);
    r1.y = dot(r3, LightDirection[0]);
    r1.z = dot(r2, LightDirection[0]);
    r0.w = const_0.x;
    OUT.position.w = dot(SkinModelViewProj[3], r0);
    r5.xyz = normalize(r1);
    OUT.texcoord_1.xyz = r5;
    r1.x = dot(ShadowProj[0], r0);
    r1.y = dot(ShadowProj[1], r0);
    r1.w = dot(ShadowProj[3], r0);
    r3.xy = (r1.w * ShadowProjTransform) + r1;
    r2.xy = r1 - ShadowProjData;
    r4.y = r1.w * ShadowProjTransform.w;
    r1.x = dot(SkinModelViewProj[0], r0);
    r1.y = dot(SkinModelViewProj[1], r0);
    r1.z = dot(SkinModelViewProj[2], r0);
    r0.w = 1.0 / r4.y;
    r0.x = dot(r1, r1);	// normalize + length
    OUT.texcoord_7.xy = r3 * r0.w;
    r0.w = 1.0 / sqrt(r0.x);
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    OUT.texcoord_7.z = r2.x * r1.w;
    r0.w = r0.w * r2.w;
    OUT.texcoord_7.w = (r2.y * -r1.w) + const_0.x;
    r0.w = max(r0.w, const_0.z);
    OUT.position.xyz = r1;
    r0.w = min(r0.w, const_0.x);
    OUT.color_1.a = const_0.x - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0 = IN.color_0;
    OUT.color_1.rgb = FogColor;

// approximately 116 instruction slots used
