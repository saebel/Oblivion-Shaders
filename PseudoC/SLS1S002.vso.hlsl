//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S002.vso /Fcshaderdump19/SLS1S002.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float3 FogColor;
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
//   FogParam          const_23      1
//   FogColor          const_24      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//

    const float4 const_0 = {1, 765.01001, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    r2.x = dot(IN.blendweight.xyz, 1);
    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    r1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
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
    r2.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    offset.x = r0.z;
    r0.x = dot(Bones[0 + offset.x], r1.xyzw);
    r0.y = dot(Bones[1 + offset.x], r1.xyzw);
    r0.z = dot(Bones[2 + offset.x], r1.xyzw);
    r2.xyz = (IN.blendweight.z * r0.xyz) + r2.xyz;
    offset.x = r0.w;
    r0.x = dot(Bones[0 + offset.x], r1.xyzw);
    r0.y = dot(Bones[1 + offset.x], r1.xyzw);
    r0.z = dot(Bones[2 + offset.x], r1.xyzw);
    r0.xyz = (r2.w * r0.xyz) + r2.xyz;
    r0.w = 1;
    r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r2.x);
    r1.w = 1.0 / r1.w;
    r1.w = FogParam.x - r1.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = r1.w * r2.w;
    r1.w = max(r1.w, 0);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r0.w = min(r1.w, 1);
    OUT.position.xyz = r1.xyz;
    OUT.color_0.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgb = FogColor.rgb;

// approximately 41 instruction slots used
