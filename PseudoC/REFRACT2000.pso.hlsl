//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/REFRACT2000.pso /Fcshaderdump19/REFRACT2000.pso.dis
//
//
// Parameters:
//
//   sampler2D Src0;
//   sampler2D Src1;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   Src0         texture_0       1
//   Src1         texture_1       1
//

    const float4 const_0 = {-0.5, 2, 0, 1};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    sampler2D Src0;
    sampler2D Src1;
    r0 = tex2D(Src1, IN.texcoord_1);
    r0.w = r0.x + const_0.x;
    r1.w = r0.z * r0.w;
    r0.w = r0.y + const_0.x;
    r1.x = (const_0.y * -r1.w) + IN.texcoord_0.x;
    r0.w = r0.z * r0.w;
    r1.y = (const_0.y * r0.w) + IN.texcoord_0.y;
    r0 = tex2D(Src1, r1);
    r1 = tex2D(Src0, r1);
    r2 = tex2D(Src0, IN.texcoord_0);
    r0.w = r0.w * r0.w;
    r3.w = (r0.w <= 0.0 ? const_0.w : const_0.z);
    r0 = lerp(r1, r2, r3.w);
    OUT.color_0 = r0;

// approximately 15 instruction slots used (4 texture, 11 arithmetic)
