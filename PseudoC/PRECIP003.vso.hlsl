//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PRECIP003.vso /Fcshaderdump19/PRECIP003.vso.dis
//
//
// Parameters:
//
//   float3 CameraUp;
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
//   CameraUp      const_13      1
//

    const float4 const_4 = {PI * 2, -PI, 0, 0};
    const float4 const_5 = {0, (1.0 / (PI * 2)), 0.5, 1};
    const int4 const_6 = {-1, 0, 1, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    float4 OUT.position : POSITION;
    float4 OUT.color_0 : COLOR0;
    float2 OUT.texcoord_0 : TEXCOORD0;
    r0.xyz = Velocity.xyz;
    r3.xyz = (Params.x * r0) + IN.texcoord_1;
    r1.xyz = MaxPos.xyz;
    r2.xyz = r1.xyz - MinPos.xyz;
    r3.xyz = r3.xyz - MinPos.xyz;
    r4.x = 1.0 / r2.x;
    r4.y = 1.0 / r2.y;
    r4.z = 1.0 / r2.z;
    r3.xyz = r3.xyz * r4.xyz;
    r5.xyz = frac(abs(r3));
    r4.xyz = (r3 >= -r3 ? 1.0 : 0.0);
    r0.w = (Params.z * Params.x) + IN.texcoord_1.x;
    r3.xyz = lerp(r5, -r5, r4);
    r0.w = (r0.w * (1.0 / (PI * 2))) + 0.5;
    r3.xyz = r2.xyz * r3.xyz;
    r0.w = frac(r0.w);
    r4.xyz = abs(r3) + MinPos;
    r5.xyz = MaxPos - abs(r3);
    r0.xyz = (0 < r0 ? 1.0 : 0.0);
    r1.w = (r0.w * PI * 2) + -PI;
    r3.xyz = lerp(r4, r5, r0);
    r0.x = cos(r1.w); r0.y = sin(r1.w);
    r4.xyz = r3.xyz - EyePosition.xyz;
    r6.xyz = r0.xxyw * const_5.wxww;
    r5.xyz = normalize(-r4);
    r4.xyz = r0.yxxw * const_6.xyz;
    r0.xyz = r5.yzxw * CameraUp.zxyw;
    r0.w = dot(r6.xyz, IN.position.xyz);
    r6.xyz = (CameraUp.yzxw * r5.zxyw) - r0.xyz;
    r5.xyz = r5.xyz * IN.position.y;
    r0.xyz = normalize(r6);
    r0.xyz = (r0.w * r0.xyz) + r5.xyz;
    r0.w = dot(r4.xyz, IN.position.xyz);
    r0.xyz = (r0.w * CameraUp.xyz) + r0.xyz;
    r1.xyz = (-0.5 * abs(r2)) + r1;
    r2.x = 1.0 / abs(r2.x);
    r2.y = 1.0 / abs(r2.y);
    r2.z = 1.0 / abs(r2.z);
    r1.xyz = r1.xyz - r3.xyz;
    r0.xyz = r3.xyz + r0.xyz;
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
    OUT.texcoord_0.xy = IN.texcoord_0;

// approximately 60 instruction slots used
