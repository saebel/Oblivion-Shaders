//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATERHMAP001.pso /Fcshaderdump19/WATERHMAP001.pso.dis
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
//   fPassNum        const_1       1
//   sampButterfly   texture_0       1
//   sampSourceImage texture_2       1
//

    float2 texcoord_0 : TEXCOORD0;
    sampler2D sampButterfly;
    sampler2D sampSourceImage;
    r2.y = IN.texcoord_0.y;
    r0.x = IN.texcoord_0.x;
    r0.y = fPassNum.x;
    r1.xyzw = tex2D(sampButterfly, r0.xy);
    r2.x = abs(r1.x);
    r0.x = r1.y;
    r0.y = IN.texcoord_0.y;
    r2.xyzw = tex2D(sampSourceImage, r2.xy);
    r0.xyzw = tex2D(sampSourceImage, r0.xy);
    r3.w = r1.w * r2.w;
    r3.x = (r1.z * r2.x) - r3.w;
    r2.w = r1.z * r2.w;
    r3.y = (r1.w * r2.x) + r2.w;
    r1.xy = (r1.x >= 0.0 ? r3.xy : -r3.xy);
    r1.x = r0.x + r1.x;
    r1.y = r0.w + r1.y;
    r0.xyz = r1.x;
    r0.w = r1.y;
    OUT.color_0.rgba = r0.xyzw;

// approximately 19 instruction slots used (3 texture, 16 arithmetic)
