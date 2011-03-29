//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2075.pso /Fcshaderdump19/SLS2075.pso.dis
//
//
// Parameters:
//
//   float4 FillColor;
//   sampler2D NormalMap;
//   float4 RimColor;
//   sampler2D SourceTexture;
//   float4 fVars;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   FillColor     const_0       1
//   RimColor      const_1       1
//   fVars         const_2       1
//   NormalMap     texture_0       1
//   SourceTexture texture_1       1
//

    const float4 const_3 = {-0.5, 0, 1, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 IN.color_1 : COLOR1;
    sampler2D NormalMap;
    sampler2D SourceTexture;
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0);
    r0.xyzw = tex2D(SourceTexture, IN.texcoord_1);
    r1.xyz = r1.xyz + -0.5;
    r1.xyz = r1.xyz + r1.xyz;
    r2.x = dot(r1.xyz, IN.texcoord_3.xyz);
    r1.w = max(r2.x, 0);
    r2.w = 1 - r1.w;
    r0.xyz = r0.xyz + FillColor.rgb;
    r0.w = r0.w * FillColor.a;
    r1.w = pow(abs(r2.w), fVars.x);
    r0.xyz = r0.xyz * r0.w;
    r1.xyzw = (r1.w * RimColor) + r0;
    r0.xyz = lerp(IN.color_1, r1, IN.color_1.a);
    r0.w = r1.w;
    OUT.color_0.rgba = r0.xyzw;

// approximately 18 instruction slots used (2 texture, 16 arithmetic)
