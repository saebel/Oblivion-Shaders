//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2032.vso /Fcshaderdump19/PAR2032.vso.dis
//
//
// Parameters:
//
float4 EyePosition : register(c25);
float3 LightDirection[3] : register(c13);
row_major float4x4 ModelViewProj : register(c0);
row_major float4x4 ShadowProj : register(c28);
float4 ShadowProjData : register(c32);
float4 ShadowProjTransform : register(c33);
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
//   EyePosition         const_25      1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
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
    float4 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float3 eye0;
    float2 m24;
    float1 q4;

    m24.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), IN.position.xyzw);
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    q4.x = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));
    eye0.xyz = EyePosition.xyz - IN.position.xyz;
    OUT.texcoord_3.xyz = mul(TanSpaceProj, normalize(normalize(eye0.xyz) + LightDirection[0].xyz));
    OUT.texcoord_6.xy = ((q4.x * ShadowProjTransform.xy) + m24.xy) / (q4.x * ShadowProjTransform.w);
    OUT.texcoord_6.zw = ((m24.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);
    OUT.texcoord_7.xyz = normalize(mul(TanSpaceProj, normalize(eye0.xyz)));

    return OUT;
};

// approximately 40 instruction slots used
