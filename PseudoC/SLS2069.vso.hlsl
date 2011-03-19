//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2069.vso /Fcshaderdump19/SLS2069.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   row_major float4x4 SkinModelViewProj;
//   row_major float4x4 SkinWorldViewTranspose;
//
//
// Registers:
//
//   Name                   Reg   Size
//   ---------------------- ----- ----
//   SkinModelViewProj[0]   SkinModelViewProj[0]       1
//   SkinModelViewProj[1]   SkinModelViewProj[1]       1
//   SkinModelViewProj[2]   SkinModelViewProj[2]       1
//   SkinModelViewProj[3]   SkinModelViewProj[3]       1
//   SkinWorldViewTranspose[0] SkinWorldViewTranspose[0]       1
//   SkinWorldViewTranspose[1] SkinWorldViewTranspose[1]       1
//   SkinWorldViewTranspose[2] SkinWorldViewTranspose[2]       1
//   Bones[0]                  Bones[0]     17
//   Bones[1]                  Bones[1]     17
//   Bones[2]                  Bones[2]     17
//

    const_0 = {1, 765.01001, 0, 0.5};
    const_8 = {5, -4.4000001, 0, 0};
    position input_0;
    normal input_1;
    dcl_blendweight input_2
    dcl_blendindices input_3
    r0 = input_3.zyxw * const_0.y;
    r0 = r0 - floor(r0);
    r1.x = (input_2.x * const_0.x.x) + (input_2.y * const_0.x.y) + (input_2.z * const_0.x.z);
    r0 = (input_3.zyxw * const_0.y) - r0;
    mova a0, r0
    r0 = (input_0.xyzx * const_0.xxxz) - const_0.zzzx;
    r1.w = const_0.x - r1.x;
    r1.x = (Bones[0][a0.y].x * r0.x) + (Bones[0][a0.y].y * r0.y) + (Bones[0][a0.y].z * r0.z) + (Bones[0][a0.y].w * r0.w);
    r1.y = (Bones[1][a0.y].x * r0.x) + (Bones[1][a0.y].y * r0.y) + (Bones[1][a0.y].z * r0.z) + (Bones[1][a0.y].w * r0.w);
    r1.z = (Bones[2][a0.y].x * r0.x) + (Bones[2][a0.y].y * r0.y) + (Bones[2][a0.y].z * r0.z) + (Bones[2][a0.y].w * r0.w);
    r2.xyz = r1 * input_2.y;
    r1.x = (Bones[0][a0.x].x * r0.x) + (Bones[0][a0.x].y * r0.y) + (Bones[0][a0.x].z * r0.z) + (Bones[0][a0.x].w * r0.w);
    r1.y = (Bones[1][a0.x].x * r0.x) + (Bones[1][a0.x].y * r0.y) + (Bones[1][a0.x].z * r0.z) + (Bones[1][a0.x].w * r0.w);
    r1.z = (Bones[2][a0.x].x * r0.x) + (Bones[2][a0.x].y * r0.y) + (Bones[2][a0.x].z * r0.z) + (Bones[2][a0.x].w * r0.w);
    r2.xyz = (input_2.x * r1) + r2;
    r1.x = (Bones[0][a0.z].x * r0.x) + (Bones[0][a0.z].y * r0.y) + (Bones[0][a0.z].z * r0.z) + (Bones[0][a0.z].w * r0.w);
    r1.y = (Bones[1][a0.z].x * r0.x) + (Bones[1][a0.z].y * r0.y) + (Bones[1][a0.z].z * r0.z) + (Bones[1][a0.z].w * r0.w);
    r1.z = (Bones[2][a0.z].x * r0.x) + (Bones[2][a0.z].y * r0.y) + (Bones[2][a0.z].z * r0.z) + (Bones[2][a0.z].w * r0.w);
    r2.xyz = (input_2.z * r1) + r2;
    r1.x = (Bones[0][a0.w].x * r0.x) + (Bones[0][a0.w].y * r0.y) + (Bones[0][a0.w].z * r0.z) + (Bones[0][a0.w].w * r0.w);
    r1.y = (Bones[1][a0.w].x * r0.x) + (Bones[1][a0.w].y * r0.y) + (Bones[1][a0.w].z * r0.z) + (Bones[1][a0.w].w * r0.w);
    r1.z = (Bones[2][a0.w].x * r0.x) + (Bones[2][a0.w].y * r0.y) + (Bones[2][a0.w].z * r0.z) + (Bones[2][a0.w].w * r0.w);
    r0.xyz = (r1.w * r1) + r2;
    r0.w = const_0.x;
    r1.x = (Bones[0][a0.y].x * input_1.x) + (Bones[0][a0.y].y * input_1.y) + (Bones[0][a0.y].z * input_1.z);
    r1.y = (Bones[1][a0.y].x * input_1.x) + (Bones[1][a0.y].y * input_1.y) + (Bones[1][a0.y].z * input_1.z);
    r1.z = (Bones[2][a0.y].x * input_1.x) + (Bones[2][a0.y].y * input_1.y) + (Bones[2][a0.y].z * input_1.z);
    r2.xyz = r1 * input_2.y;
    r1.x = (Bones[0][a0.x].x * input_1.x) + (Bones[0][a0.x].y * input_1.y) + (Bones[0][a0.x].z * input_1.z);
    r1.y = (Bones[1][a0.x].x * input_1.x) + (Bones[1][a0.x].y * input_1.y) + (Bones[1][a0.x].z * input_1.z);
    r1.z = (Bones[2][a0.x].x * input_1.x) + (Bones[2][a0.x].y * input_1.y) + (Bones[2][a0.x].z * input_1.z);
    r2.xyz = (input_2.x * r1) + r2;
    r1.x = (Bones[0][a0.z].x * input_1.x) + (Bones[0][a0.z].y * input_1.y) + (Bones[0][a0.z].z * input_1.z);
    r1.y = (Bones[1][a0.z].x * input_1.x) + (Bones[1][a0.z].y * input_1.y) + (Bones[1][a0.z].z * input_1.z);
    r1.z = (Bones[2][a0.z].x * input_1.x) + (Bones[2][a0.z].y * input_1.y) + (Bones[2][a0.z].z * input_1.z);
    r2.xyz = (input_2.z * r1) + r2;
    r1.x = (Bones[0][a0.w].x * input_1.x) + (Bones[0][a0.w].y * input_1.y) + (Bones[0][a0.w].z * input_1.z);
    r1.y = (Bones[1][a0.w].x * input_1.x) + (Bones[1][a0.w].y * input_1.y) + (Bones[1][a0.w].z * input_1.z);
    r1.z = (Bones[2][a0.w].x * input_1.x) + (Bones[2][a0.w].y * input_1.y) + (Bones[2][a0.w].z * input_1.z);
    position.x = (SkinModelViewProj[0].x * r0.x) + (SkinModelViewProj[0].y * r0.y) + (SkinModelViewProj[0].z * r0.z) + (SkinModelViewProj[0].w * r0.w);
    r1.xyz = (r1.w * r1) + r2;
    position.y = (SkinModelViewProj[1].x * r0.x) + (SkinModelViewProj[1].y * r0.y) + (SkinModelViewProj[1].z * r0.z) + (SkinModelViewProj[1].w * r0.w);
    r2.xyz = norm(r1);
    position.w = (SkinModelViewProj[3].x * r0.x) + (SkinModelViewProj[3].y * r0.y) + (SkinModelViewProj[3].z * r0.z) + (SkinModelViewProj[3].w * r0.w);
    r1.x = (SkinWorldViewTranspose[0].x * r2.x) + (SkinWorldViewTranspose[0].y * r2.y) + (SkinWorldViewTranspose[0].z * r2.z);
    r1.y = (SkinWorldViewTranspose[1].x * r2.x) + (SkinWorldViewTranspose[1].y * r2.y) + (SkinWorldViewTranspose[1].z * r2.z);
    r1.z = (SkinWorldViewTranspose[2].x * r2.x) + (SkinWorldViewTranspose[2].y * r2.y) + (SkinWorldViewTranspose[2].z * r2.z);
    r0.y = (SkinModelViewProj[2].x * r0.x) + (SkinModelViewProj[2].y * r0.y) + (SkinModelViewProj[2].z * r0.z) + (SkinModelViewProj[2].w * r0.w);
    texcoord_0.xyz = (const_0.w * r1) + const_0.w;
    texcoord_1.x = (r0.y * const_8.x) - const_8.y;
    position.z = r0.y;

// approximately 53 instruction slots used
