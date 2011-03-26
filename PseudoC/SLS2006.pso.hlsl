//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2006.pso /Fcshaderdump19/SLS2006.pso.dis
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

    const float4 const_0 = {-0.5, 0.85, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D BaseMap;
    sampler2D NormalMap;
    r1 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0 = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r1.xyz = r1 + -0.5;
    r2.xyz = r1 + r1;			// partial precision
    r1.xyz = normalize(r2);			// partial precision
    r1.x = saturate(dot(r1, IN.texcoord_1));			// partial precision
    r1.xyz = r1.x * PSLightColor[0];			// partial precision
    r2.z = 0.85;			// partial precision
    r1.xyz = (r2.z * r1) + AmbientColor;			// partial precision
    r2.xyz = max(r1, 0);			// partial precision
    r1.xyz = r0 * IN.color_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r1.xyz = (-r0 * r2) + IN.color_1;			// partial precision
    r0.xyz = r2 * r0;			// partial precision
    r1.xyz = (IN.color_1.a * r1) + r0;			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 20 instruction slots used (2 texture, 18 arithmetic)
