//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2074.vso /Fcshaderdump19/SLS2074.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 FogParam;
//   float4 LightPosition[3];
//   row_major float4x4 ObjToCubeSpace;
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
//   ObjToCubeSpace[0]    const_8        1
//   ObjToCubeSpace[1]    const_9        1
//   ObjToCubeSpace[2]    const_10        1
//   ObjToCubeSpace[3]    const_11        1
//   LightPosition[0]     const_16       1
//   FogParam          const_23      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//

    const float4 const_0 = {1, 765.01001, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    r0.xyzw = frac(r0.xyzw);
    r1.x = dot(IN.blendweight.xyz, 1);
    r0.xyzw = (IN.blendindices.zyxw * 765.01001) - r0.xyzw;
    offset.xyzw = r0.xyzw;
    r0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r1.w = 1 - r1.x;
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
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    OUT.texcoord_1.x = dot(ObjToCubeSpace[0].xyzw, r0.xyzw);
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    OUT.texcoord_1.y = dot(ObjToCubeSpace[1].xyzw, r0.xyzw);
    r1.w = 1.0 / sqrt(r2.x);
    OUT.texcoord_1.z = dot(ObjToCubeSpace[2].xyzw, r0.xyzw);
    r1.w = 1.0 / r1.w;
    r1.w = FogParam.x - r1.w;
    r2.w = 1.0 / FogParam.y;
    OUT.texcoord_1.w = dot(ObjToCubeSpace[3].xyzw, r0.xyzw);
    r0.w = r1.w * r2.w;
    OUT.texcoord_6.xyz = r0.xyz;
    r0.w = max(r0.w, 0);
    OUT.position.xyz = r1.xyz;
    r0.w = min(r0.w, 1);
    OUT.texcoord_3.w = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.xyzw = LightPosition[0].xyzw;
    OUT.texcoord_3.xyz = 0;

// approximately 46 instruction slots used
