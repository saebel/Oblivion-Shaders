//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STFROND003.vso /Fcshaderdump19/STFROND003.vso.dis
//
//
// Parameters:
//
float4 AmbientColor : register(c5);
float4 DiffColor : register(c6);
float4 DiffColorPt : register(c7);
float3 FogColor : register(c15);
float4 FogParam : register(c14);
float4 LightPos : register(c9);
float4 LightRadius : register(c10);
row_major float4x4 ModelViewProj;
float SunDimmer : register(c16);
float4 WindMatrices[16];
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
//   AmbientColor  const_5       1
//   DiffColor     const_6       1
//   DiffColorPt   const_7       1
//   LightPos      const_9       1
//   LightRadius   const_10      1
//   FogParam      const_14      1
//   FogColor      const_15      1
//   SunDimmer     const_16      1
//   WindMatrices[0]  const_18      4
//   WindMatrices[1]  const_19      4
//   WindMatrices[2]  const_20      4
//   WindMatrices[3]  const_21      4
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    float1 q0;
    float3 q1;
    float1 q4;
    float1 q5;
    float4 q8;
    float4 r0;
    float3 r1;

    q0.x = IN.blendindices.y;
    q8.xyzw = mul(float4x4(WindMatrices[0 + q0.x].xyzw, WindMatrices[1 + q0.x].xyzw, WindMatrices[2 + q0.x].xyzw, WindMatrices[3 + q0.x].xyzw), IN.position.xyzw);
    r0.xyzw = (IN.blendindices.x * (q8.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    r1.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), r0.xyzw);
    OUT.position.xyz = r1.xyz;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    q1.xyz = LightPos.xyz - r0.xyz;
    q5.x = shades(IN.normal.xyz, normalize(q1.xyz));
    q4.x = saturate(length(q1.xyz) / LightRadius.x);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    r0.xyz = (SunDimmer.x * (q5.x * DiffColor.rgb)) + AmbientColor.rgb;
    OUT.texcoord_1.xyz = (IN.color_0.rgb * r0.xyz) + ((1.0 - sqr(q4.x)) * (q5.x * DiffColorPt.xyz));
    OUT.texcoord_2.w = 1 - saturate((FogParam.x - length(r1.xyz)) / FogParam.y);
    OUT.texcoord_2.xyz = FogColor.rgb;

    return OUT;
};

// approximately 43 instruction slots used
