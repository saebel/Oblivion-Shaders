//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3025.vso /Fcshaderdump19/SM3025.vso.dis
//
//
// Parameters:
//
row_major float4x4 ModelViewProj : register(c0);
row_major float4x4 WorldViewTranspose : register(c5);
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   ModelViewProj[0]      const_0        1
//   ModelViewProj[1]      const_1        1
//   ModelViewProj[2]      const_2        1
//   ModelViewProj[3]      const_3        1
//   WorldViewTranspose[0] const_5        1
//   WorldViewTranspose[1] const_6        1
//   WorldViewTranspose[2] const_7        1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float3 texcoord_0 : TEXCOORD0;
    float texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float1 mdl0;
    float3 q4;

    q4.xyz = mul(float3x3(WorldViewTranspose[0].xyz, WorldViewTranspose[1].xyz, WorldViewTranspose[2].xyz), IN.normal.xyz);
    mdl0.x = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xy = mul(float2x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw), IN.position.xyzw);
    OUT.position.z = mdl0.x;
    OUT.texcoord_0.xyz = compress(q4.xyz);	// [-1,+1] to [0,1]
    OUT.texcoord_1.x = (mdl0.x * 5) - 4.4;

    return OUT;
};

// approximately 10 instruction slots used
