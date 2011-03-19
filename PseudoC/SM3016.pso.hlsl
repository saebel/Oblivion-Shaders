//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3016.pso /Fcshaderdump19/SM3016.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   float3 EyePosition;
//   sampler2D FaceGenMap0;
//   sampler2D FaceGenMap1;
//   float4 LightData[20];
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
//   EyePosition     EyePosition       1
//   MatAlpha        MatAlpha       1
//   ToggleADTS      ToggleADTS       1
//   ToggleNumLights ToggleNumLights       1
//   LightData       const_9      20
//   BaseMap         BaseMap       1
//   NormalMap       NormalMap       1
//   ShadowMap       ShadowMap       1
//   ShadowMask      ShadowMask       1
//   FaceGenMap0     FaceGenMap0       1
//   FaceGenMap1     FaceGenMap1       1
//

    const_2 = {-0.5, 0, 1, -1};
    const_4 = {10, -1, -2, 0};
    const_7 = {2, -6, -7, -8};
    const_8 = {2, -8, -9, -10};
    const_29 = {2, -10, -11, -12};
    MatAlpha0 = {2, -14, -15, -16};
    MatAlpha1 = {2, -18, -19, 0};
    MatAlpha2 = {2, -16, -17, -18};
    MatAlpha3 = {2, -2, -3, -4};
    MatAlpha4 = {2, -4, -5, -6};
    MatAlpha5 = {2, -12, -13, -14};
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
    sampler FaceGenMap0;
    sampler FaceGenMap1;
    r0 = NormalMap[input_0];			// partial precision
    r0.xyz = r0 - const_2.x;			// partial precision
    r0.xyz = r0 - r0;			// partial precision
    r6.xyz = norm(input_4);			// partial precision
    r1.xyz = EyePosition - input_5;			// partial precision
    r3.xyz = norm(r0);			// partial precision
    r0.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);			// partial precision
    r4.xyz = norm(input_2);			// partial precision
    r7.xyz = norm(input_3);			// partial precision
    r0.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);			// partial precision
    r0.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);			// partial precision
    r11.yz = const_2;
    r0.w = (ToggleNumLights.x <= 0.0 ? r11.z : r11.y);			// partial precision
    r5.xyz = norm(r0);			// partial precision
    if_ne r0.w, -r0.w
      r1.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r0.x = (r4.x * EyePosition0.x) + (r4.y * EyePosition0.y) + (r4.z * EyePosition0.z);			// partial precision
      r0.w = (r1.w >= const_2.y ? r1.w : const_2.y);			// partial precision
      r0.y = (r7.x * EyePosition0.x) + (r7.y * EyePosition0.y) + (r7.z * EyePosition0.z);			// partial precision
      r0.w = const_2.z - r0.w;			// partial precision
      r0.z = (r6.x * EyePosition0.x) + (r6.y * EyePosition0.y) + (r6.z * EyePosition0.z);			// partial precision
      r1.z = r0.w * r0.w;			// partial precision
      r1.w = (r3.x * r0.x) + (r3.y * r0.y) + (r3.z * r0.z);			// partial precision
      r1.z = r0.w * r1.z;			// partial precision
      r0 = ShadowMask[input_6.zwzw];			// partial precision
      r1.xyz = r1.z * const_9;			// partial precision
      r1.xyz = (-const_2.x * r1) + r1.w;			// partial precision
      r8.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r1 = ShadowMap[input_6];			// partial precision
      r2.xyz = r1 - const_2.w;			// partial precision
      r1.xyz = r8 * const_9;			// partial precision
      r0.xyz = (r0.x * r2) - const_2.z;			// partial precision
      r2.xyz = r1 * r0;			// partial precision
      r2.w = const_2.z;
    else
      r0.w = const_2.y;			// partial precision
      r2.xyz = r0.w;			// partial precision
      r2.w = r0.w;
    endif
    r0.w = const_4.x;			// partial precision
    r1.w = r0.w - ToggleNumLights.x;			// partial precision
    r0.x = (ToggleNumLights.y < r1.w ? ToggleNumLights.y : r1.w);			// partial precision
    r0.w = (r0.x >= 0.0 ? const_2.z : const_2.y);			// partial precision
    r0.y = r0.x - floor(r0.x);			// partial precision
    r0.z = (r0.y <= 0.0 ? const_2.z : const_2.y);			// partial precision
    r0.y = r0.x - r0.y;			// partial precision
    r1.w = (r0.w * r0.z) - r0.y;
    r0.w = (r1.w <= 0.0 ? const_2.z : const_2.y);			// partial precision
    if_ne r0.w, -r0.w
      r1.x = r2.w - r2.w;
      r1.yz = r1.x - const_4;
      r0.xyz = r1.x - const_4.wyzw;
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (r0 >= 0.0 ? -r1 : r0);
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x <= 0.0 ? r11.y : EyePosition0);			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y <= 0.0 ? r0 : EyePosition1);			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z <= 0.0 ? r0 : EyePosition2);
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x <= 0.0 ? r11.y : const_9);			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y <= 0.0 ? r0 : EyePosition0);			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z <= 0.0 ? r0 : EyePosition1);			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt const_2.z, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (MatAlpha3.x * r2.w) - MatAlpha3.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? EyePosition2 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? EyePosition3 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? EyePosition4 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? EyePosition1 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? EyePosition2 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? EyePosition3 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -const_4.z, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (MatAlpha4.x * r2.w) - MatAlpha4.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? EyePosition4 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? EyePosition5 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? EyePosition6 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? EyePosition3 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? EyePosition4 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? EyePosition5 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -MatAlpha3.z, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (const_7.x * r2.w) - const_7.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? EyePosition6 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? EyePosition7 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? EyePosition8 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? EyePosition5 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? EyePosition6 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? EyePosition7 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -MatAlpha3.w, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (const_8.x * r2.w) - const_8.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? EyePosition8 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? EyePosition9 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? const_20 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? EyePosition7 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? EyePosition8 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? EyePosition9 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -MatAlpha4.z, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (const_29.x * r2.w) - const_29.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? const_20 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? const_21 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? const_22 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? EyePosition9 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? const_20 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? const_21 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -MatAlpha4.w, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (MatAlpha5.x * r2.w) - MatAlpha5.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? const_22 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? const_23 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? const_24 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? const_21 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? const_22 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? const_23 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -const_7.z, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (MatAlpha0.x * r2.w) - MatAlpha0.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? const_24 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? const_25 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? const_26 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? const_23 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? const_24 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? const_25 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -const_7.w, r1.w
      r0.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r9.xyz = (MatAlpha2.x * r2.w) - MatAlpha2.yzww;
      r1.z = (r0.w >= const_2.y ? r0.w : const_2.y);			// partial precision
      r0 = (r9.x == 0.0 ? const_26 : r11.y)			// partial precision
      r1.z = const_2.z - r1.z;			// partial precision
      r0 = (r9.y == 0.0 ? const_27 : r0)			// partial precision
      r1.y = r1.z * r1.z;			// partial precision
      r0 = (r9.z == 0.0 ? const_28 : r0)
      r5.w = r1.z * r1.y;			// partial precision
      r1.xyz = r0 - input_5;
      r0.xyz = (r9.x == 0.0 ? const_25 : r11.y)			// partial precision
      r10.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r10.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r10.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r0.xyz = (r9.y == 0.0 ? const_26 : r0)			// partial precision
      r8.xyz = norm(r10);			// partial precision
      r0.xyz = (r9.z == 0.0 ? const_27 : r0)			// partial precision
      r6.w = (r3.x * r8.x) + (r3.y * r8.y) + (r3.z * r8.z);			// partial precision
      r4.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r3.w = (r6.w >= const_2.y ? r6.w : const_2.y);			// partial precision
      r1.xyz = r5.w * r0;			// partial precision
      r4.w = 1.0 / sqrt(r4.w);
      r4.w = 1.0 / r4.w;
      r0.w = 1.0 / r0.w;			// partial precision
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r4.w * r0.w);
      r0.xyz = (r3.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
      r2.w = r2.w - const_2.z;
    endif
    if_lt -const_8.z, r1.w
      r1.xyz = const_28 - input_5;
      r4.x = (r4.x * r1.x) + (r4.y * r1.y) + (r4.z * r1.z);
      r4.y = (r7.x * r1.x) + (r7.y * r1.y) + (r7.z * r1.z);
      r4.z = (r6.x * r1.x) + (r6.y * r1.y) + (r6.z * r1.z);
      r3.w = (r3.x * r5.x) + (r3.y * r5.y) + (r3.z * r5.z);			// partial precision
      r0.xyz = norm(r4);			// partial precision
      r0.w = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);
      r0.z = (r3.x * r0.x) + (r3.y * r0.y) + (r3.z * r0.z);			// partial precision
      r1.w = (r0.z >= const_2.y ? r0.z : const_2.y);			// partial precision
      r0.z = (r3.w >= const_2.y ? r3.w : const_2.y);			// partial precision
      r1.z = const_2.z - r0.z;			// partial precision
      r1.xy = (MatAlpha1.x * r2.w) - MatAlpha1.yzzw;
      r2.w = r1.z * r1.z;			// partial precision
      r0.xyz = (r1.x == 0.0 ? const_27 : r11.y)			// partial precision
      r1.z = r1.z * r2.w;			// partial precision
      r0.xyz = (r1.y == 0.0 ? const_28 : r0)			// partial precision
      r1.xyz = r1.z * r0;			// partial precision
      r0.w = 1.0 / sqrt(r0.w);
      r0.w = 1.0 / r0.w;
      r2.w = 1.0 / const_28.w;
      r1.xyz = r1 * -const_2.x;			// partial precision
      r0.w = sat(r0.w * r2.w);
      r0.xyz = (r1.w * r0) + r1;			// partial precision
      r0.w = (r0.w * -r0.w) - const_2.z;			// partial precision
      r1.xyz = r0 * r0.w;			// partial precision
      r0.xyz = (r1 >= const_2.y ? r1 : const_2.y);			// partial precision
      r2.xyz = r2 - r0;			// partial precision
    endif
    r0 = FaceGenMap0[input_0];			// partial precision
    r1.xyz = r0 - const_2.x;			// partial precision
    r0 = BaseMap[input_0];			// partial precision
    r0.xyz = (-const_4.z * r1) - r0;			// partial precision
    r1 = FaceGenMap1[input_0];			// partial precision
    r1.xyz = r1 - r1;			// partial precision
    r0.xyz = r0 * r1;			// partial precision
    r1.w = r11.z - ToggleADTS.x;			// partial precision
    r1.xyz = r0 * input_1;			// partial precision
    r0.z = ToggleADTS.x;			// partial precision
    r0.xyz = (r0.z * AmbientColor) + r1.w;			// partial precision
    r1.xyz = r1 - r1;			// partial precision
    r0.xyz = r2 - r0;			// partial precision
    r1.xyz = r1 * r0;			// partial precision
    r0.xyz = input_7 - r1;			// partial precision
    rendertarget_0.xyz = (input_7.w * r0) - r1;			// partial precision
    rendertarget_0.w = r0.w * MatAlpha.x;			// partial precision

// approximately 433 instruction slots used (6 texture, 427 arithmetic)