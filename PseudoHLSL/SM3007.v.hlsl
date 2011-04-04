//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3007.vso /Fcshaderdump19/SM3007.vso.dis
//
//
// Parameters:

float4 Bones[54];
float4 FogColor;
float4 FogParam;
row_major float4x4 ShadowProj;
float4 ShadowProjData;
float4 ShadowProjTransform;
row_major float4x4 SkinModelViewProj;


// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   SkinModelViewProj[0]   const_1        1
//   SkinModelViewProj[1]   const_2        1
//   SkinModelViewProj[2]   const_3        1
//   SkinModelViewProj[3]   const_4        1
//   FogParam            const_15      1
//   FogColor            const_16      1
//   ShadowProj[0]          const_21       1
//   ShadowProj[1]          const_22       1
//   ShadowProj[2]          const_23       1
//   ShadowProj[3]          const_24       1
//   ShadowProjData      const_25      1
//   ShadowProjTransform const_26      1
//   Bones[0]               const_31      18
//   Bones[1]               const_32      18
//   Bones[2]               const_33      18
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_0 = {1, 765.01001, 0, 0};

    float4 offset;
    float4 r0;
    float4 r1;
    float3 r2;
    float3 r3;
    float3 r4;

    r1.x.zw = 765.01001 * IN.blendindices.zy;
    r0.xyzw = frac(r1.xyzw);
    r0.x.zw = r1.xy - r0.xy;
    offset.xyzw = r0.xyzw;
    r0.x = dot(Bones[0 + offset.y], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.y], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.y], IN.normal.xyz);
    r1.w = 1 - dot(IN.blendweight.xyz, const_0.xyz);
    r1.xyz = r0.xyz * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r1.xyz = (IN.blendweight.x * r0.xyz) + r1.xyz;
    r0.x = dot(Bones[0 + offset.z], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.z], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.z], IN.normal.xyz);
    r1.xyz = (IN.blendweight.z * r0.xyz) + r1.xyz;
    r0.x = dot(Bones[0 + offset.w], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.w], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.w], IN.normal.xyz);
    OUT.texcoord_5.xyz = normalize((r1.w * r0.xyz) + r1.xyz);
    r0.x = dot(Bones[0 + offset.y], IN.tangent.xyz);
    r0.y = dot(Bones[1 + offset.y], IN.tangent.xyz);
    r0.z = dot(Bones[2 + offset.y], IN.tangent.xyz);
    r2.xyz = r0.xyz * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    r2.xyz = (IN.blendweight.x * r0.xyz) + r2.xyz;
    r0.x = dot(Bones[0 + offset.z], IN.tangent.xyz);
    r0.y = dot(Bones[1 + offset.z], IN.tangent.xyz);
    r0.z = dot(Bones[2 + offset.z], IN.tangent.xyz);
    r2.xyz = (IN.blendweight.z * r0.xyz) + r2.xyz;
    r0.x = dot(Bones[0 + offset.w], IN.tangent.xyz);
    r0.y = dot(Bones[1 + offset.w], IN.tangent.xyz);
    r0.z = dot(Bones[2 + offset.w], IN.tangent.xyz);
    r0.xyz = (r1.w * r0.xyz) + r2.xyz;
    OUT.texcoord_3.xyz = normalize(r0.xyz);
    r0.x = dot(Bones[0 + offset.y], IN.binormal.xyz);
    r0.y = dot(Bones[1 + offset.y], IN.binormal.xyz);
    r0.z = dot(Bones[2 + offset.y], IN.binormal.xyz);
    r1.xyz = r0.xyz * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    r1.xyz = (IN.blendweight.x * r0.xyz) + r1.xyz;
    r0.x = dot(Bones[0 + offset.z], IN.binormal.xyz);
    r0.y = dot(Bones[1 + offset.z], IN.binormal.xyz);
    r0.z = dot(Bones[2 + offset.z], IN.binormal.xyz);
    r2.xyz = (IN.blendweight.z * r0.xyz) + r1.xyz;
    r1.x = dot(Bones[0 + offset.w], IN.binormal.xyz);
    r1.y = dot(Bones[1 + offset.w], IN.binormal.xyz);
    r1.z = dot(Bones[2 + offset.w], IN.binormal.xyz);
    r2.xyz = (r1.w * r1.xyz) + r2.xyz;
    OUT.texcoord_4.xyz = normalize(r2.xyz);
    r0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r3.x = dot(Bones[0 + offset.y], r0.xyzw);
    r3.y = dot(Bones[1 + offset.y], r0.xyzw);
    r3.z = dot(Bones[2 + offset.y], r0.xyzw);
    r4.xyz = r3.xyz * IN.blendweight.y;
    r3.x = dot(Bones[0 + offset.x], r0.xyzw);
    r3.y = dot(Bones[1 + offset.x], r0.xyzw);
    r3.z = dot(Bones[2 + offset.x], r0.xyzw);
    r4.xyz = (IN.blendweight.x * r3.xyz) + r4.xyz;
    r3.x = dot(Bones[0 + offset.z], r0.xyzw);
    r3.y = dot(Bones[1 + offset.z], r0.xyzw);
    r3.z = dot(Bones[2 + offset.z], r0.xyzw);
    r4.xyz = (IN.blendweight.z * r3.xyz) + r4.xyz;
    r3.x = dot(Bones[0 + offset.w], r0.xyzw);
    r3.y = dot(Bones[1 + offset.w], r0.xyzw);
    r3.z = dot(Bones[2 + offset.w], r0.xyzw);
    r0.xyz = (r1.w * r3.xyz) + r4.xyz;
    r0.w = 1;
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.xyz = r1.xyz;
    OUT.texcoord_7.w = (1 - saturate((FogParam.x - length(r1.xyz)) / FogParam.y)) * FogParam.z;
    OUT.texcoord_6.xyz = r0.xyz;
    r1.xyz = dot(ShadowProj[3].xyzw, r0.xyzw) * ShadowProjTransform.xyw;
    r2.x = dot(ShadowProj[0].xyzw, r0.xyzw);
    r2.y = dot(ShadowProj[1].xyzw, r0.xyzw);
    OUT.texcoord_1.xy = (r1.xy + r2.xy) / (r1.z);
    r0.xy = r2.xy - ShadowProjData.xy;
    r0.w = 1.0 / ShadowProjData.w;
    OUT.texcoord_1.z = r0.x * r0.w;
    OUT.texcoord_1.w = (r0.y * -r0.w) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.texcoord_7.xyz = FogColor.rgb;

    return OUT;
};

// approximately 109 instruction slots used
