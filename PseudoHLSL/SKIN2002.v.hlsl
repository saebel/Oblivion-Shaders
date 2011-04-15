//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2002.vso /Fcshaderdump19/SKIN2002.vso.dis
//
//
// Parameters:
//
float4 EyePosition;
float3 FogColor;
float4 FogParam;
float3 LightDirection[3];
row_major float4x4 ModelViewProj;
row_major float4x4 ShadowProj;
float4 ShadowProjData;
float4 ShadowProjTransform;
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
//   FogParam            const_23      1
//   FogColor            const_24      1
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
    float4 color_0 : COLOR0;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float2 m14;
    float3 mdl9;
    float1 q0;

    mdl9.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), IN.position.xyzw);
    m14.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), IN.position.xyzw);
    q0.x = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.color_1.a = 1 - saturate((FogParam.x - length(mdl9.xyz)) / FogParam.y);
    OUT.color_1.rgb = FogColor.rgb;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = mdl9.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));
    OUT.texcoord_6.xyz = normalize(mul(TanSpaceProj, normalize(EyePosition.xyz - IN.position.xyz)));
    OUT.texcoord_7.xy = ((q0.x * ShadowProjTransform.xy) + m14.xy) / (q0.x * ShadowProjTransform.w);
    OUT.texcoord_7.zw = ((m14.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);

    return OUT;
};

// approximately 45 instruction slots used
