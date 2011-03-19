//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PARTICLE.vso /Fcshaderdump19/PARTICLE.vso.dis
//
//
// Parameters:
//
//   float4 Acceleration;
//   float4 Color1;
//   float4 Color2;
//   float4 Color3;
//   float4 InstanceData[2];
//   float4 Velocity;
//   row_major float4x4 WorldViewProj;
//   float4 fVars0;
//   float4 fVars1;
//   float4 fVars2;
//   float4 fVars3;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WorldViewProj const_0       4
//   fVars0        fVars0       1
//   fVars1        fVars1       1
//   fVars2        fVars2       1
//   fVars3        fVars3       1
//   Color1        Color1       1
//   Color2        Color2       1
//   Color3        Color3      1
//   Velocity      Velocity      1
//   Acceleration  Acceleration      1
//   InstanceData  const_15      2
//

    const_13 = {2, 0.5, 1, 0};
    position input_0;
    texcoord input_1;
    color_1 input_2;
    r0.w = input_2.x - input_2.x;
    r0.w = r0.w - floor(r0.w);
    r0.w = (const_13.x * input_2.x) - r0.w;
    mova a0.w, r0.w
    r1.xzw = fVars0;
    r0.w = r1.x - const_15[a0.w].w;
    r0.xyz = const_16[a0.w];
    r1.xyz = (r1.z * r0) + Velocity;
    r3.w = r0.w * const_16[a0.w].w;
    r0.xyz = (r1.w * r0) + Acceleration;
    r0.w = r3.w * r3.w;
    r1.xyz = (r3.w * r1) + const_15[a0.w];
    r0.xyz = r0 * r0.w;
    r0.xyz = (const_13.y * r0) + r1;
    r0.xyz = r0 - fVars3;
    r5.w = 1.0 / fVars0.y;
    r0.w = const_13.z;
    r6.w = r3.w * r5.w;
    r2.xz = fVars2;
    r3.xy = (fVars2.zwzw < r6.w ? 1.0 : 0.0);
    r4.zw = const_13;
    r1.xzw = (fVars2.yywy * r4.zyzw) - r4.wywz;
    r2.xz = r2 * r3.x;
    r2.yw = r3.x * (fVars2 - fVars2.xxzz) + fVars2.xxzz;
    r1.xzw = r1 - r2;
    r1.y = -r2.y;
    position.z = (const_2.x * r0.x) + (const_2.y * r0.y) + (const_2.z * r0.z) + (const_2.w * r0.w);
    r1 = (r3.y * r1) - r2;
    position.w = (const_3.x * r0.x) + (const_3.y * r0.y) + (const_3.z * r0.z) + (const_3.w * r0.w);
    r2.w = r1.w - r1.z;
    r1.w = (r3.w * r5.w) - r1.z;
    r2.w = 1.0 / r2.w;
    r3.xyz = (fVars1 < r6.w ? 1.0 : 0.0);
    r1.w = r1.w * r2.w;
    r2.w = r1.w * (r1.y - r1.x) + r1.x;
    r1.w = fVars1.x;
    r1.x = r3.x * r1.w;
    r1.z = r3.x * (fVars1.y - fVars1.x) + fVars1.x;
    r5.xy = r3.y * (fVars1.yzzw - r1.xzzw) + r1.xzzw;
    r2.xy = (fVars1.z * r4.zwzw) - r4.wzzw;
    r4.xy = r2.w * input_0;
    r1.xy = r3.z * (r2 - r5) + r5;
    r5.x = (const_0.x * r0.x) + (const_0.y * r0.y) + (const_0.z * r0.z) + (const_0.w * r0.w);
    r2.w = r1.y - r1.x;
    r1.w = (r3.w * r5.w) - r1.x;
    r2.w = 1.0 / r2.w;
    r5.y = (const_1.x * r0.x) + (const_1.y * r0.y) + (const_1.z * r0.z) + (const_1.w * r0.w);
    r5.w = r1.w * r2.w;
    r0 = Color1 - r4.zzzw;
    r1 = Color1;
    r1 = Color2 - r1;
    r0 = (r3.x * r0) - const_13.zzzw;
    r2 = (r3.x * r1) - Color1;
    r1 = r3.y * (Color2 - r0) + r0;
    r0 = r3.y * (Color3 - r2) + r2;
    r2 = r3.z * (Color3 - r1) + r1;
    r1 = r3.z * (const_13.zzzw - r0) + r0;
    r3.w = 1.0 / fVars1.w;
    r0 = r5.w * (r1 - r2) + r2;
    position.xy = (r3.w * r4) + r5;
    color_0.w = r0.w * fVars3.w;
    color_0.xyz = r0;
    texcoord_0.xy = input_1;

// approximately 73 instruction slots used