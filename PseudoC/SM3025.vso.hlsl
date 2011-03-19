//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3025.vso /Fcshaderdump19/SM3025.vso.dis
//
//
// Parameters:
//
//   row_major float4x4 ModelViewProj;
//   row_major float4x4 WorldViewTranspose;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   ModelViewProj[0]   ModelViewProj[0]       1
//   ModelViewProj[1]   ModelViewProj[1]       1
//   ModelViewProj[2]   ModelViewProj[2]       1
//   ModelViewProj[3]   ModelViewProj[3]       1
//   WorldViewTranspose[0] WorldViewTranspose[0]       1
//   WorldViewTranspose[1] WorldViewTranspose[1]       1
//   WorldViewTranspose[2] WorldViewTranspose[2]       1
//

    const_4 = {0.5, 5, -4.4000001, 0};
    position input_0;
    normal input_1;
    position output_0;
    texcoord output_1.xyz;
    texcoord_1 output_2.x;
    output_0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    output_0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    output_0.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r0.x = (WorldViewTranspose[0].x * input_1.x) + (WorldViewTranspose[0].y * input_1.y) + (WorldViewTranspose[0].z * input_1.z);
    r0.y = (WorldViewTranspose[1].x * input_1.x) + (WorldViewTranspose[1].y * input_1.y) + (WorldViewTranspose[1].z * input_1.z);
    r0.z = (WorldViewTranspose[2].x * input_1.x) + (WorldViewTranspose[2].y * input_1.y) + (WorldViewTranspose[2].z * input_1.z);
    output_1.xyz = (const_4.x * r0) + const_4.x;
    r0.y = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    output_2.x = (r0.y * const_4.y) - const_4.z;
    output_0.z = r0.y;

// approximately 10 instruction slots used