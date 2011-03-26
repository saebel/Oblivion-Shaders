//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2008.pso /Fcshaderdump19/PAR2008.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   sampler2D BaseMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   float4 Toggles;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   Toggles      const_7       1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//

    const float4 const_0 = {0.04, -0.02, -0.5, 0.2};
    const int4 const_3 = {0, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.x = dot(IN.texcoord_6, IN.texcoord_6);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_6;			// partial precision
    r0.w = (r0.w * 0.04) + -0.02;			// partial precision
    r0.xy = (r0.w * r0) + IN.texcoord_0;
    r1 = tex2D(NormalMap, r0);			// partial precision
    r0 = tex2D(BaseMap, r0);			// partial precision
    r1.xyz = r1 + -0.5;
    r2.xyz = r1 + r1;			// partial precision
    r1.xyz = normalize(r2);			// partial precision
    r2.xyz = normalize(IN.texcoord_3);			// partial precision
    r2.x = saturate(dot(r1, r2));			// partial precision
    r0.w = pow(abs(r2.x), Toggles.z);			// partial precision
    r3.x = dot(r1, IN.texcoord_1);			// partial precision
    r2.w = r1.w * r0.w;			// partial precision
    r1.w = r3.x - -0.5;			// partial precision
    r0.w = max(r1.w, 0);			// partial precision
    r1.w = r2.w * r0.w;			// partial precision
    r0.w = 0.2 - r3.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r2.xyz = saturate(r0.w * PSLightColor[0]);			// partial precision
    r1.xyz = r0 * IN.color_0;			// partial precision
    r0.w = saturate(r3.x);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r0.xyz = PSLightColor[0];
    r3.xyz = (r0.w * r0) + AmbientColor;			// partial precision
    r0.xyz = max(r3, 0);			// partial precision
    r0.xyz = (r1 * r0) + r2;			// partial precision
    r1.xyz = lerp(IN.color_1, r0, IN.color_1.a);			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    r0.w = AmbientColor.a;			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 40 instruction slots used (3 texture, 37 arithmetic)
