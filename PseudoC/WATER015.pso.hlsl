//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATER015.pso /Fcshaderdump19/WATER015.pso.dis
//
//
// Parameters:
//
//   float4 DeepColor;
//   sampler2D DetailMap;
//   float4 EyePos;
//   float FresnelRI;
//   sampler2D NormalMap;
//   float4 ReflectionColor;
//   sampler2D ReflectionMap;
//   float2 Scroll;
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
//   Scroll          Scroll       1
//   EyePos          EyePos       1
//   SunDir          SunDir       1
//   SunColor        SunColor       1
//   ShallowColor    ShallowColor       1
//   DeepColor       DeepColor       1
//   ReflectionColor ReflectionColor       1
//   VarAmounts      VarAmounts       1
//   FresnelRI       FresnelRI      1
//   ReflectionMap   ReflectionMap       1
//   NormalMap       NormalMap       1
//   DetailMap       DetailMap       1
//

    const_4 = {0.100000001, 0.000199999995, 2496, 4};
    const_9 = {2, -1, 0, -0.000122070313};
    texcoord input_0.xyz;			// centroid
    texcoord input_1.xyz;			// centroid
    texcoord input_2;			// centroid
    texcoord input_3;			// centroid
    texcoord input_4;			// centroid
    texcoord input_5;			// centroid
    texcoord input_6.xy;
    sampler ReflectionMap;
    sampler NormalMap;
    sampler DetailMap;
    r0.xy = EyePos - texcoord_1;
    dp2r0.w = r0 - r0;, const_9.z
    r0.w = 1.0 / sqrt(r0.w);
    r1.w = 1.0 / r0.w;
    r2.w = sat((r1.w * const_9.w) - const_9.y);
    r3.w = r2.w * r2.w;
    r3.xy = texcoord_6 - Scroll;
    r0 = NormalMap[r3];
    r0.xyz = (const_9.x * r0) - const_9.y;
    r0.xy = r3.w * r0;
    r0.w = sat(r1.w * const_4.y);
    r0.w = (r0.w * const_4.z) - const_4.w;
    r2.xyz = norm(r0);
    r1.xy = (r0.w * r2) - texcoord_0;
    r1.z = texcoord_0.z;
    r1.w = -const_9.y;
    r0.x = (texcoord_2.x * r1.x) + (texcoord_2.y * r1.y) + (texcoord_2.z * r1.z) + (texcoord_2.w * r1.w);
    r0.y = (texcoord_3.x * r1.x) + (texcoord_3.y * r1.y) + (texcoord_3.z * r1.z) + (texcoord_3.w * r1.w);
    r0.z = (texcoord_4.x * r1.x) + (texcoord_4.y * r1.y) + (texcoord_4.z * r1.z) + (texcoord_4.w * r1.w);
    r0.w = (texcoord_5.x * r1.x) + (texcoord_5.y * r1.y) + (texcoord_5.z * r1.z) + (texcoord_5.w * r1.w);
    r2.w = r2.w * VarAmounts.w;
    r1.xy = (const_4.x * r2) + r3;
    texldp r0, r0, ReflectionMap			// partial precision
    r1 = DetailMap[r1];
    r3.xyz = EyePos - texcoord_1;
    r4.xyz = norm(r3);
    r6.x = sat((r4.x * r2.x) + (r4.y * r2.y) + (r4.z * r2.z));
    r0.xyz = r0 - ReflectionColor;
    add r0.w, -r6.x, -const_9.y
    r3.z = VarAmounts.y;
    r0.xyz = (r3.z * r0) - ReflectionColor;			// partial precision
    r1.w = r0.w * r0.w;
    r1.w = r1.w * r1.w;
    r3.xyz = DeepColor;
    r3.xyz = ShallowColor - r3;
    r1.w = r0.w * r1.w;
    r5.x = (-r4.x * r2.x) + (-r4.y * r2.y) + (-r4.z * r2.z);
    r3.xyz = (r6.x * r3) - DeepColor;			// partial precision
    r3.w = r5.x - r5.x;
    r5.z = const_9.y;
    add r0.w, -r5.z, -FresnelRI.x
    r2.xyz = (-r3.w * r2) + -r4;
    r1.w = (r0.w * r1.w) - FresnelRI.x;
    r4.x = sat((r2.x * SunDir.x) + (r2.y * SunDir.y) + (r2.z * SunDir.z));
    r2.xyz = r1.w * (r0 - r3) + r3;
    pow r0.w, r4.x, VarAmounts.x
    r0.xyz = r0.w * SunColor;
    r0.w = sat(SunDir.w);
    r2.xyz = (r0.w * r0) + r2;
    r0.w = (VarAmounts.z >= r1.w ? VarAmounts.z : r1.w);
    r0.xyz = r2.w * (r1 - r2) + r2;
    rendertarget_0 = r0;

// approximately 60 instruction slots used (3 texture, 57 arithmetic)
