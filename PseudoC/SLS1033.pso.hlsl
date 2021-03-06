//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1033.pso /Fcshaderdump19/SLS1033.pso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   samplerCUBE EnvironmentCubeMap;
//   sampler2D NormalMap;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   AmbientColor       const_1       1
//   NormalMap          texture_0       1
//   EnvironmentCubeMap texture_3       1
//

    const int4 const_0 = {2, -1, 1, 0};
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
    float3 IN.color_0 : COLOR0;
    sampler2D NormalMap;
    samplerCUBE EnvironmentCubeMap;
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r2.x = IN.texcoord_1.w;
    r2.y = IN.texcoord_2.w;
    r2.z = IN.texcoord_3.w;
    r1.xyz = (2 * r1.xyz) - 1;
    r0.x = dot(r1.xyz, IN.texcoord_1.xyz);
    r0.y = dot(r1.xyz, IN.texcoord_2.xyz);
    r0.z = dot(r1.xyz, IN.texcoord_3.xyz);
    r3.x = dot(r0.xyz, r2.xyz);
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.w = 2 * r3.x;
    r1.xyz = r2.xyz * r1.x;
    r0.xyz = (r0.w * r0.xyz) - r1.xyz;
    r0.xyzw = texCUBE(EnvironmentCubeMap, r0.xyz);
    r0.xyz = r1.w * r0.xyz;
    r0.xyz = r0.xyz * AmbientColor.a;
    r0.xyz = r0.xyz * IN.color_0.rgb;
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;

// approximately 19 instruction slots used (2 texture, 17 arithmetic)
