//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HDR007.pso /Fcshaderdump19/HDR007.pso.dis
//
//
// Parameters:

float4 HDRParam;
sampler2D Src0;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   HDRParam     const_1       1
//   Src0         texture_0       1
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

    const float4 const_0 = {0.01, 1, 0, 0};

    float4 r0;
    float4 r1;

    r0.xyzw = tex2D(Src0, IN.texcoord_0.xy);
    r0.w = 1;
    r1.w = max(0.01, length(r0.xyz));
    r0.xyz = r0.xyz * (min(r1.w, HDRParam.x) / r1.w);
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 11 instruction slots used (1 texture, 10 arithmetic)
