//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/WATERHMAP003.pso /Fcshaderdump19/WATERHMAP003.pso.dis
//
//
// Parameters:

sampler2D sampScramble;
sampler2D sampSourceImage;


// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   sampScramble    texture_1       1
//   sampSourceImage texture_2       1
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


    float4 r0;

    r0.xyzw = tex2D(sampScramble, IN.texcoord_0.xy);
    r0.y = IN.texcoord_0.y;
    r0.xyzw = tex2D(sampSourceImage, r0.xy);
    r0.yzw = r0.x;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 5 instruction slots used (2 texture, 3 arithmetic)
