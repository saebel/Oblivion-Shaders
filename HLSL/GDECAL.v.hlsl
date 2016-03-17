//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GDECAL.vso /Fcshaderdump19/GDECAL.vso.dis
//
//
// Parameters:

float4 DecalFade;
row_major float4x4 ModelViewProj;

// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float3 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    OUT.position.x = dot(ModelViewProj[0], IN.position);
    OUT.position.y = dot(ModelViewProj[1], IN.position);
    OUT.position.z = dot(ModelViewProj[2], IN.position);
    OUT.position.w = dot(ModelViewProj[3], IN.position);

    OUT.texcoord_0.z = IN.normal.z * DecalFade.x;
    OUT.texcoord_0.xy = IN.normal;

    return OUT;
};

// approximately 6 instruction slots used