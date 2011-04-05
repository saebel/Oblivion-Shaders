//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3016.vso /Fcshaderdump19/SM3016.vso.dis
//
//
// Parameters:

float4 Bones[54];
float4 FogColor;
float4 FogParam;
row_major float4x4 ObjToCubeMap;
row_major float4x4 SkinModelViewProj;


// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_1        1
//   SkinModelViewProj[1] const_2        1
//   SkinModelViewProj[2] const_3        1
//   SkinModelViewProj[3] const_4        1
//   ObjToCubeMap[0]      const_10       1
//   ObjToCubeMap[1]      const_11       1
//   ObjToCubeMap[2]      const_12       1
//   ObjToCubeMap[3]      const_13       1
//   FogParam          const_15      1
//   FogColor          const_16      1
//   Bones[0]             const_31      18
//   Bones[1]             const_32      18
//   Bones[2]             const_33      18
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
    float3 texcoord_6 : TEXCOORD6;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_0 = {1, 765.01001, 0, 0};

    float4 offset;
    float4 r0;
    float3 r1;
    float3 r2;

    offset.xyzw = (765.01001 * IN.blendindices.zyxw) - frac(765.01001 * IN.blendindices.zyxw);
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
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.w], r0.xyzw);
    r1.y = dot(Bones[1 + offset.w], r0.xyzw);
    r1.z = dot(Bones[2 + offset.w], r0.xyzw);
    r0.w = 1;
    r0.xyz = ((1 - dot(IN.blendweight.xyz, 1)) * r1.xyz) + r2.xyz;
    r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = r1.xyz;
    OUT.texcoord_2.w = (1 - saturate((FogParam.x - length(r1.xyz)) / FogParam.y)) * FogParam.z;
    OUT.texcoord_1.x = dot(ObjToCubeMap[0].xyzw, r0.xyzw);
    OUT.texcoord_1.y = dot(ObjToCubeMap[1].xyzw, r0.xyzw);
    OUT.texcoord_1.z = dot(ObjToCubeMap[2].xyzw, r0.xyzw);
    OUT.texcoord_1.w = dot(ObjToCubeMap[3].xyzw, r0.xyzw);
    OUT.texcoord_6.xyz = r0.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.xyz = FogColor.rgb;

    return OUT;
};

// approximately 44 instruction slots used
