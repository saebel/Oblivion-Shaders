//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S014.vso /Fcshaderdump19/SLS1S014.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
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
    r0.w = 1;
    r0.x = dot(IN.blendweight.xyz, 1.xyz);
    r2.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r1.xyzw = IN.blendindices.zyxw * 765.01001;
    r3.w = 1 - r0.x;
    offset.x = r1.y;
    r0.x = dot(Bones[0 + offset.x].xyzw, r2.xyzw);
    r0.y = dot(Bones[1 + offset.x].xyzw, r2.xyzw);
    r0.z = dot(Bones[2 + offset.x].xyzw, r2.xyzw);
    r3.xyz = r0.xyz * IN.blendweight.y;
    offset.x = r1.x;
    r0.x = dot(Bones[0 + offset.x].xyzw, r2.xyzw);
    r0.y = dot(Bones[1 + offset.x].xyzw, r2.xyzw);
    r0.z = dot(Bones[2 + offset.x].xyzw, r2.xyzw);
    r3.xyz = (IN.blendweight.x * r0.xyz) + r3.xyz;
    offset.x = r1.z;
    r0.x = dot(Bones[0 + offset.x].xyzw, r2.xyzw);
    r0.y = dot(Bones[1 + offset.x].xyzw, r2.xyzw);
    r0.z = dot(Bones[2 + offset.x].xyzw, r2.xyzw);
    r3.xyz = (IN.blendweight.z * r0.xyz) + r3.xyz;
    offset.x = r1.w;
    r0.x = dot(Bones[0 + offset.x].xyzw, r2.xyzw);
    r0.y = dot(Bones[1 + offset.x].xyzw, r2.xyzw);
    r0.z = dot(Bones[2 + offset.x].xyzw, r2.xyzw);
    r0.xyz = (r3.w * r0.xyz) + r3.xyz;
    offset.x = r1.y;
    r2.x = dot(Bones[0 + offset.x].xyz, IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x].xyz, IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x].xyz, IN.tangent.xyz);
    r3.xyz = r2.xyz * IN.blendweight.y;
    offset.x = r1.x;
    r2.x = dot(Bones[0 + offset.x].xyz, IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x].xyz, IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x].xyz, IN.tangent.xyz);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    offset.x = r1.z;
    r2.x = dot(Bones[0 + offset.x].xyz, IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x].xyz, IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x].xyz, IN.tangent.xyz);
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    offset.x = r1.w;
    r2.x = dot(Bones[0 + offset.x].xyz, IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x].xyz, IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x].xyz, IN.tangent.xyz);
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r2.xyz = (r3.w * r2.xyz) + r3.xyz;
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r3.x = dot(r2.xyz, r2.xyz);	// normalize + length
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r2.w = 1.0 / sqrt(r3.x);
    r2.xyz = r2.xyz * r2.w;
    offset.x = r1.y;
    r3.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r3.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r3.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    r4.xyz = r3.xyz * IN.blendweight.y;
    offset.x = r1.x;
    r3.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r3.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r3.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    r4.xyz = (IN.blendweight.x * r3.xyz) + r4.xyz;
    offset.x = r1.z;
    r3.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r3.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r3.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    r2.x = dot(r2.xyz, LightDirection[0].xyz);
    r5.xyz = (IN.blendweight.z * r3.xyz) + r4.xyz;
    offset.x = r1.w;
    r3.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r3.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r3.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    offset.x = r1.y;
    r4.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r4.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r4.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r6.xyz = r4.xyz * IN.blendweight.y;
    offset.x = r1.x;
    r4.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r4.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r4.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r4.xyz = (IN.blendweight.x * r4.xyz) + r6.xyz;
    offset.x = r1.z;
    r1.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r1.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r1.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r4.xyz = (IN.blendweight.z * r1.xyz) + r4.xyz;
    offset.x = r1.w;
    r1.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r1.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r1.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r3.xyz = (r3.w * r3.xyz) + r5.xyz;
    r1.xyz = (r3.w * r1.xyz) + r4.xyz;
    r5.x = dot(r3.xyz, r3.xyz);	// normalize + length
    r4.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r2.w = 1.0 / sqrt(r5.x);
    r1.w = 1.0 / sqrt(r4.x);
    r3.xyz = r3.xyz * r2.w;
    r1.xyz = r1.xyz * r1.w;
    r2.y = dot(r3.xyz, LightDirection[0].xyz);
    r2.z = dot(r1.xyz, LightDirection[0].xyz);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.color_0.rgb = (0.5 * r2) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xy = IN.texcoord_0;
    OUT.texcoord_2.xy = IN.texcoord_0;
    OUT.texcoord_3.xy = IN.texcoord_0;

// approximately 106 instruction slots used
