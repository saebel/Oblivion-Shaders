//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2035.vso /Fcshaderdump19/PAR2035.vso.dis
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
    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    r0.xyzw = frac(r0.xyzw);
    r2.x = dot(IN.blendweight.xyz, 1);
    r1.xyzw = (IN.blendindices.zyxw * 765.01001) - r0.xyzw;
    r0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    offset.xyzw = r1.xyzw;
    r1.w = 1 - r2.x;
    r1.x = dot(Bones[0 + offset.y], r0.xyzw);
    r1.y = dot(Bones[1 + offset.y], r0.xyzw);
    r1.z = dot(Bones[2 + offset.y], r0.xyzw);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], r0.xyzw);
    r1.y = dot(Bones[1 + offset.x], r0.xyzw);
    r1.z = dot(Bones[2 + offset.x], r0.xyzw);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z], r0.xyzw);
    r1.y = dot(Bones[1 + offset.z], r0.xyzw);
    r1.z = dot(Bones[2 + offset.z], r0.xyzw);
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.w], r0.xyzw);
    r1.y = dot(Bones[1 + offset.w], r0.xyzw);
    r1.z = dot(Bones[2 + offset.w], r0.xyzw);
    r0.xyz = (r1.w * r1.xyz) + r2.xyz;
    r0.w = 1;
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.x = dot(Bones[0 + offset.y], IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.y], IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.y], IN.tangent.xyz);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z], IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.z], IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.z], IN.tangent.xyz);
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.w], IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.w], IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.w], IN.tangent.xyz);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r2.xyz = (r1.w * r1.xyz) + r2.xyz;
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r1.xyz = normalize(r2.xyz);
    r2.xyz = LightPosition[0].xyz - r0.xyz;
    r3.xyz = EyePosition.xyz - r0.xyz;
    r4.xyz = normalize(r2.xyz);
    r0.x = dot(Bones[0 + offset.y], IN.binormal.xyz);
    r0.y = dot(Bones[1 + offset.y], IN.binormal.xyz);
    r0.z = dot(Bones[2 + offset.y], IN.binormal.xyz);
    r5.xyz = r0.xyz * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    r5.xyz = (IN.blendweight.x * r0.xyz) + r5.xyz;
    r0.x = dot(Bones[0 + offset.z], IN.binormal.xyz);
    r0.y = dot(Bones[1 + offset.z], IN.binormal.xyz);
    r0.z = dot(Bones[2 + offset.z], IN.binormal.xyz);
    r6.x = dot(r1.xyz, r4.xyz);
    r8.xyz = (IN.blendweight.z * r0.xyz) + r5.xyz;
    r0.x = dot(Bones[0 + offset.w], IN.binormal.xyz);
    r0.y = dot(Bones[1 + offset.w], IN.binormal.xyz);
    r0.z = dot(Bones[2 + offset.w], IN.binormal.xyz);
    r5.x = dot(Bones[0 + offset.y], IN.normal.xyz);
    r5.y = dot(Bones[1 + offset.y], IN.normal.xyz);
    r5.z = dot(Bones[2 + offset.y], IN.normal.xyz);
    r7.xyz = r5.xyz * IN.blendweight.y;
    r5.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r5.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r5.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r7.xyz = (IN.blendweight.x * r5.xyz) + r7.xyz;
    r5.x = dot(Bones[0 + offset.z], IN.normal.xyz);
    r5.y = dot(Bones[1 + offset.z], IN.normal.xyz);
    r5.z = dot(Bones[2 + offset.z], IN.normal.xyz);
    r7.xyz = (IN.blendweight.z * r5.xyz) + r7.xyz;
    r5.x = dot(Bones[0 + offset.w], IN.normal.xyz);
    r5.y = dot(Bones[1 + offset.w], IN.normal.xyz);
    r5.z = dot(Bones[2 + offset.w], IN.normal.xyz);
    r0.xyz = (r1.w * r0.xyz) + r8.xyz;
    r7.xyz = (r1.w * r5.xyz) + r7.xyz;
    r5.xyz = normalize(r0.xyz);
    r0.xyz = normalize(r7.xyz);
    r6.y = dot(r5.xyz, r4.xyz);
    r6.z = dot(r0.xyz, r4.xyz);
    r7.x = dot(r3.xyz, r3.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r7.x);
    r7.xyz = normalize(r6.xyz);
    OUT.texcoord_1.xyz = r7.xyz;
    r6.xyz = (r0.w * r3.xyz) + r4.xyz;
    r4.xyz = r3.xyz * r0.w;
    r3.xyz = normalize(r6.xyz);
    OUT.texcoord_3.x = dot(r1.xyz, r3.xyz);
    r1.x = dot(r1.xyz, r4.xyz);
    OUT.texcoord_3.y = dot(r5.xyz, r3.xyz);
    r1.y = dot(r5.xyz, r4.xyz);
    r1.z = dot(r0.xyz, r4.xyz);
    OUT.texcoord_3.z = dot(r0.xyz, r3.xyz);
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r1.w = 1.0 / LightPosition[0].w;
    r0.w = 1.0 / sqrt(r0.x);
    r0.xyz = r2.xyz * r1.w;
    OUT.texcoord_7.xyz = r1.xyz * r0.w;
    OUT.texcoord_5.xyz = (0.5 * r0.xyz) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_5.w = 0.5;

// approximately 118 instruction slots used
