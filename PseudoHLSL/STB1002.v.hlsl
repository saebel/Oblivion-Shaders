//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1002.vso /Fcshaderdump19/STB1002.vso.dis
//
//
// Parameters:
//
float3 LightDirection[3];
row_major float4x4 ModelViewProj;
float4 WindMatrices[16];
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
//   WindMatrices[0]   const_38      4
//   WindMatrices[1]   const_39      4
//   WindMatrices[2]   const_40      4
//   WindMatrices[3]   const_41      4
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 blendindices : BLENDINDICES;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    const float4 const_4 = {0.5, 1, 0, 0};

    float1 q0;
    float4 q3;

    q0.x = IN.blendindices.y;
    q3.xyzw = mul(float4x4(WindMatrices[0 + q0.x].xyzw, WindMatrices[1 + q0.x].xyzw, WindMatrices[2 + q0.x].xyzw, WindMatrices[3 + q0.x].xyzw), IN.position.xyzw);
    OUT.color_0.rgba = (IN.blendindices.z * const_4.yyyz) + const_4.zzzy;
    OUT.position.xyzw = mul(ModelViewProj, (IN.blendindices.x * (q3.xyzw - IN.position.xyzw)) + IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.xy = IN.texcoord_0.xy;
    OUT.texcoord_3.xyz = compress(mul(TanSpaceProj, LightDirection[0].xyz));

    return OUT;
};

// approximately 20 instruction slots used