//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR005.pso /Fcshaderdump19/HDR005.pso.dis
//
//
// Parameters:
//
//   float4 HDRParam;
//   sampler2D Src0;
//
//	SetPixelShaderConstantF[0+]				[BlurShaderHDR]
//		|0.000000|0.000000|0.000000|0.000000|           fTargetLUM=1.2000
//	SetPixelShaderConstantF[1+]                             fUpperLUMClamp=1.4000
//		|1.225000|1.350000|0.500000|1.400000|           fGrassDimmer=1.3000
//	SetPixelShaderConstantF[2+]                             fTreeDimmer=1.2000
//		|0.250000|0.250000|0.000000|0.000000|           fEmissiveHDRMult=2.0000
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
//   HDRParam     const_1       1
//   Src0         texture_0       1
//

    const int4 const_0 = {0, 1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    sampler2D Src0;
    r0 = tex2D(Src0, IN.texcoord_0);
    r1.xyz = r0 - HDRParam.x;		// in - 1.225
    r0.xyz = max(r1, const_0.x);		// max(in - 1.225, 0)
    r0.xyz = r0 * HDRParam.y;		// max(in - 1.225, 0) * fBrightClamp == 1.350000
    r0.w = const_0.y;
    OUT.color_0 = r0;

// approximately 6 instruction slots used (1 texture, 5 arithmetic)
