//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STFROND002.vso /Fcshaderdump19/STFROND002.vso.dis
//
//
// Parameters:
//
//   float4 AmbientColor;
//   float4 DiffColor;
//   float4 DiffColorPt;
//   float4 LightPos;
//   float4 LightRadius;
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
//   DiffColorPt   const_7       1
//   LightPos      const_9       1
//   LightRadius   const_10      1
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
    r0.x = dot(WindMatrices[0 + offset.x], IN.position.xyzw);
    r0.y = dot(WindMatrices[1 + offset.x], IN.position.xyzw);
    r0.z = dot(WindMatrices[2 + offset.x], IN.position.xyzw);
    r0.w = dot(WindMatrices[3 + offset.x], IN.position.xyzw);
    r0.xyzw = r0.xyzw - IN.position.xyzw;
    r1.xyzw = IN.position.xyzw;
    r0.xyzw = (IN.blendindices.x * r0.xyzw) + r1.xyzw;
    OUT.position.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r1.xyz = LightPos.xyz - r0.xyz;
    OUT.position.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r2.x = dot(r1.xyz, r1.xyz);	// normalize + length
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r0.w = 1.0 / sqrt(r2.x);
    r0.xyz = r1.xyz * r0.w;
    r0.w = 1.0 / r0.w;
    r0.x = dot(IN.normal.xyz, r0.xyz);
    r2.w = 1.0 / LightRadius.x;
    r1.w = max(r0.x, 0);
    r0.w = r0.w * r2.w;
    r1.w = min(r1.w, 1);
    r0.w = max(r0.w, 0);
    r1.xyz = r1.w * DiffColorPt.xyz;
    r0.w = min(r0.w, 1);
    r0.xyz = r1.w * DiffColor.rgb;
    r0.w = 1.0 - (r0.w * r0.w);
    r1.xyz = r1.xyz * r0.w;
    r0.w = SunDimmer.x;
    r0.xyz = (r0.w * r0.xyz) + AmbientColor.rgb;
    OUT.texcoord_1.xyz = (IN.color_0.rgb * r0.xyz) + r1.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

// approximately 32 instruction slots used
