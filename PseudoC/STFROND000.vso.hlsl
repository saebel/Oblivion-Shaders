//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STFROND000.vso /Fcshaderdump19/STFROND000.vso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   float4 DiffColor;
//   float4 LightVector;
//   row_major float4x4 ModelViewProj;
//   float SunDimmer;
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
//   AmbientColor  const_5       1
//   DiffColor     const_6       1
//   LightVector   const_8       1
//   SunDimmer     const_16      1
//   WindMatrices[0]  const_18      4
//   WindMatrices[1]  const_19      4
//   WindMatrices[2]  const_20      4
//   WindMatrices[3]  const_21      4
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float4 IN.blendindices : BLENDINDICES;
    offset.x = IN.blendindices.y;
    r0.x = dot(WindMatrices[0 + offset.x].xyzw, IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.x].xyzw, IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.x].xyzw, IN.position.xyzw);
    r0.w = dot(WindMatrices[3 + offset.x].xyzw, IN.position.xyzw);
    r0.xyzw = r0.xyzw - IN.position.xyzw;
    r1.xyzw = IN.position.xyzw;
    r0.xyzw = (IN.blendindices.x * r0.xyzw) + r1.xyzw;
    r1.x = dot(IN.normal.xyz, LightVector.xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r1.w = max(r1.x, 0);
    OUT.position.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r1.w = min(r1.w, 1);
    OUT.position.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r1.xyz = r1.w * DiffColor.rgb;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r0.w = SunDimmer.x;
    r0.xyz = (r0.w * r1.xyz) + AmbientColor.rgb;
    OUT.texcoord_1.xyz = r0.xyz * IN.color_0.rgb;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

// approximately 20 instruction slots used