//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2018.pso /Fcshaderdump19/SLS2018.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//   sampler2D ShadowMaskMap;
//   float4 Toggles;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   AmbientColor  AmbientColor       1
//   PSLightColor  PSLightColor       1
//   Toggles       Toggles       1
//   BaseMap       BaseMap       1
//   NormalMap     NormalMap       1
//   ShadowMap     ShadowMap       1
//   ShadowMaskMap ShadowMaskMap       1
//

    const_0 = {-0.5, -1, 1, 0.200000003};
    const_3 = {0, 0, 0, 0};
    texcoord input_0.xy;			// partial precision
    texcoord input_1.xyz;			// partial precision			// centroid
    texcoord input_3.xyz;			// partial precision			// centroid
    texcoord input_7;			// partial precision
    color input_0.xyz;
    color input_1;
    sampler BaseMap;
    sampler NormalMap;
    sampler ShadowMap;
    sampler ShadowMaskMap;
    r0 = NormalMap[texcoord_0];			// partial precision
    r1.xyz = norm(texcoord_3);			// partial precision
    r0.xyz = r0 - const_0.x;
    r2.xyz = r0 - r0;			// partial precision
    r0.xyz = norm(r2);			// partial precision
    r2.x = sat((r0.x * r1.x) + (r0.y * r1.y) + (r0.z * r1.z));			// partial precision
    pow r1.w, r2.x, Toggles.z			// partial precision
    r0.x = (r0.x * texcoord_1.x) + (r0.y * texcoord_1.y) + (r0.z * texcoord_1.z);			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r1.w = r0.x - const_0.x;			// partial precision
    r0.w = (r1.w >= const_3.x ? r1.w : const_3.x);			// partial precision
    r1.w = r2.w * r0.w;			// partial precision
    r0.w = const_0.w - r0.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r4.xyz = sat(r0.w * PSLightColor);			// partial precision
    r3.w = sat(r0.x);			// partial precision
    r0.x = texcoord_7.z;			// partial precision
    r0.y = texcoord_7.w;			// partial precision
    r1 = ShadowMaskMap[r0];			// partial precision
    r2 = ShadowMap[texcoord_7];			// partial precision
    r0 = BaseMap[texcoord_0];			// partial precision
    r2.xyz = r2 - const_0.y;			// partial precision
    r3.xyz = (r1.x * r2) - const_0.z;			// partial precision
    r2.xyz = r4 * r3;			// partial precision
    r1.xyz = r3.w * PSLightColor;			// partial precision
    r3.xyz = (r3 * r1) + AmbientColor;			// partial precision
    r1.xyz = (r3 >= const_3.x ? r3 : const_3.x);			// partial precision
    r3.xyz = r0 * input_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r3 : r0);			// partial precision
    r0.xyz = (r0 * r1) + r2;			// partial precision
    r1.xyz = input_1.w * (input_1 - r0) + r0;			// partial precision
    r0.w = r0.w * AmbientColor.w;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    rendertarget_0 = r0;			// partial precision

// approximately 41 instruction slots used (4 texture, 37 arithmetic)