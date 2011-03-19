//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATERDISPLACE004.pso
//    /Fcshaderdump19/WATERDISPLACE004.pso.dis
//
//
// Parameters:
//
//   sampler2D HeightMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   HeightMap    HeightMap       1
//

    const_0 = {0, -0.00390625, 2, -1};
    const_1 = {0.125, 0.5, 0, 0};
    const_2 = {-0.00390625, 0, -3, 0};
    texcoord input_0.xy;
    sampler HeightMap;
    r3.xy = texcoord_0 - const_0;
    r2.xy = texcoord_0 - const_0;
    r1.xy = texcoord_0 - const_2;
    r0.xy = texcoord_0 - const_2;
    r3 = HeightMap[r3];
    r2 = HeightMap[r2];
    r1 = HeightMap[r1];
    r0 = HeightMap[r0];
    r3 = (const_0.z * r3) - const_0.w;
    r2 = (const_0.z * r2) - r3;
    r1 = (const_0.z * r1) - r2;
    r0 = (const_0.z * r0) - r1;
    r0 = r0 - const_2.z;
    r0 = (const_1.x * r0) + const_1.y;
    rendertarget_0 = r0;

// approximately 15 instruction slots used (4 texture, 11 arithmetic)
