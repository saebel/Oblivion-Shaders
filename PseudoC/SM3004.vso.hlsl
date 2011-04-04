//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3004.vso /Fcshaderdump19/SM3004.vso.dis
//
//
// Parameters:
//
//   float4 FogColor;
//   float4 FogParam;
//   row_major float4x4 ModelViewProj;
//   row_major float4x4 ShadowProj;
//   float4 ShadowProjData;
//   float4 ShadowProjTransform;
//
//
// Registers:
//
//   Name                Reg   Size
//   ------------------- ----- ----
//   ModelViewProj[0]       const_0        1
//   ModelViewProj[1]       const_1        1
//   ModelViewProj[2]       const_2        1
//   ModelViewProj[3]       const_3        1
//   FogParam            const_15      1
//   FogColor            const_16      1
//   ShadowProj[0]          const_21       1
//   ShadowProj[1]          const_22       1
//   ShadowProj[2]          const_23       1
//   ShadowProj[3]          const_24       1
//   ShadowProjData      const_25      1
//   ShadowProjTransform const_26      1
//

    const int4 const_4 = {1, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 OUT.position : POSITION;
    float2 OUT.texcoord_0 : TEXCOORD0;
    float4 OUT.color_0 : COLOR0;
    float3 OUT.texcoord_3 : TEXCOORD3;
    float3 OUT.texcoord_4 : TEXCOORD4;
    float3 OUT.texcoord_5 : TEXCOORD5;
    float3 OUT.texcoord_6 : TEXCOORD6;
    float4 OUT.texcoord_1 : TEXCOORD1;
    float4 OUT.texcoord_7 : TEXCOORD7;
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r0.w = dot(r0.xyz, r0.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r0.w);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    OUT.position.xyz = r0.xyz;
    r0.w = saturate(r0.w * r1.w);
    r0.z = 1 - r0.w;
    r0.w = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_7.w = r0.z * FogParam.z;
    r0.xyz = r0.w * ShadowProjTransform.xyw;
    r2.x = dot(ShadowProj[0].xyzw, IN.position.xyzw);
    r2.y = dot(ShadowProj[1].xyzw, IN.position.xyzw);
    r0.z = 1.0 / r0.z;
    r1.xy = r0.xy + r2.xy;
    r0.xy = r2.xy - ShadowProjData.xy;
    r0.w = 1.0 / ShadowProjData.w;
    OUT.texcoord_1.xy = r0.z * r1.xy;
    OUT.texcoord_1.z = r0.x * r0.w;
    OUT.texcoord_1.w = (r0.y * -r0.w) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = 1;
    OUT.texcoord_3.xyz = IN.tangent.xyz;
    OUT.texcoord_4.xyz = IN.binormal.xyz;
    OUT.texcoord_5.xyz = IN.normal.xyz;
    OUT.texcoord_6.xyz = IN.position.xyz;
    OUT.texcoord_7.xyz = FogColor.rgb;

// approximately 31 instruction slots used
