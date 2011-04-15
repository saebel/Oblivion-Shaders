//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR2006.vso /Fcshaderdump19/HAIR2006.vso.dis
//
//
// Parameters:
//
float4 EyePosition;
float3 LightColor[3];
float4 LightPosition[3];
row_major float4x4 ModelViewProj;
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
//   LightPosition[0] const_16       1
//   LightPosition[1] const_17       1
//   LightColor[0]    const_19       1
//   LightColor[1]    const_20       1
//   EyePosition   const_25      1
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

    float3 eye3;
    float3 lit0;
    float1 lit4;
    float3 lit6;
    float1 lit9;

    eye3.xyz = normalize(EyePosition.xyz - IN.position.xyz);
    lit6.xyz = LightPosition[1].xyz - IN.position.xyz;
    lit0.xyz = LightPosition[0].xyz - IN.position.xyz;
    lit9.x = 1 - saturate(length(lit6.xyz) / LightPosition[1].w);
    lit4.x = 1 - saturate(length(lit0.xyz) / LightPosition[0].w);
    OUT.color_0.a = sqr(lit4.x);
    OUT.color_0.rgb = (shade(IN.normal.xyz, normalize(lit6.xyz)) * LightColor[1].rgb) * sqr(lit9.x);
    OUT.color_1.rgba = IN.color_0.rgba;
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = normalize(mul(TanSpaceProj, eye3.xyz));
    OUT.texcoord_2.xyz = normalize(mul(TanSpaceProj, normalize(lit0.xyz)));
    OUT.texcoord_3.xyz = normalize(mul(TanSpaceProj, normalize(normalize(lit0.xyz) + eye3.xyz)));

    return OUT;
};

// approximately 61 instruction slots used