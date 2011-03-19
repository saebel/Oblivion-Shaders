//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL004.pso /Fcshaderdump19/SM3LL004.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   float4 LightData[8];
//   float3 MatAlpha;
//   sampler2D NormalMap;
//   float4 ToggleADTS;
//   float4 ToggleNumLights;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    AmbientColor       1
//   EyePosition     EyePosition       1
//   MatAlpha        MatAlpha       1
//   ToggleADTS      ToggleADTS       1
//   ToggleNumLights ToggleNumLights       1
//   LightData[0]       LightData[0]       1
//   LightData[1]       LightData[1]      1
//   LightData[2]       LightData[2]      1
//   LightData[3]       LightData[3]      1
//   LightData[4]       LightData[4]      1
//   LightData[5]       LightData[5]      1
//   LightData[6]       LightData[6]      1
//   LightData[7]       LightData[7]      1
//   BaseMap         BaseMap       1
//   NormalMap       NormalMap       1
//

    const_2 = {0.0399999991, -0.0199999996, -0.5, 0};
    const_4 = {1, 4, 0, 2};
    const_7 = {2, -6, -7, 0};
    const_8 = {2, -4, -5, -6};
    EyePosition7 = {2, -2, -3, -4};
    texcoord input_0.xy;			// partial precision
    color input_1.xyz;			// partial precision
    texcoord_3 input_2.xyz;			// partial precision			// centroid
    texcoord_4 input_3.xyz;			// partial precision			// centroid
    texcoord_5 input_4.xyz;			// partial precision			// centroid
    texcoord_6 input_5.xyz;			// partial precision			// centroid
    texcoord_7 input_6;			// partial precision			// centroid
    sampler BaseMap;
    sampler NormalMap;
    r9.xy = const_4;
    r0.w = r9.y - ToggleNumLights.x;			// partial precision
    r3.z = (ToggleNumLights.y < r0.w ? ToggleNumLights.y : r0.w);			// partial precision
    r1.w = r3.z - floor(r3.z);			// partial precision
    r2.w = (r3.z >= 0.0 ? const_4.x : const_4.z);
    r3.w = (r1.w <= 0.0 ? const_4.x : const_4.z);
    r0 = BaseMap[input_0];			// partial precision
    r4.xyz = norm(input_4);			// partial precision
    r1.xyz = EyePosition - input_5;			// partial precision
    r0.z = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);			// partial precision
    r6.xyz = norm(input_2);			// partial precision
    r5.xyz = norm(input_3);			// partial precision
    r0.x = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);			// partial precision
    r0.y = (r5.x * r1.x) + (r5.y * r1.y) + (r5.z * r1.z);			// partial precision
    r0.z = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);			// partial precision
    r0.z = 1.0 / sqrt(r0.z);			// partial precision
    r0.w = (r0.w * const_2.x) - const_2.y;			// partial precision
    r0.xy = r0 * r0.z;			// partial precision
    r1.z = (r4.x * LightData[1].x) + (r4.y * LightData[1].y) + (r4.z * LightData[1].z);			// partial precision
    r10.xy = (r0.w * r0) + input_0;			// partial precision
    r0 = NormalMap[r10];
    r0.xyz = r0 - const_2.z;
    r1.x = (r6.x * LightData[1].x) + (r6.y * LightData[1].y) + (r6.z * LightData[1].z);			// partial precision
    r0.xyz = r0 - r0;			// partial precision
    r2.xyz = norm(r0);			// partial precision
    r1.y = (r5.x * LightData[1].x) + (r5.y * LightData[1].y) + (r5.z * LightData[1].z);			// partial precision
    r0.w = r3.z - r1.w;			// partial precision
    r1.w = (r2.x * r1.x) + (r2.y * r1.y) + (r2.z * r1.z);			// partial precision
    r3.w = (r2.w * r3.w) - r0.w;
    r0.z = (r1.w >= const_2.w ? r1.w : const_2.w);			// partial precision
    r0.w = const_4.x;
    r0.xyz = r0.z * LightData[0];			// partial precision
    r2.w = const_2.w;
    r0 = (ToggleNumLights.x <= 0.0 ? r0 : r2.w);
    r1.w = (r3.w <= 0.0 ? const_4.x : const_4.z);
    if_ne r1.w, -r1.w
      r3.x = r0.w - r0.w;
      r3.yz = r3.x - const_4.xxww;
      r1.xyz = r3.x - const_4.zxww;
      r3.xyz = (r1 >= 0.0 ? -r3 : r1);
      r1 = (r3.x <= 0.0 ? r2.w : LightData[1]);
      r1 = (r3.y <= 0.0 ? r1 : LightData[2]);
      r1 = (r3.z <= 0.0 ? r1 : LightData[3]);
      r7.xyz = r1 - input_5;
      r1.z = (r7.x * r7.x) + (r7.y * r7.y) + (r7.z * r7.z);
      r4.w = 1.0 / sqrt(r1.z);
      r1.xyz = (r3.x <= 0.0 ? r2.w : LightData[0]);			// partial precision
      r3.x = 1.0 / r4.w;
      r1.w = 1.0 / r1.w;			// partial precision
      r8.x = (r6.x * r7.x) + (r6.y * r7.y) + (r6.z * r7.z);
      r8.y = (r5.x * r7.x) + (r5.y * r7.y) + (r5.z * r7.z);
      r8.z = (r4.x * r7.x) + (r4.y * r7.y) + (r4.z * r7.z);
      r3.x = sat(r3.x * r1.w);
      r7.xyz = norm(r8);			// partial precision
      r1.w = (r2.x * r7.x) + (r2.y * r7.y) + (r2.z * r7.z);			// partial precision
      r3.x = (r3.x * -r3.x) - const_4.x;			// partial precision
      r1.xyz = (r3.y <= 0.0 ? r1 : LightData[1]);			// partial precision
      r3.y = r1.w * r3.x;			// partial precision
      r1.xyz = (r3.z <= 0.0 ? r1 : LightData[2]);			// partial precision
      r1.w = (r3.y >= const_2.w ? r3.y : const_2.w);			// partial precision
      r0.xyz = (r1.w * r1) + r0;			// partial precision
      r0.w = r0.w - const_4.x;
    endif
    if_lt const_4.x, r3.w
      r3.xyz = (EyePosition7.x * r0.w) - EyePosition7.yzww;
      r1 = (r3.x == 0.0 ? LightData[3] : r2.w)
      r1 = (r3.y == 0.0 ? LightData[4] : r1)
      r1 = (r3.z == 0.0 ? LightData[5] : r1)
      r7.xyz = r1 - input_5;
      r1.z = (r7.x * r7.x) + (r7.y * r7.y) + (r7.z * r7.z);
      r4.w = 1.0 / sqrt(r1.z);
      r1.xyz = (r3.x == 0.0 ? LightData[2] : r2.w)			// partial precision
      r3.x = 1.0 / r4.w;
      r1.w = 1.0 / r1.w;			// partial precision
      r8.x = (r6.x * r7.x) + (r6.y * r7.y) + (r6.z * r7.z);
      r8.y = (r5.x * r7.x) + (r5.y * r7.y) + (r5.z * r7.z);
      r8.z = (r4.x * r7.x) + (r4.y * r7.y) + (r4.z * r7.z);
      r3.x = sat(r3.x * r1.w);
      r7.xyz = norm(r8);			// partial precision
      r1.w = (r2.x * r7.x) + (r2.y * r7.y) + (r2.z * r7.z);			// partial precision
      r3.x = (r3.x * -r3.x) - const_4.x;			// partial precision
      r1.xyz = (r3.y == 0.0 ? LightData[3] : r1)			// partial precision
      r3.y = r1.w * r3.x;			// partial precision
      r1.xyz = (r3.z == 0.0 ? LightData[4] : r1)			// partial precision
      r1.w = (r3.y >= const_2.w ? r3.y : const_2.w);			// partial precision
      r3.xyz = (r1.w * r1) + r0;			// partial precision
      r1.w = r0.w - const_4.x;
    else
      r3.xyz = r0;			// partial precision
      r1.w = r0.w;
    endif
    if_lt const_4.w, r3.w
      r1.xyz = (const_8.x * r1.w) - const_8.yzww;
      r0 = (r1.x == 0.0 ? LightData[5] : r2.w)
      r0 = (r1.y == 0.0 ? LightData[6] : r0)
      r0 = (r1.z == 0.0 ? LightData[7] : r0)
      r7.xyz = r0 - input_5;
      r0.z = (r7.x * r7.x) + (r7.y * r7.y) + (r7.z * r7.z);
      r4.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[4] : r2.w)			// partial precision
      r1.x = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r8.x = (r6.x * r7.x) + (r6.y * r7.y) + (r6.z * r7.z);
      r8.y = (r5.x * r7.x) + (r5.y * r7.y) + (r5.z * r7.z);
      r8.z = (r4.x * r7.x) + (r4.y * r7.y) + (r4.z * r7.z);
      r1.x = sat(r1.x * r0.w);
      r7.xyz = norm(r8);			// partial precision
      r0.w = (r2.x * r7.x) + (r2.y * r7.y) + (r2.z * r7.z);			// partial precision
      r1.x = (r1.x * -r1.x) - const_4.x;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[5] : r0)			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[6] : r0)			// partial precision
      r0.w = (r1.y >= const_2.w ? r1.y : const_2.w);			// partial precision
      r3.xyz = (r0.w * r0) + r3;			// partial precision
      r1.w = r1.w - const_4.x;
    endif
    if_lt -EyePosition7.z, r3.w
      r0.xyz = LightData[7] - input_5;
      r1.x = (r6.x * r0.x) + (r6.y * r0.y) + (r6.z * r0.z);
      r1.y = (r5.x * r0.x) + (r5.y * r0.y) + (r5.z * r0.z);
      r1.z = (r4.x * r0.x) + (r4.y * r0.y) + (r4.z * r0.z);
      r0.w = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
      r0.xyz = norm(r1);			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r1.z = 1.0 / r0.w;
      r1.y = 1.0 / LightData[7].w;
      r0.w = (r2.x * r0.x) + (r2.y * r0.y) + (r2.z * r0.z);			// partial precision
      r0.z = sat(r1.z * r1.y);
      r0.z = (r0.z * -r0.z) - const_4.x;			// partial precision
      r1.xy = (const_7.x * r1.w) - const_7.yzzw;
      r1.w = r0.w * r0.z;			// partial precision
      r0.xyz = (r1.x == 0.0 ? LightData[6] : r2.w)			// partial precision
      r0.w = (r1.w >= const_2.w ? r1.w : const_2.w);			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[7] : r0)			// partial precision
      r3.xyz = (r0.w * r0) + r3;			// partial precision
    endif
    r0 = BaseMap[r10];			// partial precision
    r1.w = r9.x - ToggleADTS.x;			// partial precision
    r0.w = ToggleADTS.x;			// partial precision
    r2.xyz = (r0.w * AmbientColor) + r1.w;			// partial precision
    r1.xyz = r0 * input_1;			// partial precision
    r0.xyz = r3 - r2;			// partial precision
    r1.xyz = r1 * r0;			// partial precision
    r0.xyz = input_6 - r1;			// partial precision
    rendertarget_0.xyz = (input_6.w * r0) - r1;			// partial precision
    rendertarget_0.w = MatAlpha.x;			// partial precision

// approximately 162 instruction slots used (3 texture, 159 arithmetic)