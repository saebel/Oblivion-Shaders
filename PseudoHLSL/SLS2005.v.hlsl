//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2005.vso /Fcshaderdump19/SLS2005.vso.dis
//
//
// Parameters:

float4 Bones[54];
float3 FogColor;
float4 FogParam;
float3 LightDirection[3];
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
//   LightDirection[0]      const_13       1
//   FogParam            const_23      1
//   FogColor            const_24      1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
//   Bones[0]               const_42      18
//   Bones[1]               const_43      18
//   Bones[2]               const_44      18
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
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
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
    float3 r5;

    r1.xyzw = (IN.blendindices.zyxw * 765.01001) - frac(IN.blendindices.zyxw * 765.01001);
    offset.xyzw = r1.xyzw;
    r0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r1.x = dot(Bones[0 + offset.y], r0.xyzw);
    r1.y = dot(Bones[1 + offset.y], r0.xyzw);
    r1.z = dot(Bones[2 + offset.y], r0.xyzw);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x], r0.xyzw);
    r1.y = dot(Bones[1 + offset.x], r0.xyzw);
    r1.z = dot(Bones[2 + offset.x], r0.xyzw);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z], r0.xyzw);
    r1.y = dot(Bones[1 + offset.z], r0.xyzw);
    r1.z = dot(Bones[2 + offset.z], r0.xyzw);
    r3.x = dot(Bones[0 + offset.w], r0.xyzw);
    r3.y = dot(Bones[1 + offset.w], r0.xyzw);
    r3.z = dot(Bones[2 + offset.w], r0.xyzw);
    r0.x = dot(Bones[0 + offset.y], IN.tangent.xyz);
    r0.y = dot(Bones[1 + offset.y], IN.tangent.xyz);
    r0.z = dot(Bones[2 + offset.y], IN.tangent.xyz);
    r1.w = 1 - dot(IN.blendweight.xyz, const_0.xyz);
    r4.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.xyz = r0.xyz * IN.blendweight.y;
    r0.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    r1.xyz = (IN.blendweight.x * r0.xyz) + r1.xyz;
    r0.x = dot(Bones[0 + offset.z], IN.tangent.xyz);
    r0.y = dot(Bones[1 + offset.z], IN.tangent.xyz);
    r0.z = dot(Bones[2 + offset.z], IN.tangent.xyz);
    r2.xyz = (IN.blendweight.z * r0.xyz) + r1.xyz;
    r1.x = dot(Bones[0 + offset.w], IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.w], IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.w], IN.tangent.xyz);
    r0.xyz = (r1.w * r3.xyz) + r4.xyz;
    r0.w = 1;
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r2.xyz = (r1.w * r1.xyz) + r2.xyz;
    r1.xyz = normalize(r2.xyz);
    r1.x = dot(r1.xyz, LightDirection[0].xyz);
    r2.x = dot(Bones[0 + offset.y], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.y], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.y], IN.binormal.xyz);
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.z], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.z], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.z], IN.binormal.xyz);
    r5.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.w], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.w], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.w], IN.binormal.xyz);
    r3.x = dot(Bones[0 + offset.y], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.y], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.y], IN.normal.xyz);
    r4.xyz = r3.xyz * IN.blendweight.y;
    r3.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r4.xyz = (IN.blendweight.x * r3.xyz) + r4.xyz;
    r3.x = dot(Bones[0 + offset.z], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.z], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.z], IN.normal.xyz);
    r4.xyz = (IN.blendweight.z * r3.xyz) + r4.xyz;
    r3.x = dot(Bones[0 + offset.w], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.w], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.w], IN.normal.xyz);
    r4.xyz = (r1.w * r3.xyz) + r4.xyz;
    r3.xyz = normalize((r1.w * r2.xyz) + r5.xyz);
    r1.y = dot(r3.xyz, LightDirection[0].xyz);
    r2.xyz = normalize(r4.xyz);
    r1.z = dot(r2.xyz, LightDirection[0].xyz);
    OUT.texcoord_1.xyz = normalize(r1.xyz);
    r1.x = dot(ShadowProj[0].xyzw, r0.xyzw);
    r1.y = dot(ShadowProj[1].xyzw, r0.xyzw);
    r1.w = dot(ShadowProj[3].xyzw, r0.xyzw);
    r2.xy = r1.xy - ShadowProjData.xy;
    r3.xy = (r1.w * ShadowProjTransform.xy) + r1.xy;
    r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    OUT.texcoord_7.xy = r3.xy / (r1.w * ShadowProjTransform.w);
    r1.w = 1.0 / ShadowProjData.w;
    OUT.texcoord_7.z = r2.x * r1.w;
    OUT.texcoord_7.w = (r2.y * -r1.w) + 1;
    OUT.position.xyz = r1.xyz;
    OUT.color_1.a = 1 - saturate((FogParam.x - length(r1.xyz)) / FogParam.y);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.color_1.rgb = FogColor.rgb;

    return OUT;
};

// approximately 116 instruction slots used
