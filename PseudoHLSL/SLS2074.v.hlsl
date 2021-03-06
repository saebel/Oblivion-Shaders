//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2074.vso /Fcshaderdump19/SLS2074.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c42);
float4 FogParam : register(c23);
float4 LightPosition[3] : register(c16);
row_major float4x4 ObjToCubeSpace : register(c8);
row_major float4x4 SkinModelViewProj : register(c1);
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
//   ObjToCubeSpace[0]    const_8        1
//   ObjToCubeSpace[1]    const_9        1
//   ObjToCubeSpace[2]    const_10        1
//   ObjToCubeSpace[3]    const_11        1
//   LightPosition[0]     const_16       1
//   FogParam          const_23      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
    float3 texcoord_6 : TEXCOORD6;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0};

    float3 mdl9;
    float4 offset;
    float4 q0;
    float3 q4;
    float3 q5;
    float3 q6;
    float3 q7;
    float3 q8;
    float4 r0;

    offset.xyzw = IN.blendindices.zyxw * 765.01001;
    r0.w = 1;
    q0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q8.xyz = mul(float3x4(Bones[0 + offset.w].xyzw, Bones[1 + offset.w].xyzw, Bones[2 + offset.w].xyzw), q0.xyzw);
    q6.xyz = mul(float3x4(Bones[0 + offset.z].xyzw, Bones[1 + offset.z].xyzw, Bones[2 + offset.z].xyzw), q0.xyzw);
    q5.xyz = mul(float3x4(Bones[0 + offset.x].xyzw, Bones[1 + offset.x].xyzw, Bones[2 + offset.x].xyzw), q0.xyzw);
    q4.xyz = mul(float3x4(Bones[0 + offset.y].xyzw, Bones[1 + offset.y].xyzw, Bones[2 + offset.y].xyzw), q0.xyzw);
    q7.xyz = (IN.blendweight.z * q6.xyz) + ((IN.blendweight.x * q5.xyz) + (q4.xyz * IN.blendweight.y));
    r0.xyz = ((1 - weight(IN.blendweight.xyz)) * q8.xyz) + q7.xyz;
    mdl9.xyz = mul(float3x4(SkinModelViewProj[0].xyzw, SkinModelViewProj[1].xyzw, SkinModelViewProj[2].xyzw), r0.xyzw);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl9.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyzw = mul(ObjToCubeSpace, r0.xyzw);
    OUT.texcoord_2.xyzw = LightPosition[0].xyzw;
    OUT.texcoord_3.w = 1 - saturate((FogParam.x - length(mdl9.xyz)) / FogParam.y);
    OUT.texcoord_3.xyz = 0;
    OUT.texcoord_6.xyz = r0.xyz;

    return OUT;
};

// approximately 46 instruction slots used
