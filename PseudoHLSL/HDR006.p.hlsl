//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR006.pso /Fcshaderdump19/HDR006.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
sampler2D AvgLum : register(s1);
float4 HDRParam : register(c1);
sampler2D ScreenSpace : register(s0);
float4 TimingData : register(c0);
//
//	SetPixelShaderConstantF[0+]				[BlurShaderHDR]
//		|0.000000|0.000000|0.000000|0.000000|           fTargetLUM=1.2000
//	SetPixelShaderConstantF[1+]                             fUpperLUMClamp=1.4000
//		|1.200000|1.350000|0.500000|1.400000|           fGrassDimmer=1.3000
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
//   TimingData   const_0       1
//   HDRParam     const_1       1
//   ScreenSpace         texture_0       1
//   AvgLum       texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 ScreenOffset : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float3 q3;
    float4 r0;
    float3 t0;

    t0.xyz = tex2D(ScreenSpace, IN.ScreenOffset.xy);
    r0.xyzw = tex2D(AvgLum, IN.ScreenOffset.xy);
    q3.xyz = lerp(t0.xyz, r0.xyz, 1 - pow(abs(HDRParam.z), TimingData.z));		// lerp(ScreenSpace, AvgLum, 1.0 - pow(something))
    OUT.color_0.a = 1;
    OUT.color_0.rgb = q3.xyz * (min(max(0.01, length(q3.xyz)), HDRParam.w) / max(0.01, length(q3.xyz)));

    return OUT;
};

// approximately 19 instruction slots used (2 texture, 17 arithmetic)
