//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS1039.pso /Fcshaderdump19/SLS1039.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D DiffuseMap;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   DiffuseMap   texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;


    float3 r0;

    r0.xyz = AmbientColor.rgb;
    OUT.color_0.rgba = tex2D(DiffuseMap, IN.texcoord_0.xy);

    return OUT;
};

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
