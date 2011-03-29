//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2006.vso /Fcshaderdump19/SKIN2006.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
//   float4 LightPosition[3];
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

    const float4 const_4 = {0.5, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r0.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r0.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r1.xyz = EyePosition.xyz - IN.position;
    r2.xyz = normalize(r1);
    r1.x = dot(IN.tangent.xyz, r2.xyz);
    r1.y = dot(IN.binormal.xyz, r2.xyz);
    r1.z = dot(IN.normal.xyz, r2.xyz);
    r4.xyz = normalize(r0);
    OUT.texcoord_1.xyz = r4.xyz;
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r0.x);
    r0.xyz = LightPosition[1].xyz - IN.position;
    OUT.texcoord_6.xyz = r1.xyz * r0.w;
    r1.xyz = normalize(r0);
    OUT.texcoord_2.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, r1.xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, r1.xyz);
    r0.w = 1.0 / LightPosition[1].w;
    r0.xyz = r0.xyz * r0.w;
    r0.w = dot(ShadowProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_4.xyz = (0.5 * r0) + 0.5;
    r0.y = r0.w * ShadowProjTransform.w;
    r1.w = 1.0 / r0.y;
    r1.x = dot(ShadowProj[0].xyzw, IN.position.xyzw);
    r1.y = dot(ShadowProj[1].xyzw, IN.position.xyzw);
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r2.xy = (r0.w * ShadowProjTransform.xy) + r1.xy;
    r3.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r1.xy = r1.xy - ShadowProjData.xy;
    r0.w = 1.0 / sqrt(r3.x);
    OUT.texcoord_7.xy = r1.w * r2.xy;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = r0.w * r2.w;
    OUT.texcoord_7.z = r1.x * r1.w;
    r0.w = max(r0.w, 0);
    OUT.texcoord_7.w = (r1.y * -r1.w) + 1;
    r0.w = min(r0.w, 1);
    OUT.position.xyz = r0.xyz;
    OUT.color_1.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4.w = 0.5;
    OUT.color_0.rgba = IN.color_0;
    OUT.color_1.rgb = FogColor.rgb;

// approximately 56 instruction slots used
