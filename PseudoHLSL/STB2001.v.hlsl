//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2001.vso /Fcshaderdump19/STB2001.vso.dis
//
//
// Parameters:
//
float3 LightDirection[3] : register(c13);
float4 LightPosition[3] : register(c16);
row_major float4x4 ModelViewProj : register(c0);
row_major float4x4 ShadowProj : register(c28);
float4 ShadowProjData : register(c32);
float4 ShadowProjTransform : register(c33);
float4 WindMatrices[16];
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   ModelViewProj[0]       const_0        1
//   ModelViewProj[1]       const_1        1
//   ModelViewProj[2]       const_2        1
//   ModelViewProj[3]       const_3        1
//   LightDirection[0]      const_13       1
//   LightPosition[0]       const_16       1
//   LightPosition[1]       const_17       1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
//   WindMatrices[0]        const_38      4
//   WindMatrices[1]        const_39      4
//   WindMatrices[2]        const_40      4
//   WindMatrices[3]        const_41      4
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
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_6 : TEXCOORD6;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float3 lit2;
    float2 m27;
    float1 q0;
    float1 q1;
    float4 q6;
    float4 r0;

    m27.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), IN.position.xyzw);
    q1.x = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    q0.x = IN.blendindices.y;
    q6.xyzw = mul(float4x4(WindMatrices[0 + q0.x].xyzw, WindMatrices[1 + q0.x].xyzw, WindMatrices[2 + q0.x].xyzw, WindMatrices[3 + q0.x].xyzw), IN.position.xyzw);
    r0.xyzw = (IN.blendindices.x * (q6.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    OUT.position.xyzw = mul(ModelViewProj, r0.xyzw);
    lit2.xyz = LightPosition[1].xyz - r0.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));
    OUT.texcoord_2.xyz = mul(TanSpaceProj, normalize(lit2.xyz));
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_4.xyz = compress(lit2.xyz / LightPosition[1].w);	// [-1,+1] to [0,1]
    OUT.texcoord_6.xy = ((q1.x * ShadowProjTransform.xy) + m27.xy) / (q1.x * ShadowProjTransform.w);
    OUT.texcoord_6.zw = ((m27.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);

    return OUT;
};

// approximately 43 instruction slots used
