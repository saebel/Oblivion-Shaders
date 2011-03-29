//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2023.vso /Fcshaderdump19/PAR2023.vso.dis
//
//
// Parameters:

float4 Bones[54];
float4 EyePosition;
float3 LightDirection[3];
float4 LightPosition[3];
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
//   LightPosition[0]       const_16       1
//   LightPosition[1]       const_17       1
//   LightPosition[2]       const_18       1
//   EyePosition         const_25      1
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
    float3 blendweight : BLENDWEIGHT;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_0 = {1, 765.01001, 0, 0.5};

    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_4.xyz = (0.5 * r3) + 0.5;
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_5.xyz = (0.5 * r1) + 0.5;
    r1.xyzw = (IN.blendindices.zyxw * 765.01001) - r0;
    offset.xyzw = r1.xyzw;
    r0.xyzw = IN.blendindices.zyxw * 765.01001;
    r0.xyzw = frac(r0);
    r0.xyzw = (IN.position.xyzx * const_0.xxxz) + const_0.zzzx;
    r2.x = dot(IN.blendweight.xyz, 1.xyz);
    r1.w = 1 - r2.x;
    r1.x = dot(Bones[0 + offset.y].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.y].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.y].xyzw, r0.xyzw);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.x].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.x].xyzw, r0.xyzw);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.z].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.z].xyzw, r0.xyzw);
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.w].xyzw, r0.xyzw);
    r1.y = dot(Bones[1 + offset.w].xyzw, r0.xyzw);
    r1.z = dot(Bones[2 + offset.w].xyzw, r0.xyzw);
    r0.w = 1;
    r0.xyz = (r1.w * r1.xyz) + r2.xyz;
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    OUT.position.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r1.x = dot(Bones[0 + offset.y].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.y].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.y].xyz, IN.tangent.xyz);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(Bones[0 + offset.x].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.x].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.x].xyz, IN.tangent.xyz);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.z].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.z].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.z].xyz, IN.tangent.xyz);
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(Bones[0 + offset.w].xyz, IN.tangent.xyz);
    r1.y = dot(Bones[1 + offset.w].xyz, IN.tangent.xyz);
    r1.z = dot(Bones[2 + offset.w].xyz, IN.tangent.xyz);
    r1.xyz = (r1.w * r1.xyz) + r2.xyz;
    r4.xyz = normalize(r6);
    r1.y = dot(r4.xyz, LightDirection[0].xyz);
    r2.x = dot(Bones[0 + offset.y].xyz, IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.y].xyz, IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.y].xyz, IN.binormal.xyz);
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x].xyz, IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.x].xyz, IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.x].xyz, IN.binormal.xyz);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.z].xyz, IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.z].xyz, IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.z].xyz, IN.binormal.xyz);
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.w].xyz, IN.binormal.xyz);
    r2.y = dot(Bones[1 + offset.w].xyz, IN.binormal.xyz);
    r2.z = dot(Bones[2 + offset.w].xyz, IN.binormal.xyz);
    r5.xyz = normalize(r1);
    r6.xyz = (r1.w * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.y].xyz, IN.normal.xyz);
    r2.y = dot(Bones[1 + offset.y].xyz, IN.normal.xyz);
    r2.z = dot(Bones[2 + offset.y].xyz, IN.normal.xyz);
    r3.xyz = r2.xyz * IN.blendweight.y;
    r2.x = dot(Bones[0 + offset.x].xyz, IN.normal.xyz);
    r2.y = dot(Bones[1 + offset.x].xyz, IN.normal.xyz);
    r2.z = dot(Bones[2 + offset.x].xyz, IN.normal.xyz);
    r3.xyz = (IN.blendweight.x * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.z].xyz, IN.normal.xyz);
    r2.y = dot(Bones[1 + offset.z].xyz, IN.normal.xyz);
    r2.z = dot(Bones[2 + offset.z].xyz, IN.normal.xyz);
    r3.xyz = (IN.blendweight.z * r2.xyz) + r3.xyz;
    r2.x = dot(Bones[0 + offset.w].xyz, IN.normal.xyz);
    r2.y = dot(Bones[1 + offset.w].xyz, IN.normal.xyz);
    r2.z = dot(Bones[2 + offset.w].xyz, IN.normal.xyz);
    r3.xyz = (r1.w * r2.xyz) + r3.xyz;
    r2.xyz = normalize(r3);
    r3.xyz = EyePosition.xyz - r0.xyz;
    r6.xyz = normalize(r3);
    r3.x = dot(r5.xyz, r6.xyz);
    r3.y = dot(r4.xyz, r6.xyz);
    r3.z = dot(r2.xyz, r6.xyz);
    r6.xyz = normalize(r1);
    OUT.texcoord_1.xyz = r6.xyz;
    r1.x = dot(r5.xyz, LightDirection[0].xyz);
    r1.x = dot(r3.xyz, r3.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r1.x);
    OUT.texcoord_7.xyz = r3.xyz * r1.w;
    r1.w = 1.0 / LightPosition[1].w;
    r1.z = dot(r2.xyz, LightDirection[0].xyz);
    r3.xyz = normalize(r1);
    OUT.texcoord_2.x = dot(r5.xyz, r3.xyz);
    OUT.texcoord_2.y = dot(r4.xyz, r3.xyz);
    OUT.texcoord_2.z = dot(r2.xyz, r3.xyz);
    r1.xyz = LightPosition[1].xyz - r0.xyz;
    r3.xyz = r1.xyz * r1.w;
    r1.w = 1.0 / LightPosition[2].w;
    r3.xyz = normalize(r1);
    OUT.texcoord_3.x = dot(r5.xyz, r3.xyz);
    OUT.texcoord_3.y = dot(r4.xyz, r3.xyz);
    OUT.texcoord_3.z = dot(r2.xyz, r3.xyz);
    r1.xyz = LightPosition[2].xyz - r0.xyz;
    r1.xyz = r1.xyz * r1.w;
    r2.x = dot(ShadowProj[0].xyzw, r0.xyzw);
    r2.y = dot(ShadowProj[1].xyzw, r0.xyzw);
    r0.w = dot(ShadowProj[3].xyzw, r0.xyzw);
    r0.xy = r2.xy - ShadowProjData.xy;
    r1.xy = (r0.w * ShadowProjTransform.xy) + r2.xy;
    r2.y = r0.w * ShadowProjTransform.w;
    r0.w = 1.0 / ShadowProjData.w;
    OUT.texcoord_6.w = (r0.y * -r0.w) + 1;
    OUT.texcoord_6.z = r0.x * r0.w;
    r1.w = 1.0 / r2.y;
    OUT.texcoord_6.xy = r1.xy * r1.w;

    return OUT;
};

// approximately 136 instruction slots used
