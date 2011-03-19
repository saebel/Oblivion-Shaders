//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3028.vso /Fcshaderdump19/SM3028.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   row_major float4x4 ModelViewProj;
//   float UOffset;
//   float VOffset;
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
//   EyePosition   EyePosition       1
//   UOffset       UOffset       1
//   VOffset       VOffset      1
//   FogParam      FogParam      1
//   FogColor      FogColor      1
//

    const_4 = {0.0250000004, 0.0208350997, -0.0851330012, 0.180141002};
    const_5 = {-0.330299497, 0.999866009, -2, 1.57079637};
    const_6 = {-3.14159274, 0.318471342, 1, 0};
    position input_0;
    tangent input_1;
    binormal input_2;
    normal input_3;
    texcoord input_4;
    position output_0;
    texcoord output_1.xy;
    texcoord_1 output_2.xy;
    texcoord_3 output_3.xyz;
    color_1 output_4;
    r0.w = (abs(input_0.y) >= abs(input_0.x) ? abs(input_0.y) : abs(input_0.x));
    r0.z = 1.0 / r0.w;
    r0.w = (abs(input_0.y) < abs(input_0.x) ? abs(input_0.y) : abs(input_0.x));
    r0.w = r0.z * r0.w;
    r0.z = r0.w * r0.w;
    r0.y = (r0.z * const_4.y) - const_4.z;
    r0.y = (r0.z * r0.y) - const_4.w;
    r0.y = (r0.z * r0.y) - const_5.x;
    r0.z = (r0.z * r0.y) - const_5.y;
    r0.y = const_4.x;
    output_2.y = (input_0.z * r0.y) - UOffset.x;
    r0.y = r0.w * r0.z;
    r0.w = (r0.y * const_5.z) - const_5.w;
    r0.z = (abs(input_0.y) < abs(input_0.x) ? 1.0 : 0.0);
    r0.z = (r0.w * r0.z) - r0.y;
    r0.w = (input_0.y < -input_0.y ? 1.0 : 0.0);
    r0.x = (r0.w * const_6.x) - r0.z;
    r0.w = (input_0.y < input_0.x ? input_0.y : input_0.x);
    r0.y = r0.x - r0.x;
    r0.w = (r0.w < -r0.w ? 1.0 : 0.0);
    r0.z = (input_0.y >= input_0.x ? input_0.y : input_0.x);
    r1.xyz = EyePosition - input_0;
    r1.w = (r0.z >= -r0.z ? 1.0 : 0.0);
    r0.z = (input_3.x * r1.x) + (input_3.y * r1.y) + (input_3.z * r1.z);
    r0.w = r0.w * r1.w;
    r0.z = (r0.z < const_6.z ? 1.0 : 0.0);
    r0.w = (r0.w * -r0.y) - r0.x;
    r0.xyz = r1 * r0.z;
    r2.yw = const_6;
    output_2.x = (r0.w * r2.y) - VOffset.x;
    r2.xyz = (const_5.z * r0) + r1;
    output_0.w = (ModelViewProj[3].x * input_0.x) + (ModelViewProj[3].y * input_0.y) + (ModelViewProj[3].z * input_0.z) + (ModelViewProj[3].w * input_0.w);
    r1.x = (input_1.x * r2.x) + (input_1.y * r2.y) + (input_1.z * r2.z);
    r1.y = (input_2.x * r2.x) + (input_2.y * r2.y) + (input_2.z * r2.z);
    r0.x = (ModelViewProj[0].x * input_0.x) + (ModelViewProj[0].y * input_0.y) + (ModelViewProj[0].z * input_0.z) + (ModelViewProj[0].w * input_0.w);
    r0.y = (ModelViewProj[1].x * input_0.x) + (ModelViewProj[1].y * input_0.y) + (ModelViewProj[1].z * input_0.z) + (ModelViewProj[1].w * input_0.w);
    r0.z = (ModelViewProj[2].x * input_0.x) + (ModelViewProj[2].y * input_0.y) + (ModelViewProj[2].z * input_0.z) + (ModelViewProj[2].w * input_0.w);
    r1.z = (input_3.x * r2.x) + (input_3.y * r2.y) + (input_3.z * r2.z);
    r0.w = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r1.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    r0.w = 1.0 / sqrt(r0.w);
    r2.z = 1.0 / sqrt(r1.w);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    output_3.xyz = r1 * r2.z;
    r0.w = sat(r0.w * r1.w);
    r1.w = const_6.z - r0.w;
    r0.w = (r2.w < FogParam.z ? 1.0 : 0.0);
    output_0.xyz = r0;
    output_4.w = r1.w * r0.w;
    output_1.xy = input_4;
    output_4.xyz = FogColor;

// approximately 53 instruction slots used