//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3002.vso /Fcshaderdump19/SM3002.vso.dis
//
//
// Parameters:
//
float4 FogColor;
float4 FogParam;
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
//   FogParam      const_15      1
//   FogColor      const_16      1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float3 mdl3;
    float1 q0;

    mdl3.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), IN.position.xyzw);
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = mdl3.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_3.xyz = IN.tangent.xyz;
    OUT.texcoord_4.xyz = IN.binormal.xyz;
    OUT.texcoord_5.xyz = IN.normal.xyz;
    OUT.texcoord_6.xyz = IN.position.xyz;
    q0.x = 1 - saturate((FogParam.x - length(mdl3.xyz)) / FogParam.y);
    OUT.texcoord_7.xyz = FogColor.rgb;
    OUT.texcoord_7.w = q0.x * FogParam.z;

    return OUT;
};

// approximately 20 instruction slots used
