//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2013.vso /Fcshaderdump19/SLS2013.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
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

    const int4 const_4 = {1, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.w = dot(ModelViewProj[3], IN.position);
    r0.x = dot(IN.tangent, LightDirection[0]);
    r1.xyz = EyePosition - IN.position;
    r0.y = dot(IN.binormal, LightDirection[0]);
    r2.x = dot(r1, r1);	// normalize + length
    r0.z = dot(IN.normal, LightDirection[0]);
    r0.w = 1.0 / sqrt(r2.x);
    r2.xyz = (r0.w * r1) + LightDirection[0];
    r1.xyz = normalize(r2);
    r4.xyz = normalize(r0);
    OUT.texcoord_1.xyz = r4;
    r0.x = dot(IN.tangent, r1);
    r0.y = dot(IN.binormal, r1);
    r0.z = dot(IN.normal, r1);
    r1.w = dot(ShadowProj[3], IN.position);
    r1.y = r1.w * ShadowProjTransform.w;
    r4.xyz = normalize(r0);
    OUT.texcoord_3.xyz = r4;
    r0.w = 1.0 / r1.y;
    r1.x = dot(ShadowProj[0], IN.position);
    r1.y = dot(ShadowProj[1], IN.position);
    r2.xy = (r1.w * ShadowProjTransform) + r1;
    r0.x = dot(ModelViewProj[0], IN.position);
    r0.y = dot(ModelViewProj[1], IN.position);
    r0.z = dot(ModelViewProj[2], IN.position);
    r1.xy = r1 - ShadowProjData;
    r3.x = dot(r0, r0);	// normalize + length
    OUT.texcoord_7.xy = r0.w * r2;
    r0.w = 1.0 / sqrt(r3.x);
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    OUT.texcoord_7.z = r1.x * r1.w;
    r0.w = r0.w * r2.w;
    OUT.texcoord_7.w = (r1.y * -r1.w) + const_4.x;
    r0.w = max(r0.w, const_4.y);
    OUT.position.xyz = r0;
    r0.w = min(r0.w, const_4.x);
    OUT.color_1.a = const_4.x - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_0 = IN.color_0;
    OUT.color_1.rgb = FogColor;

// approximately 49 instruction slots used
