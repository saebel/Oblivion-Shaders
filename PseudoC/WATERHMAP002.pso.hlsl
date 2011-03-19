//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATERHMAP002.pso /Fcshaderdump19/WATERHMAP002.pso.dis
//
//
// Parameters:
//
//   float fPassNum;
//   sampler2D sampButterfly;
//   sampler2D sampSourceImage;
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   fPassNum        fPassNum       1
//   sampButterfly   sampButterfly       1
//   sampSourceImage sampSourceImage       1
//

    texcoord input_0.xy;
    sampler sampButterfly;
    sampler sampSourceImage;
    r2.x = texcoord_0.x;
    r0.x = texcoord_0.y;
    r0.y = fPassNum.x;
    r1 = sampButterfly[r0];
    abs r2.y, r1.x
    r0.y = r1.y;
    r0.x = texcoord_0.x;
    r2 = sampSourceImage[r2];
    r0 = sampSourceImage[r0];
    r3.w = r1.w * r2.w;
    r3.x = (r1.z * r2.x) - r3.w;
    r2.w = r1.z * r2.w;
    r3.y = (r1.w * r2.x) - r2.w;
    r1.xy = (r1.x >= 0.0 ? -r3 : r3);
    r1.x = r0.x - r1.x;
    r1.y = r0.w - r1.y;
    r0.xyz = r1.x;
    r0.w = r1.y;
    rendertarget_0 = r0;

// approximately 19 instruction slots used (3 texture, 16 arithmetic)
