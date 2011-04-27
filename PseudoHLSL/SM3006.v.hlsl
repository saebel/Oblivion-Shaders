//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3006.vso /Fcshaderdump19/SM3006.vso.dis
//
//
// Parameters:
//
float4 FogColor : register(c16);
float4 FogParam : register(c15);
row_major float4x4 ModelViewProj : register(c0);
row_major float4x4 ShadowProj : register(c21);
float4 ShadowProjData : register(c25);
float4 ShadowProjTransform : register(c26);
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
//   FogParam            const_15      1
//   FogColor            const_16      1
//   ShadowProj[0]          const_21       1
//   ShadowProj[1]          const_22       1
//   ShadowProj[2]          const_23       1
//   ShadowProj[3]          const_24       1
//   ShadowProjData      const_25      1
//   ShadowProjTransform const_26      1
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
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float2 m9;
    float3 mdl4;
    float1 q0;
    float3 r0;

    mdl4.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), IN.position.xyzw);
    m9.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), IN.position.xyzw);
    r0.xyz = dot(ShadowProj[3].xyzw, IN.position.xyzw) * ShadowProjTransform.xyw;
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = mdl4.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    q0.x = 1 - saturate((FogParam.x - length(mdl4.xyz)) / FogParam.y);
    OUT.texcoord_1.xy = (r0.xy + m9.xy) / r0.z;
    OUT.texcoord_1.zw = ((m9.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);
    OUT.texcoord_3.xyz = IN.tangent.xyz;
    OUT.texcoord_4.xyz = IN.binormal.xyz;
    OUT.texcoord_5.xyz = IN.normal.xyz;
    OUT.texcoord_6.xyz = IN.position.xyz;
    OUT.texcoord_7.w = q0.x * FogParam.z;
    OUT.texcoord_7.xyz = FogColor.rgb;

    return OUT;
};

// approximately 31 instruction slots used
