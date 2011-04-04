//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB1009.vso /Fcshaderdump19/STB1009.vso.dis
//
//
// Parameters:
//
//   float3 FogColor;
//   float4 FogParam;
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
//   FogParam      const_23      1
//   FogColor      const_24      1
//   WindMatrices[0]  const_38      4
//   WindMatrices[1]  const_39      4
//   WindMatrices[2]  const_40      4
//   WindMatrices[3]  const_41      4
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.blendindices : BLENDINDICES;
    offset.x = IN.blendindices.y;
    r0.x = dot(WindMatrices[0 + offset.x], IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.x], IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.x], IN.position.xyzw);
    r0.w = dot(WindMatrices[3 + offset.x], IN.position.xyzw);
    r0.x.zw = r0.xy - IN.position.xy;
    r1.xyzw = IN.position.xyzw;
    r0.xyzw = (IN.blendindices.x * r0.xyzw) + r1.xyzw;
    r1.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r2.x);
    r1.w = 1.0 / r1.w;
    r1.w = FogParam.x - r1.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = r1.w * r2.w;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r0.w = max(r1.w, 0);
    OUT.position.xyz = r1.xyz;
    r0.w = min(r0.w, 1);
    OUT.color_0.a = 1 - r0.w;
    OUT.color_0.rgb = FogColor.rgb;

// approximately 23 instruction slots used
