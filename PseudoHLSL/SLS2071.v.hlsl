//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2071.vso /Fcshaderdump19/SLS2071.vso.dis
//
//
// Parameters:
//
float4 EyePosition;
float3 FogColor;
float4 FogParam;
row_major float4x4 ModelViewProj;
float UOffset;
float VOffset;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   EyePosition   const_8       1
//   UOffset       const_9       1
//   VOffset       const_10      1
//   FogParam      const_12      1
//   FogColor      const_13      1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
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

    const float4 const_6 = {-PI, (1.0 / PI), 1, 0};

    float3 eye0;
    float3 mdl30;
    float1 q1;
    float1 q13;
    float1 q2;
    float1 q3;
    float3 q33;
    float1 q4;
    float1 q5;
    float1 q7;
    float4 r0;

    mdl30.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), IN.position.xyzw);
    r0.xy = abs(IN.position.xy);
    q1.x = min(r0.y, r0.x) / max(r0.y, r0.x);
    q2.x = sqr(q1.x);
    eye0.xyz = EyePosition.xyz - IN.position.xyz;
    q7.x = 1 - saturate((FogParam.x - length(mdl30.xyz)) / FogParam.y);
    q3.x = (q2.x * ((q2.x * ((q2.x * 0.0208350997) - 0.0851330012)) + 0.180141002)) - 0.330299497;
    q4.x = q1.x * ((q2.x * q3.x) + 0.999866009);
    q33.xyz = mul(TanSpaceProj, eye0.xyz - (2 * (dot(IN.normal.xyz, eye0.xyz) < 1 ? eye0.xyz : 0)));
    q5.x = (max(IN.position.y, IN.position.x) == 0 ? (min(IN.position.y, IN.position.x) < 0.0 ? 1 : 0) : 0);
    q13.x = (((PI - (q4.x * 2) / 2) * (r0.y < r0.x ? 1.0 : 0.0)) + q4.x) - (IN.position.y < 0.0 ? PI : 0);
    r0.yw = const_6.yw;
    OUT.color_1.rgb = FogColor.rgb;
    OUT.color_1.a = (r0.w < FogParam.z ? q7.x : 0);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = mdl30.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.x = ((q13.x - (q5.x * (2 * q13.x))) * r0.y) + VOffset.x;
    OUT.texcoord_1.y = (IN.position.z * 0.025) + UOffset.x;
    OUT.texcoord_3.xyz = normalize(q33.xyz);

    return OUT;
};

// approximately 57 instruction slots used