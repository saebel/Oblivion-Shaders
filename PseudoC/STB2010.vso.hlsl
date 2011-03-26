//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2010.vso /Fcshaderdump19/STB2010.vso.dis
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
//   float4 WindMatrices[16];
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//   LightPosition[0]  const_16       1
//   LightPosition[1]  const_17       1
//   FogParam       const_23      1
//   FogColor       const_24      1
//   EyePosition    const_25      1
//   WindMatrices[0]   const_38      4
//   WindMatrices[1]   const_39      4
//   WindMatrices[2]   const_40      4
//   WindMatrices[3]   const_41      4
//

    const float4 const_4 = {0.5, 0, 1, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.blendindices : BLENDINDICES;
    r0.w = frac(IN.blendindices.y);
    r0.w = IN.blendindices.y - r0.w;
    offset.w = r0.w;
    r0.x = dot(WindMatrices[0 + offset.w], IN.position);
    r0.y = dot(WindMatrices[1 + offset.w], IN.position);
    r0.z = dot(WindMatrices[2 + offset.w], IN.position);
    r0.w = dot(WindMatrices[3 + offset.w], IN.position);
    r0 = r0 - IN.position;
    r1 = IN.position;
    r0 = (IN.blendindices.x * r0) + r1;
    OUT.position.w = dot(ModelViewProj[3], r0);
    r1.xyz = EyePosition - r0;
    r3.x = dot(IN.tangent, LightDirection[0]);
    r2.x = dot(r1, r1);	// normalize + length
    r3.y = dot(IN.binormal, LightDirection[0]);
    r1.w = 1.0 / sqrt(r2.x);
    r3.z = dot(IN.normal, LightDirection[0]);
    r2.xyz = (r1.w * r1) + LightDirection[0];
    r4.xyz = normalize(r2);
    r2.x = dot(IN.tangent, r4);
    r2.y = dot(IN.binormal, r4);
    r2.z = dot(IN.normal, r4);
    r4.xyz = normalize(r3);
    OUT.texcoord_1.xyz = r4;
    r3.x = dot(r2, r2);	// normalize + length
    r2.w = 1.0 / sqrt(r3.x);
    r3.xyz = LightPosition[1] - r0;
    OUT.texcoord_3.xyz = r2 * r2.w;
    r2.xyz = normalize(r3);
    OUT.texcoord_2.x = dot(IN.tangent, r2);
    OUT.texcoord_2.y = dot(IN.binormal, r2);
    OUT.texcoord_2.z = dot(IN.normal, r2);
    r2.xyz = (r1.w * r1) + r2;
    r1.w = 1.0 / LightPosition[1].w;
    r1.x = dot(ModelViewProj[0], r0);
    r1.y = dot(ModelViewProj[1], r0);
    r1.z = dot(ModelViewProj[2], r0);
    r0.xyz = r3 * r1.w;
    r3.x = dot(r1, r1);	// normalize + length
    OUT.texcoord_5.xyz = (0.5 * r0) + 0.5;
    r0.w = 1.0 / sqrt(r3.x);
    r0.xyz = normalize(r2);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    OUT.texcoord_4.x = dot(IN.tangent, r0);
    r0.w = r0.w * r1.w;
    OUT.texcoord_4.y = dot(IN.binormal, r0);
    r0.w = max(r0.w, 0);
    OUT.texcoord_4.z = dot(IN.normal, r0);
    r0.w = min(r0.w, 1);
    OUT.position.xyz = r1;
    OUT.color_1.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_5.w = 0.5;
    OUT.color_0 = (IN.blendindices.z * const_4.zzzy) + const_4.yyyz;
    OUT.color_1.rgb = FogColor;

// approximately 65 instruction slots used
