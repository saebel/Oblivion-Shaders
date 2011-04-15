//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2005.vso /Fcshaderdump19/STB2005.vso.dis
//
//
// Parameters:
//
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
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
//   FogParam            const_23      1
//   FogColor            const_24      1
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

    const int4 const_4 = {1, 0, 0, 0};
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
    r2.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r2.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r2.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r1.xyzw = IN.position.xyzw;
    r0.xyzw = (IN.blendindices.x * r0.xyzw) + r1.xyzw;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r5.xyz = normalize(r2.xyz);
    OUT.texcoord_1.xyz = r5.xyz;
    r1.x = dot(ShadowProj[0].xyzw, r0.xyzw);
    r1.y = dot(ShadowProj[1].xyzw, r0.xyzw);
    r1.w = dot(ShadowProj[3].xyzw, r0.xyzw);
    r3.xy = (r1.w * ShadowProjTransform.xy) + r1.xy;
    r2.xy = r1.xy - ShadowProjData.xy;
    r4.y = r1.w * ShadowProjTransform.w;
    r1.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r0.w = 1.0 / r4.y;
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    OUT.texcoord_7.xy = r3.xy * r0.w;
    r0.w = 1.0 / sqrt(r0.x);
    r1.w = 1.0 / ShadowProjData.w;
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r2.w = 1.0 / FogParam.y;
    OUT.texcoord_7.z = r2.x * r1.w;
    r0.w = r0.w * r2.w;
    OUT.texcoord_7.w = (r2.y * -r1.w) + 1;
    r0.w = max(r0.w, 0);
    OUT.position.xyz = r1.xyz;
    r0.w = min(r0.w, 1);
    OUT.color_1.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = (IN.blendindices.z * const_4.xxxy) + const_4.yyyx;
    OUT.color_1.rgb = FogColor.rgb;

// approximately 45 instruction slots used
