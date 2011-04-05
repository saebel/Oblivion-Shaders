//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1007.vso /Fcshaderdump19/STB1007.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 LightDirection[3];
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
//   EyePosition    const_25      1
//   WindMatrices[0]   const_38      4
//   WindMatrices[1]   const_39      4
//   WindMatrices[2]   const_40      4
//   WindMatrices[3]   const_41      4
//

    const float4 const_4 = {0.5, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.blendindices : BLENDINDICES;
    offset.x = IN.blendindices.y;
    r0.x = dot(WindMatrices[0 + offset.x], IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.x], IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.x], IN.position.xyzw);
    r0.w = dot(WindMatrices[3 + offset.x], IN.position.xyzw);
    r0.xyzw = r0.xyzw - IN.position.xyzw;
    r1.xyzw = IN.position.xyzw;
    r0.xyzw = (IN.blendindices.x * r0.xyzw) + r1.xyzw;
    r1.xyz = EyePosition.xyz - r0.xyz;
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r2.x);
    r1.xyz = (r1.w * r1.xyz) + LightDirection[0].xyz;
    OUT.position.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    OUT.position.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r1.w = 1.0 / sqrt(r2.x);
    OUT.position.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r1.xyz = r1.xyz * r1.w;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r0.x = dot(IN.tangent.xyz, r1.xyz);
    r0.y = dot(IN.binormal.xyz, r1.xyz);
    r0.z = dot(IN.normal.xyz, r1.xyz);
    OUT.texcoord_1.xyz = (0.5 * r0.xyz) + 0.5;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

// approximately 24 instruction slots used
