//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1S020.vso /Fcshaderdump19/SLS1S020.vso.dis
//
//
// Parameters:

float4 Bones[54];
row_major float4x4 SkinModelViewProj;


// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_1        1
//   SkinModelViewProj[1] const_2        1
//   SkinModelViewProj[2] const_3        1
//   SkinModelViewProj[3] const_4        1
//   Bones[0]             const_42      18
//   Bones[1]             const_43      18
//   Bones[2]             const_44      18
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_0 = {1, 765.01001, 0, 0};

    float1 offset;
    float4 r0;
    float4 r1;
    float3 r2;
    float3 r3;

    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    offset.x = r0.y;
    r1.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    offset.x = r0.x;
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x], r1.xyzw);
    r2.y = dot(Bones[1 + offset.x], r1.xyzw);
    r2.z = dot(Bones[2 + offset.x], r1.xyzw);
    offset.x = r0.z;
    r0.x = dot(Bones[0 + offset.x], r1.xyzw);
    r0.y = dot(Bones[1 + offset.x], r1.xyzw);
    r0.z = dot(Bones[2 + offset.x], r1.xyzw);
    offset.x = r0.w;
    r0.w = 1;
    r2.xyz = (IN.blendweight.z * r0.xyz) + ((IN.blendweight.x * r2.xyz) + r3.xyz);
    r0.x = dot(Bones[0 + offset.x], r1.xyzw);
    r0.y = dot(Bones[1 + offset.x], r1.xyzw);
    r0.z = dot(Bones[2 + offset.x], r1.xyzw);
    r0.xyz = ((1 - dot(IN.blendweight.xyz, 1)) * r0.xyz) + r2.xyz;
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 31 instruction slots used
