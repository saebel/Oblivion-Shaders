//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SM3LL019.pso /Fcshaderdump19/SM3LL019.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   sampler2D GlowMap;
//   float4 LightData[8];
//   float3 MatAlpha;
//   float3 MatEmit;
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
//   EyePosition     EyePosition       1
//   MatAlpha        MatAlpha       1
//   MatEmit         MatEmit       1
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
//   GlowMap         GlowMap       1
//

    const_2 = {-0.5, 0, 1, -1};
    const_7 = {4, -1, -2, 0};
    const_8 = {2, -4, -5, -6};
    EyePosition7 = {2, -6, -7, 0};
    EyePosition8 = {2, -2, -3, -4};
    texcoord input_0.xy;			// partial precision
    color input_1.xyz;			// partial precision
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
    sampler GlowMap;
    r0 = NormalMap[input_0];			// partial precision
    r0.xyz = r0 - const_2.x;			// partial precision
    r0.xyz = r0 - r0;			// partial precision
    r6.xyz = norm(input_4);			// partial precision
    r1.xyz = EyePosition - input_5;			// partial precision
    r3.xyz = norm(r0);			// partial precision
    r0.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);			// partial precision
    r8.xyz = norm(input_2);			// partial precision
    r7.xyz = norm(input_3);			// partial precision
    r0.x = (r8.x * r1.x) + (r8.y * r1.y) + (r8.z * r1.z);			// partial precision
    r0.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);			// partial precision
    r11.yz = const_2;
    r1.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);
    r5.xyz = norm(r0);			// partial precision
    if_ne r1.w, -r1.w
      r4.x = (r8.x * LightData[1].x) + (r8.y * LightData[1].y) + (r8.z * LightData[1].z);			// partial precision
      r4.y = (r7.x * LightData[1].x) + (r7.y * LightData[1].y) + (r7.z * LightData[1].z);			// partial precision
      r4.z = (r6.x * LightData[1].x) + (r6.y * LightData[1].y) + (r6.z * LightData[1].z);			// partial precision
      r1.xyz = r5 - r4;			// partial precision
      r0.xyz = norm(r1);			// partial precision
      r0.z = sat((r0.x * r3.x) + (r0.y * r3.y) + (r0.z * r3.z));			// partial precision
      pow r3.w, r0.z, ToggleNumLights.z			// partial precision
      r1 = ShadowMask[input_6.zwzw];			// partial precision
      r2 = ShadowMap[input_6];			// partial precision
      r0.xyz = r2 - const_2.w;			// partial precision
      r2.w = (r3.x * r4.x) + (r3.y * r4.y) + (r3.z * r4.z);			// partial precision
      r2.xyz = (r1.x * r0) - const_2.z;			// partial precision
      r1.w = (r2.w >= const_2.y ? r2.w : const_2.y);			// partial precision
      r0.xyz = r3.w * LightData[0];			// partial precision
      r1.xyz = r1.w * LightData[0];			// partial precision
      r0.xyz = r2 * r0;			// partial precision
      r2.xyz = r2 * r1;			// partial precision
      r3.w = const_2.z;
    else
      r1.w = const_2.y;
      r2.xyz = r1.w;			// partial precision
      r0.xyz = r1.w;			// partial precision
      r3.w = r1.w;
    endif
    r1.w = ToggleNumLights.x;
    r2.w = const_7.x - r1.w;			// partial precision
    r1.x = (ToggleNumLights.y < r2.w ? ToggleNumLights.y : r2.w);			// partial precision
    r1.w = (r1.x >= 0.0 ? const_2.z : const_2.y);
    r1.y = r1.x - floor(r1.x);			// partial precision
    r1.z = (r1.y <= 0.0 ? const_2.z : const_2.y);
    r1.y = r1.x - r1.y;			// partial precision
    r2.w = (r1.w * r1.z) - r1.y;
    r1.w = (r2.w <= 0.0 ? const_2.z : const_2.y);
    if_ne r1.w, -r1.w
      r4.x = r3.w - r3.w;
      r4.yz = r4.x - const_7;
      r1.xyz = r4.x - const_7.wyzw;
      r9.xyz = (r1 >= 0.0 ? -r4 : r1);
      r1 = (r9.x <= 0.0 ? r11.y : LightData[1]);
      r1 = (r9.y <= 0.0 ? r1 : LightData[2]);
      r1 = (r9.z <= 0.0 ? r1 : LightData[3]);
      r10.xyz = (r9.x <= 0.0 ? r11.y : LightData[0]);			// partial precision
      r4.xyz = r1 - input_5;
      r1.xyz = (r9.y <= 0.0 ? r10 : LightData[1]);			// partial precision
      r10.x = (r8.x * r4.x) + (r8.y * r4.y) + (r8.z * r4.z);
      r10.y = (r7.x * r4.x) + (r7.y * r4.y) + (r7.z * r4.z);
      r10.z = (r6.x * r4.x) + (r6.y * r4.y) + (r6.z * r4.z);
      r1.xyz = (r9.z <= 0.0 ? r1 : LightData[2]);			// partial precision
      r9.xyz = norm(r10);			// partial precision
      r4.w = (r4.x * r4.x) + (r4.y * r4.y) + (r4.z * r4.z);
      r10.xyz = r5 - r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = norm(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = sat((r4.x * r3.x) + (r4.y * r3.y) + (r4.z * r3.z));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      pow r4.w, r6.w, ToggleNumLights.z			// partial precision
      r1.w = sat(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) - const_2.z;			// partial precision
      r1.w = (r3.x * r9.x) + (r3.y * r9.y) + (r3.z * r9.z);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = (r4.w >= const_2.y ? r4.w : const_2.y);			// partial precision
      r3.w = r3.w - const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt const_2.z, r2.w
      r9.xyz = (EyePosition8.x * r3.w) - EyePosition8.yzww;
      r1 = (r9.x == 0.0 ? LightData[3] : r11.y)
      r1 = (r9.y == 0.0 ? LightData[4] : r1)
      r1 = (r9.z == 0.0 ? LightData[5] : r1)
      r10.xyz = (r9.x == 0.0 ? LightData[2] : r11.y)			// partial precision
      r4.xyz = r1 - input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[3] : r10)			// partial precision
      r10.x = (r8.x * r4.x) + (r8.y * r4.y) + (r8.z * r4.z);
      r10.y = (r7.x * r4.x) + (r7.y * r4.y) + (r7.z * r4.z);
      r10.z = (r6.x * r4.x) + (r6.y * r4.y) + (r6.z * r4.z);
      r1.xyz = (r9.z == 0.0 ? LightData[4] : r1)			// partial precision
      r9.xyz = norm(r10);			// partial precision
      r4.w = (r4.x * r4.x) + (r4.y * r4.y) + (r4.z * r4.z);
      r10.xyz = r5 - r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = norm(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = sat((r4.x * r3.x) + (r4.y * r3.y) + (r4.z * r3.z));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      pow r4.w, r6.w, ToggleNumLights.z			// partial precision
      r1.w = sat(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) - const_2.z;			// partial precision
      r1.w = (r3.x * r9.x) + (r3.y * r9.y) + (r3.z * r9.z);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = (r4.w >= const_2.y ? r4.w : const_2.y);			// partial precision
      r3.w = r3.w - const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -const_7.z, r2.w
      r9.xyz = (const_8.x * r3.w) - const_8.yzww;
      r1 = (r9.x == 0.0 ? LightData[5] : r11.y)
      r1 = (r9.y == 0.0 ? LightData[6] : r1)
      r1 = (r9.z == 0.0 ? LightData[7] : r1)
      r10.xyz = (r9.x == 0.0 ? LightData[4] : r11.y)			// partial precision
      r4.xyz = r1 - input_5;
      r1.xyz = (r9.y == 0.0 ? LightData[5] : r10)			// partial precision
      r10.x = (r8.x * r4.x) + (r8.y * r4.y) + (r8.z * r4.z);
      r10.y = (r7.x * r4.x) + (r7.y * r4.y) + (r7.z * r4.z);
      r10.z = (r6.x * r4.x) + (r6.y * r4.y) + (r6.z * r4.z);
      r1.xyz = (r9.z == 0.0 ? LightData[6] : r1)			// partial precision
      r9.xyz = norm(r10);			// partial precision
      r4.w = (r4.x * r4.x) + (r4.y * r4.y) + (r4.z * r4.z);
      r10.xyz = r5 - r9;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.xyz = norm(r10);			// partial precision
      r5.w = 1.0 / r4.w;
      r6.w = sat((r4.x * r3.x) + (r4.y * r3.y) + (r4.z * r3.z));			// partial precision
      r1.w = 1.0 / r1.w;			// partial precision
      pow r4.w, r6.w, ToggleNumLights.z			// partial precision
      r1.w = sat(r5.w * r1.w);
      r4.xyz = r1 * r4.w;			// partial precision
      r4.w = (r1.w * -r1.w) - const_2.z;			// partial precision
      r1.w = (r3.x * r9.x) + (r3.y * r9.y) + (r3.z * r9.z);			// partial precision
      r0.xyz = (r4.w * r4) + r0;			// partial precision
      r4.w = r4.w * r1.w;			// partial precision
      r1.w = (r4.w >= const_2.y ? r4.w : const_2.y);			// partial precision
      r3.w = r3.w - const_2.z;
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    if_lt -EyePosition8.z, r2.w
      r4.xyz = LightData[7] - input_5;
      r1.x = (r8.x * r4.x) + (r8.y * r4.y) + (r8.z * r4.z);
      r1.y = (r7.x * r4.x) + (r7.y * r4.y) + (r7.z * r4.z);
      r1.z = (r6.x * r4.x) + (r6.y * r4.y) + (r6.z * r4.z);
      r1.w = (r4.x * r4.x) + (r4.y * r4.y) + (r4.z * r4.z);
      r4.xyz = norm(r1);			// partial precision
      r5.xyz = r5 - r4;			// partial precision
      r1.w = 1.0 / sqrt(r1.w);
      r1.w = 1.0 / r1.w;
      r2.w = 1.0 / LightData[7].w;
      r1.xyz = norm(r5);			// partial precision
      r1.w = sat(r1.w * r2.w);
      r4.w = sat((r1.x * r3.x) + (r1.y * r3.y) + (r1.z * r3.z));			// partial precision
      r2.w = (r1.w * -r1.w) - const_2.z;			// partial precision
      pow r1.w, r4.w, ToggleNumLights.z			// partial precision
      r5.xy = (EyePosition7.x * r3.w) - EyePosition7.yzzw;
      r1.xyz = (r5.x == 0.0 ? LightData[6] : r11.y)			// partial precision
      r3.w = (r3.x * r4.x) + (r3.y * r4.y) + (r3.z * r4.z);			// partial precision
      r1.xyz = (r5.y == 0.0 ? LightData[7] : r1)			// partial precision
      r3.w = r2.w * r3.w;			// partial precision
      r3.xyz = r1.w * r1;			// partial precision
      r1.w = (r3.w >= const_2.y ? r3.w : const_2.y);			// partial precision
      r0.xyz = (r2.w * r3) + r0;			// partial precision
      r2.xyz = (r1.w * r1) + r2;			// partial precision
    endif
    r2.w = r11.z - ToggleADTS.x;			// partial precision
    r1 = GlowMap[input_0];			// partial precision
    r3.xyz = MatEmit;			// partial precision
    r1.xyz = (r1 * r3) + AmbientColor;			// partial precision
    r1.xyz = (ToggleADTS.x * r1) + r2.w;			// partial precision
    r1.xyz = r2 - r1;			// partial precision
    r2.xyz = r0.w * r0;			// partial precision
    r0 = BaseMap[input_0];			// partial precision
    r0.xyz = r0 * input_1;			// partial precision
    r1.xyz = (r0 * r1) + r2;			// partial precision
    r0.xyz = input_7 - r1;			// partial precision
    rendertarget_0.xyz = (input_7.w * r0) - r1;			// partial precision
    rendertarget_0.w = r0.w * MatAlpha.x;			// partial precision

// approximately 221 instruction slots used (5 texture, 216 arithmetic)
