//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2006.vso /Fcshaderdump19/SKIN2006.vso.dis
//
//
// Parameters:

float4 EyePosition;
float3 FogColor;
float4 FogParam;
float3 LightDirection[3];
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
//   LightDirection[0]      const_13       1
//   LightPosition[0]       const_16       1
//   LightPosition[1]       const_17       1
//   FogParam            const_23      1
//   FogColor            const_24      1
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
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float4 texcoord_4 : TEXCOORD4;
    float3 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 1, 0, 0};

    float4 r0;
    float4 r1;
    float3 r2;

    r0.w = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    r0.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r0.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r0.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_1.xyz = normalize(r0.xyz);
    r0.xyz = LightPosition[1].xyz - IN.position.xyz;
    r2.xyz = normalize(EyePosition.xyz - IN.position.xyz);
    r1.x = dot(IN.tangent.xyz, r2.xyz);
    r1.y = dot(IN.binormal.xyz, r2.xyz);
    r1.z = dot(IN.normal.xyz, r2.xyz);
    OUT.texcoord_6.xyz = r1.xyz * (1.0 / length(r1.xyz));
    r1.xyz = normalize(r0.xyz);
    r0.xyz = r0.xyz / LightPosition[1].w;
    OUT.texcoord_2.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, r1.xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, r1.xyz);
    OUT.texcoord_4.xyz = (0.5 * r0.xyz) + 0.5;	// [-1,+1] to [0,1]
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r1.x = dot(ShadowProj[0].xyzw, IN.position.xyzw);
    r1.y = dot(ShadowProj[1].xyzw, IN.position.xyzw);
    OUT.texcoord_7.xy = (1.0 / (r0.w * ShadowProjTransform.w)) * ((r0.w * ShadowProjTransform.xy) + r1.xy);
    r1.w = 1.0 / ShadowProjData.w;
    r1.xy = r1.xy - ShadowProjData.xy;
    OUT.texcoord_7.z = r1.x * r1.w;
    OUT.texcoord_7.w = (r1.y * -r1.w) + 1;
    OUT.position.xyz = r0.xyz;
    OUT.color_1.a = 1 - saturate((FogParam.x - length(r0.xyz)) / FogParam.y);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.w = 0.5;
    OUT.color_0.rgba = IN.color_0.rgba;
    OUT.color_1.rgb = FogColor.rgb;

    return OUT;
};

// approximately 56 instruction slots used
