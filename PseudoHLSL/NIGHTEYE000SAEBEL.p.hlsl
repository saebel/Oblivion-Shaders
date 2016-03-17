//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/NIGHTEYE000.pso /Fcshaderdump19/NIGHTEYE000.pso.dis
//
//
#define	ScreenSpace	Src0
// Parameters:
//

sampler2D ScreenSpace : register(s0);
//
//
// Registers:
//
//   Name         Reg       Size
//   ------------ -----     ----
//   ScreenSpace  texture_0 1
//

// Following Parameters added by saebel.
// ---------------------------------------------------------------
// /// indicates comments used by Shazzam for previewing the results.

// *** SPECIAL VARIABLES ***

/// <summary>Light Level Hitting Player</summary>
/// <minValue>0.0</minValue>
/// <maxValue>100.0</maxValue>
/// <defaultValue>100.0</defaultValue>
float LightLevel : register(C2);

/// <summary>This determines how much of the light hitting the player offsets the night-eye color-mix, blending it into the original color.  At 100, then a light level of 100 nullifies the night-eye color mix.  At 0 the night-eye color mix ignores light levels.  And everything in between.</summary>
/// <minValue>0.0</minValue>
/// <maxValue>100.0</maxValue>
/// <defaultValue>0.0</defaultValue>
float LightLevelColorImpact : register(C1);

/// <summary>This is the "Threshold" in relation to standard vision.  0 is the same as normal vision.  Higher values increase the overall brightness.  Value selected is altered to force a range of .3 to .5.</summary>
/// <minValue>0.0</minValue>
/// <maxValue>100.0</maxValue>
/// <defaultValue>0.0</defaultValue>
float Threshold : register(C3);

/// <summary>This is the tunnel vision factor.  The amount applied = LightLevel%.  So if light level is 100, then full tunnel effect.  If set to 0, then no tunnel vision effect will be applied.  Value selected is altered to force a range of 0 to .02.</summary>
/// <minValue>0.0</minValue>
/// <maxValue>100.0</maxValue>
/// <defaultValue>0.0</defaultValue>
float TunnelFactor : register(C4);

// *** COLOR BALANCE ***

/// <summary>Balance of Red, Blue, Green</summary>
/// <minValue>0.0,0.0,0.0</minValue>
/// <maxValue>100.0,100.0,100.0</maxValue>
/// <defaultValue>50.0,50.0,50.0</defaultValue>
float3 ColorBalanceRGB : register(C5);

/// <summary>Balance of Yellow, Cyan, Magenta</summary>
/// <minValue>0.0,0.0,0.0</minValue>
/// <maxValue>100.0,100.0,100.0</maxValue>
/// <defaultValue>50.0,50.0,50.0</defaultValue>
float3 ColorBalanceYCM : register(C6);

// *** COLOR SATURATION ***

/// <summary>Saturation of Red, Blue, Green</summary>
/// <minValue>0.0,0.0,0.0</minValue>
/// <maxValue>100.0,100.0,100.0</maxValue>
/// <defaultValue>100.0,100.0,100.0</defaultValue>
float3 ColorSaturationRGB : register(C7);

/// <summary>Saturation of Yellow, Cyan, Magenta</summary>
/// <minValue>0.0,0.0,0.0</minValue>
/// <maxValue>100.0,100.0,100.0</maxValue>
/// <defaultValue>100.0,100.0,100.0</defaultValue>
float3 ColorSaturationYCM : register(C8);

// ---------------------------------------------------------------

// Helper Functions
float WeightedLuma(float3 color)
{
return sqrt( 0.299*( color.r*color.r ) + 0.587*( color.g*color.g ) + 0.114*( color.b*color.b ));
}

// ---------------------------------------------------------------
// Main shader code

float4 main(float2 uv : TEXCOORD0) : COLOR0
{

	float4 color = tex2D(ScreenSpace, uv.xy);
	
	// store original color for later
	float4 originalColor = color;
	
	// Apply color balance settings
	float3 BalanceRGB = ((ColorBalanceRGB.rgb) - 50.0f)/50.0f * .6;
	float3 BalanceYCM = ((ColorBalanceYCM.rgb) - 50.0f)/50.0f * .2;
	color.r = color.r + (BalanceRGB.r + BalanceYCM.r + BalanceYCM.b)/3.0;
	color.g = color.g + (BalanceRGB.g + BalanceYCM.r + BalanceYCM.g)/3.0;
	color.b = color.b + (BalanceRGB.b + BalanceYCM.g + BalanceYCM.b)/3.0;
	
	// Apply saturation settings
	color.rgb = saturate( color.rgb ); //comment out if not using LDR, but this effect should run in LDR.
	float gr = WeightedLuma( color.rgb );
	float r = color.r;
	float g = color.g;
	float b = color.b;
	
	float3 SaturationRGB = (10.00 - (ColorSaturationRGB.rgb/10.0));
	float3 SaturationYCM = (10.00 - (ColorSaturationYCM.rgb/10.0));
	float sr = saturate(SaturationRGB.r * ( r-b-g+r ));
	float sg = saturate(SaturationRGB.g * ( g-r-b+g ));
	float sb = saturate(SaturationRGB.b * ( b-r-g+b ));
	
	float sy = saturate(SaturationYCM.r * ( min(r,g)-2*max(r,g)-b+r+g ));
	float sc = saturate(SaturationYCM.g * ( min(b,g)-2*max(b,g)-r+b+g ));
	float sm = saturate(SaturationYCM.b * ( min(r,b)-2*max(r,b)-g+r+b ));
	
	color.rgb = lerp( color.rgb, gr, saturate( sr + sg + sb + sc + sm + sy ));

	// adjust brightness of night-eye effect
	float ThresholdActual = .5 - (Threshold/500.0);
	float exponent = ThresholdActual / ( 1 - ThresholdActual);
        color.rgb = saturate(.5 * (pow(abs(color.rgb/ThresholdActual),exponent)));

	// Mix original with night-eye effect
	float colorMix = (LightLevel/100.0)*(LightLevelColorImpact/100.0);
	color = lerp(color,originalColor,colorMix);
 		
	// Apply tunnel
	if(TunnelFactor > 0)
	{
		float tFactor = 1 - (TunnelFactor/5000.0 * LightLevel);
		float3 tunnel = color.rgb*sin(uv.x*3.14)*sin(uv.y*3.14);
		float4 tunnelColor = float4(tunnel.r, tunnel.g, tunnel.b, color.a);
		color = lerp(tunnelColor,color,tFactor);
	}
	
	return color;
}
