//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3002.vso /Fcshaderdump19/SM3002.vso.dis
//
//
// Parameters:
//
//   float4 FogColor;
//   float4 FogParam;
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
//   FogParam      FogParam      1
//   FogColor      FogColor      1
//

    const_4 = {1, 0, 0, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    color input_5;
    position output_0;
    texcoord output_1.xy;
    dcl_color output_2
    texcoord_3 output_3.xyz;
    texcoord_4 output_4.xyz;
    texcoord_5 output_5.xyz;
    texcoord_6 output_6.xyz;
    texcoord_7 output_7;
    r0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    r0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r0.w = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r0.w = 1.0 / sqrt(r0.w);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    output_0.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r0.w = sat(r0.w * r1.w);
    output_0.xyz = r0;
    r0.w = const_4.x - r0.w;
    output_7.w = r0.w * FogParam.z;
    output_1.xy = input_4;
    output_2 = input_5;
    output_3.xyz = input_1;
    output_4.xyz = input_2;
    output_5.xyz = input_3;
    output_6.xyz = input_0;
    output_7.xyz = FogColor;

// approximately 20 instruction slots used
