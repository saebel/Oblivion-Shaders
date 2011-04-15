//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2003.vso /Fcshaderdump19/PAR2003.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   row_major float4x4 ShadowProj;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//   row_major float4x4 SkinModelViewProj;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   SkinModelViewProj[0]   const_1        1
//   SkinModelViewProj[1]   const_2        1
//   SkinModelViewProj[2]   const_3        1
//   SkinModelViewProj[3]   const_4        1
//   LightDirection[0]      const_13       1
//   FogParam            const_23      1
//   FogColor            const_24      1
//   EyePosition         const_25      1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
//   Bones[0]               const_42      18
//   Bones[1]               const_43      18
//   Bones[2]               const_44      18
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
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r2.xyz = (r1.w * r1.xyz) + r2.xyz;
    r1.xyz = normalize(r2.xyz);
    r2.x = dot(Bones[0 + offset.y].xyz, IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.y].xyz, IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.y].xyz, IN.binormal.xyz);
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.z].xyz, IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.z].xyz, IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.z].xyz, IN.binormal.xyz);
    r4.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r3.x = dot(Bones[0 + offset.w].xyz, IN.binormal.xyz);
    r3.y = dot(Bones[1 + offset.w].xyz, IN.binormal.xyz);
    r3.z = dot(Bones[2 + offset.w].xyz, IN.binormal.xyz);
    r2.x = dot(r1.xyz, LightDirection[0].xyz);
    r3.xyz = (r1.w * r3.xyz) + r4.xyz;
    r5.xyz = normalize(r3.xyz);
    r3.x = dot(Bones[0 + offset.y].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.y].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.y].xyz, IN.normal.xyz);
    r4.xyz = r3.xyz * IN.blendweight.y;
    r3.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r4.xyz = (IN.blendweight.x * r3.xyz) + r4.xyz;
    r3.x = dot(Bones[0 + offset.z].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.z].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.z].xyz, IN.normal.xyz);
    r4.xyz = (IN.blendweight.z * r3.xyz) + r4.xyz;
    r3.x = dot(Bones[0 + offset.w].xyz, IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.w].xyz, IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.w].xyz, IN.normal.xyz);
    r2.y = dot(r5.xyz, LightDirection[0].xyz);
    r4.xyz = (r1.w * r3.xyz) + r4.xyz;
    r3.xyz = normalize(r4.xyz);
    r6.xyz = EyePosition.xyz - r0.xyz;
    r2.z = dot(r3.xyz, LightDirection[0].xyz);
    r4.xyz = normalize(r6.xyz);
    r1.x = dot(r1.xyz, r4.xyz);
    r1.y = dot(r5.xyz, r4.xyz);
    r1.z = dot(r3.xyz, r4.xyz);
    r5.xyz = normalize(r2.xyz);
    OUT.texcoord_1.xyz = r5.xyz;
    r5.xyz = normalize(r1.xyz);
    OUT.texcoord_6.xyz = r5.xyz;
    r1.x = dot(ShadowProj[0].xyzw, r0.xyzw);
    r1.y = dot(ShadowProj[1].xyzw, r0.xyzw);
    r1.w = dot(ShadowProj[3].xyzw, r0.xyzw);
    r3.xy = (r1.w * ShadowProjTransform.xy) + r1.xy;
    r2.xy = r1.xy - ShadowProjData.xy;
    r4.y = r1.w * ShadowProjTransform.w;
    r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r0.w = 1.0 / r4.y;
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    OUT.texcoord_7.xy = r3.xy * r0.w;
    r0.w = 1.0 / sqrt(r0.x);
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    OUT.texcoord_7.z = r2.x * r1.w;
    r0.w = r0.w * r2.w;
    OUT.texcoord_7.w = (r2.y * -r1.w) + 1;
    r0.w = max(r0.w, 0);
    OUT.position.xyz = r1.xyz;
    r0.w = min(r0.w, 1);
    OUT.color_1.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.color_1.rgb = FogColor.rgb;

// approximately 127 instruction slots used
