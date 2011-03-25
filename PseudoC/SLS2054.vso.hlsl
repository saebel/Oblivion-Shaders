//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2054.vso /Fcshaderdump19/SLS2054.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 LightPosition[3];
//   row_major float4x4 SkinModelViewProj;
//   row_major float4x4 SkinWorldViewTranspose;
//
//
// Registers:
//
//   Name                   Reg   Size
//   ---------------------- ----- ----
//   SkinModelViewProj[0]      const_1        1
//   SkinModelViewProj[1]      const_2        1
//   SkinModelViewProj[2]      const_3        1
//   SkinModelViewProj[3]      const_4        1
//   SkinWorldViewTranspose[0] const_5        1
//   SkinWorldViewTranspose[1] const_6        1
//   SkinWorldViewTranspose[2] const_7        1
//   LightPosition[0]          const_16       1
//   Bones[0]                  const_42      18
//   Bones[1]                  const_43      18
//   Bones[2]                  const_44      18
//

    const float4 const_0 = {1, 765.01001, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r0 = IN.blendindices.zyxw * const_0.y;
    r0 = r0 - floor(r0);
    r1.x = dot(IN.blendweight, const_0.x);
    r0 = (IN.blendindices.zyxw * const_0.y) - r0;
    offset = r0;
    r0 = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r1.w = const_0.x - r1.x;
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
    OUT.position.w = dot(SkinModelViewProj[3], r0);
    OUT.texcoord_1.x = dot(SkinWorldViewTranspose[0], r0);
    OUT.texcoord_1.y = dot(SkinWorldViewTranspose[1], r0);
    OUT.texcoord_1.z = dot(SkinWorldViewTranspose[2], r0);
    OUT.texcoord_1.w = LightPosition[0].w;

// approximately 32 instruction slots used
