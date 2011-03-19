//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2056.vso /Fcshaderdump19/SLS2056.vso.dis
//
//
// Parameters:
//
//   float4 LightPosition[3];
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
//   LightPosition      LightPosition      1
//

    position input_0;
    position.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    position.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    position.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    texcoord_1.x = (WorldViewTranspose[0].x * input_0.x) + (WorldViewTranspose[0].y * input_0.y) + (WorldViewTranspose[0].z * input_0.z) + (WorldViewTranspose[0].w * input_0.w);
    texcoord_1.y = (WorldViewTranspose[1].x * input_0.x) + (WorldViewTranspose[1].y * input_0.y) + (WorldViewTranspose[1].z * input_0.z) + (WorldViewTranspose[1].w * input_0.w);
    r0.w = (WorldViewTranspose[2].x * input_0.x) + (WorldViewTranspose[2].y * input_0.y) + (WorldViewTranspose[2].z * input_0.z) + (WorldViewTranspose[2].w * input_0.w);
    texcoord_1.z = r0.w - LightPosition.z;
    texcoord_1.w = LightPosition.w;

// approximately 9 instruction slots used