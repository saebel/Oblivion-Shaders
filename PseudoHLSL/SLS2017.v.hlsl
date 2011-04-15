//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2017.vso /Fcshaderdump19/SLS2017.vso.dis
//
//
// Parameters:
//
float4 EyePosition;
float3 FogColor;
float4 FogParam;
float3 LightDirection[3];
float4 LightPosition[3];
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
//   LightPosition[0]       const_16       1
//   LightPosition[1]       const_17       1
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
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float3 eye0;
    float3 lit3;
    float2 m35;
    float3 mdl24;
    float1 q5;

    mdl24.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), IN.position.xyzw);
    m35.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), IN.position.xyzw);
    q5.x = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    lit3.xyz = LightPosition[1].xyz - IN.position.xyz;
    OUT.color_0.rgba = IN.color_0.rgba;
    eye0.xyz = EyePosition.xyz - IN.position.xyz;
    OUT.color_1.a = 1 - saturate((FogParam.x - length(mdl24.xyz)) / FogParam.y);
    OUT.color_1.rgb = FogColor.rgb;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = mdl24.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));
    OUT.texcoord_2.xyz = mul(TanSpaceProj, normalize(lit3.xyz));
    OUT.texcoord_3.xyz = normalize(mul(TanSpaceProj, normalize(normalize(eye0.xyz) + LightDirection[0].xyz)));
    OUT.texcoord_4.xyz = mul(TanSpaceProj, normalize(normalize(eye0.xyz) + normalize(lit3.xyz)));
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_5.xyz = compress(lit3.xyz / LightPosition[1].w);	// [-1,+1] to [0,1]
    OUT.texcoord_7.xy = ((q5.x * ShadowProjTransform.xy) + m35.xy) / (q5.x * ShadowProjTransform.w);
    OUT.texcoord_7.zw = ((m35.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);

    return OUT;
};

// approximately 65 instruction slots used
