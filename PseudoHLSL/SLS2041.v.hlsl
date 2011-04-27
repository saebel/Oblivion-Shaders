//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2041.vso /Fcshaderdump19/SLS2041.vso.dis
//
//
// Parameters:
//
float4 DecalFade[8] : register(c31);
row_major float4x4 DecalProjection[8];
row_major float4x4 ModelViewProj : register(c0);
//
//
// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   ModelViewProj[0]   const_0        1
//   ModelViewProj[1]   const_1        1
//   ModelViewProj[2]   const_2        1
//   ModelViewProj[3]   const_3        1
//   DecalFade[0]       const_31       1
//   DecalFade[1]       const_32       1
//   DecalFade[2]       const_33       1
//   DecalFade[3]       const_34       1
//   DecalFade[4]       const_35       1
//   DecalFade[5]       const_36       1
//   DecalFade[6]       const_37       1
//   DecalFade[7]       const_38       1
//   DecalProjection[0][0] const_40         1
//   DecalProjection[0][1] const_41         1
//   DecalProjection[0][2] const_42         1
//   DecalProjection[0][3] const_43         1
//   DecalProjection[1][0] const_44         1
//   DecalProjection[1][1] const_45         1
//   DecalProjection[1][2] const_46         1
//   DecalProjection[1][3] const_47         1
//   DecalProjection[2][0] const_48        1
//   DecalProjection[2][1] const_49        1
//   DecalProjection[2][2] const_50        1
//   DecalProjection[2][3] const_51        1
//   DecalProjection[3][0] const_52        1
//   DecalProjection[3][1] const_53        1
//   DecalProjection[3][2] const_54        1
//   DecalProjection[3][3] const_55        1
//   DecalProjection[4][0] const_56       1
//   DecalProjection[4][1] const_57       1
//   DecalProjection[4][2] const_58       1
//   DecalProjection[4][3] const_59       1
//   DecalProjection[5][0] const_60      1
//   DecalProjection[5][1] const_61      1
//   DecalProjection[5][2] const_62      1
//   DecalProjection[5][3] const_63      1
//   DecalProjection[6][0] const_64      1
//   DecalProjection[6][1] const_65      1
//   DecalProjection[6][2] const_66      1
//   DecalProjection[6][3] const_67      1
//   DecalProjection[7][0] const_68      1
//   DecalProjection[7][1] const_69      1
//   DecalProjection[7][2] const_70      1
//   DecalProjection[7][3] const_71      1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float3 normal : NORMAL;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float3 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    const float4 const_4 = {0.0125000002, 0.5, 0, 1};

    float2 m100;
    float2 m75;
    float2 m85;
    float2 m88;
    float2 m91;
    float2 m94;
    float2 m97;
    float1 q0;
    float1 q1;
    float3 q13;
    float1 q2;
    float1 q3;
    float3 q31;
    float3 q32;
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
    float1 q6;

    q6.x = pow(abs(1 - shade(IN.normal.xyz, DecalProjection[7][2].xyz)), 10) * DecalFade[7].x;
    q5.x = pow(abs(1 - shade(IN.normal.xyz, DecalProjection[6][2].xyz)), 10) * DecalFade[6].x;
    q4.x = pow(abs(1 - shade(IN.normal.xyz, DecalProjection[5][2].xyz)), 10) * DecalFade[5].x;
    q2.x = pow(abs(1 - shade(IN.normal.xyz, DecalProjection[3][2].xyz)), 10) * DecalFade[3].x;
    q1.x = pow(abs(1 - shade(IN.normal.xyz, DecalProjection[2][2].xyz)), 10) * DecalFade[2].x;
    q0.x = pow(abs(1 - shade(IN.normal.xyz, DecalProjection[1][2].xyz)), 10) * DecalFade[1].x;
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    q50.xyz = float3(DecalProjection[7][0].w, DecalProjection[7][1].w, DecalProjection[7][2].w);
    q13.xyz = q50.xyz + IN.position.xyz;
    m100.xy = mul(float2x3(DecalProjection[7][0].xyz, DecalProjection[7][1].xyz), q13.xyz);
    q48.xyz = float3(DecalProjection[6][0].w, DecalProjection[6][1].w, DecalProjection[6][2].w);
    q49.xyz = q48.xyz + IN.position.xyz;
    m97.xy = mul(float2x3(DecalProjection[6][0].xyz, DecalProjection[6][1].xyz), q49.xyz);
    q46.xyz = float3(DecalProjection[5][0].w, DecalProjection[5][1].w, DecalProjection[5][2].w);
    q47.xyz = q46.xyz + IN.position.xyz;
    m94.xy = mul(float2x3(DecalProjection[5][0].xyz, DecalProjection[5][1].xyz), q47.xyz);
    q44.xyz = float3(DecalProjection[4][0].w, DecalProjection[4][1].w, DecalProjection[4][2].w);
    q45.xyz = q44.xyz + IN.position.xyz;
    m91.xy = mul(float2x3(DecalProjection[4][0].xyz, DecalProjection[4][1].xyz), q45.xyz);
    q42.xyz = float3(DecalProjection[3][0].w, DecalProjection[3][1].w, DecalProjection[3][2].w);
    q43.xyz = q42.xyz + IN.position.xyz;
    m88.xy = mul(float2x3(DecalProjection[3][0].xyz, DecalProjection[3][1].xyz), q43.xyz);
    q40.xyz = float3(DecalProjection[2][0].w, DecalProjection[2][1].w, DecalProjection[2][2].w);
    q41.xyz = q40.xyz + IN.position.xyz;
    m85.xy = mul(float2x3(DecalProjection[2][0].xyz, DecalProjection[2][1].xyz), q41.xyz);
    q31.xyz = float3(DecalProjection[1][0].w, DecalProjection[1][1].w, DecalProjection[1][2].w);
    q32.xyz = q31.xyz + IN.position.xyz;
    m75.xy = mul(float2x3(DecalProjection[1][0].xyz, DecalProjection[1][1].xyz), q32.xyz);
    q3.x = pow(abs(1 - shade(IN.normal.xyz, DecalProjection[4][2].xyz)), 10) * DecalFade[4].x;
    OUT.texcoord_0.xyz = (IN.texcoord_0.xyx * const_4.wwz) + const_4.zzw;
    OUT.texcoord_1.xy = (0.0125000002 * m75.xy) + 0.5;
    OUT.texcoord_1.z = (1 - (abs(dot(DecalProjection[1][2].xyz, q32.xyz)) / 256)) * q0.x;
    OUT.texcoord_2.xy = (0.0125000002 * m85.xy) + 0.5;
    OUT.texcoord_2.z = (1 - (abs(dot(DecalProjection[2][2].xyz, q41.xyz)) / 256)) * q1.x;
    OUT.texcoord_3.xy = (0.0125000002 * m88.xy) + 0.5;
    OUT.texcoord_3.z = (1 - (abs(dot(DecalProjection[3][2].xyz, q43.xyz)) / 256)) * q2.x;
    OUT.texcoord_4.xy = (0.0125000002 * m91.xy) + 0.5;
    OUT.texcoord_4.z = (1 - (abs(dot(DecalProjection[4][2].xyz, q45.xyz)) / 256)) * q3.x;
    OUT.texcoord_5.xy = (0.0125000002 * m94.xy) + 0.5;
    OUT.texcoord_5.z = (1 - (abs(dot(DecalProjection[5][2].xyz, q47.xyz)) / 256)) * q4.x;
    OUT.texcoord_6.xy = (0.0125000002 * m97.xy) + 0.5;
    OUT.texcoord_6.z = (1 - (abs(dot(DecalProjection[6][2].xyz, q49.xyz)) / 256)) * q5.x;
    OUT.texcoord_7.xy = (0.0125000002 * m100.xy) + 0.5;
    OUT.texcoord_7.z = (1 - (abs(dot(DecalProjection[7][2].xyz, q13.xyz)) / 256)) * q6.x;

    return OUT;
};

// approximately 131 instruction slots used
