//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S006.vso /Fcshaderdump19/SLS1S006.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
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
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//

    const float4 const_0 = {1, 765.01001, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r2.x = dot(IN.blendweight, const_0.x);
    r0 = IN.blendindices.zyxw * const_0.y;
    r1 = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r2.w = const_0.x - r2.x;
    offset.x = r0.y;
    r2.x = dot(Bones[0 + offset.x], r1);
    r2.y = dot(Bones[1 + offset.x], r1);
    r2.z = dot(Bones[2 + offset.x], r1);
    r3.xyz = r2 * IN.blendweight.y;
    offset.x = r0.x;
    r2.x = dot(Bones[0 + offset.x], r1);
    r2.y = dot(Bones[1 + offset.x], r1);
    r2.z = dot(Bones[2 + offset.x], r1);
    r2.xyz = (IN.blendweight.x * r2) + r3;
    offset.x = r0.z;
    r0.x = dot(Bones[0 + offset.x], r1);
    r0.y = dot(Bones[1 + offset.x], r1);
    r0.z = dot(Bones[2 + offset.x], r1);
    r2.xyz = (IN.blendweight.z * r0) + r2;
    offset.x = r0.w;
    r0.x = dot(Bones[0 + offset.x], r1);
    r0.y = dot(Bones[1 + offset.x], r1);
    r0.z = dot(Bones[2 + offset.x], r1);
    r0.xyz = (r2.w * r0) + r2;
    r0.w = const_0.x;
    OUT.position.x = dot(SkinModelViewProj[0], r0);
    OUT.position.y = dot(SkinModelViewProj[1], r0);
    OUT.position.z = dot(SkinModelViewProj[2], r0);
    OUT.position.w = dot(SkinModelViewProj[3], r0);
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0 = (IN.color_0.xyzx * const_0.xxxz) + const_0.zzzx;

// approximately 31 instruction slots used
