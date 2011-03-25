//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISBLUR2000.pso /Fcshaderdump19/ISBLUR2000.pso.dis
//
//
// Parameters:
//
//   sampler2D Src0;
//   float4 alphaAdd;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   alphaAdd     const_2       1
//   Src0         texture_0       1
//

    const float4 const_0 = {0.6, 0.73, 0.8, 1};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D Src0;
    r0 = tex2D(Src0, IN.texcoord_0);
    r1.x = saturate(dot(const_0, r0));
    r1.w = r1.x * alphaAdd.y;
    r0.w = r0.w * alphaAdd.z;
    r0.w = (r1.w * r1.w) + r0.w;
    r0.w = r0.w + alphaAdd.x;
    r0.xyz = r0 * r0.w;
    r0.w = const_0.w;
    OUT.color_0 = r0;

// approximately 9 instruction slots used (1 texture, 8 arithmetic)
