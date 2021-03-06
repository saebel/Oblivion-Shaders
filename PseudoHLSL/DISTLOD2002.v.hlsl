//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/DISTLOD2002.vso /Fcshaderdump19/DISTLOD2002.vso.dis
//
//
// Parameters:
//
float4 AlphaParam : register(c12);
float4 AmbientColor : register(c13);
float3 DiffuseColor : register(c5);
float3 DiffuseDir : register(c4);
float4 EyePos : register(c9);
float4 FogColor : register(c10);
float4 FogParam : register(c11);
float4 InstanceData[2] : register(c20);
row_major float4x4 ModelViewProj : register(c0);
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
//   DiffuseDir    const_4       1
//   DiffuseColor  const_5       1
//   EyePos        const_9       1
//   FogColor      const_10      1
//   FogParam      const_11      1
//   AlphaParam    const_12      1
//   AmbientColor  const_13      1
//   InstanceData[0]  const_20       1
//   InstanceData[1]  const_21       1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 color_0 : COLOR0;
    float4 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    float1 eye5;
    float3 mdl10;
    float3 q0;
    float1 q3;
    float4 r0;
    float4 r1;

    eye5.x = length(EyePos.xyz - (InstanceData[0 + IN.texcoord_1.x]));
    r1.xyzw = frac(InstanceData[0 + IN.texcoord_1.x]);
    q0.xyz = expand(r1.xyz);	// [0,1] to [-1,+1]
    r0.w = IN.position.w;
    q3.x = 1 - saturate((eye5.x - AlphaParam.x) / AlphaParam.y);
    r0.xyz = (IN.position.xyz * (0.01 * InstanceData[0 + IN.texcoord_1.x].w)) + InstanceData[0 + IN.texcoord_1.x];
    mdl10.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), r0.xyzw);
    OUT.color_0.rgb = FogColor.rgb;
    OUT.color_0.a = 1 - saturate((FogParam.x - length(mdl10.xyz)) / FogParam.y);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl10.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.w = 1;
    OUT.texcoord_4.xyz = (DiffuseColor.rgb * (r1.w * (dot(DiffuseDir.xyz, q0.xyz) * IN.color_0.rgb))) + AmbientColor.rgb;
    OUT.texcoord_5.w = (AlphaParam.x < eye5.x ? q3.x : 0) + 1;
    OUT.texcoord_5.xyz = 0;

    return OUT;
};

// approximately 46 instruction slots used
