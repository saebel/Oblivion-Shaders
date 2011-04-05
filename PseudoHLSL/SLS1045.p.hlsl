//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1045.pso /Fcshaderdump19/SLS1045.pso.dis
//
//
// Parameters:

sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   PSLightColor[1] const_3        1
//   PSLightColor[2] const_4        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
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

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);
    r0.w = dot(PSLightColor[1].rgba, IN.color_0.rgba) + dot(PSLightColor[2].rgba, IN.color_1.rgba);
    r1.xyzw = tex2D(NormalMap, IN.texcoord_1.xy);
    r0.xyz = saturate(saturate(dot(2 * (r1.xyz - 0.5), 2 * (IN.texcoord_3.xyz - 0.5))) * PSLightColor[0].rgb) * (r0.xyz * IN.texcoord_2.xyz);	// [0,1] to [-1,+1]
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 14 instruction slots used (2 texture, 12 arithmetic)
