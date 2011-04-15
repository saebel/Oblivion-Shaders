//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S009.vso /Fcshaderdump19/SLS1S009.vso.dis
//
//
// Parameters:
//
float4 Bones[54];
float4 EyePosition;
float3 LightDirection[3];
row_major float4x4 SkinModelViewProj;
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
//   LightDirection[0]    const_13       1
//   EyePosition       const_25      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
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
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float3 m62;
    float4 q1;
    float1 q10;
    float1 q12;
    float1 q15;
    float3 q18;
    float3 q182;
    float3 q19;
    float1 q2;
    float3 q20;
    float3 q40;
    float3 q41;
    float3 q42;
    float3 q43;
    float3 q44;
    float3 q48;
    float3 q49;
    float1 q5;
    float3 q50;
    float3 q51;
    float3 q52;
    float3 q53;
    float3 q54;
    float3 q55;
    float3 q56;
    float3 q57;
    float3 q59;
    float3 q61;
    float3 q63;
    float3 q64;
    float3 q81;
    float4 r0;
    float4 r1;

    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    q5.x = r0.w;
    q63.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.tangent.xyz);
    q64.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.tangent.xyz);
    q48.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.tangent.xyz);
    q53.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.binormal.xyz);
    q52.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.binormal.xyz);
    q2.x = 1 - weight(IN.blendweight.xyz);
    r1.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q15.x = r0.w;
    q10.x = r0.w;
    q12.x = r0.y;
    q42.xyz = mul(float3x4(Bones[0 + r0.z].xyzw, Bones[1 + r0.z].xyzw, Bones[2 + r0.z].xyzw), q1.xyzw);
    q41.xyz = mul(float3x4(Bones[0 + r0.x].xyzw, Bones[1 + r0.x].xyzw, Bones[2 + r0.x].xyzw), q1.xyzw);
    q40.xyz = mul(float3x4(Bones[0 + r0.y].xyzw, Bones[1 + r0.y].xyzw, Bones[2 + r0.y].xyzw), q1.xyzw);
    q44.xyz = mul(float3x4(Bones[0 + q5.x].xyzw, Bones[1 + q5.x].xyzw, Bones[2 + q5.x].xyzw), q1.xyzw);
    q57.xyz = mul(float3x3(Bones[0 + r0.w].xyz, Bones[1 + r0.w].xyz, Bones[2 + r0.w].xyz), IN.normal.xyz);
    q56.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.normal.xyz);
    q55.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.normal.xyz);
    q182.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.normal.xyz);
    q59.xyz = mul(float3x3(Bones[0 + q15.x].xyz, Bones[1 + q15.x].xyz, Bones[2 + q15.x].xyz), IN.binormal.xyz);
    q51.xyz = mul(float3x3(Bones[0 + q12.x].xyz, Bones[1 + q12.x].xyz, Bones[2 + q12.x].xyz), IN.binormal.xyz);
    q49.xyz = mul(float3x3(Bones[0 + q10.x].xyz, Bones[1 + q10.x].xyz, Bones[2 + q10.x].xyz), IN.tangent.xyz);
    q50.xyz = (IN.blendweight.z * q63.xyz) + ((IN.blendweight.x * q64.xyz) + (q48.xyz * IN.blendweight.y));
    q61.xyz = normalize((q2.x * q49.xyz) + q50.xyz);
    q54.xyz = (IN.blendweight.z * q53.xyz) + ((IN.blendweight.x * q52.xyz) + (q51.xyz * IN.blendweight.y));
    q20.xyz = normalize((q2.x * q59.xyz) + q54.xyz);
    q43.xyz = (IN.blendweight.z * q42.xyz) + ((IN.blendweight.x * q41.xyz) + (q40.xyz * IN.blendweight.y));
    r1.xyz = (q2.x * q44.xyz) + q43.xyz;
    q19.xyz = normalize(normalize(EyePosition.xyz - r1.xyz) + LightDirection[0].xyz);
    OUT.position.xyzw = mul(SkinModelViewProj, r1.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    q81.xyz = (IN.blendweight.z * q182.xyz) + ((IN.blendweight.x * q56.xyz) + (q55.xyz * IN.blendweight.y));
    q18.xyz = normalize((q2.x * q57.xyz) + q81.xyz);
    m62.xyz = mul(float3x3(q61.xyz, q20.xyz, q18.xyz), q19.xyz);
    OUT.texcoord_1.xyz = compress(m62.xyz);	// [-1,+1] to [0,1]

    return OUT;
};

// approximately 110 instruction slots used
