//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2035.vso /Fcshaderdump19/PAR2035.vso.dis
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
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_5 : TEXCOORD5;
    float3 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float3 eye13;
    float3 lit72;
    float3 m45;
    float3 m47;
    float4 offset;
    float1 q0;
    float4 q1;
    float3 q18;
    float3 q21;
    float3 q22;
    float3 q23;
    float3 q24;
    float3 q25;
    float3 q26;
    float3 q27;
    float3 q28;
    float3 q29;
    float3 q30;
    float3 q31;
    float3 q32;
    float3 q33;
    float3 q34;
    float3 q35;
    float3 q36;
    float3 q37;
    float3 q38;
    float3 q39;
    float3 q40;
    float3 q43;
    float3 q44;
    float4 r0;

    offset.xyzw = IN.blendindices.zyxw * 765.01001;
    q30.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.tangent.xyz);
    q28.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.tangent.xyz);
    q27.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.tangent.xyz);
    q26.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.tangent.xyz);
    q40.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.normal.xyz);
    q38.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.normal.xyz);
    q37.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.normal.xyz);
    q36.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.normal.xyz);
    q43.xyz = mul(float3x3(Bones[0 + offset.w].xyz, Bones[1 + offset.w].xyz, Bones[2 + offset.w].xyz), IN.binormal.xyz);
    q34.xyz = mul(float3x3(Bones[0 + offset.z].xyz, Bones[1 + offset.z].xyz, Bones[2 + offset.z].xyz), IN.binormal.xyz);
    q33.xyz = mul(float3x3(Bones[0 + offset.x].xyz, Bones[1 + offset.x].xyz, Bones[2 + offset.x].xyz), IN.binormal.xyz);
    q32.xyz = mul(float3x3(Bones[0 + offset.y].xyz, Bones[1 + offset.y].xyz, Bones[2 + offset.y].xyz), IN.binormal.xyz);
    q0.x = 1 - weight(IN.blendweight.xyz);
    r0.w = 1;
    q1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    q25.xyz = mul(float3x4(Bones[0 + offset.w].xyzw, Bones[1 + offset.w].xyzw, Bones[2 + offset.w].xyzw), q1.xyzw);
    q23.xyz = mul(float3x4(Bones[0 + offset.z].xyzw, Bones[1 + offset.z].xyzw, Bones[2 + offset.z].xyzw), q1.xyzw);
    q22.xyz = mul(float3x4(Bones[0 + offset.x].xyzw, Bones[1 + offset.x].xyzw, Bones[2 + offset.x].xyzw), q1.xyzw);
    q21.xyz = mul(float3x4(Bones[0 + offset.y].xyzw, Bones[1 + offset.y].xyzw, Bones[2 + offset.y].xyzw), q1.xyzw);
    q39.xyz = (IN.blendweight.z * q38.xyz) + ((IN.blendweight.x * q37.xyz) + (q36.xyz * IN.blendweight.y));
    q18.xyz = normalize((q0.x * q40.xyz) + q39.xyz);
    q35.xyz = (IN.blendweight.z * q34.xyz) + ((IN.blendweight.x * q33.xyz) + (q32.xyz * IN.blendweight.y));
    q44.xyz = normalize((q0.x * q43.xyz) + q35.xyz);
    q29.xyz = (IN.blendweight.z * q28.xyz) + ((IN.blendweight.x * q27.xyz) + (q26.xyz * IN.blendweight.y));
    q31.xyz = normalize((q0.x * q30.xyz) + q29.xyz);
    q24.xyz = (IN.blendweight.z * q23.xyz) + ((IN.blendweight.x * q22.xyz) + (q21.xyz * IN.blendweight.y));
    r0.xyz = (q0.x * q25.xyz) + q24.xyz;
    OUT.position.xyzw = mul(SkinModelViewProj, r0.xyzw);
    lit72.xyz = LightPosition[0].xyz - r0.xyz;
    m45.xyz = mul(float3x3(q31.xyz, q44.xyz, q18.xyz), normalize(lit72.xyz));
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(m45.xyz);
    eye13.xyz = EyePosition.xyz - r0.xyz;
    OUT.texcoord_3.xyz = mul(float3x3(q31.xyz, q44.xyz, q18.xyz), normalize(normalize(eye13.xyz) + normalize(lit72.xyz)));
    m47.xyz = mul(float3x3(q31.xyz, q44.xyz, q18.xyz), normalize(eye13.xyz));
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_5.xyz = compress(lit72.xyz / LightPosition[0].w);	// [-1,+1] to [0,1]
    OUT.texcoord_7.xyz = normalize(m47.xyz);

    return OUT;
};

// approximately 118 instruction slots used
