//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2001.vso /Fcshaderdump19/HAIR2001.vso.dis
//
//
// Parameters:
//
float4 EyePosition : register(c25);
float3 LightColor[3] : register(c19);
float3 LightDirection[3] : register(c13);
float4 LightPosition[3] : register(c16);
row_major float4x4 ModelViewProj : register(c0);
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//   LightPosition[0]  const_16       1
//   LightPosition[1]  const_17       1
//   LightColor[0]     const_19       1
//   LightColor[1]     const_20       1
//   EyePosition    const_25      1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;

#define	TanSpaceProj	float3x3(IN.tangent.xyz, IN.binormal.xyz, IN.normal.xyz)
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float3 eye0;
    float3 lit4;
    float1 lit7;
    float3 q27;

    lit4.xyz = LightPosition[1].xyz - IN.position.xyz;
    eye0.xyz = EyePosition.xyz - IN.position.xyz;
    q27.xyz = normalize(mul(TanSpaceProj, normalize(normalize(eye0.xyz) + LightDirection[0].xyz)));
    lit7.x = 1 - saturate(length(lit4.xyz) / LightPosition[1].w);
    OUT.color_0.a = 1;
    OUT.color_0.rgb = (shade(IN.normal.xyz, normalize(lit4.xyz)) * LightColor[1].rgb) * sqr(lit7.x);
    OUT.color_1.rgba = IN.color_0.rgba;
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, normalize(eye0.xyz)));
    OUT.texcoord_2.xyz = normalize(mul(TanSpaceProj, LightDirection[0].xyz));
    OUT.texcoord_3.xyz = q27.xyz;

    return OUT;
};

// approximately 51 instruction slots used
