//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2017.vso /Fcshaderdump19/STB2017.vso.dis
//
//
// Parameters:
//
//   float4 FogParam;
//   float4 LightPosition[3];
//   row_major float4x4 ModelViewProj;
//   row_major float4x4 ObjToCubeSpace;
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
//   ObjToCubeSpace const_8       4
//   LightPosition[0]  const_16       1
//   FogParam       const_23      1
//   WindMatrices[0]   const_38      4
//   WindMatrices[1]   const_39      4
//   WindMatrices[2]   const_40      4
//   WindMatrices[3]   const_41      4
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
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
    r1.x = dot(ModelViewProj[0], r0);
    r1.y = dot(ModelViewProj[1], r0);
    r1.z = dot(ModelViewProj[2], r0);
    OUT.texcoord_1.x = dot(ObjToCubeSpace, r0);
    r2.x = dot(r1, r1);	// normalize + length
    OUT.texcoord_1.y = dot(const_9, r0);
    r1.w = 1.0 / sqrt(r2.x);
    OUT.texcoord_1.z = dot(const_10, r0);
    r1.w = 1.0 / r1.w;
    r1.w = FogParam.x - r1.w;
    r2.w = 1.0 / FogParam.y;
    OUT.texcoord_1.w = dot(const_11, r0);
    r0.w = r1.w * r2.w;
    OUT.texcoord_6.xyz = r0;
    r0.w = max(r0.w, const_4.x);
    OUT.position.xyz = r1;
    r0.w = min(r0.w, const_4.y);
    OUT.texcoord_3.w = const_4.y - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_2 = LightPosition[0];
    OUT.texcoord_3.xyz = const_4.x;

// approximately 32 instruction slots used
