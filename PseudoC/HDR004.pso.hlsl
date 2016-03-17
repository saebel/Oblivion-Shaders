//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR004.pso /Fcshaderdump19/HDR004.pso.dis
//
//
// Parameters:
//
//   sampler2D AvgLum;
//   sampler2D DestBlend;
//   float4 HDRParam;
//   sampler2D Src0;
//
//	SetPixelShaderConstantF[0+]				[BlurShaderHDR]
//		|0.000000|0.000000|0.000000|0.000000|           fTargetLUM=1.2000
//	SetPixelShaderConstantF[1+]                             fUpperLUMClamp=1.4000
//		|1.200000|1.350000|0.500000|1.400000|           fGrassDimmer=1.3000
//	SetPixelShaderConstantF[2+]                             fTreeDimmer=1.2000
//		|0.000000|0.003906|0.000000|0.000000|           fEmissiveHDRMult=2.0000
//	SetPixelShaderConstantF[3+]                             fEyeAdaptSpeed=0.7000
//		|-7.000000|-7.000000|0.000000|0.000000|         fSunlightDimmer=1.3000
//		|-6.000000|-6.000000|0.000000|0.000000|         fSIEmmisiveMult=1.0000
//		|-5.000000|-5.000000|0.000000|0.000000|         fSISpecularMult=1.5000
//		|-4.000000|-4.000000|0.000000|0.000000|         fSkyBrightness=0.5000
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
//   DestBlend    texture_1       1
//   AvgLum       texture_2       1
//

    const float4 const_0 = {1, 0.5, 0, 0};
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    sampler2D Src0;
    sampler2D DestBlend;
    sampler2D AvgLum;
    r2.xyzw = tex2D(AvgLum, IN.texcoord_0.xy);		// range-surface
    r1.xyzw = tex2D(Src0, IN.texcoord_0.xy);		// blur-surface
    r0.xyzw = tex2D(DestBlend, IN.texcoord_1.xy);		// original-surface

    r2.x = dot(r2.xyz, 1);		// range.x * 1 + range.y * 1 + range.z * 1
    r0.w = max(r2.x, HDRParam.x);	//              max(range, fTargetLUM)
    r0.w = 1.0 / r0.w;		//        1.0 / max(range, fTargetLUM)
    r1.w = r0.w * 0.5;	//        0.5 / max(range, fTargetLUM)
    r2.xyz = r1.xyz * r1.w;	// blur * 0.5 / max(range, fTargetLUM)
    r0.w = r0.w * HDRParam.x;	// fTargetLUM / max(range, fTargetLUM)
    r1.xyz = max(r2.xyz, 0);	// max(blur * 0.5 / max(range, fTargetLUM), 0)
    r0.xyz = (r0.w * r0.xyz) + r1.xyz;	// fTargetLUM / max(range, fTargetLUM) * (max(blur * 0.5 / max(range, fTargetLUM), 0) + original)
    r0.w = 1;
    OUT.color_0.rgba = r0.xyzw;

// approximately 13 instruction slots used (3 texture, 10 arithmetic)