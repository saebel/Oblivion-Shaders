//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3001.vso /Fcshaderdump19/SM3001.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 FogColor;
//   float4 FogParam;
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
//   FogParam          const_15      1
//   FogColor          const_16      1
//   Bones[0]             const_31      18
//   Bones[1]             const_32      18
//   Bones[2]             const_33      18
//

    const float4 const_0 = {1, 765.01001, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    float4 OUT.position : POSITION;
    float2 OUT.texcoord_0 : TEXCOORD0;
    float4 OUT.color_0 : COLOR0;
    float3 OUT.texcoord_3 : TEXCOORD3;
    float3 OUT.texcoord_4 : TEXCOORD4;
    float3 OUT.texcoord_5 : TEXCOORD5;
    float3 OUT.texcoord_6 : TEXCOORD6;
    float4 OUT.texcoord_7 : TEXCOORD7;
    r1 = const_0.y * IN.blendindices.zyxw;
    r0 = r1 - floor(r1);
    r0 = r1 - r0;
    r1.w = dot(IN.blendweight, const_0.x);
    offset = r0;
    r1.w = const_0.x - r1.w;
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
    r1.xyz = (IN.blendweight.z * r0) + r1;
    r0.x = dot(Bones[0 + offset.w], IN.normal);
    r0.y = dot(Bones[1 + offset.w], IN.normal);
    r0.z = dot(Bones[2 + offset.w], IN.normal);
    r0.xyz = (r1.w * r0) + r1;
    r0.w = dot(r0, r0);	// normalize + length
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
    r0.w = 1.0 / sqrt(r0.w);
    r2.xyz = (r1.w * r1) + r2;
    OUT.texcoord_5.xyz = r0 * r0.w;
    r0.w = dot(r2, r2);	// normalize + length
    r0.w = 1.0 / sqrt(r0.w);
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
    OUT.texcoord_3.xyz = r2 * r0.w;
    r2.xyz = (IN.blendweight.z * r0) + r1;
    r1.x = dot(Bones[0 + offset.w], IN.binormal);
    r1.y = dot(Bones[1 + offset.w], IN.binormal);
    r1.z = dot(Bones[2 + offset.w], IN.binormal);
    r0 = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r2.xyz = (r1.w * r1) + r2;
    r1.x = dot(Bones[0 + offset.y], r0);
    r1.y = dot(Bones[1 + offset.y], r0);
    r1.z = dot(Bones[2 + offset.y], r0);
    r3.xyz = r1 * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], r0);
    r1.y = dot(Bones[1 + offset.x], r0);
    r1.z = dot(Bones[2 + offset.x], r0);
    r3.xyz = (IN.blendweight.x * r1) + r3;
    r1.x = dot(Bones[0 + offset.z], r0);
    r1.y = dot(Bones[1 + offset.z], r0);
    r1.z = dot(Bones[2 + offset.z], r0);
    r3.xyz = (IN.blendweight.z * r1) + r3;
    r1.x = dot(Bones[0 + offset.w], r0);
    r1.y = dot(Bones[1 + offset.w], r0);
    r1.z = dot(Bones[2 + offset.w], r0);
    r0.xyz = (r1.w * r1) + r3;
    r0.w = const_0.x;
    r1.w = dot(r2, r2);	// normalize + length
    r1.x = dot(SkinModelViewProj[0], r0);
    r1.y = dot(SkinModelViewProj[1], r0);
    r1.z = dot(SkinModelViewProj[2], r0);
    r2.w = 1.0 / sqrt(r1.w);
    r1.w = dot(r1, r1);	// normalize + length
    OUT.texcoord_4.xyz = r2 * r2.w;
    r1.w = 1.0 / sqrt(r1.w);
    OUT.position.w = dot(SkinModelViewProj[3], r0);
    r0.w = 1.0 / r1.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    OUT.texcoord_6.xyz = r0;
    r0.w = saturate(r0.w * r1.w);
    OUT.position.xyz = r1;
    r0.w = const_0.x - r0.w;
    OUT.texcoord_7.w = r0.w * FogParam.z;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0 = const_0.x;
    OUT.texcoord_7.xyz = FogColor;

// approximately 98 instruction slots used
