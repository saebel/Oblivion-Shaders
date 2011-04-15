//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2002.vso /Fcshaderdump19/STB2002.vso.dis
//
//
// Parameters:
//
float3 LightDirection[3];
float4 LightPosition[3];
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
//   LightPosition[0]  const_16       1
//   LightPosition[1]  const_17       1
//   LightPosition[2]  const_18       1
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
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float3 lit1;
    float3 lit3;
    float1 q0;
    float4 q6;
    float4 r0;

    q0.x = IN.blendindices.y;
    q6.xyzw = mul(float4x4(WindMatrices[0 + q0.x].xyzw, WindMatrices[1 + q0.x].xyzw, WindMatrices[2 + q0.x].xyzw, WindMatrices[3 + q0.x].xyzw), IN.position.xyzw);
    r0.xyzw = (IN.blendindices.x * (q6.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    OUT.position.xyzw = mul(ModelViewProj, r0.xyzw);
    lit3.xyz = LightPosition[2].xyz - r0.xyz;
    lit1.xyz = LightPosition[1].xyz - r0.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));
    OUT.texcoord_2.xyz = mul(TanSpaceProj, normalize(lit1.xyz));
    OUT.texcoord_3.xyz = mul(TanSpaceProj, normalize(lit3.xyz));
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_4.xyz = compress(lit1.xyz / LightPosition[1].w);	// [-1,+1] to [0,1]
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_5.xyz = compress(lit3.xyz / LightPosition[2].w);	// [-1,+1] to [0,1]

    return OUT;
};

// approximately 44 instruction slots used
