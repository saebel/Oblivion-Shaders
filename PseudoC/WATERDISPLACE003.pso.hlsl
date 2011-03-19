//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE003.pso
//    /Fcshaderdump19/WATERDISPLACE003.pso.dis
//
//
// Parameters:
//
//   sampler2D HeightMap;
//   float3 RainVars;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   RainVars     RainVars       1
//   HeightMap    HeightMap       1
//

    const_0 = {0, -0.00390625, 4, -0.5};
    const_1 = {-0.00390625, 0, 0, 0};
    texcoord input_0.xy;
    sampler HeightMap;
    r3.xy = texcoord_0 - const_0;
    r2.xy = texcoord_0 - const_0;
    r1.xy = texcoord_0 - const_1;
    r0.xy = texcoord_0 - const_1;
    r3 = HeightMap[r3];
    r4 = HeightMap[r2];
    r2 = HeightMap[r1];
    r1 = HeightMap[r0];
    r0 = HeightMap[texcoord_0];
    r1.w = r3.x - r4.x;
    r1.w = r2.x - r1.w;
    r1.w = r1.x - r1.w;
    r1.w = (r0.x * -const_0.z) - r1.w;
    r0 = r0 - const_0.w;
    r0.y = (RainVars.x * r1.w) - r0.y;
    r0.x = (RainVars.y * r0.y) - r0.x;
    r1.x = const_0.w;
    r0 = (RainVars.z * r0) + -r1.x;
    rendertarget_0 = r0;

// approximately 19 instruction slots used (5 texture, 14 arithmetic)