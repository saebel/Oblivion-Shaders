//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1017.vso /Fcshaderdump19/SLS1017.vso.dis
//
//
// Parameters:
//
//   float3 FogColor;
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

    const_4 = {0, 1, 0, 0};
    position input_0;
    r0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    r0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r1.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r0.w = 1.0 / sqrt(r1.x);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    r0.w = r0.w * r1.w;
    position.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r0.w = (r0.w >= const_4.x ? r0.w : const_4.x);
    position.xyz = r0;
    r0.w = (r0.w < const_4.y ? r0.w : const_4.y);
    color_0.w = const_4.y - r0.w;
    color_0.xyz = FogColor;

// approximately 15 instruction slots used
