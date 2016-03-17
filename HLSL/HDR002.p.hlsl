//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR002.pso /Fcshaderdump19/HDR002.pso.dis
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
//		|1.225000|1.350000|0.500000|1.400000|           fGrassDimmer=1.3000
//	SetPixelShaderConstantF[2+]                             fTreeDimmer=1.2000
//		|0.003906|0.000000|0.000000|0.000000|           fEmissiveHDRMult=2.0000
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
//   BlurScale    const_2       1		1/256 => 0.003906
//   BlurOffsets[0]  const_3       1
//   BlurOffsets[1]  const_4       1
//   BlurOffsets[2]  const_5       1
//   BlurOffsets[3]  const_6       1
//   BlurOffsets[4]  const_7       1
//   BlurOffsets[5]  const_8       1
//   BlurOffsets[6]  const_9       1
//   BlurOffsets[7]  const_10      1
//   BlurOffsets[8]  const_11      1
//   BlurOffsets[9]  const_12      1
//   BlurOffsets[10]  const_13      1
//   BlurOffsets[11]  const_14      1
//   BlurOffsets[12]  const_15      1
//   BlurOffsets[13]  const_16      1
//   BlurOffsets[14]  const_17      1
//   ScreenSpace         texture_0       1
//

#include "includes/Color.hlsl"

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

    float3 q14;
    float3 t0;
    float3 t1;
    float3 t10;
    float3 t11;
    float3 t12;
    float3 t13;
    float3 t18;
    float3 t2;
    float3 t3;
    float3 t4;
    float3 t5;
    float3 t6;
    float3 t7;
    float3 t8;
    float3 t9;

    /* original shader ---------------------------------------
     *
     * unknown kernel
     */

    float2 pos0  = (BlurScale.xy * BlurOffsets[ 0].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos1  = (BlurScale.xy * BlurOffsets[ 1].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos2  = (BlurScale.xy * BlurOffsets[ 2].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos3  = (BlurScale.xy * BlurOffsets[ 3].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos4  = (BlurScale.xy * BlurOffsets[ 4].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos5  = (BlurScale.xy * BlurOffsets[ 5].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos6  = (BlurScale.xy * BlurOffsets[ 6].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos7  = (BlurScale.xy * BlurOffsets[ 7].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos8  = (BlurScale.xy * BlurOffsets[ 8].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos9  = (BlurScale.xy * BlurOffsets[ 9].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos10 = (BlurScale.xy * BlurOffsets[10].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos11 = (BlurScale.xy * BlurOffsets[11].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos12 = (BlurScale.xy * BlurOffsets[12].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos13 = (BlurScale.xy * BlurOffsets[13].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)
    float2 pos14 = (BlurScale.xy * BlurOffsets[14].xy) + IN.ScreenOffset.xy;	// |?.??????|?.??????| + (in / 256)

    t11.xyz = tex2D(ScreenSpace, pos0 );
    t12.xyz = tex2D(ScreenSpace, pos1 );
    t10.xyz = tex2D(ScreenSpace, pos2 );
    t9.xyz  = tex2D(ScreenSpace, pos3 );
    t8.xyz  = tex2D(ScreenSpace, pos4 );
    t7.xyz  = tex2D(ScreenSpace, pos5 );
    t6.xyz  = tex2D(ScreenSpace, pos6 );
    t5.xyz  = tex2D(ScreenSpace, pos7 );
    t4.xyz  = tex2D(ScreenSpace, pos8 );
    t3.xyz  = tex2D(ScreenSpace, pos9 );
    t2.xyz  = tex2D(ScreenSpace, pos10);
    t1.xyz  = tex2D(ScreenSpace, pos11);
    t0.xyz  = tex2D(ScreenSpace, pos12);
    t13.xyz = tex2D(ScreenSpace, pos13);
    t18.xyz = tex2D(ScreenSpace, pos14);

    q14.xyz = (BlurOffsets[ 0].z * t11.xyz) +
	      (BlurOffsets[ 1].z * t12.xyz) +
	      (BlurOffsets[ 2].z * t10.xyz) +
	      (BlurOffsets[ 3].z * t9.xyz) +
	      (BlurOffsets[ 4].z * t8.xyz) +
	      (BlurOffsets[ 5].z * t7.xyz) +
	      (BlurOffsets[ 6].z * t6.xyz) +
	      (BlurOffsets[ 7].z * t5.xyz) +
	      (BlurOffsets[ 8].z * t4.xyz) +
	      (BlurOffsets[ 9].z * t3.xyz) +
	      (BlurOffsets[10].z * t2.xyz) +
	      (BlurOffsets[11].z * t1.xyz) +
	      (BlurOffsets[12].z * t0.xyz) +
	      (BlurOffsets[13].z * t13.xyz) +
	      (BlurOffsets[14].z * t18.xyz);

    OUT.color_0.a = 1;
    OUT.color_0.rgb = q14.xyz;

    return OUT;
};

// approximately 48 instruction slots used (15 texture, 33 arithmetic)