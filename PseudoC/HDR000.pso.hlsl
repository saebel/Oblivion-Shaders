//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR000.pso /Fcshaderdump19/HDR000.pso.dis
//
//
// Parameters:
//
//   float4 BlurOffsets[16];
//   float2 BlurScale;
//   sampler2D Src0;
//
//	SetPixelShaderConstantF[0+]				[BlurShaderHDR]
//		|0.000000|0.000000|0.000000|0.000000|           fTargetLUM=1.2000
//	SetPixelShaderConstantF[1+]                             fUpperLUMClamp=1.4000
//		|1.200000|1.350000|0.500000|1.400000|           fGrassDimmer=1.3000
//	SetPixelShaderConstantF[2+]                             fTreeDimmer=1.2000
//		|0.003906|0.003906|0.000000|0.000000|           fEmissiveHDRMult=2.0000
//	SetPixelShaderConstantF[3+]                             fEyeAdaptSpeed=0.7000
//		|3.000000|3.000000|0.250000|0.000000|           fSunlightDimmer=1.3000
//		|1.000000|3.000000|0.250000|0.000000|           fSIEmmisiveMult=1.0000
//		|1.000000|1.000000|0.250000|0.000000|           fSISpecularMult=1.5000
//		|3.000000|1.000000|0.250000|0.000000|           fSkyBrightness=0.5000
//		|-3.000000|-3.000000|0.000000|0.000000|         fSunBrightness=0.0000
//		|-2.000000|-2.000000|0.000000|0.000000|         fBrightScale=1.5000
//		|-1.000000|-1.000000|0.106507|0.000000|         fBrightClamp=1.3500
//		|0.000000|0.000000|0.786986|0.000000|           fBlurRadius=1.0000
//		|1.000000|1.000000|0.106507|0.000000|           iNumBlurpasses=1
//		|2.000000|2.000000|0.000000|0.000000|           iBlendType=2
//		|3.000000|3.000000|0.000000|0.000000|           bDoHighDynamicRange=1
//		|4.000000|4.000000|0.000000|0.000000|
//		|5.000000|5.000000|0.000000|0.000000|
//		|6.000000|6.000000|0.000000|0.000000|
//		|7.000000|7.000000|0.000000|0.000000|
//		|0.000000|0.000000|0.000000|0.000000|
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   BlurScale    const_2       1		1/256 => 0.003906
//   BlurOffsets  const_3       4		1/4   => 0.250000
//                const_4       .
//                const_5       .
//                const_6       .
//   Src0         texture_0       1
//

    const int4 const_0 = {1, 0, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D Src0;
    r0.xy = BlurScale;
    r3.xy = (r0 * const_4) + IN.texcoord_0;		// |3.000000|3.000000| + (in / 256)
    r2.xy = (r0 * BlurOffsets) + IN.texcoord_0;		// |1.000000|3.000000| + (in / 256)
    r1.xy = (r0 * const_5) + IN.texcoord_0;		// |1.000000|1.000000| + (in / 256)
    r0.xy = (r0 * const_6) + IN.texcoord_0;		// |3.000000|1.000000| + (in / 256)
    r3 = tex2D(Src0, r3);
    r2 = tex2D(Src0, r2);
    r1 = tex2D(Src0, r1);
    r0 = tex2D(Src0, r0);
    r3.xyz = r3 * const_4.z;		// (in[0] / 4)
    r2.xyz = (BlurOffsets.z * r2) + r3;            // (in[0] / 4) + (in[1] / 4)
    r1.xyz = (const_5.z * r1) + r2;            // (in[0] / 4) + (in[1] / 4) + (in[2] / 4)
    r0.xyz = (const_6.z * r0) + r1;            // (in[0] / 4) + (in[1] / 4) + (in[2] / 4) + (in[3] / 4)
    r0.w = 1;
    OUT.color_0 = r0;

// approximately 15 instruction slots used (4 texture, 11 arithmetic)
