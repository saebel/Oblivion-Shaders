//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2044.vso /Fcshaderdump19/SLS2044.vso.dis
//
//
// Parameters:
//
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
//   LightPosition[1] const_17       1
//   LightPosition[2] const_18       1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
    float4 texcoord_4 : TEXCOORD4;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = IN.color_0.rgb;
    OUT.texcoord_2.w = LightPosition[0].w;
    OUT.texcoord_2.xyz = mul(TanSpaceProj, LightPosition[0].xyz - IN.position.xyz);
    OUT.texcoord_3.w = LightPosition[1].w;
    OUT.texcoord_3.xyz = mul(TanSpaceProj, LightPosition[1].xyz - IN.position.xyz);
    OUT.texcoord_4.w = LightPosition[2].w;
    OUT.texcoord_4.xyz = mul(TanSpaceProj, LightPosition[2].xyz - IN.position.xyz);

    return OUT;
};

// approximately 21 instruction slots used
