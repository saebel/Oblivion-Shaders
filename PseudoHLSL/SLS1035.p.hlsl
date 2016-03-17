//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1035.pso /Fcshaderdump19/SLS1035.pso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c1);
sampler2D DiffuseMap : register(s0);
float4 PSLightColor[4] : register(c2);
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   PSLightColor[1] const_3        1
//   DiffuseMap   texture_0       1
//


// Structures:

struct VS_OUTPUT {
    float3 color_0 : COLOR0;
    float3 color_1 : COLOR1;
    float2 DiffuseUV : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    float3 q0;
    float4 r0;

    r0.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);
    q0.xyz = (IN.color_1.rgb * PSLightColor[1].rgb) + ((IN.color_0.rgb * PSLightColor[0].rgb) + AmbientColor.rgb);
    OUT.color_0.a = r0.w;
    OUT.color_0.rgb = r0.xyz * q0.xyz;

    return OUT;
};

// approximately 6 instruction slots used (1 texture, 5 arithmetic)