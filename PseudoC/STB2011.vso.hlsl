//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2011.vso /Fcshaderdump19/STB2011.vso.dis
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
//   float4 WindMatrices[16];
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
//   WindMatrices[0]        const_38      4
//   WindMatrices[1]        const_39      4
//   WindMatrices[2]        const_40      4
//   WindMatrices[3]        const_41      4
//

    const float4 const_4 = {0.5, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.blendindices : BLENDINDICES;
    r0.w = frac(IN.blendindices.y);
    r0.w = IN.blendindices.y - r0.w;
    offset.w = r0.w;
    r0.x = dot(WindMatrices[0 + offset.w].xyzw, IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.w].xyzw, IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.w].xyzw, IN.position.xyzw);
    r0.w = dot(WindMatrices[3 + offset.w].xyzw, IN.position.xyzw);
    r0.xyzw = r0.xyzw - IN.position.xyzw;
    r1.xyzw = IN.position.xyzw;
    r0.xyzw = (IN.blendindices.x * r0.xyzw) + r1.xyzw;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r3.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r2.xyz = EyePosition.xyz - r0.xyz;
    r3.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r1.x = dot(r2.xyz, r2.xyz);	// normalize + length
    r3.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r1.w = 1.0 / sqrt(r1.x);
    r1.x = dot(r3.xyz, r3.xyz);	// normalize + length
    r4.xyz = (r1.w * r2.xyz) + LightDirection[0].xyz;
    r2.w = 1.0 / sqrt(r1.x);
    r1.xyz = normalize(r4.xyz);
    OUT.texcoord_1.xyz = r3.xyz * r2.w;
    r4.x = dot(IN.tangent.xyz, r1.xyz);
    r4.y = dot(IN.binormal.xyz, r1.xyz);
    r4.z = dot(IN.normal.xyz, r1.xyz);
    r3.x = dot(r4.xyz, r4.xyz);	// normalize + length
    r1.xyz = LightPosition[1].xyz - r0.xyz;
    r2.w = 1.0 / sqrt(r3.x);
    r3.xyz = normalize(r1.xyz);
    OUT.texcoord_3.xyz = r4.xyz * r2.w;
    OUT.texcoord_2.x = dot(IN.tangent.xyz, r3.xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, r3.xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, r3.xyz);
    r3.xyz = (r1.w * r2.xyz) + r3.xyz;
    r1.w = 1.0 / LightPosition[1].w;
    r2.xyz = r1.xyz * r1.w;
    r1.xyz = normalize(r3.xyz);
    OUT.texcoord_5.xyz = (0.5 * r2.xyz) + 0.5;
    OUT.texcoord_4.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_4.y = dot(IN.binormal.xyz, r1.xyz);
    r2.x = dot(ShadowProj[0].xyzw, r0.xyzw);
    r2.y = dot(ShadowProj[1].xyzw, r0.xyzw);
    r1.w = dot(ShadowProj[3].xyzw, r0.xyzw);
    OUT.texcoord_4.z = dot(IN.normal.xyz, r1.xyz);
    r3.xy = (r1.w * ShadowProjTransform.xy) + r2.xy;
    r2.xy = r2.xy - ShadowProjData.xy;
    r1.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r0.y = r1.w * ShadowProjTransform.w;
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r1.w = 1.0 / r0.y;
    r0.w = 1.0 / sqrt(r0.x);
    OUT.texcoord_7.xy = r3.xy * r1.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = r0.w * r2.w;
    OUT.texcoord_7.z = r2.x * r1.w;
    r0.w = max(r0.w, 0);
    OUT.texcoord_7.w = (r2.y * -r1.w) + 1;
    r0.w = min(r0.w, 1);
    OUT.position.xyz = r1.xyz;
    OUT.color_1.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_5.w = 0.5;
    OUT.color_0.rgba = (IN.blendindices.z * const_4.yyyz) + const_4.zzzy;
    OUT.color_1.rgb = FogColor.rgb;

// approximately 75 instruction slots used
