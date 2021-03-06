//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1011.vso /Fcshaderdump19/SLS1011.vso.dis
//
//
// Parameters:
//
//   float3 FogColor;
//   float4 FogParam;
//   float3 LightDirection[3];
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
//   FogParam       const_23      1
//   FogColor       const_24      1
//

    const float4 const_4 = {0.5, 0, 1, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r1.x = dot(r0.xyz, r0.xyz);	// normalize + length
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.w = 1.0 / sqrt(r1.x);
    r1.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r1.w = 1.0 / FogParam.y;
    r1.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r0.w = r0.w * r1.w;
    r1.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    r0.w = max(r0.w, 0);
    OUT.texcoord_3.xyz = (0.5 * r1.xyz) + 0.5;
    r0.w = min(r0.w, 1);
    OUT.position.xyz = r0.xyz;
    OUT.color_0.a = 1 - r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.xy = IN.texcoord_0.xy;
    OUT.color_0.rgb = FogColor.rgb;

// approximately 22 instruction slots used
