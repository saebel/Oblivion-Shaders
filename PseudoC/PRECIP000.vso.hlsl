//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PRECIP000.vso /Fcshaderdump19/PRECIP000.vso.dis
//
//
// Parameters:
//
//   float3 EyePosition;
//   float3 MaxPos;
//   float3 MinPos;
//   float3 Params;
//   float3 Velocity;
//   row_major float4x4 WorldViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   WorldViewProj[0] const_0        1
//   WorldViewProj[1] const_1        1
//   WorldViewProj[2] const_2        1
//   WorldViewProj[3] const_3        1
//   EyePosition   const_8       1
//   Velocity      const_9       1
//   MinPos        const_10      1
//   MaxPos        const_11      1
//   Params        const_12      1
//

    const float4 const_4 = {0, -1, 1, 0.5};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 OUT.position : POSITION;
    float4 OUT.color_0 : COLOR0;
    float2 OUT.texcoord_0 : TEXCOORD0;
    r0.xyz = Velocity.xyz;
    r1.xyz = (Params.x * r0.xyz) + IN.texcoord_1.xyz;
    r5.xyz = MaxPos.xyz;
    r2.xyz = r5.xyz - MinPos.xyz;
    r1.xyz = r1.xyz - MinPos.xyz;
    r3.x = 1.0 / r2.x;
    r3.y = 1.0 / r2.y;
    r3.z = 1.0 / r2.z;
    r1.xyz = r1.xyz * r3.xyz;
    r4.xyz = frac(abs(r1.xyz));
    r3.xyz = (r1.xyz == 0 ? 1.0 : 0.0);
    r1.xyz = lerp(r4.xyz, -r4.xyz, r3.xyz);
    r3.xyz = r2.xyz * r1.xyz;
    r1.xyz = abs(r3.xyz) + MinPos.xyz;
    r3.xyz = MaxPos.xyz - abs(r3.xyz);
    r0.xyz = (0 < r0.xyz ? 1.0 : 0.0);
    r4.xyz = lerp(r1.xyz, r3.xyz, r0.xyz);
    r0.xy = r4.xy - EyePosition.xy;
    r1.xy = r0.xy * r0.xy;
    r0.w = r1.y + r1.x;
    r0.w = 1.0 / sqrt(r0.w);
    r1.xz = -r0.xy * r0.w;
    r1.yw = r1.z * const_4.yx;
    r0.xyz = r1.zxw * const_4.yzz;
    r0.w = dot(r1.yxw, r0.xyz);
    r0.w = 1.0 / sqrt(r0.w);
    r1.xy = r0.xy * r0.w;
    r0.w = r1.x;
    r3.y = dot(r1.yzw, IN.position.xyz);
    r3.x = dot(r0.wyz, IN.position.xyz);
    r3.z = IN.position.z;
    r0.xyz = (-0.5 * abs(r2.xyz)) + r5.xyz;
    r2.x = 1.0 / abs(r2.x);
    r2.y = 1.0 / abs(r2.y);
    r2.z = 1.0 / abs(r2.z);
    r1.xyz = r0.xyz - r4.xyz;
    r0.xyz = r4.xyz + r3.xyz;
    r1.xyz = r2.xyz * r1.xyz;
    r0.w = 1;
    r1.w = dot(r1.xyz, r1.xyz);	// normalize + length
    OUT.position.x = dot(WorldViewProj[0].xyzw, r0.xyzw);
    r1.w = 1.0 / sqrt(r1.w);
    OUT.position.y = dot(WorldViewProj[1].xyzw, r0.xyzw);
    r1.w = 1.0 / r1.w;
    OUT.position.z = dot(WorldViewProj[2].xyzw, r0.xyzw);
    r1.w = 1 - r1.w;
    OUT.position.w = dot(WorldViewProj[3].xyzw, r0.xyzw);
    OUT.color_0.a = r1.w * r1.w;
    OUT.color_0.rgb = 1;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

// approximately 52 instruction slots used
