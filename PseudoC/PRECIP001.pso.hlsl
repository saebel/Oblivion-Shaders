//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PRECIP001.pso /Fcshaderdump19/PRECIP001.pso.dis
//
//
// Parameters:
//
//   float3 AmbientColor;
//   sampler2D Src0;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_0       1
//   Src0         texture_0       1
//

    float4 IN.color_0 : COLOR0;
    float2 IN.texcoord_0 : TEXCOORD0;
    sampler2D Src0;
    r0.xyzw = tex2D(Src0, IN.texcoord_0.xy);
    OUT.color_0.rgb = saturate((IN.color_0.rgb * r0.xyz) + AmbientColor.rgb);
    OUT.color_0.a = r0.w * IN.color_0.a;

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
