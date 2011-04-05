//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1034.pso /Fcshaderdump19/SLS1034.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D DiffuseMap;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   DiffuseMap   texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float3 color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;


    float4 r0;

    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0.xy);
    r0.xyz = r0.xyz * ((IN.color_0.rgb * PSLightColor[0].rgb) + AmbientColor.rgb);
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 5 instruction slots used (1 texture, 4 arithmetic)
