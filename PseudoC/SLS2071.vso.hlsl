//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2071.vso /Fcshaderdump19/SLS2071.vso.dis
//
//
// Parameters:
//
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   row_major float4x4 ModelViewProj;
//   float UOffset;
//   float VOffset;
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
//   EyePosition   const_8       1
//   UOffset       const_9       1
//   VOffset       const_10      1
//   FogParam      const_12      1
//   FogColor      const_13      1
//

    const float4 const_4 = {0.025, 0.0208350997, -0.0851330012, 0.180141002};
    const float4 const_5 = {-0.330299497, 0.999866009, -2, PI / 2};
    const float4 const_6 = {-PI, 0.318471342, 1, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    r0.xy = abs(IN.position);
    r0.w = max(r0.y, r0.x);
    r1.w = 1.0 / r0.w;
    r0.w = min(r0.y, r0.x);
    r0.w = r1.w * r0.w;
    r1.w = r0.w * r0.w;
    r2.w = (r1.w * 0.0208350997) + -0.0851330012;
    r2.w = (r1.w * r2.w) + 0.180141002;
    r2.w = (r1.w * r2.w) + -0.330299497;
    r1.w = (r1.w * r2.w) + 0.999866009;
    r2.w = r0.w * r1.w;
    r1.w = (r0.y < r0.x ? 1.0 : 0.0);
    r0.w = (r2.w * -2) + PI / 2;
    r1.w = (r0.w * r1.w) + r2.w;
    r0.w = (IN.position.y < -IN.position.y ? 1.0 : 0.0);
    r2.w = (r0.w * -PI) + r1.w;
    r0.w = 0.025;
    OUT.texcoord_1.y = (IN.position.z * r0.w) + UOffset.x;
    r1.w = r2.w + r2.w;
    r0.w = min(IN.position.y, IN.position.x);
    r3.w = max(IN.position.y, IN.position.x);
    r0.w = (r0.w < -r0.w ? 1.0 : 0.0);
    r3.w = (r3.w >= -r3.w ? 1.0 : 0.0);
    r0.w = r0.w * r3.w;
    r1.xyz = EyePosition.xyz - IN.position;
    r1.w = (r0.w * -r1.w) + r2.w;
    r0.x = dot(IN.normal.xyz, r1.xyz);
    r0.yw = const_6.yw;
    OUT.texcoord_1.x = (r1.w * r0.y) + VOffset.x;
    r1.w = (r0.x < 1 ? 1.0 : 0.0);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    r0.xyz = r1.xyz * r1.w;
    r2.xyz = (-2 * r0.xyz) + r1.xyz;
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r1.x = dot(IN.tangent.xyz, r2.xyz);
    r3.x = dot(r0.xyz, r0.xyz);	// normalize + length
    r1.y = dot(IN.binormal.xyz, r2.xyz);
    r1.w = 1.0 / sqrt(r3.x);
    r1.z = dot(IN.normal.xyz, r2.xyz);
    r1.w = 1.0 / r1.w;
    r1.w = FogParam.x - r1.w;
    r2.w = 1.0 / FogParam.y;
    r1.w = r1.w * r2.w;
    r1.w = max(r1.w, 0);
    r2.xyz = normalize(r1);
    OUT.texcoord_3.xyz = r2.xyz;
    r1.w = min(r1.w, 1);
    r1.w = 1 - r1.w;
    r0.w = (r0.w < FogParam.z ? 1.0 : 0.0);
    OUT.position.xyz = r0.xyz;
    OUT.color_1.a = r1.w * r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.color_1.rgb = FogColor.rgb;

// approximately 57 instruction slots used
