//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR002.pso /Fcshaderdump19/HDR002.pso.dis
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
// Parameters:

float4 BlurOffsets[16];
float2 BlurScale;
sampler2D Src0;

// Structures:

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float2 p1  = (BlurOffsets[1].xy  * BlurScale) + IN.texcoord_0;
    float2 p0  = (BlurOffsets[0].xy  * BlurScale) + IN.texcoord_0;
    float2 p2  = (BlurOffsets[2].xy  * BlurScale) + IN.texcoord_0;
    float2 p3  = (BlurOffsets[3].xy  * BlurScale) + IN.texcoord_0;
    float2 p4  = (BlurOffsets[4].xy  * BlurScale) + IN.texcoord_0;
    float2 p5  = (BlurOffsets[5].xy  * BlurScale) + IN.texcoord_0;
    float2 p6  = (BlurOffsets[6].xy  * BlurScale) + IN.texcoord_0;
    float2 p7  = (BlurOffsets[7].xy  * BlurScale) + IN.texcoord_0;
    float2 p8  = (BlurOffsets[8].xy  * BlurScale) + IN.texcoord_0;
    float2 p9  = (BlurOffsets[9].xy  * BlurScale) + IN.texcoord_0;
    float2 p10 = (BlurOffsets[10].xy * BlurScale) + IN.texcoord_0;
    float2 p11 = (BlurOffsets[11].xy * BlurScale) + IN.texcoord_0;
    float2 p12 = (BlurOffsets[12].xy * BlurScale) + IN.texcoord_0;
    float2 p13 = (BlurOffsets[13].xy * BlurScale) + IN.texcoord_0;
    float2 p14 = (BlurOffsets[14].xy * BlurScale) + IN.texcoord_0;

    float3 c1  = tex2D(Src0, p1 );
    float3 c0  = tex2D(Src0, p0 );
    float3 c2  = tex2D(Src0, p2 );
    float3 c3  = tex2D(Src0, p3 );
    float3 c4  = tex2D(Src0, p4 );
    float3 c5  = tex2D(Src0, p5 );
    float3 c6  = tex2D(Src0, p6 );
    float3 c7  = tex2D(Src0, p7 );
    float3 c8  = tex2D(Src0, p8 );
    float3 c9  = tex2D(Src0, p9 );
    float3 c10 = tex2D(Src0, p10);
    float3 c11 = tex2D(Src0, p11);
    float3 c12 = tex2D(Src0, p12);
    float3 c13 = tex2D(Src0, p13);
    float3 c14 = tex2D(Src0, p14);

    float3 sum =
    	(BlurOffsets[1].z  * c1 ) +
    	(BlurOffsets[0].z  * c0 ) +
    	(BlurOffsets[2].z  * c2 ) +
    	(BlurOffsets[3].z  * c3 ) +
    	(BlurOffsets[4].z  * c4 ) +
    	(BlurOffsets[5].z  * c5 ) +
    	(BlurOffsets[6].z  * c6 ) +
    	(BlurOffsets[7].z  * c7 ) +
    	(BlurOffsets[8].z  * c8 ) +
    	(BlurOffsets[9].z  * c9 ) +
    	(BlurOffsets[10].z * c10) +
    	(BlurOffsets[11].z * c11) +
    	(BlurOffsets[12].z * c12) +
    	(BlurOffsets[13].z * c13) +
    	(BlurOffsets[14].z * c14);

    OUT.color_0.rgb = sum;
    OUT.color_0.a   = 1;

    return OUT;
};

// approximately 48 instruction slots used (15 texture, 33 arithmetic)
