//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S017.vso /Fcshaderdump19/SLS1S017.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c42);
float4 EyePosition : register(c25);
row_major float4x4 SkinModelViewProj : register(c1);
row_major float4x4 SkinToCubeSpace : register(c9);
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
//   SkinToCubeSpace[0]   const_9        1
//   SkinToCubeSpace[1]   const_10        1
//   SkinToCubeSpace[2]   const_11        1
//   EyePosition       const_25      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
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
    float3 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0.1};

    float4 q1;
    float1 q13;
    float1 q14;
    float1 q15;
    float3 q16;
    float3 q17;
    float1 q2;
    float1 q23;
    float1 q24;
    float3 q36;
    float3 q37;
    float3 q38;
    float3 q39;
    float3 q40;
    float3 q42;
    float3 q43;
    float3 q44;
    float3 q45;
    float3 q46;
    float3 q47;
    float3 q48;
    float1 q5;
    float3 q50;
    float3 q51;
    float3 q52;
    float3 q53;
    float3 q54;
    float3 q58;
    float3 q59;
    float3 q60;
    float3 q61;
    float3 q62;
    float1 q9;
    float4 r0;
    float4 r1;

    OUT.color_0.rgb = IN.color_0.rgb;
    r1.xyzw = IN.blendindices.zyxw * 765.01001;
    q9.x = r1.w;
    q5.x = r1.w;
    q44.xyz = mul(float3x3(Bones[0 + r1.z].xyz, Bones[1 + r1.z].xyz, Bones[2 + r1.z].xyz), IN.tangent.xyz);
    q43.xyz = mul(float3x3(Bones[0 + r1.x].xyz, Bones[1 + r1.x].xyz, Bones[2 + r1.x].xyz), IN.tangent.xyz);
    q42.xyz = mul(float3x3(Bones[0 + r1.y].xyz, Bones[1 + r1.y].xyz, Bones[2 + r1.y].xyz), IN.tangent.xyz);
    q52.xyz = mul(float3x3(Bones[0 + r1.z].xyz, Bones[1 + r1.z].xyz, Bones[2 + r1.z].xyz), IN.binormal.xyz);
    q51.xyz = mul(float3x3(Bones[0 + r1.x].xyz, Bones[1 + r1.x].xyz, Bones[2 + r1.x].xyz), IN.binormal.xyz);
    q50.xyz = mul(float3x3(Bones[0 + r1.y].xyz, Bones[1 + r1.y].xyz, Bones[2 + r1.y].xyz), IN.binormal.xyz);
    q46.xyz = mul(float3x3(Bones[0 + q9.x].xyz, Bones[1 + q9.x].xyz, Bones[2 + q9.x].xyz), IN.tangent.xyz);
    q2.x = 1 - weight(IN.blendweight.xyz);
    r0.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q24.x = r1.w;
    q23.x = r1.z;
    q13.x = r1.w;
    q15.x = r1.x;
    q14.x = r1.y;
    q38.xyz = mul(float3x4(Bones[0 + r1.z].xyzw, Bones[1 + r1.z].xyzw, Bones[2 + r1.z].xyzw), q1.xyzw);
    q37.xyz = mul(float3x4(Bones[0 + r1.x].xyzw, Bones[1 + r1.x].xyzw, Bones[2 + r1.x].xyzw), q1.xyzw);
    q36.xyz = mul(float3x4(Bones[0 + r1.y].xyzw, Bones[1 + r1.y].xyzw, Bones[2 + r1.y].xyzw), q1.xyzw);
    q40.xyz = mul(float3x4(Bones[0 + q5.x].xyzw, Bones[1 + q5.x].xyzw, Bones[2 + q5.x].xyzw), q1.xyzw);
    q62.xyz = mul(float3x3(Bones[0 + q24.x].xyz, Bones[1 + q24.x].xyz, Bones[2 + q24.x].xyz), IN.normal.xyz);
    q58.xyz = mul(float3x3(Bones[0 + q23.x].xyz, Bones[1 + q23.x].xyz, Bones[2 + q23.x].xyz), IN.normal.xyz);
    q60.xyz = mul(float3x3(Bones[0 + q15.x].xyz, Bones[1 + q15.x].xyz, Bones[2 + q15.x].xyz), IN.normal.xyz);
    q59.xyz = mul(float3x3(Bones[0 + q14.x].xyz, Bones[1 + q14.x].xyz, Bones[2 + q14.x].xyz), IN.normal.xyz);
    q54.xyz = mul(float3x3(Bones[0 + q13.x].xyz, Bones[1 + q13.x].xyz, Bones[2 + q13.x].xyz), IN.binormal.xyz);
    q61.xyz = (IN.blendweight.z * q58.xyz) + ((IN.blendweight.x * q60.xyz) + (q59.xyz * IN.blendweight.y));
    q17.xyz = normalize((q2.x * q62.xyz) + q61.xyz);
    q53.xyz = (IN.blendweight.z * q52.xyz) + ((IN.blendweight.x * q51.xyz) + (q50.xyz * IN.blendweight.y));
    q16.xyz = normalize((q2.x * q54.xyz) + q53.xyz) * 0.1;
    q45.xyz = (IN.blendweight.z * q44.xyz) + ((IN.blendweight.x * q43.xyz) + (q42.xyz * IN.blendweight.y));
    q47.xyz = normalize((q2.x * q46.xyz) + q45.xyz) * 0.1;
    q39.xyz = (IN.blendweight.z * q38.xyz) + ((IN.blendweight.x * q37.xyz) + (q36.xyz * IN.blendweight.y));
    r0.xyz = (q2.x * q40.xyz) + q39.xyz;
    q48.xyz = mul(float3x4(SkinToCubeSpace[0].xyzw, SkinToCubeSpace[1].xyzw, SkinToCubeSpace[2].xyzw), r0.xyzw);
    OUT.position.xyzw = mul(SkinModelViewProj, r0.xyzw);
    r0.xyz = normalize(EyePosition.xyz - q48.xyz);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.w = r0.x;
    OUT.texcoord_1.xyz = mul(float3x3(q47.xyz, q16.xyz, q17.xyz), SkinToCubeSpace[0].xyz);
    OUT.texcoord_2.w = r0.y;
    OUT.texcoord_2.xyz = mul(float3x3(q47.xyz, q16.xyz, q17.xyz), SkinToCubeSpace[1].xyz);
    OUT.texcoord_3.w = r0.z;
    OUT.texcoord_3.xyz = mul(float3x3(q47.xyz, q16.xyz, q17.xyz), SkinToCubeSpace[2].xyz);

    return OUT;
};

// approximately 121 instruction slots used
