//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S003.vso /Fcshaderdump19/SLS1S003.vso.dis
//
//
// Parameters:

float4 Bones[54];
float4 LightPosition[3];
row_major float4x4 SkinModelViewProj;


// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_1        1
//   SkinModelViewProj[1] const_2        1
//   SkinModelViewProj[2] const_3        1
//   SkinModelViewProj[3] const_4        1
//   LightPosition[0]     const_16       1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float1 offset;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;
    float3 r8;

    r1.xyzw = IN.blendindices.zyxw * 765.01001;
    offset.x = r1.y;
    r0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r2.x = dot(Bones[0 + offset.x], r0.xyzw);
    r2.y = dot(Bones[1 + offset.x], r0.xyzw);
    r2.z = dot(Bones[2 + offset.x], r0.xyzw);
    offset.x = r1.x;
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], r0.xyzw);
    r2.y = dot(Bones[1 + offset.x], r0.xyzw);
    r2.z = dot(Bones[2 + offset.x], r0.xyzw);
    offset.x = r1.z;
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], r0.xyzw);
    r2.y = dot(Bones[1 + offset.x], r0.xyzw);
    r2.z = dot(Bones[2 + offset.x], r0.xyzw);
    offset.x = r1.w;
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], r0.xyzw);
    r2.y = dot(Bones[1 + offset.x], r0.xyzw);
    r2.z = dot(Bones[2 + offset.x], r0.xyzw);
    offset.x = r1.y;
    r2.w = 1 - dot(IN.blendweight.xyz, 1);
    r0.xyz = (r2.w * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r1.x;
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r1.z;
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r1.w;
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r1.y;
    r5.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r5.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r5.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r1.x;
    r6.xyz = r5.xyz * IN.blendweight.y;
    r5.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r5.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r5.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r1.z;
    r6.xyz = (IN.blendweight.x * r5.xyz) + r6.xyz;
    r5.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r5.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r5.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r1.w;
    r7.xyz = (IN.blendweight.z * r5.xyz) + r6.xyz;
    r5.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r5.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r5.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r1.y;
    r6.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r6.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r6.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    offset.x = r1.x;
    r8.xyz = r6.xyz * IN.blendweight.y;
    r6.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r6.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r6.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    offset.x = r1.z;
    r1.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r1.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r1.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    offset.x = r1.w;
    r0.w = 1;
    r3.xyz = normalize((r2.w * r2.xyz) + r3.xyz);
    r2.xyz = LightPosition[0].xyz - r0.xyz;
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r0.xyz = r2.xyz / LightPosition[0].w;
    r6.xyz = (IN.blendweight.z * r1.xyz) + ((IN.blendweight.x * r6.xyz) + r8.xyz);
    r1.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r1.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r1.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r4.xyz = normalize(r2.xyz);
    r3.x = dot(r3.xyz, r4.xyz);
    r3.y = dot(normalize((r2.w * r5.xyz) + r7.xyz), r4.xyz);
    r3.z = dot(normalize((r2.w * r1.xyz) + r6.xyz), r4.xyz);
    OUT.texcoord_3.xyz = normalize(r3.xyz);
    OUT.texcoord_1.xy = (0.5 * r0.xy) + 0.5;
    OUT.texcoord_2.x = (r0.z * 0.5) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.y = 0.5;

    return OUT;
};

// approximately 114 instruction slots used
