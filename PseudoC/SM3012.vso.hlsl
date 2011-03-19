//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3012.vso /Fcshaderdump19/SM3012.vso.dis
//
//
// Parameters:
//
//   float3 BoundWorldCenter;
//   float3 EyePosition;
//   row_major float4x4 ModelViewProj;
//   row_major float4x4 ObjToCubeSpace;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   ModelViewProj[0]    ModelViewProj[0]       1
//   ModelViewProj[1]    ModelViewProj[1]       1
//   ModelViewProj[2]    ModelViewProj[2]       1
//   ModelViewProj[3]    ModelViewProj[3]       1
//   ObjToCubeSpace[0]   ObjToCubeSpace[0]      1
//   ObjToCubeSpace[1]   ObjToCubeSpace[1]      1
//   ObjToCubeSpace[2]   ObjToCubeSpace[2]      1
//   EyePosition      EyePosition      1
//   BoundWorldCenter BoundWorldCenter      1
//

    const_4 = {-2, 3, 0, 0};
    const_5 = {0.5, -0.800000012, 6.66666651, 1};
    position input_0;
    texcoord input_1;
    position output_0;
    texcoord output_1.xy;
    texcoord_1 output_2;
    texcoord_2 output_3.xyz;
    dcl_color output_4.xyz
    output_0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    output_0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.x = (ObjToCubeSpace[0].x * input_0.x) + (ObjToCubeSpace[0].y * input_0.y) + (ObjToCubeSpace[0].z * input_0.z) + (ObjToCubeSpace[0].w * input_0.w);
    r0.y = (ObjToCubeSpace[1].x * input_0.x) + (ObjToCubeSpace[1].y * input_0.y) + (ObjToCubeSpace[1].z * input_0.z) + (ObjToCubeSpace[1].w * input_0.w);
    r0.z = (ObjToCubeSpace[2].x * input_0.x) + (ObjToCubeSpace[2].y * input_0.y) + (ObjToCubeSpace[2].z * input_0.z) + (ObjToCubeSpace[2].w * input_0.w);
    output_0.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r2.xyz = r0 - BoundWorldCenter;
    r0.xyz = EyePosition - r0;
    r1.xyz = norm(r2);
    r2.xyz = norm(r0);
    r1.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r0.w = (r1.x * r2.x) + (r1.y * r2.y) + (r1.z * r2.z);
    r1.w = 1.0 / sqrt(r1.w);
    output_0.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r0.w = (r0.w * r1.w) - const_5.y;
    output_2.xyz = (const_5.x * r1) + const_5.x;
    r1.w = sat(r0.w * const_5.z);
    r0.w = (r1.w * const_4.x) - const_4.y;
    r1.w = r1.w * r1.w;
    output_3.xyz = r0;
    output_2.w = r0.w * r1.w;
    output_1.xy = input_1;
    output_4.xyz = const_5.w;

// approximately 27 instruction slots used
