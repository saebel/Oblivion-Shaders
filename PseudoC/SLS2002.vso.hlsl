//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2002.vso /Fcshaderdump19/SLS2002.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
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
//   LightDirection[0]    const_13       1
//   FogParam          const_23      1
//   FogColor          const_24      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
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
    OUT.position.w = dot(SkinModelViewProj[3], r0);
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
    r4.xyz = (r1.w * r1) + r2;
    r1.x = dot(Bones[0 + offset.y], IN.binormal);
    r1.y = dot(Bones[1 + offset.y], IN.binormal);
    r1.z = dot(Bones[2 + offset.y], IN.binormal);
    r2.xyz = r1 * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], IN.binormal);
    r1.y = dot(Bones[1 + offset.x], IN.binormal);
    r1.z = dot(Bones[2 + offset.x], IN.binormal);
    r2.xyz = (IN.blendweight.x * r1) + r2;
    r1.x = dot(Bones[0 + offset.z], IN.binormal);
    r1.y = dot(Bones[1 + offset.z], IN.binormal);
    r1.z = dot(Bones[2 + offset.z], IN.binormal);
    r3.xyz = (IN.blendweight.z * r1) + r2;
    r2.x = dot(Bones[0 + offset.w], IN.binormal);
    r2.y = dot(Bones[1 + offset.w], IN.binormal);
    r2.z = dot(Bones[2 + offset.w], IN.binormal);
    r1.xyz = normalize(r4);
    r3.xyz = (r1.w * r2) + r3;
    r2.x = dot(r1, LightDirection[0]);
    r1.xyz = normalize(r3);
    r2.y = dot(r1, LightDirection[0]);
    r1.x = dot(Bones[0 + offset.y], IN.normal);
    r1.y = dot(Bones[1 + offset.y], IN.normal);
    r1.z = dot(Bones[2 + offset.y], IN.normal);
    r3.xyz = r1 * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], IN.normal);
    r1.y = dot(Bones[1 + offset.x], IN.normal);
    r1.z = dot(Bones[2 + offset.x], IN.normal);
    r3.xyz = (IN.blendweight.x * r1) + r3;
    r1.x = dot(Bones[0 + offset.z], IN.normal);
    r1.y = dot(Bones[1 + offset.z], IN.normal);
    r1.z = dot(Bones[2 + offset.z], IN.normal);
    r3.xyz = (IN.blendweight.z * r1) + r3;
    r1.x = dot(Bones[0 + offset.w], IN.normal);
    r1.y = dot(Bones[1 + offset.w], IN.normal);
    r1.z = dot(Bones[2 + offset.w], IN.normal);
    r3.xyz = (r1.w * r1) + r3;
    r1.x = dot(SkinModelViewProj[0], r0);
    r1.y = dot(SkinModelViewProj[1], r0);
    r1.z = dot(SkinModelViewProj[2], r0);
    r0.xyz = normalize(r3);
    r3.x = dot(r1, r1);	// normalize + length
    r2.z = dot(r0, LightDirection[0]);
    r0.w = 1.0 / sqrt(r3.x);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    r0.w = r0.w * r2.w;
    r3.xyz = normalize(r2);
    OUT.texcoord_1.xyz = r3;
    r0.w = max(r0.w, const_0.z);
    OUT.position.xyz = r1;
    r0.w = min(r0.w, const_0.x);
    OUT.color_1.a = const_0.x - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0 = IN.color_0;
    OUT.color_1.rgb = FogColor;

// approximately 105 instruction slots used
