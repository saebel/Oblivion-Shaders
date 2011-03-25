//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2036.vso /Fcshaderdump19/SLS2036.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 EyePosition;
//   float4 LightPosition[3];
//   row_major float4x4 SkinModelViewProj;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_1        1
//   SkinModelViewProj[1] const_2        1
//   SkinModelViewProj[2] const_3        1
//   SkinModelViewProj[3] const_4        1
//   LightPosition[0]     const_16       1
//   EyePosition       const_25      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//

    const float4 const_0 = {1, 765.01001, 0, 0.5};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r0 = IN.blendindices.zyxw * const_0.y;
    r0 = r0 - floor(r0);
    r2.x = dot(IN.blendweight, const_0.x);
    r1 = (IN.blendindices.zyxw * const_0.y) - r0;
    r0 = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    offset = r1;
    r1.w = const_0.x - r2.x;
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
    r0.w = const_0.x;
    OUT.position.x = dot(SkinModelViewProj[0], r0);
    OUT.position.y = dot(SkinModelViewProj[1], r0);
    OUT.position.z = dot(SkinModelViewProj[2], r0);
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
    OUT.position.w = dot(SkinModelViewProj[3], r0);
    r1.xyz = (r1.w * r1) + r2;
    r4.xyz = normalize(r1);
    r3.xyz = LightPosition[0] - r0;
    r5.xyz = EyePosition - r0;
    r6.xyz = normalize(r3);
    r2.x = dot(r4, r6);
    r0.x = dot(Bones[0 + offset.y], IN.binormal);
    r0.y = dot(Bones[1 + offset.y], IN.binormal);
    r0.z = dot(Bones[2 + offset.y], IN.binormal);
    r1.xyz = r0 * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.binormal);
    r0.y = dot(Bones[1 + offset.x], IN.binormal);
    r0.z = dot(Bones[2 + offset.x], IN.binormal);
    r1.xyz = (IN.blendweight.x * r0) + r1;
    r0.x = dot(Bones[0 + offset.z], IN.binormal);
    r0.y = dot(Bones[1 + offset.z], IN.binormal);
    r0.z = dot(Bones[2 + offset.z], IN.binormal);
    r1.xyz = (IN.blendweight.z * r0) + r1;
    r0.x = dot(Bones[0 + offset.w], IN.binormal);
    r0.y = dot(Bones[1 + offset.w], IN.binormal);
    r0.z = dot(Bones[2 + offset.w], IN.binormal);
    r8.xyz = (r1.w * r0) + r1;
    r0.x = dot(Bones[0 + offset.y], IN.normal);
    r0.y = dot(Bones[1 + offset.y], IN.normal);
    r0.z = dot(Bones[2 + offset.y], IN.normal);
    r1.xyz = r0 * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.normal);
    r0.y = dot(Bones[1 + offset.x], IN.normal);
    r0.z = dot(Bones[2 + offset.x], IN.normal);
    r1.xyz = (IN.blendweight.x * r0) + r1;
    r0.x = dot(Bones[0 + offset.z], IN.normal);
    r0.y = dot(Bones[1 + offset.z], IN.normal);
    r0.z = dot(Bones[2 + offset.z], IN.normal);
    r7.xyz = (IN.blendweight.z * r0) + r1;
    r1.x = dot(Bones[0 + offset.w], IN.normal);
    r1.y = dot(Bones[1 + offset.w], IN.normal);
    r1.z = dot(Bones[2 + offset.w], IN.normal);
    r0.xyz = normalize(r8);
    r7.xyz = (r1.w * r1) + r7;
    r2.y = dot(r0, r6);
    r1.xyz = normalize(r7);
    r2.z = dot(r1, r6);
    r8.x = dot(r5, r5);	// normalize + length
    r1.w = 1.0 / sqrt(r8.x);
    r5.xyz = (r1.w * r5) + r6;
    r6.xyz = normalize(r2);
    OUT.texcoord_1.xyz = r6;
    r2.xyz = normalize(r5);
    OUT.texcoord_3.x = dot(r4, r2);
    r0.w = 1.0 / LightPosition[0].w;
    OUT.texcoord_3.y = dot(r0, r2);
    r0.xyz = r3 * r0.w;
    OUT.texcoord_3.z = dot(r1, r2);
    OUT.texcoord_5.xyz = (const_0.w * r0) + const_0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_5.w = const_0.w;

// approximately 111 instruction slots used
