//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2045.pso /Fcshaderdump19/SLS2045.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   samplerCUBE EnvironmentCubeMap;
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//   float4 Toggles;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   AmbientColor       const_1       1
//   PSLightColor[0]       const_2        1
//   Toggles            const_7       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_1       1
//

    const float4 const_0 = {-0.5, 3, 1, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 IN.color_0 : COLOR0;
    sampler2D NormalMap;
    samplerCUBE EnvironmentCubeMap;
    r0.xyz = IN.texcoord_1 + const_0.x;
    r0.xyz = r0 + r0;			// partial precision
    r1.xyz = normalize(IN.texcoord_2);			// partial precision
    r3.x = dot(r0, r1);			// partial precision
    r2.x = dot(r0, r0);	// normalize + length			// partial precision
    r0.w = r3.x + r3.x;			// partial precision
    r1.xyz = r1 * r2.x;			// partial precision
    r0.xyz = (r0.w * r0) - r1;			// partial precision
    r0 = texCUBE(EnvironmentCubeMap, r0);			// partial precision
    r1 = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.xyz = r0 * r1.w;			// partial precision
    r0.xyz = r0 * AmbientColor.a;			// partial precision
    r1.xyz = r0 * IN.color_0;			// partial precision
    r0.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r0.xyz = r0 * PSLightColor[0];
    r0.xyz = r0 * IN.texcoord_1.w;			// partial precision
    r0.xyz = r0 * const_0.y;			// partial precision
    r0.w = const_0.z;
    OUT.color_0 = r0;			// partial precision

// approximately 21 instruction slots used (2 texture, 19 arithmetic)
