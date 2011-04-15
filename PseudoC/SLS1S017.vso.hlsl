//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S017.vso /Fcshaderdump19/SLS1S017.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 EyePosition;
//   row_major float4x4 SkinModelViewProj;
//   row_major float4x4 SkinToCubeSpace;
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
//   SkinToCubeSpace[0]   const_9        1
//   SkinToCubeSpace[1]   const_10        1
//   SkinToCubeSpace[2]   const_11        1
//   EyePosition       const_25      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//

    const float4 const_0 = {1, 765.01001, 0, 0.1};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.normal : NORMAL;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float4 IN.color_0 : COLOR0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r2.x = dot(IN.blendweight.xyz, 1);
    r0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r1.xyzw = IN.blendindices.zyxw * 765.01001;
    r2.w = 1 - r2.x;
    offset.x = r1.y;
    r2.x = dot(Bones[0 + offset.x].xyzw, r0.xyzw);
    r2.y = dot(Bones[1 + offset.x].xyzw, r0.xyzw);
    r2.z = dot(Bones[2 + offset.x].xyzw, r0.xyzw);
    r3.xyz = r2.xyz * IN.blendweight.y;
    offset.x = r1.x;
    r2.x = dot(Bones[0 + offset.x].xyzw, r0.xyzw);
    r2.y = dot(Bones[1 + offset.x].xyzw, r0.xyzw);
    r2.z = dot(Bones[2 + offset.x].xyzw, r0.xyzw);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    offset.x = r1.z;
    r2.x = dot(Bones[0 + offset.x].xyzw, r0.xyzw);
    r2.y = dot(Bones[1 + offset.x].xyzw, r0.xyzw);
    r2.z = dot(Bones[2 + offset.x].xyzw, r0.xyzw);
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    offset.x = r1.w;
    r2.x = dot(Bones[0 + offset.x].xyzw, r0.xyzw);
    r2.y = dot(Bones[1 + offset.x].xyzw, r0.xyzw);
    r2.z = dot(Bones[2 + offset.x].xyzw, r0.xyzw);
    r0.xyz = (r2.w * r2.xyz) + r3.xyz;
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
    r0.w = 1;
    r2.xyz = (r2.w * r2.xyz) + r3.xyz;
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r3.x = dot(r2.xyz, r2.xyz);	// normalize + length
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r3.w = 1.0 / sqrt(r3.x);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r2.xyz = r2.xyz * r3.w;
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r2.xyz = r2.xyz * 0.1;
    OUT.texcoord_1.x = dot(r2.xyz, SkinToCubeSpace[0].xyz);
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
    r4.xyz = (IN.blendweight.z * r3.xyz) + r4.xyz;
    offset.x = r1.w;
    r3.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r3.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r3.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    r3.xyz = (r2.w * r3.xyz) + r4.xyz;
    offset.x = r1.y;
    r4.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r4.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r4.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r5.xyz = r4.xyz * IN.blendweight.y;
    offset.x = r1.x;
    r4.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r4.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r4.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r4.xyz = (IN.blendweight.x * r4.xyz) + r5.xyz;
    offset.x = r1.z;
    r1.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r1.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r1.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r4.xyz = (IN.blendweight.z * r1.xyz) + r4.xyz;
    offset.x = r1.w;
    r1.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r1.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r1.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r5.x = dot(r3.xyz, r3.xyz);	// normalize + length
    r1.xyz = (r2.w * r1.xyz) + r4.xyz;
    r1.w = 1.0 / sqrt(r5.x);
    r4.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r3.xyz = r3.xyz * r1.w;
    r1.w = 1.0 / sqrt(r4.x);
    r3.xyz = r3.xyz * 0.1;
    r1.xyz = r1.xyz * r1.w;
    OUT.texcoord_1.y = dot(r3.xyz, SkinToCubeSpace[0].xyz);
    OUT.texcoord_1.z = dot(r1.xyz, SkinToCubeSpace[0].xyz);
    OUT.texcoord_2.x = dot(r2.xyz, SkinToCubeSpace[1].xyz);
    OUT.texcoord_3.x = dot(r2.xyz, SkinToCubeSpace[2].xyz);
    OUT.texcoord_2.y = dot(r3.xyz, SkinToCubeSpace[1].xyz);
    r2.x = dot(SkinToCubeSpace[0].xyzw, r0.xyzw);
    r2.y = dot(SkinToCubeSpace[1].xyzw, r0.xyzw);
    r2.z = dot(SkinToCubeSpace[2].xyzw, r0.xyzw);
    OUT.texcoord_3.y = dot(r3.xyz, SkinToCubeSpace[2].xyz);
    r0.xyz = EyePosition.xyz - r2.xyz;
    OUT.texcoord_2.z = dot(r1.xyz, SkinToCubeSpace[1].xyz);
    r2.x = dot(r0.xyz, r0.xyz);	// normalize + length
    OUT.texcoord_3.z = dot(r1.xyz, SkinToCubeSpace[2].xyz);
    r0.w = 1.0 / sqrt(r2.x);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    r0.xyz = r0.xyz * r0.w;
    OUT.texcoord_1.w = r0.x;
    OUT.texcoord_2.w = r0.y;
    OUT.texcoord_3.w = r0.z;
    OUT.color_0.rgb = IN.color_0.rgb;

// approximately 121 instruction slots used
