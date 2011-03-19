//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/GRASS2006.pso /Fcshaderdump19/GRASS2006.pso.dis
//
//
// Parameters:
//
//   float4 AlphaTestRef;
//   sampler2D DiffuseMap;
//   float4 LightData;
//   float4 PSLightColor;
//   sampler2D ShadowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor PSLightColor       1
//   AlphaTestRef AlphaTestRef       1
//   LightData    LightData       1
//   DiffuseMap   DiffuseMap       1
//   ShadowMap    ShadowMap       1
//

    const_0 = {0, 1, 0.5, 0.00100000005};
    const_1 = {0.50999999, 0.00999999978, 0, 0};
    const_5 = {0.50999999, -0.00999999978, 0, 0};
    const_6 = {0.5, -0.5, -0.00136718748, 0.50999999};
    const_7 = {0, 0.5, 0.125, 0.600000024};
    const_8 = {0.49000001, 0.00999999978, 0, 0};
    const_9 = {0.49000001, -0.00999999978, 0, 0};
    const_10 = {0.5, 0.50999999, 0, 0};
    const_11 = {0.5, 0.49000001, 0, 0};
    const_12 = {0.49000001, 0, 0, 0};
    const_13 = {1, 1, 1, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_5;			// partial precision			// centroid
    texcoord input_1;			// partial precision			// centroid
    texcoord input_2.xyz;			// partial precision			// centroid
    color input_0;
    sampler DiffuseMap;
    sampler ShadowMap;
    r1.w = 1.0 / texcoord_1.w;			// partial precision
    r10.xy = r1.w * texcoord_1;			// partial precision
    r8.xy = sat((const_6 * r10) + const_6.x);			// partial precision
    r1.xy = const_6;
    r0.xy = (r1 * r10) + const_7;			// partial precision
    r7.xy = sat(r0 - const_1);			// partial precision
    r6.xy = sat(r0 - const_8);			// partial precision
    r5.xy = sat(r0 - const_5);			// partial precision
    r4.xy = sat(r0 - const_9);			// partial precision
    r3.xy = sat((r1 * r10) + const_10);			// partial precision
    r2.xy = sat((r1 * r10) + const_11);			// partial precision
    r0.z = r0.x - const_6.w;			// partial precision
    r0.w = r0.x - const_6.w;			// partial precision
    r1.x = sat((r0.z >= 0.0 ? const_0.x : r0.w));			// partial precision
    r1.y = sat((r0.y >= 0.0 ? const_0.x : r0.y));			// partial precision
    r10.w = (texcoord_1.y * -r1.w) - const_0.y;			// partial precision
    r0.xy = sat(r0 - const_12);			// partial precision
    r9 = ShadowMap[r8];			// partial precision
    r8 = ShadowMap[r7];			// partial precision
    r7 = ShadowMap[r6];			// partial precision
    r6 = ShadowMap[r5];			// partial precision
    r5 = ShadowMap[r4];			// partial precision
    r4 = ShadowMap[r3];			// partial precision
    r3 = ShadowMap[r2];			// partial precision
    r2 = ShadowMap[r1];			// partial precision
    r0 = ShadowMap[r0];			// partial precision
    r1 = DiffuseMap[texcoord_0];			// partial precision
    r0.w = (texcoord_1.z * -const_0.w) - r9.x;			// partial precision
    r0.w = const_6.z - r0.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r2.w = (texcoord_1.z * -const_0.w) - r8.x;			// partial precision
    r2.w = const_6.z - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r2.w;			// partial precision
    r2.w = (texcoord_1.z * -const_0.w) - r7.x;			// partial precision
    r2.w = const_6.z - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r2.w;			// partial precision
    r2.w = (texcoord_1.z * -const_0.w) - r6.x;			// partial precision
    r2.w = const_6.z - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r2.w;			// partial precision
    r2.w = (texcoord_1.z * -const_0.w) - r5.x;			// partial precision
    r2.w = const_6.z - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r2.w;			// partial precision
    r2.w = (texcoord_1.z * -const_0.w) - r4.x;			// partial precision
    r2.w = const_6.z - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r2.w;			// partial precision
    r2.w = (r10.x * const_0.z) - const_0.z;			// partial precision
    r3.w = (texcoord_1.z * -const_0.w) - r3.x;			// partial precision
    r3.w = const_6.z - r3.w;			// partial precision
    r3.w = (r3.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r3.w;			// partial precision
    r3.w = (texcoord_1.z * -const_0.w) - r2.x;			// partial precision
    r3.w = const_6.z - r3.w;			// partial precision
    r3.w = (r3.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r3.w;			// partial precision
    r3.w = (texcoord_1.z * -const_0.w) - r0.x;			// partial precision
    r3.w = const_6.z - r3.w;			// partial precision
    r3.w = (r3.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r0.w = r0.w - r3.w;			// partial precision
    r0.w = sat(r0.w * const_7.z);			// partial precision
    r0.w = r0.w - const_0.y;			// partial precision
    r3.w = const_0.y - r2.w;			// partial precision
    r2.w = (r2.w >= 0.0 ? const_0.x : const_0.y);			// partial precision
    r3.w = (r3.w >= 0.0 ? const_0.x : const_0.y);			// partial precision
    r2.w = r2.w * r3.w;
    r4.w = (r10.w >= 0.0 ? const_0.x : const_0.y);			// partial precision
    r3.w = (r10.w * -const_0.z) - const_0.y;			// partial precision
    r2.w = r2.w * r4.w;
    r3.w = (r3.w >= 0.0 ? const_0.x : const_0.y);			// partial precision
    r2.w = r2.w * r3.w;
    r3.w = (texcoord_1.z >= 0.0 ? const_0.x : const_0.y);			// partial precision
    r3.w = r2.w * r3.w;
    r2.yz = const_0;
    r0.xyz = (PSLightColor.w * r0.w) - r2.y;			// partial precision
    r0.w = const_0.y;			// partial precision
    r0 = (r3.w <= 0.0 ? r0 : const_13);			// partial precision
    r4.w = (r1.w < r0.w ? r1.w : r0.w);			// partial precision
    r5.w = const_0.y - r0.x;			// partial precision
    r1.xyz = texcoord_2 - LightData;			// partial precision
    r6.w = r5.w * const_7.w;			// partial precision
    r1.x = (r1.x * r1.x) + (r1.y * r1.y) + (r1.z * r1.z);			// partial precision
    r2.w = 1.0 / sqrt(r1.x);			// partial precision
    r2.w = 1.0 / r2.w;			// partial precision
    r7.w = r2.z * LightData.w;			// partial precision
    r7.w = 1.0 / r7.w;			// partial precision
    r2.w = sat(r2.w * r7.w);			// partial precision
    r1.xyz = (r6.w * -PSLightColor) - r2.y;			// partial precision
    r6.w = r2.w * r2.w;			// partial precision
    r1.w = AlphaTestRef.x - r1.w;			// partial precision
    r2.xyz = r6.w * (const_0.y - r1) + r1;			// partial precision
    r1.xyz = input_0.w * (const_0.y - r2) + r2;			// partial precision
    r1.w = (r1.w >= 0.0 ? const_0.y : const_0.x);			// partial precision
    r1.xyz = r1 - const_0.y;			// partial precision
    r2.w = r1.w * texcoord_5.w;			// partial precision
    r1.w = (r4.w < r5.w ? r4.w : r5.w);			// partial precision
    r1.xyz = (r2.w * r1) - const_0.y;			// partial precision
    r1 = (r3.w <= 0.0 ? r1 : r0);			// partial precision
    r0.w = (r1.w < r2.w ? r1.w : r2.w);			// partial precision
    r0.xyz = r1;			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 106 instruction slots used (10 texture, 96 arithmetic)