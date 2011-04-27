//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S008.vso /Fcshaderdump19/SLS1S008.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c42);
float4 EyePosition : register(c25);
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
//   LightPosition[0]     const_16       1
//   EyePosition       const_25      1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
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

    float3 eye27;
    float3 lit12;
    float3 m60;
    float4 q1;
    float3 q107;
    float1 q17;
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
    float3 q51;
    float3 q52;
    float3 q53;
    float3 q54;
    float3 q55;
    float3 q56;
    float3 q57;
    float3 q58;
    float3 q59;
    float3 q63;
    float3 q80;
    float3 q81;
    float1 q9;
    float4 r0;
    float4 r1;

    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    q9.x = r0.w;
    q5.x = r0.w;
    q48.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.tangent.xyz);
    q47.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.tangent.xyz);
    q46.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.tangent.xyz);
    q54.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.binormal.xyz);
    q52.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.binormal.xyz);
    q53.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.binormal.xyz);
    q50.xyz = mul(float3x3(Bones[0 + q9.x].xyz, Bones[1 + q9.x].xyz, Bones[2 + q9.x].xyz), IN.tangent.xyz);
    q2.x = 1 - weight(IN.blendweight.xyz);
    r1.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q17.x = r0.w;
    q43.xyz = mul(float3x4(Bones[0 + r0.z].xyzw, Bones[1 + r0.z].xyzw, Bones[2 + r0.z].xyzw), q1.xyzw);
    q42.xyz = mul(float3x4(Bones[0 + r0.x].xyzw, Bones[1 + r0.x].xyzw, Bones[2 + r0.x].xyzw), q1.xyzw);
    q41.xyz = mul(float3x4(Bones[0 + r0.y].xyzw, Bones[1 + r0.y].xyzw, Bones[2 + r0.y].xyzw), q1.xyzw);
    q45.xyz = mul(float3x4(Bones[0 + q5.x].xyzw, Bones[1 + q5.x].xyzw, Bones[2 + q5.x].xyzw), q1.xyzw);
    q57.xyz = mul(float3x3(Bones[0 + r0.w].xyz, Bones[1 + r0.w].xyz, Bones[2 + r0.w].xyz), IN.normal.xyz);
    q63.xyz = mul(float3x3(Bones[0 + r0.y].xyz, Bones[1 + r0.y].xyz, Bones[2 + r0.y].xyz), IN.normal.xyz);
    q56.xyz = mul(float3x3(Bones[0 + r0.x].xyz, Bones[1 + r0.x].xyz, Bones[2 + r0.x].xyz), IN.normal.xyz);
    q107.xyz = mul(float3x3(Bones[0 + r0.z].xyz, Bones[1 + r0.z].xyz, Bones[2 + r0.z].xyz), IN.normal.xyz);
    q58.xyz = mul(float3x3(Bones[0 + q17.x].xyz, Bones[1 + q17.x].xyz, Bones[2 + q17.x].xyz), IN.binormal.xyz);
    q55.xyz = (IN.blendweight.z * q54.xyz) + ((IN.blendweight.x * q53.xyz) + (q52.xyz * IN.blendweight.y));
    q59.xyz = normalize((q2.x * q58.xyz) + q55.xyz);
    q49.xyz = (IN.blendweight.z * q48.xyz) + ((IN.blendweight.x * q47.xyz) + (q46.xyz * IN.blendweight.y));
    q51.xyz = normalize((q2.x * q50.xyz) + q49.xyz);
    q44.xyz = (IN.blendweight.z * q43.xyz) + ((IN.blendweight.x * q42.xyz) + (q41.xyz * IN.blendweight.y));
    r1.xyz = (q2.x * q45.xyz) + q44.xyz;
    lit12.xyz = LightPosition[0].xyz - r1.xyz;
    eye27.xyz = normalize(normalize(lit12.xyz) + normalize(EyePosition.xyz - r1.xyz));
    r0.xyz = lit12.xyz / LightPosition[0].w;
    q80.xyz = (IN.blendweight.z * q107.xyz) + ((IN.blendweight.x * q56.xyz) + (q63.xyz * IN.blendweight.y));
    q81.xyz = normalize((q2.x * q57.xyz) + q80.xyz);
    m60.xyz = mul(float3x3(q51.xyz, q59.xyz, q81.xyz), q81.xyz);
    OUT.color_0.rgb = compress(m60.xyz);	// [-1,+1] to [0,1]
    OUT.position.xyzw = mul(SkinModelViewProj, r1.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = compress(r0.xy);	// [-1,+1] to [0,1]
    OUT.texcoord_2.x = compress(r0.z);	// [-1,+1] to [0,1]
    OUT.texcoord_2.y = 0.5;
    OUT.texcoord_3.xyz = mul(float3x3(q51.xyz, q59.xyz, q81.xyz), eye27.xyz);

    return OUT;
};

// approximately 122 instruction slots used
