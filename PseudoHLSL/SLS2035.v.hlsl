//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2035.vso /Fcshaderdump19/SLS2035.vso.dis
//
//
// Parameters:
//
float4 EyePosition;
float4 LightPosition[3];
row_major float4x4 ModelViewProj;
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
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_5 : TEXCOORD5;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float3 lit1;
    float3 q2;

    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    lit1.xyz = LightPosition[0].xyz - IN.position.xyz;
    q2.xyz = normalize(lit1.xyz);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, q2.xyz));
    OUT.texcoord_3.xyz = mul(TanSpaceProj, normalize(normalize(EyePosition.xyz - IN.position.xyz) + q2.xyz));
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_5.xyz = compress(lit1.xyz / LightPosition[0].w);

    return OUT;
};

// approximately 30 instruction slots used