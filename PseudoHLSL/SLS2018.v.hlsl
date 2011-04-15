//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2018.vso /Fcshaderdump19/SLS2018.vso.dis
//
//
// Parameters:
//
float4 Bones[54];
float4 EyePosition;
float3 FogColor;
float4 FogParam;
float3 LightDirection[3];
float4 LightPosition[3];
row_major float4x4 ShadowProj;
float4 ShadowProjData;
float4 ShadowProjTransform;
row_major float4x4 SkinModelViewProj;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   SkinModelViewProj[0]   const_1        1
//   SkinModelViewProj[1]   const_2        1
//   SkinModelViewProj[2]   const_3        1
//   SkinModelViewProj[3]   const_4        1
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
//   Bones[0]               const_42      18
//   Bones[1]               const_43      18
//   Bones[2]               const_44      18
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
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
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float3 eye2;
    float3 lit5;
    float2 m119;
    float3 m56;
    float3 mdl54;
    float4 offset;
    float1 q0;
    float4 q1;
    float3 q13;
    float1 q19;
    float3 q32;
    float3 q33;
    float3 q34;
    float3 q35;
    float3 q36;
    float3 q37;
    float3 q38;
    float3 q39;
    float3 q40;
    float3 q41;
    float3 q42;
    float3 q43;
    float3 q44;
    float3 q45;
    float3 q46;
    float3 q47;
    float3 q48;
    float3 q49;
    float3 q50;
    float3 q51;
    float3 q52;
    float3 q53;
    float3 q61;
    float4 r0;

    OUT.color_0.rgba = IN.color_0.rgba;
    offset.xyzw = IN.blendindices.zyxw * 765.01001;
    q41.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.tangent.xyz);
    q39.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.tangent.xyz);
    q38.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.tangent.xyz);
    q37.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.tangent.xyz);
    q53.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.normal.xyz);
    q51.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.normal.xyz);
    q50.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.normal.xyz);
    q49.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.normal.xyz);
    q47.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.binormal.xyz);
    q45.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.binormal.xyz);
    q44.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.binormal.xyz);
    q43.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.binormal.xyz);
    q0.x = 1 - weight(IN.blendweight.xyz);
    r0.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q36.xyz = mul(float3x4(Bones[0 + offset.w].xyzw, Bones[1 + offset.w].xyzw, Bones[2 + offset.w].xyzw), q1.xyzw);
    q34.xyz = mul(float3x4(Bones[0 + offset.z].xyzw, Bones[1 + offset.z].xyzw, Bones[2 + offset.z].xyzw), q1.xyzw);
    q33.xyz = mul(float3x4(Bones[0 + offset.x].xyzw, Bones[1 + offset.x].xyzw, Bones[2 + offset.x].xyzw), q1.xyzw);
    q32.xyz = mul(float3x4(Bones[0 + offset.y].xyzw, Bones[1 + offset.y].xyzw, Bones[2 + offset.y].xyzw), q1.xyzw);
    q52.xyz = (IN.blendweight.z * q51.xyz) + ((IN.blendweight.x * q50.xyz) + (q49.xyz * IN.blendweight.y));
    q13.xyz = normalize((q0.x * q53.xyz) + q52.xyz);
    q46.xyz = (IN.blendweight.z * q45.xyz) + ((IN.blendweight.x * q44.xyz) + (q43.xyz * IN.blendweight.y));
    q48.xyz = normalize((q0.x * q47.xyz) + q46.xyz);
    q40.xyz = (IN.blendweight.z * q39.xyz) + ((IN.blendweight.x * q38.xyz) + (q37.xyz * IN.blendweight.y));
    q42.xyz = normalize((q0.x * q41.xyz) + q40.xyz);
    m56.xyz = mul(float3x3(q42.xyz, q48.xyz, q13.xyz), LightDirection[0].xyz);
    q35.xyz = (IN.blendweight.z * q34.xyz) + ((IN.blendweight.x * q33.xyz) + (q32.xyz * IN.blendweight.y));
    r0.xyz = (q0.x * q36.xyz) + q35.xyz;
    mdl54.xyz = mul(float3x4(SkinModelViewProj[0].xyzw, SkinModelViewProj[1].xyzw, SkinModelViewProj[2].xyzw), r0.xyzw);
    m119.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), r0.xyzw);
    q19.x = dot(ShadowProj[3].xyzw, r0.xyzw);
    lit5.xyz = LightPosition[1].xyz - r0.xyz;
    OUT.color_1.rgb = FogColor.rgb;
    eye2.xyz = EyePosition.xyz - r0.xyz;
    q61.xyz = mul(float3x3(q42.xyz, q48.xyz, q13.xyz), normalize(normalize(eye2.xyz) + LightDirection[0].xyz));
    OUT.color_1.a = 1 - saturate((FogParam.x - length(mdl54.xyz)) / FogParam.y);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl54.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(m56.xyz);
    OUT.texcoord_2.xyz = mul(float3x3(q42.xyz, q48.xyz, q13.xyz), normalize(lit5.xyz));
    OUT.texcoord_3.xyz = normalize(q61.xyz);
    OUT.texcoord_4.xyz = mul(float3x3(q42.xyz, q48.xyz, q13.xyz), normalize(normalize(eye2.xyz) + normalize(lit5.xyz)));
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_5.xyz = compress(lit5.xyz / LightPosition[1].w);	// [-1,+1] to [0,1]
    OUT.texcoord_7.xy = ((q19.x * ShadowProjTransform.xy) + m119.xy) / (q19.x * ShadowProjTransform.w);
    OUT.texcoord_7.zw = ((m119.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);

    return OUT;
};

// approximately 146 instruction slots used
