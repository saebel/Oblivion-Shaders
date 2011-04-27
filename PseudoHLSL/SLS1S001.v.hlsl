//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S001.vso /Fcshaderdump19/SLS1S001.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c42);
float3 FogColor : register(c24);
float4 FogParam : register(c23);
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
//   FogParam          const_23      1
//   FogColor          const_24      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 position : POSITION;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0};

    float3 mdl11;
    float4 q0;
    float3 q10;
    float3 q16;
    float3 q20;
    float3 q8;
    float3 q9;
    float4 r0;

    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    q0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q16.xyz = mul(float3x4(Bones[0 + r0.w].xyzw, Bones[1 + r0.w].xyzw, Bones[2 + r0.w].xyzw), q0.xyzw);
    q20.xyz = mul(float3x4(Bones[0 + r0.x].xyzw, Bones[1 + r0.x].xyzw, Bones[2 + r0.x].xyzw), q0.xyzw);
    q9.xyz = mul(float3x4(Bones[0 + r0.z].xyzw, Bones[1 + r0.z].xyzw, Bones[2 + r0.z].xyzw), q0.xyzw);
    q8.xyz = mul(float3x4(Bones[0 + r0.y].xyzw, Bones[1 + r0.y].xyzw, Bones[2 + r0.y].xyzw), q0.xyzw);
    r0.w = 1;
    q10.xyz = (IN.blendweight.z * q9.xyz) + ((IN.blendweight.x * q20.xyz) + (q8.xyz * IN.blendweight.y));
    r0.xyz = ((1 - weight(IN.blendweight.xyz)) * q16.xyz) + q10.xyz;
    mdl11.xyz = mul(float3x4(SkinModelViewProj[0].xyzw, SkinModelViewProj[1].xyzw, SkinModelViewProj[2].xyzw), r0.xyzw);
    OUT.color_0.rgb = FogColor.rgb;
    OUT.color_0.a = 1 - saturate((FogParam.x - length(mdl11.xyz)) / FogParam.y);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl11.xyz;

    return OUT;
};

// approximately 40 instruction slots used
