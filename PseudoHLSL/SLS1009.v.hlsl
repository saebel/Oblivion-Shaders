//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1009.vso /Fcshaderdump19/SLS1009.vso.dis
//
//
// Parameters:
//
float4 EyePosition;
float3 LightDirection[3];
row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//   EyePosition    const_25      1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float3 eye5;

    eye5.xyz = mul(TanSpaceProj, normalize(normalize(EyePosition.xyz - IN.position.xyz) + LightDirection[0].xyz));
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = compress(eye5.xyz);	// [-1,+1] to [0,1]

    return OUT;
};

// approximately 16 instruction slots used
