//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYT.vso /Fcshaderdump19/SKYT.vso.dis
//
//
// Parameters:
//
//   float4 BlendColor[3];
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
//   BlendColor    const_4       3
//

    position input_0;
    texcoord input_1;
    color input_2;
    position output_0;
    texcoord output_1.xy;
    texcoord_1 output_2.xy;
    texcoord_2 output_3.xy;
    texcoord_3 output_4.xy;
    dcl_color output_5
    r0.xyz = const_5 * input_2.y;
    r0.xyz = (input_2.x * const_4) + r0;
    output_5.xyz = (input_2.z * const_6) + r0;
    r0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    r0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.z = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    output_5.w = const_4.w * input_2.w;
    output_0 = r0.xyzz;
    output_1.xy = input_1;
    output_2.xy = input_1;
    output_3.xy = input_1;
    output_4.xy = input_1;

// approximately 12 instruction slots used