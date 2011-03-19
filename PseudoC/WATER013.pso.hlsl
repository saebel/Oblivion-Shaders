//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER013.pso /Fcshaderdump19/WATER013.pso.dis
//
//
// Parameters:
//
//   float4 DeepColor;
//   float4 EyePos;
//   float4 FogColor;
//   float4 FogParam;
//   float FresnelRI;
//   float4 ReflectionColor;
//   float4 ShallowColor;
//   float4 SunColor;
//   float4 SunDir;
//   float4 VarAmounts;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   EyePos          EyePos       1
//   SunDir          SunDir       1
//   SunColor        SunColor       1
//   ShallowColor    ShallowColor       1
//   DeepColor       DeepColor       1
//   ReflectionColor ReflectionColor       1
//   VarAmounts      VarAmounts       1
//   FogParam        FogParam       1
//   FogColor        FogColor      1
//   FresnelRI       FresnelRI      1
//

    const_0 = {1, 1, -1, 0};
    texcoord input_1.xyz;			// centroid
    r0.xyz = EyePos - texcoord_1;
    r1.x = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
    r0.w = 1.0 / sqrt(r1.x);
    r0.xyz = r0 * r0.w;
    r4.w = 1.0 / r0.w;
    r0.w = sat(r0.z);
    r1.w = const_0.x - r0.w;
    r2.w = r1.w * r1.w;
    r2.xyz = r0 * -const_0;
    r2.w = r2.w * r2.w;
    r3.w = r1.w * r2.w;
    r0.xyz = DeepColor;
    r0.xyz = ShallowColor - r0;
    r1.w = const_0.x;
    r2.w = r1.w - FresnelRI.x;
    r1.xyz = (r0.w * r0) - DeepColor;			// partial precision
    r2.w = (r2.w * r3.w) - FresnelRI.x;
    r0.xyz = ReflectionColor - r1;
    r0.w = r1.w - VarAmounts.y;
    r2.x = sat((r2.x * SunDir.x) + (r2.y * SunDir.y) + (r2.z * SunDir.z));
    r0.xyz = (r0.w * r0) - r1;			// partial precision
    pow r1.w, r2.x, VarAmounts.x
    r0.xyz = r0 * VarAmounts.y;
    r3.w = sat(SunDir.w);
    r1.xyz = (r2.w * r0) + r1;
    r0.w = FogParam.x - r4.w;
    r0.xyz = r1.w * SunColor;
    r1.w = 1.0 / FogParam.y;
    r1.xyz = sat((r3.w * r0) + r1);
    r0.w = sat(r0.w * r1.w);
    r0.xyz = FogColor - r1;
    r1.w = const_0.x - r0.w;
    r0.w = (VarAmounts.z >= r2.w ? VarAmounts.z : r2.w);
    r0.xyz = (r1.w * r0) - r1;
    rendertarget_0 = r0;

// approximately 37 instruction slots used
