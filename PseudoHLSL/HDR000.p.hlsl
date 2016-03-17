//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR000.pso /Fcshaderdump19/HDR000.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//
float4 BlurOffsets[16] : register(c3);
float2 BlurScale : register(c2);
sampler2D ScreenSpace : register(s0);
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
//   BlurOffsets[0]  const_3       1		1/4   => 0.250000
//   BlurOffsets[1]  const_4       1
//   BlurOffsets[2]  const_5       1
//   BlurOffsets[3]  const_6       1
//   ScreenSpace         texture_0       1
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
    float3 t0;
    float3 t1;
    float3 t2;
    float3 t4;

    t4.xyz = tex2D(ScreenSpace, (BlurScale.xy * BlurOffsets[3].xy) + IN.ScreenOffset.xy);
    t0.xyz = tex2D(ScreenSpace, (BlurScale.xy * BlurOffsets[2].xy) + IN.ScreenOffset.xy);
    t2.xyz = tex2D(ScreenSpace, (BlurScale.xy * BlurOffsets[1].xy) + IN.ScreenOffset.xy);
    t1.xyz = tex2D(ScreenSpace, (BlurScale.xy * BlurOffsets[0].xy) + IN.ScreenOffset.xy);
    q3.xyz = (BlurOffsets[2].z * t0.xyz) + ((BlurOffsets[0].z * t1.xyz) + (t2.xyz * BlurOffsets[1].z));            // (in[0] / 4) + (in[1] / 4) + (in[2] / 4)
    OUT.color_0.a = 1;
    OUT.color_0.rgb = (BlurOffsets[3].z * t4.xyz) + q3.xyz;

    return OUT;
};

// approximately 15 instruction slots used (4 texture, 11 arithmetic)