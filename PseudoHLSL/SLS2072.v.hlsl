//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2072.vso /Fcshaderdump19/SLS2072.vso.dis
//
//
// Parameters:
//
float4 Bones[54] : register(c14);
float4 EyePosition : register(c8);
float3 FogColor : register(c13);
float4 FogParam : register(c12);
row_major float4x4 SkinModelViewProj : register(c4);
float UOffset : register(c9);
float VOffset : register(c10);
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_4        1
//   SkinModelViewProj[1] const_5        1
//   SkinModelViewProj[2] const_6        1
//   SkinModelViewProj[3] const_7        1
//   EyePosition       const_8       1
//   UOffset           const_9       1
//   VOffset           const_10      1
//   FogParam          const_12      1
//   FogColor          const_13      1
//   Bones[0]             const_14      18
//   Bones[1]             const_15      18
//   Bones[2]             const_16      18
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
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI			3.14159274
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const int4 const_3 = {1, 0, 0, 0};

    float3 eye8;
    float3 mdl61;
    float4 offset;
    float1 q0;
    float1 q1;
    float1 q10;
    float3 q19;
    float1 q2;
    float3 q22;
    float1 q3;
    float1 q4;
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
    float1 q6;
    float3 q60;
    float3 q67;
    float4 q7;
    float4 r0;

    r0.xy = abs(IN.position.xy);
    q0.x = min(r0.y, r0.x) / max(r0.y, r0.x);
    q1.x = sqr(q0.x);
    offset.xyzw = IN.blendindices.zyxw * 765.01001;
    q56.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.tangent.xyz);
    q53.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.tangent.xyz);
    q52.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.tangent.xyz);
    q51.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.tangent.xyz);
    q58.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.binormal.xyz);
    q57.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.binormal.xyz);
    q55.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.binormal.xyz);
    q6.x = 1 - weight(IN.blendweight.xyz);
    q60.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.binormal.xyz);
    r0.w = 1;
    q2.x = (q1.x * ((q1.x * ((q1.x * 0.0208350997) - 0.0851330012)) + 0.180141002)) - 0.330299497;
    q3.x = q0.x * ((q1.x * q2.x) + 0.999866009);
    q7.xyzw = (IN.position.xyzx * const_3.xxxy) + const_3.yyyx;
    q59.xyz = (IN.blendweight.z * q58.xyz) + ((IN.blendweight.x * q57.xyz) + (q55.xyz * IN.blendweight.y));
    q54.xyz = (IN.blendweight.z * q53.xyz) + ((IN.blendweight.x * q52.xyz) + (q51.xyz * IN.blendweight.y));
    q4.x = (((PI - (q3.x * 2) / 2) * (r0.y < r0.x ? 1.0 : 0.0)) + q3.x) - (IN.position.y < 0.0 ? PI : 0);
    q44.xyz = mul(float3x4(Bones[0 + offset.w].xyzw, Bones[1 + offset.w].xyzw, Bones[2 + offset.w].xyzw), q7.xyzw);
    q42.xyz = mul(float3x4(Bones[0 + offset.z].xyzw, Bones[1 + offset.z].xyzw, Bones[2 + offset.z].xyzw), q7.xyzw);
    q41.xyz = mul(float3x4(Bones[0 + offset.x].xyzw, Bones[1 + offset.x].xyzw, Bones[2 + offset.x].xyzw), q7.xyzw);
    q40.xyz = mul(float3x4(Bones[0 + offset.y].xyzw, Bones[1 + offset.y].xyzw, Bones[2 + offset.y].xyzw), q7.xyzw);
    q49.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.normal.xyz);
    q47.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.normal.xyz);
    q46.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.normal.xyz);
    q45.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.normal.xyz);
    q48.xyz = (IN.blendweight.z * q47.xyz) + ((IN.blendweight.x * q46.xyz) + (q45.xyz * IN.blendweight.y));
    q50.xyz = normalize((q6.x * q49.xyz) + q48.xyz);
    q5.x = (max(IN.position.y, IN.position.x) == 0 ? (min(IN.position.y, IN.position.x) < 0.0 ? 1 : 0) : 0);
    q22.xyz = normalize((q6.x * q60.xyz) + q59.xyz);
    q19.xyz = normalize((q6.x * q56.xyz) + q54.xyz);
    q43.xyz = (IN.blendweight.z * q42.xyz) + ((IN.blendweight.x * q41.xyz) + (q40.xyz * IN.blendweight.y));
    r0.xyz = (q6.x * q44.xyz) + q43.xyz;
    mdl61.xyz = mul(float3x4(SkinModelViewProj[0].xyzw, SkinModelViewProj[1].xyzw, SkinModelViewProj[2].xyzw), r0.xyzw);
    eye8.xyz = EyePosition.xyz - r0.xyz;
    q67.xyz = mul(float3x3(q19.xyz, q22.xyz, q50.xyz), eye8.xyz - (2 * (dot(q50.xyz, eye8.xyz) < 1 ? eye8.xyz : 0)));
    q10.x = 1 - saturate((FogParam.x - length(mdl61.xyz)) / FogParam.y);
    OUT.color_1.rgb = FogColor.rgb;
    OUT.color_1.a = (0 < FogParam.z ? q10.x : 0);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl61.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.x = ((q4.x - (q5.x * (2 * q4.x))) / PI) + VOffset.x;
    OUT.texcoord_1.y = (IN.position.z * 0.025) + UOffset.x;
    OUT.texcoord_3.xyz = normalize(q67.xyz);

    return OUT;
};

// approximately 139 instruction slots used
