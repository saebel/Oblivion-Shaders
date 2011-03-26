//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/GRASS2040.vso /Fcshaderdump19/GRASS2040.vso.dis
//
//
// Parameters:
//
//   float4 AlphaParam;
//   float4 FogColor;
//   float4 FogParam;
//   float4 InstanceData[2];
//   row_major float4x4 ModelViewProj;
//   float4 ObjToCube0;
//   float4 ObjToCube1;
//   float4 ObjToCube2;
//   float4 ObjToCube3;
//   float3 ScaleMask;
//   float4 WindData;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ObjToCube0    const_0       1
//   ObjToCube1    const_1       1
//   ScaleMask     const_2       1
//   ObjToCube2    const_3       1
//   WindData      const_4       1
//   AlphaParam    const_5       1
//   ObjToCube3    const_6       1
//   ModelViewProj[0] const_9        1
//   ModelViewProj[1] const_10        1
//   ModelViewProj[2] const_11        1
//   ModelViewProj[3] const_12        1
//   FogColor      const_14      1
//   FogParam      const_15      1
//   InstanceData[0]  const_20       1
//   InstanceData[1]  const_21       1
//

    const float4 const_7 = {0, (1.0 / 128), (1.0 / (PI * 2)), 0.5};
    const float4 const_8 = {0.01, 1, (1.0 / 17), -0.5};
    const float4 const_13 = {PI * 2, -PI, 1, 0};
    const float4 const_16 = {D3DSINCOSCONST1};
    const float4 const_17 = {D3DSINCOSCONST2};
    float4 IN.position : POSITION;
    float4 IN.color_0 : COLOR0;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.texcoord_1 : TEXCOORD1;
    r0.w = frac(IN.texcoord_1.x);
    r0.w = IN.texcoord_1.x - r0.w;
    offset.w = r0.w;
    r0.w = InstanceData[0 + offset.w].y + InstanceData[0 + offset.w].x;
    r0.z = (1.0 / 128);
    r1.w = (r0.w * r0.z) + WindData.w;
    r1.w = (r1.w * (1.0 / (PI * 2))) + 0.5;
    r0.w = r0.w * (1.0 / 17);
    r1.w = frac(r1.w);
    r2.w = (r1.w * PI * 2) + -PI;
    r1.w = frac(r0.w);
    r0.y = sin(r2.w);
    r0.w = r1.w + -0.5;
    r2.w = r0.y * WindData.z;
    r0.x = r0.w + r0.w;
    r1.w = IN.color_0.a * IN.color_0.w;
    r0.w = (r0.x * -r0.x) + 1;
    r1.w = r2.w * r1.w;
    r0.w = 1.0 / sqrt(r0.w);
    r0.w = 1.0 / r0.w;
    r1.xy = const_8;
    r2.w = r1.x * InstanceData[0 + offset.w].w;
    r0.y = -r0.w;
    r1.xyz = (r2.w * ScaleMask) + r1.y;
    r1.xyz = r1 * IN.position;
    r0.z = 0;
    r2.x = dot(r0, r1);
    r2.y = dot(r0.wxzw, r1);
    r0.z = r1.z;
    r0.xy = (r1.w * WindData) + r2;
    r0.xyz = r0 + InstanceData[0 + offset.w];
    r0.w = IN.position.w;
    r1.x = dot(ModelViewProj[0], r0);
    r1.y = dot(ModelViewProj[1], r0);
    r1.z = dot(ModelViewProj[2], r0);
    r2.x = dot(r1, r1);	// normalize + length
    r1.w = dot(ModelViewProj[3], r0);
    r2.w = 1.0 / sqrt(r2.x);
    r0 = (r0.xyzx * const_13.zzzw) + const_13.wwwz;
    r2.w = 1.0 / r2.w;
    r2.w = FogParam.x - r2.w;
    r3.w = dot(r1, r1);	// normalize + length
    r4.w = 1.0 / FogParam.y;
    r3.w = 1.0 / sqrt(r3.w);
    r2.w = r2.w * r4.w;
    r3.w = 1.0 / r3.w;
    r2.xy = r3.w - AlphaParam.xzzw;
    r3.x = 1.0 / AlphaParam.y;
    r3.y = 1.0 / AlphaParam.w;
    r2.w = max(r2.w, 0);
    r2.xy = r2 * r3;
    r2.w = min(r2.w, 1);
    r2.xy = max(r2, 0);
    OUT.color_0.a = 1 - r2.w;
    r2.xy = min(r2, 1);
    OUT.position = r1;
    r1.w = 1 - r2.y;
    OUT.texcoord_5.w = r2.x * r1.w;
    OUT.texcoord_1.x = dot(ObjToCube0, r0);
    OUT.texcoord_1.y = dot(ObjToCube1, r0);
    OUT.texcoord_1.z = dot(ObjToCube2, r0);
    OUT.texcoord_1.w = dot(ObjToCube3, r0);
    OUT.texcoord_2 = r0;
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_4 = 0;
    OUT.texcoord_5.xyz = 0;
    OUT.color_0.rgb = FogColor;

// approximately 74 instruction slots used
