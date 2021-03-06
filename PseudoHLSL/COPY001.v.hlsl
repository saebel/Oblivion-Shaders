//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/COPY001.vso /Fcshaderdump19/COPY001.vso.dis
//
//
// Parameters:
//
row_major float2x2 RotationMatrix : register(c8);
float4 texRatio0 : register(c6);
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   texRatio0      const_6       1
//   RotationMatrix[0] const_8        1
//   RotationMatrix[1] const_9        1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float2 r0;

    OUT.position.xyzw = IN.position.xyzw;
    r0.xy = ((IN.texcoord_0.xy * texRatio0.xy) + texRatio0.zw) - 0.5;
    OUT.texcoord_0.xy = ((r0.x * RotationMatrix[0].xy) + (r0.y * RotationMatrix[1].xy)) + 0.5;

    return OUT;
};

// approximately 6 instruction slots used
