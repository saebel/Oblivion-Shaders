//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL012.pso /Fcshaderdump19/SM3LL012.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 HairTint;
//   sampler2D LayerMap;
//   float4 LightData[8];
//   float3 MatAlpha;
//   sampler2D NormalMap;
//   sampler2D ShadowMap;
//   sampler2D ShadowMask;
//   float4 ToggleADTS;
//   float4 ToggleNumLights;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   AmbientColor    AmbientColor       1
//   HairTint        HairTint       1
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
//   ShadowMap       ShadowMap       1
//   ShadowMask      ShadowMask       1
//   LayerMap        LayerMap       1
//

    const_1 = {-0.5, 0, 1, -1};
    const_4 = {4, -1, -2, 0};
    const_7 = {2, -2, -3, -4};
    const_8 = {2, -4, -5, -6};
    const_17 = {2, -6, -7, 0};
    texcoord input_0.xy;			// partial precision
    color input_1.y;			// partial precision
    texcoord_3 input_2.xyz;			// partial precision			// centroid
    texcoord_4 input_3.xyz;			// partial precision			// centroid
    texcoord_5 input_4.xyz;			// partial precision			// centroid
    texcoord_6 input_5.xyz;			// partial precision			// centroid
    texcoord_1 input_6;			// partial precision
    texcoord_7 input_7;			// partial precision			// centroid
    sampler BaseMap;
    sampler NormalMap;
    sampler ShadowMap;
    sampler ShadowMask;
    sampler LayerMap;
    r0 = NormalMap[input_0];			// partial precision
    r0.xyz = r0 - const_1.x;			// partial precision
    r0.xyz = r0 - r0;			// partial precision
    r4.xyz = norm(r0);			// partial precision
    r3.xyz = const_1;
    r0.w = (ToggleNumLights.x <= 0.0 ? r3.z : r3.y);
    r7.xyz = norm(input_2);			// partial precision
    r6.xyz = norm(input_3);			// partial precision
    r5.xyz = norm(input_4);			// partial precision
    if_ne r0.w, -r0.w
      r0.x = (r7.x * LightData[1].x) + (r7.y * LightData[1].y) + (r7.z * LightData[1].z);			// partial precision
      r0.y = (r6.x * LightData[1].x) + (r6.y * LightData[1].y) + (r6.z * LightData[1].z);			// partial precision
      r0.z = (r5.x * LightData[1].x) + (r5.y * LightData[1].y) + (r5.z * LightData[1].z);			// partial precision
      r0.w = (r4.x * r0.x) + (r4.y * r0.y) + (r4.z * r0.z);			// partial precision
      r2.w = (r0.w >= const_1.y ? r0.w : const_1.y);			// partial precision
      r0 = ShadowMask[input_6.zwzw];			// partial precision
      r1 = ShadowMap[input_6];			// partial precision
      r1.xyz = r1 - const_1.w;			// partial precision
      r1.xyz = (r0.x * r1) - const_1.z;			// partial precision
      r0.xyz = r2.w * LightData[0];			// partial precision
      r2.xyz = r1 * r0;			// partial precision
      r1.w = const_1.z;
    else
      r0.w = const_1.y;
      r2.xyz = r0.w;			// partial precision
      r1.w = r0.w;
    endif
    r0.w = const_4.x;			// partial precision
    r1.z = r0.w - ToggleNumLights.x;			// partial precision
    r0.x = (ToggleNumLights.y < r1.z ? ToggleNumLights.y : r1.z);			// partial precision
    r0.w = (r0.x >= 0.0 ? const_1.z : const_1.y);
    r0.y = r0.x - floor(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? const_1.z : const_1.y);
    r0.y = r0.x - r0.y;			// partial precision
    r2.w = (r0.w * r0.z) - r0.y;
    r0.w = (r2.w <= 0.0 ? const_1.z : const_1.y);
    if_ne r0.w, -r0.w
      r1.x = r1.w - r1.w;
      r1.yz = r1.x - const_4;
      r0.xyz = r1.x - const_4.wyzw;
      r1.xyz = (r0 >= 0.0 ? -r1 : r0);
      r0 = (r1.x <= 0.0 ? r3.y : LightData[1]);
      r0 = (r1.y <= 0.0 ? r0 : LightData[2]);
      r0 = (r1.z <= 0.0 ? r0 : LightData[3]);
      r8.xyz = r0 - input_5;
      r0.z = (r8.x * r8.x) + (r8.y * r8.y) + (r8.z * r8.z);
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x <= 0.0 ? r3.y : LightData[0]);			// partial precision
      r1.x = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r9.x = (r7.x * r8.x) + (r7.y * r8.y) + (r7.z * r8.z);
      r9.y = (r6.x * r8.x) + (r6.y * r8.y) + (r6.z * r8.z);
      r9.z = (r5.x * r8.x) + (r5.y * r8.y) + (r5.z * r8.z);
      r1.x = sat(r1.x * r0.w);
      r8.xyz = norm(r9);			// partial precision
      r0.w = (r4.x * r8.x) + (r4.y * r8.y) + (r4.z * r8.z);			// partial precision
      r1.x = (r1.x * -r1.x) - const_1.z;			// partial precision
      r0.xyz = (r1.y <= 0.0 ? r0 : LightData[1]);			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z <= 0.0 ? r0 : LightData[2]);			// partial precision
      r0.w = (r1.y >= const_1.y ? r1.y : const_1.y);			// partial precision
      r2.xyz = (r0.w * r0) + r2;			// partial precision
      r1.w = r1.w - const_1.z;
    endif
    if_lt const_1.z, r2.w
      r1.xyz = (const_7.x * r1.w) - const_7.yzww;
      r0 = (r1.x == 0.0 ? LightData[3] : r3.y)
      r0 = (r1.y == 0.0 ? LightData[4] : r0)
      r0 = (r1.z == 0.0 ? LightData[5] : r0)
      r8.xyz = r0 - input_5;
      r0.z = (r8.x * r8.x) + (r8.y * r8.y) + (r8.z * r8.z);
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[2] : r3.y)			// partial precision
      r1.x = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r9.x = (r7.x * r8.x) + (r7.y * r8.y) + (r7.z * r8.z);
      r9.y = (r6.x * r8.x) + (r6.y * r8.y) + (r6.z * r8.z);
      r9.z = (r5.x * r8.x) + (r5.y * r8.y) + (r5.z * r8.z);
      r1.x = sat(r1.x * r0.w);
      r8.xyz = norm(r9);			// partial precision
      r0.w = (r4.x * r8.x) + (r4.y * r8.y) + (r4.z * r8.z);			// partial precision
      r1.x = (r1.x * -r1.x) - const_1.z;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[3] : r0)			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[4] : r0)			// partial precision
      r0.w = (r1.y >= const_1.y ? r1.y : const_1.y);			// partial precision
      r2.xyz = (r0.w * r0) + r2;			// partial precision
      r1.w = r1.w - const_1.z;
    endif
    if_lt -const_4.z, r2.w
      r1.xyz = (const_8.x * r1.w) - const_8.yzww;
      r0 = (r1.x == 0.0 ? LightData[5] : r3.y)
      r0 = (r1.y == 0.0 ? LightData[6] : r0)
      r0 = (r1.z == 0.0 ? LightData[7] : r0)
      r8.xyz = r0 - input_5;
      r0.z = (r8.x * r8.x) + (r8.y * r8.y) + (r8.z * r8.z);
      r3.w = 1.0 / sqrt(r0.z);
      r0.xyz = (r1.x == 0.0 ? LightData[4] : r3.y)			// partial precision
      r1.x = 1.0 / r3.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r9.x = (r7.x * r8.x) + (r7.y * r8.y) + (r7.z * r8.z);
      r9.y = (r6.x * r8.x) + (r6.y * r8.y) + (r6.z * r8.z);
      r9.z = (r5.x * r8.x) + (r5.y * r8.y) + (r5.z * r8.z);
      r1.x = sat(r1.x * r0.w);
      r8.xyz = norm(r9);			// partial precision
      r0.w = (r4.x * r8.x) + (r4.y * r8.y) + (r4.z * r8.z);			// partial precision
      r1.x = (r1.x * -r1.x) - const_1.z;			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[5] : r0)			// partial precision
      r1.y = r0.w * r1.x;			// partial precision
      r0.xyz = (r1.z == 0.0 ? LightData[6] : r0)			// partial precision
      r0.w = (r1.y >= const_1.y ? r1.y : const_1.y);			// partial precision
      r2.xyz = (r0.w * r0) + r2;			// partial precision
      r1.w = r1.w - const_1.z;
    endif
    if_lt -const_7.z, r2.w
      r0.xyz = LightData[7] - input_5;
      r1.x = (r7.x * r0.x) + (r7.y * r0.y) + (r7.z * r0.z);
      r1.y = (r6.x * r0.x) + (r6.y * r0.y) + (r6.z * r0.z);
      r1.z = (r5.x * r0.x) + (r5.y * r0.y) + (r5.z * r0.z);
      r0.w = (r0.x * r0.x) + (r0.y * r0.y) + (r0.z * r0.z);
      r0.xyz = norm(r1);			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r1.z = 1.0 / r0.w;
      r1.y = 1.0 / LightData[7].w;
      r0.w = (r4.x * r0.x) + (r4.y * r0.y) + (r4.z * r0.z);			// partial precision
      r0.z = sat(r1.z * r1.y);
      r0.z = (r0.z * -r0.z) - const_1.z;			// partial precision
      r1.xy = (const_17.x * r1.w) - const_17.yzzw;
      r1.w = r0.w * r0.z;			// partial precision
      r0.xyz = (r1.x == 0.0 ? LightData[6] : r3.y)			// partial precision
      r0.w = (r1.w >= const_1.y ? r1.w : const_1.y);			// partial precision
      r0.xyz = (r1.y == 0.0 ? LightData[7] : r0)			// partial precision
      r2.xyz = (r0.w * r0) + r2;			// partial precision
    endif
    r0.xyz = r3.x - HairTint;			// partial precision
    r0.xyz = (input_1.y * r0) - const_1.x;			// partial precision
    r4.xyz = r0 - r0;			// partial precision
    r0 = BaseMap[input_0];			// partial precision
    r1 = LayerMap[input_0];			// partial precision
    r2.w = r3.z - ToggleADTS.x;			// partial precision
    r3.xyz = r1.w * (r1 - r0) + r0;			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor) + r2.w;			// partial precision
    r1.xyz = r4 * r3;			// partial precision
    r0.xyz = r2 - r0;			// partial precision
    r1.xyz = r1 * r0;			// partial precision
    r0.xyz = input_7 - r1;			// partial precision
    rendertarget_0.xyz = (input_7.w * r0) - r1;			// partial precision
    rendertarget_0.w = r0.w * MatAlpha.x;			// partial precision

// approximately 166 instruction slots used (5 texture, 161 arithmetic)
