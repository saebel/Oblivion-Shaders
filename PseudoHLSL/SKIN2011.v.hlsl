//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2011.vso /Fcshaderdump19/SKIN2011.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c42);
float4 EyePosition : register(c25);
float3 LightDirection[3] : register(c13);
float4 LightPosition[3] : register(c16);
row_major float4x4 ShadowProj : register(c28);
float4 ShadowProjData : register(c32);
float4 ShadowProjTransform : register(c33);
row_major float4x4 SkinModelViewProj : register(c1);
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
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float3 eye121;
    float3 lit3;
    float2 m147;
    float4 offset;
    float1 q0;
    float4 q1;
    float1 q122;
    float3 q14;
    float3 q19;
    float3 q20;
    float3 q21;
    float3 q22;
    float3 q23;
    float3 q24;
    float3 q25;
    float3 q26;
    float3 q27;
    float3 q28;
    float3 q29;
    float3 q30;
    float3 q31;
    float3 q32;
    float3 q33;
    float3 q34;
    float3 q35;
    float3 q36;
    float3 q37;
    float3 q38;
    float3 q40;
    float3 q41;
    float4 r0;
    float3 r3;

    offset.xyzw = IN.blendindices.zyxw * 765.01001;
    q28.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.tangent.xyz);
    q26.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.tangent.xyz);
    q25.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.tangent.xyz);
    q24.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.tangent.xyz);
    q38.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.normal.xyz);
    q36.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.normal.xyz);
    q35.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.normal.xyz);
    q34.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.normal.xyz);
    q40.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.binormal.xyz);
    q32.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.binormal.xyz);
    q31.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.binormal.xyz);
    q30.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.binormal.xyz);
    q0.x = 1 - weight(IN.blendweight.xyz);
    r0.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q23.xyz = mul(float3x4(Bones[0 + offset.w].xyzw, Bones[1 + offset.w].xyzw, Bones[2 + offset.w].xyzw), q1.xyzw);
    q21.xyz = mul(float3x4(Bones[0 + offset.z].xyzw, Bones[1 + offset.z].xyzw, Bones[2 + offset.z].xyzw), q1.xyzw);
    q20.xyz = mul(float3x4(Bones[0 + offset.x].xyzw, Bones[1 + offset.x].xyzw, Bones[2 + offset.x].xyzw), q1.xyzw);
    q19.xyz = mul(float3x4(Bones[0 + offset.y].xyzw, Bones[1 + offset.y].xyzw, Bones[2 + offset.y].xyzw), q1.xyzw);
    q37.xyz = (IN.blendweight.z * q36.xyz) + ((IN.blendweight.x * q35.xyz) + (q34.xyz * IN.blendweight.y));
    q14.xyz = normalize((q0.x * q38.xyz) + q37.xyz);
    r3.z = dot(q14.xyz, LightDirection[0].xyz);
    q33.xyz = (IN.blendweight.z * q32.xyz) + ((IN.blendweight.x * q31.xyz) + (q30.xyz * IN.blendweight.y));
    q41.xyz = normalize((q0.x * q40.xyz) + q33.xyz);
    r3.y = dot(q41.xyz, LightDirection[0].xyz);
    q27.xyz = (IN.blendweight.z * q26.xyz) + ((IN.blendweight.x * q25.xyz) + (q24.xyz * IN.blendweight.y));
    q29.xyz = normalize((q0.x * q28.xyz) + q27.xyz);
    r3.x = dot(q29.xyz, LightDirection[0].xyz);
    q22.xyz = (IN.blendweight.z * q21.xyz) + ((IN.blendweight.x * q20.xyz) + (q19.xyz * IN.blendweight.y));
    r0.xyz = (q0.x * q23.xyz) + q22.xyz;
    eye121.xyz = mul(float3x3(q29.xyz, q41.xyz, q14.xyz), normalize(EyePosition.xyz - r0.xyz));
    m147.xy = mul(float2x4(ShadowProj[0].xyzw, ShadowProj[1].xyzw), r0.xyzw);
    OUT.position.xyzw = mul(SkinModelViewProj, r0.xyzw);
    q122.x = dot(ShadowProj[3].xyzw, r0.xyzw);
    lit3.xyz = LightPosition[1].xyz - r0.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(r3.xyz);
    OUT.texcoord_2.xyz = mul(float3x3(q29.xyz, q41.xyz, q14.xyz), normalize(lit3.xyz));
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_4.xyz = compress(lit3.xyz / LightPosition[1].w);	// [-1,+1] to [0,1]
    OUT.texcoord_6.xy = ((q122.x * ShadowProjTransform.xy) + m147.xy) / (q122.x * ShadowProjTransform.w);
    OUT.texcoord_6.zw = ((m147.xy - ShadowProjData.xy) / ShadowProjData.w) * float2(1, -1) + float2(0, 1);
    OUT.texcoord_7.xyz = normalize(eye121.xyz);

    return OUT;
};

// approximately 124 instruction slots used
