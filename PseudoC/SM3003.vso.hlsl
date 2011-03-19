//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3003.vso /Fcshaderdump19/SM3003.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 FogColor;
//   float4 FogParam;
//   row_major float4x4 SkinModelViewProj;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] SkinModelViewProj[0]       1
//   SkinModelViewProj[1] SkinModelViewProj[1]       1
//   SkinModelViewProj[2] SkinModelViewProj[2]       1
//   SkinModelViewProj[3] SkinModelViewProj[3]       1
//   FogParam          FogParam      1
//   FogColor          FogColor      1
//   Bones[0]          Bones[0]     17
//   Bones[1]          Bones[1]     17
//   Bones[2]          Bones[2]     17
//

    const_0 = {1, 765.01001, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    dcl_blendweight input_6
    dcl_blendindices input_7
    position output_0;
    texcoord output_1.xy;
    dcl_color output_2
    texcoord_3 output_3.xyz;
    texcoord_4 output_4.xyz;
    texcoord_5 output_5.xyz;
    texcoord_6 output_6.xyz;
    texcoord_7 output_7;
    r1 = const_0.y * input_7.zyxw;
    r0 = r1 - floor(r1);
    r0 = r1 - r0;
    r1.w = (input_6.x * const_0.x.x) + (input_6.y * const_0.x.y) + (input_6.z * const_0.x.z);
    mova a0, r0
    r1.w = const_0.x - r1.w;
    r0.x = (Bones[0][a0.y].x * input_3.x) + (Bones[0][a0.y].y * input_3.y) + (Bones[0][a0.y].z * input_3.z);
    r0.y = (Bones[1][a0.y].x * input_3.x) + (Bones[1][a0.y].y * input_3.y) + (Bones[1][a0.y].z * input_3.z);
    r0.z = (Bones[2][a0.y].x * input_3.x) + (Bones[2][a0.y].y * input_3.y) + (Bones[2][a0.y].z * input_3.z);
    r1.xyz = r0 * input_6.y;
    r0.x = (Bones[0][a0.x].x * input_3.x) + (Bones[0][a0.x].y * input_3.y) + (Bones[0][a0.x].z * input_3.z);
    r0.y = (Bones[1][a0.x].x * input_3.x) + (Bones[1][a0.x].y * input_3.y) + (Bones[1][a0.x].z * input_3.z);
    r0.z = (Bones[2][a0.x].x * input_3.x) + (Bones[2][a0.x].y * input_3.y) + (Bones[2][a0.x].z * input_3.z);
    r1.xyz = (input_6.x * r0) + r1;
    r0.x = (Bones[0][a0.z].x * input_3.x) + (Bones[0][a0.z].y * input_3.y) + (Bones[0][a0.z].z * input_3.z);
    r0.y = (Bones[1][a0.z].x * input_3.x) + (Bones[1][a0.z].y * input_3.y) + (Bones[1][a0.z].z * input_3.z);
    r0.z = (Bones[2][a0.z].x * input_3.x) + (Bones[2][a0.z].y * input_3.y) + (Bones[2][a0.z].z * input_3.z);
    r1.xyz = (input_6.z * r0) + r1;
    r0.x = (Bones[0][a0.w].x * input_3.x) + (Bones[0][a0.w].y * input_3.y) + (Bones[0][a0.w].z * input_3.z);
    r0.y = (Bones[1][a0.w].x * input_3.x) + (Bones[1][a0.w].y * input_3.y) + (Bones[1][a0.w].z * input_3.z);
    r0.z = (Bones[2][a0.w].x * input_3.x) + (Bones[2][a0.w].y * input_3.y) + (Bones[2][a0.w].z * input_3.z);
    r0.xyz = (r1.w * r0) + r1;
    r0.w = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r1.x = (Bones[0][a0.y].x * input_1.x) + (Bones[0][a0.y].y * input_1.y) + (Bones[0][a0.y].z * input_1.z);
    r1.y = (Bones[1][a0.y].x * input_1.x) + (Bones[1][a0.y].y * input_1.y) + (Bones[1][a0.y].z * input_1.z);
    r1.z = (Bones[2][a0.y].x * input_1.x) + (Bones[2][a0.y].y * input_1.y) + (Bones[2][a0.y].z * input_1.z);
    r2.xyz = r1 * input_6.y;
    r1.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r1.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r1.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r2.xyz = (input_6.x * r1) + r2;
    r1.x = (Bones[0][a0.z].x * input_1.x) + (Bones[0][a0.z].y * input_1.y) + (Bones[0][a0.z].z * input_1.z);
    r1.y = (Bones[1][a0.z].x * input_1.x) + (Bones[1][a0.z].y * input_1.y) + (Bones[1][a0.z].z * input_1.z);
    r1.z = (Bones[2][a0.z].x * input_1.x) + (Bones[2][a0.z].y * input_1.y) + (Bones[2][a0.z].z * input_1.z);
    r2.xyz = (input_6.z * r1) + r2;
    r1.x = (Bones[0][a0.w].x * input_1.x) + (Bones[0][a0.w].y * input_1.y) + (Bones[0][a0.w].z * input_1.z);
    r1.y = (Bones[1][a0.w].x * input_1.x) + (Bones[1][a0.w].y * input_1.y) + (Bones[1][a0.w].z * input_1.z);
    r1.z = (Bones[2][a0.w].x * input_1.x) + (Bones[2][a0.w].y * input_1.y) + (Bones[2][a0.w].z * input_1.z);
    r0.w = 1.0 / sqrt(r0.w);
    r2.xyz = (r1.w * r1) + r2;
    output_5.xyz = r0 * r0.w;
    r0.w = (r2.x * r2.x) + (r2.y * r2.y) + (r2.z * r2.z);
    r0.w = 1.0 / sqrt(r0.w);
    r0.x = (Bones[0][a0.y].x * input_2.x) + (Bones[0][a0.y].y * input_2.y) + (Bones[0][a0.y].z * input_2.z);
    r0.y = (Bones[1][a0.y].x * input_2.x) + (Bones[1][a0.y].y * input_2.y) + (Bones[1][a0.y].z * input_2.z);
    r0.z = (Bones[2][a0.y].x * input_2.x) + (Bones[2][a0.y].y * input_2.y) + (Bones[2][a0.y].z * input_2.z);
    r1.xyz = r0 * input_6.y;
    r0.x = (Bones[0][a0.x].x * input_2.x) + (Bones[0][a0.x].y * input_2.y) + (Bones[0][a0.x].z * input_2.z);
    r0.y = (Bones[1][a0.x].x * input_2.x) + (Bones[1][a0.x].y * input_2.y) + (Bones[1][a0.x].z * input_2.z);
    r0.z = (Bones[2][a0.x].x * input_2.x) + (Bones[2][a0.x].y * input_2.y) + (Bones[2][a0.x].z * input_2.z);
    r1.xyz = (input_6.x * r0) + r1;
    r0.x = (Bones[0][a0.z].x * input_2.x) + (Bones[0][a0.z].y * input_2.y) + (Bones[0][a0.z].z * input_2.z);
    r0.y = (Bones[1][a0.z].x * input_2.x) + (Bones[1][a0.z].y * input_2.y) + (Bones[1][a0.z].z * input_2.z);
    r0.z = (Bones[2][a0.z].x * input_2.x) + (Bones[2][a0.z].y * input_2.y) + (Bones[2][a0.z].z * input_2.z);
    output_3.xyz = r2 * r0.w;
    r2.xyz = (input_6.z * r0) + r1;
    r1.x = (Bones[0][a0.w].x * input_2.x) + (Bones[0][a0.w].y * input_2.y) + (Bones[0][a0.w].z * input_2.z);
    r1.y = (Bones[1][a0.w].x * input_2.x) + (Bones[1][a0.w].y * input_2.y) + (Bones[1][a0.w].z * input_2.z);
    r1.z = (Bones[2][a0.w].x * input_2.x) + (Bones[2][a0.w].y * input_2.y) + (Bones[2][a0.w].z * input_2.z);
    r0 = (input_0.xyzx * const_0.xxxz) - const_0.zzzx;
    r2.xyz = (r1.w * r1) + r2;
    r1.x = (Bones[0][a0.y].x * r0.x) + (Bones[0][a0.y].y * r0.y) + (Bones[0][a0.y].z * r0.z) + (Bones[0][a0.y].w * r0.w);
    r1.y = (Bones[1][a0.y].x * r0.x) + (Bones[1][a0.y].y * r0.y) + (Bones[1][a0.y].z * r0.z) + (Bones[1][a0.y].w * r0.w);
    r1.z = (Bones[2][a0.y].x * r0.x) + (Bones[2][a0.y].y * r0.y) + (Bones[2][a0.y].z * r0.z) + (Bones[2][a0.y].w * r0.w);
    r3.xyz = r1 * input_6.y;
    r1.x = (Bones[0][a0.x].x * r0.x) + (Bones[0][a0.x].y * r0.y) + (Bones[0][a0.x].z * r0.z) + (Bones[0][a0.x].w * r0.w);
    r1.y = (Bones[1][a0.x].x * r0.x) + (Bones[1][a0.x].y * r0.y) + (Bones[1][a0.x].z * r0.z) + (Bones[1][a0.x].w * r0.w);
    r1.z = (Bones[2][a0.x].x * r0.x) + (Bones[2][a0.x].y * r0.y) + (Bones[2][a0.x].z * r0.z) + (Bones[2][a0.x].w * r0.w);
    r3.xyz = (input_6.x * r1) + r3;
    r1.x = (Bones[0][a0.z].x * r0.x) + (Bones[0][a0.z].y * r0.y) + (Bones[0][a0.z].z * r0.z) + (Bones[0][a0.z].w * r0.w);
    r1.y = (Bones[1][a0.z].x * r0.x) + (Bones[1][a0.z].y * r0.y) + (Bones[1][a0.z].z * r0.z) + (Bones[1][a0.z].w * r0.w);
    r1.z = (Bones[2][a0.z].x * r0.x) + (Bones[2][a0.z].y * r0.y) + (Bones[2][a0.z].z * r0.z) + (Bones[2][a0.z].w * r0.w);
    r3.xyz = (input_6.z * r1) + r3;
    r1.x = (Bones[0][a0.w].x * r0.x) + (Bones[0][a0.w].y * r0.y) + (Bones[0][a0.w].z * r0.z) + (Bones[0][a0.w].w * r0.w);
    r1.y = (Bones[1][a0.w].x * r0.x) + (Bones[1][a0.w].y * r0.y) + (Bones[1][a0.w].z * r0.z) + (Bones[1][a0.w].w * r0.w);
    r1.z = (Bones[2][a0.w].x * r0.x) + (Bones[2][a0.w].y * r0.y) + (Bones[2][a0.w].z * r0.z) + (Bones[2][a0.w].w * r0.w);
    r0.xyz = (r1.w * r1) + r3;
    r0.w = const_0.x;
    r1.w = (r2.x * r2.x) + (r2.y * r2.y) + (r2.z * r2.z);
    r1.x = (SkinModelViewProj[0].x * r0.x) + (SkinModelViewProj[0].y * r0.y) + (SkinModelViewProj[0].z * r0.z) + (SkinModelViewProj[0].w * r0.w);
    r1.y = (SkinModelViewProj[1].x * r0.x) + (SkinModelViewProj[1].y * r0.y) + (SkinModelViewProj[1].z * r0.z) + (SkinModelViewProj[1].w * r0.w);
    r1.z = (SkinModelViewProj[2].x * r0.x) + (SkinModelViewProj[2].y * r0.y) + (SkinModelViewProj[2].z * r0.z) + (SkinModelViewProj[2].w * r0.w);
    r2.w = 1.0 / sqrt(r1.w);
    r1.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    output_4.xyz = r2 * r2.w;
    r1.w = 1.0 / sqrt(r1.w);
    output_0.w = (SkinModelViewProj[3].x * r0.x) + (SkinModelViewProj[3].y * r0.y) + (SkinModelViewProj[3].z * r0.z) + (SkinModelViewProj[3].w * r0.w);
    r0.w = 1.0 / r1.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    output_6.xyz = r0;
    r0.w = sat(r0.w * r1.w);
    output_0.xyz = r1;
    r0.w = const_0.x - r0.w;
    output_7.w = r0.w * FogParam.z;
    output_1.xy = input_4;
    output_2 = input_5;
    output_7.xyz = FogColor;

// approximately 98 instruction slots used
