//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3029.vso /Fcshaderdump19/SM3029.vso.dis
//
//
// Parameters:
//
//   float4 Bones[54];
//   float4 EyePosition;
//   float3 FogColor;
//   float4 FogParam;
//   row_major float4x4 SkinModelViewProj;
//   float UOffset;
//   float VOffset;
//
//
// Registers:
//
//   Name              Reg   Size
//   ----------------- ----- ----
//   SkinModelViewProj[0] const_4        1
//   SkinModelViewProj[1] const_5        1
//   SkinModelViewProj[2] const_6        1
//   SkinModelViewProj[3] const_7        1
//   EyePosition       const_8       1
//   UOffset           const_9       1
//   VOffset           const_10      1
//   FogParam          const_12      1
//   FogColor          const_13      1
//   Bones             const_14     54
//

    const float4 const_0 = {0.025, 0.0208350997, -0.0851330012, 0.180141002};
    const float4 const_1 = {-0.330299497, 0.999866009, -2, PI / 2};
    const float4 const_2 = {-PI, 0.318471342, 1, 765.01001};
    const int4 const_3 = {1, 0, 0, 0};
    float4 IN.position : POSITION;
    float3 IN.tangent : TANGENT;
    float3 IN.binormal : BINORMAL;
    float3 IN.normal : NORMAL;
    float4 IN.texcoord_0 : TEXCOORD0;
    float3 IN.blendweight : BLENDWEIGHT;
    float4 IN.blendindices : BLENDINDICES;
    float4 OUT.position : POSITION;
    float2 OUT.texcoord_0 : TEXCOORD0;
    float2 OUT.texcoord_1 : TEXCOORD1;
    float3 OUT.texcoord_3 : TEXCOORD3;
    float4 OUT.color_1 : COLOR1;
    r0.w = max(abs(IN.position.y), abs(IN.position.x));
    r0.z = 1.0 / r0.w;
    r0.w = min(abs(IN.position.y), abs(IN.position.x));
    r0.w = r0.z * r0.w;
    r0.z = r0.w * r0.w;
    r0.y = (r0.z * 0.0208350997) - 0.0851330012;
    r0.y = (r0.z * r0.y) + 0.180141002;
    r0.y = (r0.z * r0.y) - 0.330299497;
    r0.z = (r0.z * r0.y) + 0.999866009;
    r0.y = r0.w * r0.z;
    r0.w = (r0.y * -2) + PI / 2;
    r0.z = (abs(IN.position.y) < abs(IN.position.x) ? 1.0 : 0.0);
    r0.z = (r0.w * r0.z) + r0.y;
    r0.w = (IN.position.y < -IN.position.y ? 1.0 : 0.0);
    r0.y = 0.025;
    OUT.texcoord_1.y = (IN.position.z * r0.y) + UOffset.x;
    r2.y = (r0.w * -PI) + r0.z;
    r2.z = 2 * r2.y;
    r0.w = min(IN.position.y, IN.position.x);
    r0.w = (r0.w < -r0.w ? 1.0 : 0.0);
    r0.z = max(IN.position.y, IN.position.x);
    r0.z = (r0.z >= -r0.z ? 1.0 : 0.0);
    r1.x.zw = 765.01001 * IN.blendindices.zy;
    r2.w = r0.w * r0.z;
    r0.xyzw = frac(r1.xyzw);
    r2.w = (r2.w * -r2.z) + r2.y;
    r1.x.zw = r1.xy - r0.xy;
    r0.xyzw = (IN.position.xyzx * const_3.xxxy) + const_3.yyyx;
    offset.xyzw = r1.xyzw;
    r1.w = dot(IN.blendweight.xyz, const_2.xyz);.z
    r1.x = dot(const_14[offset.y], r0.xyzw);
    r1.y = dot(const_15[offset.y], r0.xyzw);
    r1.z = dot(const_16[offset.y], r0.xyzw);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(const_14[offset.x], r0.xyzw);
    r1.y = dot(const_15[offset.x], r0.xyzw);
    r1.z = dot(const_16[offset.x], r0.xyzw);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(const_14[offset.z], r0.xyzw);
    r1.y = dot(const_15[offset.z], r0.xyzw);
    r1.z = dot(const_16[offset.z], r0.xyzw);
    r1.w = 1 - r1.w;
    r4.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r3.x = dot(const_14[offset.w], r0.xyzw);
    r3.y = dot(const_15[offset.w], r0.xyzw);
    r3.z = dot(const_16[offset.w], r0.xyzw);
    r0.x = dot(const_14[offset.y], IN.normal.xyz);
    r0.y = dot(const_15[offset.y], IN.normal.xyz);
    r0.z = dot(const_16[offset.y], IN.normal.xyz);
    r1.xyz = r0.xyz * IN.blendweight.y;
    r0.x = dot(const_14[offset.x], IN.normal.xyz);
    r0.y = dot(const_15[offset.x], IN.normal.xyz);
    r0.z = dot(const_16[offset.x], IN.normal.xyz);
    r1.xyz = (IN.blendweight.x * r0.xyz) + r1.xyz;
    r0.x = dot(const_14[offset.z], IN.normal.xyz);
    r0.y = dot(const_15[offset.z], IN.normal.xyz);
    r0.z = dot(const_16[offset.z], IN.normal.xyz);
    r2.xyz = (IN.blendweight.z * r0.xyz) + r1.xyz;
    r1.x = dot(const_14[offset.w], IN.normal.xyz);
    r1.y = dot(const_15[offset.w], IN.normal.xyz);
    r1.z = dot(const_16[offset.w], IN.normal.xyz);
    r0.xyz = (r1.w * r3.xyz) + r4.xyz;
    r1.xyz = (r1.w * r1.xyz) + r2.xyz;
    r3.xyz = normalize(r1.xyz);
    r2.xyz = EyePosition.xyz - r0.xyz;
    r0.w = 0.318471342;
    OUT.texcoord_1.x = (r2.w * r0.w) + VOffset.x;
    r1.z = dot(r3.xyz, r2.xyz);
    r0.w = 1;
    r1.z = (r1.z < 1 ? 1.0 : 0.0);
    OUT.position.w = dot(SkinModelViewProj[3].xyzw, r0.xyzw);
    r1.xyz = r2.xyz * r1.z;
    r4.xyz = (-2 * r1.xyz) + r2.xyz;
    r1.x = dot(const_14[offset.y], IN.tangent.xyz);
    r1.y = dot(const_15[offset.y], IN.tangent.xyz);
    r1.z = dot(const_16[offset.y], IN.tangent.xyz);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(const_14[offset.x], IN.tangent.xyz);
    r1.y = dot(const_15[offset.x], IN.tangent.xyz);
    r1.z = dot(const_16[offset.x], IN.tangent.xyz);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(const_14[offset.z], IN.tangent.xyz);
    r1.y = dot(const_15[offset.z], IN.tangent.xyz);
    r1.z = dot(const_16[offset.z], IN.tangent.xyz);
    r2.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r1.x = dot(const_14[offset.w], IN.tangent.xyz);
    r1.y = dot(const_15[offset.w], IN.tangent.xyz);
    r1.z = dot(const_16[offset.w], IN.tangent.xyz);
    r6.xyz = (r1.w * r1.xyz) + r2.xyz;
    r1.x = dot(const_14[offset.y], IN.binormal.xyz);
    r1.y = dot(const_15[offset.y], IN.binormal.xyz);
    r1.z = dot(const_16[offset.y], IN.binormal.xyz);
    r2.xyz = r1.xyz * IN.blendweight.y;
    r1.x = dot(const_14[offset.x], IN.binormal.xyz);
    r1.y = dot(const_15[offset.x], IN.binormal.xyz);
    r1.z = dot(const_16[offset.x], IN.binormal.xyz);
    r2.xyz = (IN.blendweight.x * r1.xyz) + r2.xyz;
    r1.x = dot(const_14[offset.z], IN.binormal.xyz);
    r1.y = dot(const_15[offset.z], IN.binormal.xyz);
    r1.z = dot(const_16[offset.z], IN.binormal.xyz);
    r5.xyz = (IN.blendweight.z * r1.xyz) + r2.xyz;
    r2.x = dot(const_14[offset.w], IN.binormal.xyz);
    r2.y = dot(const_15[offset.w], IN.binormal.xyz);
    r2.z = dot(const_16[offset.w], IN.binormal.xyz);
    r1.xyz = normalize(r6.xyz);
    r5.xyz = (r1.w * r2.xyz) + r5.xyz;
    r2.x = dot(r1.xyz, r4.xyz);
    r1.xyz = normalize(r5.xyz);
    r2.y = dot(r1.xyz, r4.xyz);
    r1.x = dot(SkinModelViewProj[0].xyzw, r0.xyzw);
    r1.y = dot(SkinModelViewProj[1].xyzw, r0.xyzw);
    r1.z = dot(SkinModelViewProj[2].xyzw, r0.xyzw);
    r2.z = dot(r3.xyz, r4.xyz);
    r0.w = dot(r1.xyz, r1.xyz);	// normalize + length
    r0.z = dot(r2.xyz, r2.xyz);	// normalize + length
    r0.w = 1.0 / sqrt(r0.w);
    r0.y = 1.0 / sqrt(r0.z);
    r0.w = 1.0 / r0.w;
    r0.w = FogParam.x - r0.w;
    r0.z = 1.0 / FogParam.y;
    OUT.texcoord_3.xyz = r2.xyz * r0.y;
    r0.w = saturate(r0.w * r0.z);
    r0.z = 1 - r0.w;
    r0.y = 0;
    r0.w = (r0.y < FogParam.z ? 1.0 : 0.0);
    OUT.position.xyz = r1.xyz;
    OUT.color_1.a = r0.z * r0.w;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_1.rgb = FogColor.rgb;

// approximately 135 instruction slots used
