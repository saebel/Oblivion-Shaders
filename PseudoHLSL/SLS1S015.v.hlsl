//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S015.vso /Fcshaderdump19/SLS1S015.vso.dis
//
//
// Parameters:
//
float4 Bones[54];
float3 FogColor;
float4 FogParam;
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
//   FogParam          const_23      1
//   FogColor          const_24      1
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
    float4 color_0 : COLOR0;
    float3 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float2 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float3 mdl59;
    float4 q1;
    float3 q102;
    float1 q13;
    float1 q15;
    float1 q19;
    float1 q2;
    float3 q39;
    float3 q40;
    float3 q41;
    float3 q42;
    float3 q43;
    float3 q44;
    float3 q45;
    float3 q46;
    float3 q47;
    float3 q48;
    float1 q5;
    float3 q51;
    float3 q52;
    float3 q53;
    float3 q54;
    float3 q55;
    float3 q57;
    float3 q58;
    float3 q61;
    float3 q77;
    float1 q9;
    float4 r0;
    float4 r1;
    float3 r2;

    r1.xyzw = IN.blendindices.zyxw * 765.01001;
    q9.x = r1.w;
    q5.x = r1.w;
    q19.x = r1.z;
    q46.xyz = mul(float3x3(Bones[0 + r1.z].xyz, Bones[1 + r1.z].xyz, Bones[2 + r1.z].xyz), IN.tangent.xyz);
    q45.xyz = mul(float3x3(Bones[0 + r1.x].xyz, Bones[1 + r1.x].xyz, Bones[2 + r1.x].xyz), IN.tangent.xyz);
    q44.xyz = mul(float3x3(Bones[0 + r1.y].xyz, Bones[1 + r1.y].xyz, Bones[2 + r1.y].xyz), IN.tangent.xyz);
    q58.xyz = mul(float3x3(Bones[0 + r1.w].xyz, Bones[1 + r1.w].xyz, Bones[2 + r1.w].xyz), IN.normal.xyz);
    q61.xyz = mul(float3x3(Bones[0 + r1.y].xyz, Bones[1 + r1.y].xyz, Bones[2 + r1.y].xyz), IN.normal.xyz);
    q57.xyz = mul(float3x3(Bones[0 + r1.x].xyz, Bones[1 + r1.x].xyz, Bones[2 + r1.x].xyz), IN.normal.xyz);
    q53.xyz = mul(float3x3(Bones[0 + r1.z].xyz, Bones[1 + r1.z].xyz, Bones[2 + r1.z].xyz), IN.binormal.xyz);
    q51.xyz = mul(float3x3(Bones[0 + r1.y].xyz, Bones[1 + r1.y].xyz, Bones[2 + r1.y].xyz), IN.binormal.xyz);
    q48.xyz = mul(float3x3(Bones[0 + q9.x].xyz, Bones[1 + q9.x].xyz, Bones[2 + q9.x].xyz), IN.tangent.xyz);
    q2.x = 1 - weight(IN.blendweight.xyz);
    r0.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q15.x = r1.w;
    q13.x = r1.x;
    q41.xyz = mul(float3x4(Bones[0 + r1.z].xyzw, Bones[1 + r1.z].xyzw, Bones[2 + r1.z].xyzw), q1.xyzw);
    q40.xyz = mul(float3x4(Bones[0 + r1.x].xyzw, Bones[1 + r1.x].xyzw, Bones[2 + r1.x].xyzw), q1.xyzw);
    q39.xyz = mul(float3x4(Bones[0 + r1.y].xyzw, Bones[1 + r1.y].xyzw, Bones[2 + r1.y].xyzw), q1.xyzw);
    q43.xyz = mul(float3x4(Bones[0 + q5.x].xyzw, Bones[1 + q5.x].xyzw, Bones[2 + q5.x].xyzw), q1.xyzw);
    q102.xyz = mul(float3x3(Bones[0 + q19.x].xyz, Bones[1 + q19.x].xyz, Bones[2 + q19.x].xyz), IN.normal.xyz);
    q55.xyz = mul(float3x3(Bones[0 + q15.x].xyz, Bones[1 + q15.x].xyz, Bones[2 + q15.x].xyz), IN.binormal.xyz);
    q52.xyz = mul(float3x3(Bones[0 + q13.x].xyz, Bones[1 + q13.x].xyz, Bones[2 + q13.x].xyz), IN.binormal.xyz);
    q54.xyz = (IN.blendweight.z * q53.xyz) + ((IN.blendweight.x * q52.xyz) + (q51.xyz * IN.blendweight.y));
    r2.y = dot(normalize((q2.x * q55.xyz) + q54.xyz), LightDirection[0].xyz);
    q47.xyz = (IN.blendweight.z * q46.xyz) + ((IN.blendweight.x * q45.xyz) + (q44.xyz * IN.blendweight.y));
    r2.x = dot(normalize((q2.x * q48.xyz) + q47.xyz), LightDirection[0].xyz);
    q42.xyz = (IN.blendweight.z * q41.xyz) + ((IN.blendweight.x * q40.xyz) + (q39.xyz * IN.blendweight.y));
    r0.xyz = (q2.x * q43.xyz) + q42.xyz;
    mdl59.xyz = mul(float3x4(SkinModelViewProj[0].xyzw, SkinModelViewProj[1].xyzw, SkinModelViewProj[2].xyzw), r0.xyzw);
    OUT.color_0.rgb = FogColor.rgb;
    OUT.color_0.a = 1 - saturate((FogParam.x - length(mdl59.xyz)) / FogParam.y);
    q77.xyz = (IN.blendweight.z * q102.xyz) + ((IN.blendweight.x * q57.xyz) + (q61.xyz * IN.blendweight.y));
    r2.z = dot(normalize((q2.x * q58.xyz) + q77.xyz), LightDirection[0].xyz);
    OUT.color_1.rgb = compress(r2.xyz);	// [-1,+1] to [0,1]
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl59.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.xy = IN.texcoord_0.xy;
    OUT.texcoord_3.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 117 instruction slots used
