//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYFAR.vso /Fcshaderdump19/SKYFAR.vso.dis
//
//
// Parameters:

row_major float4x4 ModelViewProj;

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

    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[3], IN.position) * 0.999998987;
    OUT.position.w = dot(ModelViewProj[3], IN.position) * 1;

    OUT.texcoord_0.xy = IN.texcoord_0;

    return OUT;
};

// approximately 5 instruction slots used
