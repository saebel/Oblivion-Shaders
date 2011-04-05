//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2050.vso /Fcshaderdump19/SLS2050.vso.dis
//
//
// Parameters:

float4 EyePosition;
float4 LightPosition[3];
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
//   LightPosition[0]       const_16       1
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
    float4 color_0 : COLOR0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_4 : TEXCOORD4;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 1, 0, 0};

    float4 r0;
    float3 r1;
    float3 r2;
    float3 r3;

    r0.w = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    r2.xyz = normalize(LightPosition[0].xyz - IN.position.xyz);
    r1.xyz = normalize(normalize(EyePosition.xyz - IN.position.xyz) + r2.xyz);
    r0.x = dot(IN.tangent.xyz, r1.xyz);
    r0.y = dot(IN.binormal.xyz, r1.xyz);
    r0.z = dot(IN.normal.xyz, r1.xyz);
    r3.x = dot(IN.tangent.xyz, r2.xyz);
    r3.y = dot(IN.binormal.xyz, r2.xyz);
    r3.z = dot(IN.normal.xyz, r2.xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_2.xyz = (0.5 * normalize(r3.xyz)) + 0.5;	// [-1,+1] to [0,1]
    OUT.texcoord_3.xyz = (0.5 * r0.xyz) + 0.5;	// [-1,+1] to [0,1]
    r0.x = dot(ShadowProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ShadowProj[1].xyzw, IN.position.xyzw);
    OUT.texcoord_4.xy = ((r0.w * ShadowProjTransform.xy) + r0.xy) / (r0.w * ShadowProjTransform.w);
    r0.w = 1.0 / ShadowProjData.w;
    r0.xy = r0.xy - ShadowProjData.xy;
    OUT.texcoord_4.z = r0.x * r0.w;
    OUT.texcoord_4.w = (r0.y * -r0.w) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyz = IN.color_0.rgb;
    OUT.texcoord_2.w = 1;

    return OUT;
};

// approximately 40 instruction slots used
