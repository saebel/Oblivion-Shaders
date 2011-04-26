//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2007.vso /Fcshaderdump19/STB2007.vso.dis
//
//
// Parameters:
//
float3 FogColor : register(c24);
float4 FogParam : register(c23);
float3 LightDirection[3];
float4 LightPosition[3];
row_major float4x4 ModelViewProj;
row_major float4x4 ShadowProj;
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
//   FogParam            const_23      1
//   FogColor            const_24      1
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
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    const float4 const_4 = {0.5, 1, 0, 0};

    float3 lit1;
    float2 m29;
    float3 mdl18;
    float1 q0;
    float4 q5;
    float1 q9;
    float4 r0;

    q0.x = IN.blendindices.y;
    q5.xyzw = mul(float4x4(WindMatrices[0 + q0.x].xyzw, WindMatrices[1 + q0.x].xyzw, WindMatrices[2 + q0.x].xyzw, WindMatrices[3 + q0.x].xyzw), IN.position.xyzw);
    OUT.color_0.rgba = (IN.blendindices.z * const_4.yyyz) + const_4.zzzy;
    r0.xyzw = (IN.blendindices.x * (q5.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    mdl18.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), r0.xyzw);
    m29.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), r0.xyzw);
    q9.x = dot(ShadowProj[3].xyzw, r0.xyzw);
    lit1.xyz = LightPosition[1].xyz - r0.xyz;
    OUT.color_1.rgb = FogColor.rgb;
    OUT.color_1.a = 1 - saturate((FogParam.x - length(mdl18.xyz)) / FogParam.y);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl18.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));
    OUT.texcoord_2.xyz = mul(TanSpaceProj, normalize(lit1.xyz));
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_4.xyz = compress(lit1.xyz / LightPosition[1].w);	// [-1,+1] to [0,1]
    OUT.texcoord_7.xy = ((q9.x * ShadowProjTransform.xy) + m29.xy) / (q9.x * ShadowProjTransform.w);
    OUT.texcoord_7.zw = ((m29.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);

    return OUT;
};

// approximately 55 instruction slots used
