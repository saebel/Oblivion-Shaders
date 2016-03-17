//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1002.pso /Fcshaderdump19/SLS1002.pso.dis
//
//
// Parameters:
//
//   sampler2D NormalMap;
//   float4 PSLightColor[4];
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   NormalMap    texture_0       1
//

    const float4 const_0 = {-0.5, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    sampler2D NormalMap;
    r0.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);
    r0.xyz = r0.xyz - 0.5;
    r0.xyz = 2 * r0.xyz;
    r1.xyz = IN.texcoord_1.xyz - 0.5;
    r1.xyz = 2 * r1.xyz;
    r0.x = saturate(dot(r0.xyz, r1.xyz));
    r0.xyz = r0.x * PSLightColor[0].rgb;
    r0.w = PSLightColor[0].a;
    OUT.color_0.rgba = r0.xyzw;

// approximately 9 instruction slots used (1 texture, 8 arithmetic)