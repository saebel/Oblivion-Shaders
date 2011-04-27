//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3011.vso /Fcshaderdump19/SM3011.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c31);
float3 EyePosition : register(c14);
row_major float4x4 SkinModelViewProj : register(c1);
row_major float4x4 SkinToCubeSpace : register(c27);
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_1        1
//   SkinModelViewProj[1] const_2        1
//   SkinModelViewProj[2] const_3        1
//   SkinModelViewProj[3] const_4        1
//   EyePosition       const_14      1
//   SkinToCubeSpace[0]   const_27       1
//   SkinToCubeSpace[1]   const_28       1
//   SkinToCubeSpace[2]   const_29       1
//   Bones[0]             const_31      18
//   Bones[1]             const_32      18
//   Bones[2]             const_33      18
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float3 normal : NORMAL;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float4 color_0 : COLOR0;
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
    float3 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0};

    float4 offset;
    float1 q0;
    float4 q1;
    float3 q10;
    float3 q11;
    float3 q12;
    float3 q13;
    float3 q14;
    float3 q15;
    float3 q16;
    float3 q17;
    float3 q18;
    float3 q19;
    float3 q2;
    float3 q20;
    float3 q21;
    float3 q22;
    float3 q23;
    float3 q24;
    float3 q26;
    float3 q27;
    float3 q28;
    float3 q29;
    float3 q30;
    float3 q31;
    float3 q32;
    float3 q9;
    float4 r0;

    OUT.color_0.rgb = IN.color_0.rgb;
    offset.xyzw = 765.01001 * IN.blendindices.zyxw;
    q24.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.binormal.xyz);
    q22.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.binormal.xyz);
    q21.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.binormal.xyz);
    q20.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.binormal.xyz);
    q0.x = 1 - weight(IN.blendweight.xyz);
    r0.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q13.xyz = mul(float3x4(Bones[0 + offset.w].xyzw, Bones[1 + offset.w].xyzw, Bones[2 + offset.w].xyzw), q1.xyzw);
    q9.xyz = mul(float3x4(Bones[0 + offset.y].xyzw, Bones[1 + offset.y].xyzw, Bones[2 + offset.y].xyzw), q1.xyzw);
    q11.xyz = mul(float3x4(Bones[0 + offset.z].xyzw, Bones[1 + offset.z].xyzw, Bones[2 + offset.z].xyzw), q1.xyzw);
    q10.xyz = mul(float3x4(Bones[0 + offset.x].xyzw, Bones[1 + offset.x].xyzw, Bones[2 + offset.x].xyzw), q1.xyzw);
    q18.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.tangent.xyz);
    q16.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.tangent.xyz);
    q15.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.tangent.xyz);
    q14.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.tangent.xyz);
    q23.xyz = (IN.blendweight.z * q22.xyz) + ((IN.blendweight.x * q21.xyz) + (q20.xyz * IN.blendweight.y));
    q2.xyz = normalize((q0.x * q24.xyz) + q23.xyz);
    q30.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.normal.xyz);
    q28.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.normal.xyz);
    q27.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.normal.xyz);
    q26.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.normal.xyz);
    q29.xyz = (IN.blendweight.z * q28.xyz) + ((IN.blendweight.x * q27.xyz) + (q26.xyz * IN.blendweight.y));
    q31.xyz = normalize((q0.x * q30.xyz) + q29.xyz);
    q17.xyz = (IN.blendweight.z * q16.xyz) + ((IN.blendweight.x * q15.xyz) + (q14.xyz * IN.blendweight.y));
    q19.xyz = normalize((q0.x * q18.xyz) + q17.xyz);
    q12.xyz = (IN.blendweight.z * q11.xyz) + ((IN.blendweight.x * q10.xyz) + (q9.xyz * IN.blendweight.y));
    r0.xyz = (q0.x * q13.xyz) + q12.xyz;
    q32.xyz = mul(float3x4(SkinToCubeSpace[0].xyzw, SkinToCubeSpace[1].xyzw, SkinToCubeSpace[2].xyzw), r0.xyzw);
    OUT.position.xyzw = mul(SkinModelViewProj, r0.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    r0.xyz = EyePosition.xyz - q32.xyz;
    OUT.texcoord_1.xyz = mul(float3x3(q19.xyz, q2.xyz, q31.xyz), SkinToCubeSpace[0].xyz);
    OUT.texcoord_1.w = r0.x;
    OUT.texcoord_2.w = r0.y;
    OUT.texcoord_2.xyz = mul(float3x3(q19.xyz, q2.xyz, q31.xyz), SkinToCubeSpace[1].xyz);
    OUT.texcoord_3.w = r0.z;
    OUT.texcoord_3.xyz = mul(float3x3(q19.xyz, q2.xyz, q31.xyz), SkinToCubeSpace[2].xyz);

    return OUT;
};

// approximately 103 instruction slots used
