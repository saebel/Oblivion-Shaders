//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1022.pso /Fcshaderdump19/SLS1022.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
sampler2D GlowMap;
sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   GlowMap      texture_2       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 color_0 : COLOR0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r1.xyzw = tex2D(GlowMap, IN.texcoord_2.xy);
    r2.xyzw = tex2D(NormalMap, IN.texcoord_1.xy);
    r1.xyz = saturate(saturate(dot(2 * (r2.xyz - 0.5), 2 * (IN.texcoord_3.xyz - 0.5))) * PSLightColor[0]) + (r1.xyz + AmbientColor.rgb));	// [0,1] to [-1,+1]
    r0.xyz = (r0.xyz * r1.xyz) + (((-r0.xyz * r1.xyz) + IN.color_0.rgb) * IN.color_0.a);
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 14 instruction slots used (3 texture, 11 arithmetic)
