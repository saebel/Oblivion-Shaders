//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3020.pso /Fcshaderdump19/SM3020.pso.dis
//
//
// Parameters:
//
//   samplerCUBE EnvironmentCubeMap;
//   float4 MatAlpha;
//   sampler2D NormalMap;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   MatAlpha           const_3       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_1       1
//

    const float4 const_0 = {-0.5, 0.5, 1, 0};
    float2 IN.texcoord_0 : TEXCOORD0;			// partial precision
    float4 IN.texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 IN.texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 IN.texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 IN.color_0 : COLOR0;			// partial precision
    sampler2D NormalMap;
    samplerCUBE EnvironmentCubeMap;
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r0.xyz = r1.xyz - 0.5;
    r1.xyz = 2 * r0.xyz;			// partial precision
    r0.xyz = normalize(r1.xyz);			// partial precision
    r2.xyz = r0.xyz * const_0.yyz;			// partial precision
    r1.xyz = normalize(IN.texcoord_1.xyz);			// partial precision
    r0.xyz = normalize(r2.xyz);			// partial precision
    r1.x = dot(r0.xyz, r1.xyz);			// partial precision
    r2.xyz = normalize(IN.texcoord_2.xyz);			// partial precision
    r1.y = dot(r0.xyz, r2.xyz);			// partial precision
    r2.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r1.z = dot(r0.xyz, r2.xyz);			// partial precision
    r2.x = IN.texcoord_1.w;			// partial precision
    r2.y = IN.texcoord_2.w;			// partial precision
    r2.z = IN.texcoord_3.w;			// partial precision
    r0.xyz = normalize(r1.xyz);			// partial precision
    r1.xyz = normalize(r2.xyz);			// partial precision
    r0.w = dot(r0.xyz, r1.xyz);			// partial precision
    r2.w = dot(r0.xyz, r0.xyz);	// normalize + length			// partial precision
    r0.w = 2 * r0.w;			// partial precision
    r1.xyz = r1.xyz * r2.w;			// partial precision
    r0.xyz = (r0.w * r0.xyz) - r1.xyz;			// partial precision
    r0.xyzw = texCUBE(EnvironmentCubeMap, r0.xyz);			// partial precision
    r0.xyz = r1.w * r0.xyz;			// partial precision
    r0.xyz = r0.xyz * MatAlpha.x;			// partial precision
    OUT.color_0.rgb = r0.xyz * IN.color_0.rgb;			// partial precision
    OUT.color_0.a = 1;			// partial precision

// approximately 41 instruction slots used (2 texture, 39 arithmetic)
