//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/ISHIT2002.vso /Fcshaderdump19/ISHIT2002.vso.dis
//
//
// Parameters:

float4 texRatio0;
float4 texRatio1;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   texRatio0    const_6       1
//   texRatio1    const_7       1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;


    OUT.position.xyzw = IN.position;
    OUT.texcoord_0.xy = (IN.texcoord_0 * texRatio0) + texRatio0.zwzw;
    OUT.texcoord_1.xy = (IN.texcoord_0 * texRatio1) + texRatio1.zwzw;

    return OUT;
};

// approximately 3 instruction slots used
