//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2006.vso /Fcshaderdump19/SLS2006.vso.dis
//
//
// Parameters:
//
float3 FogColor : register(c24);
float4 FogParam : register(c23);
float3 LightDirection[3] : register(c13);
row_major float4x4 ModelViewProj : register(c0);
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
//   FogParam       const_23      1
//   FogColor       const_24      1
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
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float3 mdl0;

    mdl0.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), IN.position.xyzw);
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.color_1.a = 1 - saturate((FogParam.x - length(mdl0.xyz)) / FogParam.y);
    OUT.color_1.rgb = FogColor.rgb;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = mdl0.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));

    return OUT;
};

// approximately 24 instruction slots used
