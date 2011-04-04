//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S008.vso /Fcshaderdump19/SLS1S008.vso.dis
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
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r2.x = dot(IN.blendweight.xyz, const_0.xyz);.x
    r1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    r2.w = 1 - r2.x;
    offset.x = r0.y;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    r3.xyz = r2.xyz * IN.blendweight.y;
    offset.x = r0.x;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    offset.x = r0.z;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    offset.x = r0.w;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    r1.w = 1;
    r1.xyz = (r2.w * r2.xyz) + r3.xyz;
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r1.xyzw);
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r1.xyzw);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r1.xyzw);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r1.xyzw);
    offset.x = r0.y;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    r3.xyz = r2.xyz * IN.blendweight.y;
    offset.x = r0.x;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    offset.x = r0.z;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    offset.x = r0.w;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    r3.xyz = (r2.w * r2.xyz) + r3.xyz;
    r2.xyz = EyePosition.xyz - r1.xyz;
    r1.xyz = LightPosition[0].xyz - r1.xyz;
    r4.x = dot(r2.xyz, r2.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r4.x);
    r4.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r2.xyz = r2.xyz * r1.w;
    r1.w = 1.0 / sqrt(r4.x);
    r4.x = dot(r3.xyz, r3.xyz);	// normalize + length
    r2.xyz = (r1.w * r1.xyz) + r2.xyz;
    r1.w = 1.0 / sqrt(r4.x);
    r5.x = dot(r2.xyz, r2.xyz);	// normalize + length
    r4.xyz = r3.xyz * r1.w;
    r1.w = 1.0 / sqrt(r5.x);
    r5.xyz = r2.xyz * r1.w;
    offset.x = r0.y;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    r3.xyz = r2.xyz * IN.blendweight.y;
    offset.x = r0.x;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    offset.x = r0.z;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    OUT.texcoord_3.x = dot(r4.xyz, r5.xyz);
    r6.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    offset.x = r0.w;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r0.y;
    r3.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r7.xyz = r3.xyz * IN.blendweight.y;
    offset.x = r0.x;
    r3.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r3.xyz = (IN.blendweight.x * r3.xyz) + r7.xyz;
    offset.x = r0.z;
    r0.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r3.xyz = (IN.blendweight.z * r0.xyz) + r3.xyz;
    offset.x = r0.w;
    r0.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r2.xyz = (r2.w * r2.xyz) + r6.xyz;
    r0.xyz = (r2.w * r0.xyz) + r3.xyz;
    r6.x = dot(r2.xyz, r2.xyz);	// normalize + length
    r3.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r6.x);
    r0.w = 1.0 / sqrt(r3.x);
    r3.xyz = r2.xyz * r1.w;
    r2.xyz = r0.xyz * r0.w;
    OUT.texcoord_3.y = dot(r3.xyz, r5.xyz);
    OUT.texcoord_3.z = dot(r2.xyz, r5.xyz);
    r0.x = dot(r4.xyz, r2.xyz);
    r0.y = dot(r3.xyz, r2.xyz);
    r0.z = dot(r2.xyz, r2.xyz);	// normalize + length
    r0.w = 1.0 / LightPosition[0].w;
    OUT.color_0.rgb = (0.5 * r0.xyz) + 0.5;
    r0.xyz = r1.xyz * r0.w;
    OUT.texcoord_1.xy = (0.5 * r0.xy) + 0.5;
    OUT.texcoord_2.x = (r0.z * 0.5) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.y = 0.5;

// approximately 122 instruction slots used
