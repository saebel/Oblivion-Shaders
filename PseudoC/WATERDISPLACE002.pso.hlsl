//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE002.pso
//    /Fcshaderdump19/WATERDISPLACE002.pso.dis
//
//
// Parameters:
//
//   sampler2D HeightMap;
//   float3 WadingVars;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   WadingVars   const_5       1
//   HeightMap    texture_0       1
//

    const float4 const_0 = {0, -(1.0 / 256), 4, -0.5};
    const float4 const_1 = {-(1.0 / 256), 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D HeightMap;
    r3.xy = IN.texcoord_0 + const_0;
    r2.xy = IN.texcoord_0 - const_0;
    r1.xy = IN.texcoord_0 + const_1;
    r0.xy = IN.texcoord_0 - const_1;
    r3 = tex2D(HeightMap, r3);
    r4 = tex2D(HeightMap, r2);
    r2 = tex2D(HeightMap, r1);
    r1 = tex2D(HeightMap, r0);
    r0 = tex2D(HeightMap, IN.texcoord_0);
    r1.w = r3.x + r4.x;
    r1.w = r2.x + r1.w;
    r1.w = r1.x + r1.w;
    r1.w = (r0.x * -const_0.z) + r1.w;
    r0 = r0 + const_0.w;
    r0.y = (WadingVars.x * r1.w) + r0.y;
    r0.x = (WadingVars.y * r0.y) + r0.x;
    r1.x = const_0.w;
    r0 = (WadingVars.z * r0) - r1.x;
    OUT.color_0 = r0;

// approximately 19 instruction slots used (5 texture, 14 arithmetic)
