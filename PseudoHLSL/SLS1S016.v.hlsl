//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S016.vso /Fcshaderdump19/SLS1S016.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c42);
float3 LightDirection[3] : register(c13);
float4 LightPosition[3] : register(c16);
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
//   LightDirection[0]    const_13       1
//   LightPosition[0]     const_16       1
//   LightPosition[1]     const_17       1
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
    float3 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float3 lit19;
    float3 m65;
    float4 q1;
    float3 q11;
    float1 q14;
    float3 q16;
    float3 q18;
    float1 q2;
    float3 q41;
    float3 q42;
    float3 q43;
    float3 q44;
    float3 q45;
    float3 q46;
    float3 q47;
    float3 q48;
    float3 q49;
    float1 q5;
    float3 q50;
    float3 q53;
    float3 q54;
    float3 q55;
    float3 q56;
    float3 q57;
    float3 q59;
    float3 q60;
    float3 q61;
    float3 q62;
    float3 q63;
    float1 q9;
    float4 r0;
    float4 r1;

    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    q9.x = r0.w;
    q5.x = r0.w;
    q48.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.tangent.xyz);
    q47.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.tangent.xyz);
    q46.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.tangent.xyz);
    q63.xyz = mul(float3x3(Bones[0 + r0.w].xyz, Bones[1 + r0.w].xyz, Bones[2 + r0.w].xyz), IN.normal.xyz);
    q59.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.normal.xyz);
    q61.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.normal.xyz);
    q60.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.normal.xyz);
    q55.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.binormal.xyz);
    q54.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.binormal.xyz);
    q53.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.binormal.xyz);
    q50.xyz = mul(float3x3(Bones[0 + q9.x].xyz, Bones[1 + q9.x].xyz, Bones[2 + q9.x].xyz), IN.tangent.xyz);
    q2.x = 1 - weight(IN.blendweight.xyz);
    r1.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q14.x = r0.w;
    q43.xyz = mul(float3x4(Bones[0 + r0.z].xyzw, Bones[1 + r0.z].xyzw, Bones[2 + r0.z].xyzw), q1.xyzw);
    q42.xyz = mul(float3x4(Bones[0 + r0.x].xyzw, Bones[1 + r0.x].xyzw, Bones[2 + r0.x].xyzw), q1.xyzw);
    q41.xyz = mul(float3x4(Bones[0 + r0.y].xyzw, Bones[1 + r0.y].xyzw, Bones[2 + r0.y].xyzw), q1.xyzw);
    q45.xyz = mul(float3x4(Bones[0 + q5.x].xyzw, Bones[1 + q5.x].xyzw, Bones[2 + q5.x].xyzw), q1.xyzw);
    q57.xyz = mul(float3x3(Bones[0 + q14.x].xyz, Bones[1 + q14.x].xyz, Bones[2 + q14.x].xyz), IN.binormal.xyz);
    q62.xyz = (IN.blendweight.z * q59.xyz) + ((IN.blendweight.x * q61.xyz) + (q60.xyz * IN.blendweight.y));
    q18.xyz = normalize((q2.x * q63.xyz) + q62.xyz);
    q56.xyz = (IN.blendweight.z * q55.xyz) + ((IN.blendweight.x * q54.xyz) + (q53.xyz * IN.blendweight.y));
    q16.xyz = normalize((q2.x * q57.xyz) + q56.xyz);
    q49.xyz = (IN.blendweight.z * q48.xyz) + ((IN.blendweight.x * q47.xyz) + (q46.xyz * IN.blendweight.y));
    q11.xyz = normalize((q2.x * q50.xyz) + q49.xyz);
    m65.xyz = mul(float3x3(q11.xyz, q16.xyz, q18.xyz), LightDirection[0].xyz);
    OUT.color_0.rgb = compress(m65.xyz);
    q44.xyz = (IN.blendweight.z * q43.xyz) + ((IN.blendweight.x * q42.xyz) + (q41.xyz * IN.blendweight.y));
    r1.xyz = (q2.x * q45.xyz) + q44.xyz;
    OUT.position.xyzw = mul(SkinModelViewProj, r1.xyzw);
    lit19.xyz = LightPosition[1].xyz - r1.xyz;
    r0.xyz = lit19.xyz / LightPosition[1].w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = compress(r0.xy);
    OUT.texcoord_2.x = compress(r0.z);
    OUT.texcoord_2.y = 0.5;
    OUT.texcoord_3.xyz = mul(float3x3(q11.xyz, q16.xyz, q18.xyz), normalize(lit19.xyz));

    return OUT;
};

// approximately 115 instruction slots used