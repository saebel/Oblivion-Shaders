//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2020.vso /Fcshaderdump19/SLS2020.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float3 LightDirection[3];
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
//   LightDirection[0]    const_13       1
//   LightPosition[0]     const_16       1
//   LightPosition[1]     const_17       1
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
    r1.x = dot(Bones[0 + offset.y].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.y].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.y].xyzw, r0.xyzw);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.x].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.x].xyzw, r0.xyzw);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.z].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.z].xyzw, r0.xyzw);
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.w].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.w].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.w].xyzw, r0.xyzw);
    r0.xyz = (r1.w * r1.xyz) + r2.xyz;
    r0.w = 1;
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.x = dot(Bones[0 + offset.y].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.y].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.y].xyz, IN.tangent.xyz);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.x].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.x].xyz, IN.tangent.xyz);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.z].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.z].xyz, IN.tangent.xyz);
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.w].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.w].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.w].xyz, IN.tangent.xyz);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r1.xyz = (r1.w * r1.xyz) + r2.xyz;
    r4.xyz = normalize(r1.xyz);
    r1.x = dot(Bones[0 + offset.y].xyz, IN.binormal.xyz);
    r1.y = dot(Bones[1 + offset.y].xyz, IN.binormal.xyz);
    r1.z = dot(Bones[2 + offset.y].xyz, IN.binormal.xyz);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r1.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r1.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    r3.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z].xyz, IN.binormal.xyz);
    r1.y = dot(Bones[1 + offset.z].xyz, IN.binormal.xyz);
    r1.z = dot(Bones[2 + offset.z].xyz, IN.binormal.xyz);
    r2.x = dot(r4.xyz, LightDirection[0].xyz);
    r6.xyz = (IN.blendweight.z * r1.xyz) + r3.xyz;
    r1.x = dot(Bones[0 + offset.w].xyz, IN.binormal.xyz);
    r1.y = dot(Bones[1 + offset.w].xyz, IN.binormal.xyz);
    r1.z = dot(Bones[2 + offset.w].xyz, IN.binormal.xyz);
    r3.x = dot(Bones[0 + offset.y].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.y].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.y].xyz, IN.normal.xyz);
    r5.xyz = r3.xyz * IN.blendweight.y;
    r3.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r5.xyz = (IN.blendweight.x * r3.xyz) + r5.xyz;
    r3.x = dot(Bones[0 + offset.z].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.z].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.z].xyz, IN.normal.xyz);
    r5.xyz = (IN.blendweight.z * r3.xyz) + r5.xyz;
    r3.x = dot(Bones[0 + offset.w].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.w].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.w].xyz, IN.normal.xyz);
    r1.xyz = (r1.w * r1.xyz) + r6.xyz;
    r5.xyz = (r1.w * r3.xyz) + r5.xyz;
    r3.xyz = normalize(r1.xyz);
    r1.xyz = normalize(r5.xyz);
    r2.y = dot(r3.xyz, LightDirection[0].xyz);
    r2.z = dot(r1.xyz, LightDirection[0].xyz);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r0.xyz = LightPosition[1].xyz - r0.xyz;
    r5.xyz = normalize(r2.xyz);
    OUT.texcoord_1.xyz = r5.xyz;
    r2.xyz = normalize(r0.xyz);
    OUT.texcoord_2.x = dot(r4.xyz, r2.xyz);
    r0.w = 1.0 / LightPosition[1].w;
    OUT.texcoord_2.y = dot(r3.xyz, r2.xyz);
    r0.xyz = r0.xyz * r0.w;
    OUT.texcoord_2.z = dot(r1.xyz, r2.xyz);
    OUT.texcoord_4.xyz = (0.5 * r0.xyz) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.w = 0.5;

// approximately 104 instruction slots used
