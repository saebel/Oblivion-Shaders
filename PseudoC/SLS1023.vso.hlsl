//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1023.vso /Fcshaderdump19/SLS1023.vso.dis
//
//
// Parameters:
//
//   float3 LightDirection[3];
//   float4 LightPosition[3];
//   row_major float4x4 ModelViewProj;
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
//

    const int4 const_4 = {0, 1, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r0.xyz = LightPosition[1].xyz - IN.position.xyz;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r2.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r1.x = dot(LightDirection[0].xyz, IN.normal.xyz);
    r2.w = 1.0 / sqrt(r2.x);
    r3.w = 1.0 / LightPosition[1].w;
    r0.w = 1.0 / r2.w;
    r1.w = max(r1.x, 0);
    r0.w = r3.w * r0.w;
    r1.w = min(r1.w, 1);
    r0.w = max(r0.w, 0);
    r0.xyz = r0.xyz * r2.w;
    r0.w = min(r0.w, 1);
    r0.w = 1.0 - (r0.w * r0.w);
    r0.x = dot(r0.xyz, IN.normal.xyz);
    OUT.color_0.rgb = r1.w * IN.color_0.rgb;
    r0.w = r0.w * r0.x;
    OUT.color_1.rgb = r0.w * IN.color_0.rgb;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

// approximately 22 instruction slots used
