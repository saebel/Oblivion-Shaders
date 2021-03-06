//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1008.vso /Fcshaderdump19/STB1008.vso.dis
//
//
// Parameters:
//
float4 EyePosition : register(c25);
float4 LightPosition[3] : register(c16);
row_major float4x4 ModelViewProj : register(c0);
float4 WindMatrices[16] : register(c38);
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   LightPosition[0] const_16       1
//   EyePosition   const_25      1
//   WindMatrices[0]  const_38      4
//   WindMatrices[1]  const_39      4
//   WindMatrices[2]  const_40      4
//   WindMatrices[3]  const_41      4
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float4 blendindices : BLENDINDICES;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
};

struct VS_OUTPUT {
    float3 color_0 : COLOR0;
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

    float1 q0;
    float3 q2;
    float4 q5;
    float4 r0;
    float3 r1;

    q0.x = IN.blendindices.y;
    q5.xyzw = mul(float4x4(WindMatrices[0 + q0.x].xyzw, WindMatrices[1 + q0.x].xyzw, WindMatrices[2 + q0.x].xyzw, WindMatrices[3 + q0.x].xyzw), IN.position.xyzw);
    r0.xyzw = (IN.blendindices.x * (q5.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    OUT.position.xyzw = mul(ModelViewProj, r0.xyzw);
    r1.xyz = LightPosition[0].xyz - r0.xyz;
    q2.xyz = normalize(normalize(r1.xyz) + normalize(EyePosition.xyz - r0.xyz));
    r0.x = dot(IN.tangent.xyz, IN.normal.xyz);
    r0.z = dot(IN.normal.xyz, IN.normal.xyz);
    r0.y = dot(IN.binormal.xyz, IN.normal.xyz);
    OUT.color_0.rgb = compress(r0.xyz);	// [-1,+1] to [0,1]
    r0.xyz = r1.xyz / LightPosition[0].w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = compress(r0.xy);	// [-1,+1] to [0,1]
    OUT.texcoord_2.x = compress(r0.z);	// [-1,+1] to [0,1]
    OUT.texcoord_2.y = 0.5;
    OUT.texcoord_3.xyz = mul(TanSpaceProj, q2.xyz);

    return OUT;
};

// approximately 37 instruction slots used
