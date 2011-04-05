//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2032.vso /Fcshaderdump19/PAR2032.vso.dis
//
//
// Parameters:

float4 EyePosition;
float3 LightDirection[3];
row_major float4x4 ModelViewProj;
row_major float4x4 ShadowProj;
float4 ShadowProjData;
float4 ShadowProjTransform;


// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   ModelViewProj[0]       const_0        1
//   ModelViewProj[1]       const_1        1
//   ModelViewProj[2]       const_2        1
//   ModelViewProj[3]       const_3        1
//   LightDirection[0]      const_13       1
//   EyePosition         const_25      1
//   ShadowProj[0]          const_28       1
//   ShadowProj[1]          const_29       1
//   ShadowProj[2]          const_30       1
//   ShadowProj[3]          const_31       1
//   ShadowProjData      const_32      1
//   ShadowProjTransform const_33      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_4 = {1, 0, 0, 0};

    float4 r0;
    float3 r1;
    float3 r2;

    r0.xyz = EyePosition.xyz - IN.position.xyz;
    r0.w = 1.0 / length(r0.xyz);
    r1.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r1.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r1.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_1.xyz = normalize(r1.xyz);
    r1.xyz = normalize((r0.w * r0.xyz) + LightDirection[0].xyz);
    r2.xyz = r0.xyz * r0.w;
    r0.w = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    r0.x = dot(IN.tangent.xyz, r2.xyz);
    r0.y = dot(IN.binormal.xyz, r2.xyz);
    r0.z = dot(IN.normal.xyz, r2.xyz);
    OUT.texcoord_3.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, r1.xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, r1.xyz);
    OUT.texcoord_7.xyz = normalize(r0.xyz);
    r0.x = dot(ShadowProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ShadowProj[1].xyzw, IN.position.xyzw);
    OUT.texcoord_6.xy = ((r0.w * ShadowProjTransform.xy) + r0.xy) / (r0.w * ShadowProjTransform.w);
    r0.w = 1.0 / ShadowProjData.w;
    r0.xy = r0.xy - ShadowProjData.xy;
    OUT.texcoord_6.z = r0.x * r0.w;
    OUT.texcoord_6.w = (r0.y * -r0.w) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 40 instruction slots used
