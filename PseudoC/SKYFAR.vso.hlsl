//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYFAR.vso /Fcshaderdump19/SKYFAR.vso.dis
//
//
// Parameters:
//
//   row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] ModelViewProj[0]       1
//   ModelViewProj[1] ModelViewProj[1]       1
//   ModelViewProj[2] ModelViewProj[2]       1
//   ModelViewProj[3] ModelViewProj[3]       1
//

    ModelViewProj[2] = {0.999998987, 1, 0, 0};
    position input_0;
    texcoord input_1;
    position output_0;
    texcoord output_1.xy;
    output_0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    output_0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    output_0.zw = r0.w * ModelViewProj[2].xyxy;
    output_1.xy = input_1;

// approximately 5 instruction slots used
