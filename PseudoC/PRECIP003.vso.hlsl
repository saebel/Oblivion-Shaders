//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PRECIP003.vso /Fcshaderdump19/PRECIP003.vso.dis
//
//
// Parameters:
//
//   float3 CameraUp;
//   float3 EyePosition;
//   float3 MaxPos;
//   float3 MinPos;
//   float3 Params;
//   float3 Velocity;
//   row_major float4x4 WorldViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WorldViewProj const_0       4
//   EyePosition   EyePosition       1
//   Velocity      Velocity       1
//   MinPos        MinPos      1
//   MaxPos        MaxPos      1
//   Params        Params      1
//   CameraUp      CameraUp      1
//

    const_4 = {6.28318548, -3.14159274, 0, 0};
    const_5 = {0, 0.159154937, 0.5, 1};
    const_6 = {-1, 0, 1, 0};
    position input_0;
    texcoord input_1;
    texcoord_1 input_2;
    position output_0;
    dcl_color output_1
    texcoord output_2.xy;
    r0.xyz = Velocity;
    r3.xyz = (Params.x * r0) + input_2;
    r1.xyz = MaxPos;
    r2.xyz = r1 - MinPos;
    r3.xyz = r3 - MinPos;
    r4.x = 1.0 / r2.x;
    r4.y = 1.0 / r2.y;
    r4.z = 1.0 / r2.z;
    r3.xyz = r3 * r4;
    r5.xyz = abs(r3) - floor(abs(r3));
    r4.xyz = (r3 >= -r3 ? 1.0 : 0.0);
    r0.w = (Params.z * Params.x) - input_2.x;
    r3.xyz = r4 * (r5 - -r5) + -r5;
    r0.w = (r0.w * const_5.y) - const_5.z;
    r3.xyz = r2 * r3;
    r0.w = r0.w - floor(r0.w);
    r4.xyz = abs(r3) - MinPos;
    r5.xyz = MaxPos - abs(r3);
    r0.xyz = (const_5.x < r0 ? 1.0 : 0.0);
    r1.w = (r0.w * const_4.x) - const_4.y;
    r3.xyz = r0 * (r4 - r5) + r5;
    sincos r0.xy, r1.w
    r4.xyz = r3 - EyePosition;
    r6.xyz = r0.xxyw * const_5.wxww;
    r5.xyz = norm(-r4);
    r4.xyz = r0.yxxw * const_6;
    r0.xyz = r5.yzxw * CameraUp.zxyw;
    r0.w = (r6.x * input_0.x) + (r6.y * input_0.y) + (r6.z * input_0.z);
    r6.xyz = (CameraUp.yzxw * r5.zxyw) - r0;
    r5.xyz = r5 * input_0.y;
    r0.xyz = norm(r6);
    r0.xyz = (r0.w * r0) + r5;
    r0.w = (r4.x * input_0.x) + (r4.y * input_0.y) + (r4.z * input_0.z);
    r0.xyz = (r0.w * CameraUp) + r0;
    r1.xyz = (-const_5.z * abs(r2)) + r1;
    r2.x = 1.0 / abs(r2.x);
    r2.y = 1.0 / abs(r2.y);
    r2.z = 1.0 / abs(r2.z);
    r1.xyz = r1 - r3;
    r0.xyz = r3 - r0;
    r1.xyz = r2 * r1;
    r0.w = const_5.w;
    r1.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
    output_0.x = (const_0.x * r0.x) + (const_0.y * r0.y) + (const_0.z * r0.z) + (const_0.w * r0.w);
    r1.w = 1.0 / sqrt(r1.w);
    output_0.y = (const_1.x * r0.x) + (const_1.y * r0.y) + (const_1.z * r0.z) + (const_1.w * r0.w);
    r1.w = 1.0 / r1.w;
    output_0.z = (const_2.x * r0.x) + (const_2.y * r0.y) + (const_2.z * r0.z) + (const_2.w * r0.w);
    r1.w = const_5.w - r1.w;
    output_0.w = (const_3.x * r0.x) + (const_3.y * r0.y) + (const_3.z * r0.z) + (const_3.w * r0.w);
    output_1.w = r1.w * r1.w;
    output_1.xyz = const_5.w;
    output_2.xy = input_1;

// approximately 60 instruction slots used