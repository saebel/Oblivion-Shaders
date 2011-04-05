//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2016.pso /Fcshaderdump19/SLS2016.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
float4 EmittanceColor;
sampler2D GlowMap;
sampler2D NormalMap;
float4 PSLightColor[4];
float4 Toggles;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 color_0 : COLOR0;
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0.2, 0.5, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_0.xy);
    r2.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r2.xyz = normalize(2 * (r2.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r3.xyz = normalize(IN.texcoord_3.xyz);			// partial precision
    r3.w = r2.w * pow(abs(saturate(dot(r2.xyz, r3.xyz))), Toggles.z);			// partial precision
    r3.x = dot(r2.xyz, IN.texcoord_1.xyz);			// partial precision
    r2.xyz = saturate(((0.2 - r3.x) >= 0.0 ? r3.w : (r3.w * max(r3.x + 0.5, 0))) * PSLightColor[0].rgb);			// partial precision
    r3.xyz = (saturate(r3.x) * PSLightColor[0].rgb) + ((r1.xyz * EmittanceColor.rgb) + AmbientColor.rgb);			// partial precision
    r0.xyz = ((Toggles.x <= 0.0 ? (r0.xyz * IN.color_0.rgb) : r0.xyz) * max(r3.xyz, 0)) + r2.xyz;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? lerp(IN.color_1.rgb, r0.xyz, IN.color_1.a) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 36 instruction slots used (3 texture, 33 arithmetic)
