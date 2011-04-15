//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/DISTLOD2002.vso /Fcshaderdump19/DISTLOD2002.vso.dis
//
//
// Parameters:
//
//   float4 AlphaParam;
//   float4 AmbientColor;
//   float3 DiffuseColor;
//   float3 DiffuseDir;
//   float4 EyePos;
//   float4 FogColor;
//   float4 FogParam;
//   float4 InstanceData[2];
//   row_major float4x4 ModelViewProj;
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
//   DiffuseDir    const_4       1
//   DiffuseColor  const_5       1
//   EyePos        const_9       1
//   FogColor      const_10      1
//   FogParam      const_11      1
//   AlphaParam    const_12      1
//   AmbientColor  const_13      1
//   InstanceData[0]  const_20       1
//   InstanceData[1]  const_21       1
//

    const float4 const_6 = {0.01, -0.5, 0, 1};
    float4 IN.position : POSITION;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r0.w = 0.01;
    r0.w = r0.w * InstanceData[0 + offset.w].w;
    r1.xyzw = frac(InstanceData[0 + offset.w]);
    r0.xyz = (IN.position.xyz * r0.w) + InstanceData[0 + offset.w];
    r1.xyz = r1.xyz - 0.5;
    r0.w = IN.position.w;
    r1.xyz = 2 * r1.xyz;
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    r2.x = dot(DiffuseDir.xyz, r1.xyz);
    r1.xyz = InstanceData[0 + offset.w];
    r1.xyz = EyePos.xyz - r1.xyz;
    r2.xyz = r2.x * IN.color_0.rgb;
    r3.xyz = r1.w * r2.xyz;
    r2.x = dot(ModelViewProj[0].xyzw, r0.xyzw);
    r2.y = dot(ModelViewProj[1].xyzw, r0.xyzw);
    r2.z = dot(ModelViewProj[2].xyzw, r0.xyzw);
    r0.xyz = DiffuseColor.rgb;
    OUT.texcoord_4.xyz = (r0.xyz * r3.xyz) + AmbientColor.rgb;
    r0.x = dot(r2.xyz, r2.xyz);	// normalize + length
    OUT.position.xyz = r2.xyz;
    r0.w = 1.0 / sqrt(r0.x);
    r0.w = 1.0 / r0.w;
    r0.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r2.w = FogParam.x - r0.w;
    r0.w = 1.0 / sqrt(r0.x);
    r4.w = 1.0 / FogParam.y;
    r0.w = 1.0 / r0.w;
    r1.w = r0.w - AlphaParam.x;
    r3.w = 1.0 / AlphaParam.y;
    r2.w = r2.w * r4.w;
    r1.w = (r1.w * -r3.w) + 1;
    r2.w = max(r2.w, 0);
    r1.w = max(r1.w, 0);
    r2.w = min(r2.w, 1);
    r1.w = min(r1.w, 1);
    r0.w = (AlphaParam.x < r0.w ? 1.0 : 0.0);
    r1.w = r1.w - 1;
    OUT.color_0.a = 1 - r2.w;
    OUT.texcoord_5.w = (r0.w * r1.w) + 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.w = 1;
    OUT.texcoord_5.xyz = 0;
    OUT.color_0.rgb = FogColor.rgb;

// approximately 46 instruction slots used
