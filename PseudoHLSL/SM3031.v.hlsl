//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3031.vso /Fcshaderdump19/SM3031.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c31);
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
//   Bones[0]             const_31      18
//   Bones[1]             const_32      18
//   Bones[2]             const_33      18
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
    float4 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0};

    float4 offset;
    float4 q0;
    float3 q4;
    float3 q5;
    float3 q6;
    float3 q7;
    float3 q8;
    float4 r0;

    offset.xyzw = 765.01001 * IN.blendindices.zyxw;
    r0.w = 1;
    OUT.color_0.rgba = 1;
    q0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q8.xyz = mul(float3x4(Bones[0 + offset.w].xyzw, Bones[1 + offset.w].xyzw, Bones[2 + offset.w].xyzw), q0.xyzw);
    q6.xyz = mul(float3x4(Bones[0 + offset.z].xyzw, Bones[1 + offset.z].xyzw, Bones[2 + offset.z].xyzw), q0.xyzw);
    q5.xyz = mul(float3x4(Bones[0 + offset.x].xyzw, Bones[1 + offset.x].xyzw, Bones[2 + offset.x].xyzw), q0.xyzw);
    q4.xyz = mul(float3x4(Bones[0 + offset.y].xyzw, Bones[1 + offset.y].xyzw, Bones[2 + offset.y].xyzw), q0.xyzw);
    q7.xyz = (IN.blendweight.z * q6.xyz) + ((IN.blendweight.x * q5.xyz) + (q4.xyz * IN.blendweight.y));
    r0.xyz = ((1 - weight(IN.blendweight.xyz)) * q8.xyz) + q7.xyz;
    OUT.position.xyzw = mul(SkinModelViewProj, r0.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 30 instruction slots used
