//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2012.vso /Fcshaderdump19/STB2012.vso.dis
//
//
// Parameters:
//
//   float4 LightPosition[3];
//   row_major float4x4 ModelViewProj;
//   float4 WindMatrices[16];
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   LightPosition[0] const_16       1
//   LightPosition[1] const_17       1
//   WindMatrices[0]  const_38      4
//   WindMatrices[1]  const_39      4
//   WindMatrices[2]  const_40      4
//   WindMatrices[3]  const_41      4
//

    const float4 const_4 = {0.5, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.blendindices : BLENDINDICES;
    r0.w = frac(IN.blendindices.y);
    r0.w = IN.blendindices.y - r0.w;
    offset.w = r0.w;
    r0.x = dot(WindMatrices[0 + offset.w], IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.w], IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.w], IN.position.xyzw);
    r0.w = dot(WindMatrices[3 + offset.w], IN.position.xyzw);
    r0.x.zw = r0.xy - IN.position.xy;
    r1.xyzw = IN.position.xyzw;
    r0.xyzw = (IN.blendindices.x * r0.xyzw) + r1.xyzw;
    OUT.position.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r1.xyz = LightPosition[0].xyz - r0.xyz;
    r0.xyz = LightPosition[1].xyz - r0.xyz;
    r2.xyz = normalize(r1.xyz);
    OUT.texcoord_1.x = dot(IN.tangent.xyz, r2.xyz);
    OUT.texcoord_1.y = dot(IN.binormal.xyz, r2.xyz);
    OUT.texcoord_1.z = dot(IN.normal.xyz, r2.xyz);
    r0.w = 1.0 / LightPosition[0].w;
    r2.xyz = r1.xyz * r0.w;
    r1.xyz = normalize(r0.xyz);
    OUT.texcoord_4.xyz = (0.5 * r2.xyz) + 0.5;
    OUT.texcoord_2.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, r1.xyz);
    r0.w = 1.0 / LightPosition[1].w;
    OUT.texcoord_2.z = dot(IN.normal.xyz, r1.xyz);
    r0.xyz = r0.xyz * r0.w;
    OUT.texcoord_5.xyz = (0.5 * r0.xyz) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_5.w = 0.5;

// approximately 37 instruction slots used
