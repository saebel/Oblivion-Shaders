//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2003.pso /Fcshaderdump19/ISBLUR2003.pso.dis
//
//
// Parameters:
//
//   sampler2D Src0;
//   sampler2D Src1;
//   float4 blendW;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   blendW       const_0       1
//   Src0         texture_0       1
//   Src1         texture_1       1
//

    const int4 const_1 = {1, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    sampler2D Src0;
    sampler2D Src1;
    r1 = tex2D(Src1, IN.texcoord_1);
    r0 = tex2D(Src0, IN.texcoord_0);
    r1.xyz = r1 * blendW.y;
    r0.xyz = (blendW.x * r0) + r1;
    r0.w = 1;
    OUT.color_0 = r0;

// approximately 6 instruction slots used (2 texture, 4 arithmetic)
