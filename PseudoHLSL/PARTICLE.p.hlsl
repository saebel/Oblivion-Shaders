//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PARTICLE.pso /Fcshaderdump19/PARTICLE.pso.dis
//
//
// Parameters:

sampler2D SourceTexture;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   SourceTexture texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float2 texcoord_0 : TEXCOORD0;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;



    OUT.color_0.rgba = (tex2D(SourceTexture, IN.texcoord_0.xy)) * IN.color_0.rgba;			// partial precision

    return OUT;
};

// approximately 3 instruction slots used (1 texture, 2 arithmetic)
