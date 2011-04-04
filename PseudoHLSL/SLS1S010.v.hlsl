//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S010.vso /Fcshaderdump19/SLS1S010.vso.dis
//
//
// Parameters:

float4 Bones[54];
float3 LightDirection[3];
row_major float4x4 SkinModelViewProj;


// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_1        1
//   SkinModelViewProj[1] const_2        1
//   SkinModelViewProj[2] const_3        1
//   SkinModelViewProj[3] const_4        1
//   LightDirection[0]    const_13       1
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
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    float1 offset;
    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;
    float3 r4;
    float3 r5;

    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    offset.x = r0.y;
    r1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r2.w = 1 - dot(IN.blendweight.xyz, const_0.xyz);
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    offset.x = r0.x;
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    offset.x = r0.z;
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    offset.x = r0.w;
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    r1.w = 1;
    r1.xyz = (r2.w * r2.xyz) + r3.xyz;
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r1.xyzw);
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r1.xyzw);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r1.xyzw);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r1.xyzw);
    offset.x = r0.y;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r0.x;
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r0.z;
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r0.w;
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], IN.tangent.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.tangent.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.tangent.xyz);
    offset.x = r0.y;
    r2.xyz = (r2.w * r2.xyz) + r3.xyz;
    r1.xyz = normalize(r2.xyz);
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r0.x;
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r0.z;
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r0.w;
    r4.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.x], IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x], IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x], IN.binormal.xyz);
    offset.x = r0.y;
    r3.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    offset.x = r0.x;
    r5.xyz = r3.xyz * IN.blendweight.y;
    r3.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r3.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r3.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    offset.x = r0.z;
    r0.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    offset.x = r0.w;
    r3.xyz = (IN.blendweight.z * r0.xyz) + ((IN.blendweight.x * r3.xyz) + r5.xyz);
    r0.x = dot(Bones[0 + offset.x], IN.normal.xyz);
    r0.y = dot(Bones[1 + offset.x], IN.normal.xyz);
    r0.z = dot(Bones[2 + offset.x], IN.normal.xyz);
    r1.x = dot(r1.xyz, LightDirection[0].xyz);
    r1.y = dot(normalize((r2.w * r2.xyz) + r4.xyz), LightDirection[0].xyz);
    r1.z = dot(normalize((r2.w * r0.xyz) + r3.xyz), LightDirection[0].xyz);
    OUT.texcoord_3.xyz = (0.5 * r1.xyz) + 0.5;	// [-1,+1] to [0,1]
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 105 instruction slots used
