//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATER001.vso /Fcshaderdump19/WATER001.vso.dis
//
//
// Parameters:
//
//   float4 DepthOffset;
//   row_major float4x4 ModelViewProj;
//   float4 QPosAdjust;
//   float Tile;
//   row_major float4x4 WorldMat;
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
//   WorldMat[0]      const_4        1
//   WorldMat[1]      const_5        1
//   WorldMat[2]      const_6        1
//   WorldMat[3]      const_7        1
//   Tile          const_8       1
//   QPosAdjust    const_9       1
//   DepthOffset   const_10      1
//

    const float4 const_11 = {0.5, 8.13802108e-005, (3.0 / 4096), 0};
    const int4 const_12 = {1, -1, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    r1.w = 0.5;
    r0.xyzw = r1.w * ModelViewProj[3];
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_2.xyzw = (r1.w * ModelViewProj[0]) + r0;
    OUT.texcoord_3.xyzw = (r1.w * ModelViewProj[1]) + r0;
    OUT.texcoord_4.xyzw = (r1.w * ModelViewProj[2]) + r0;
    OUT.texcoord_1.z = dot(WorldMat[2].xyzw, IN.position.xyzw);
    OUT.texcoord_1.w = dot(WorldMat[3].xyzw, IN.position.xyzw);
    r0.x = dot(WorldMat[0].xyzw, IN.position.xyzw);
    r0.y = dot(WorldMat[1].xyzw, IN.position.xyzw);
    r1.w = 1.0 / Tile.x;
    r0.zw = r0.xyxy + QPosAdjust.xyxy;
    OUT.texcoord_7.xy = r1.w * IN.texcoord_0;
    OUT.texcoord_7.zw = r0.zw * (3.0 / 4096);
    OUT.texcoord_0.xyzw = IN.position;
    r0.zw = r0.xyxy - DepthOffset.zw;
    OUT.texcoord_1.xy = r0.xy;
    r0.zw = r0.zw + QPosAdjust.xyxy;
    OUT.texcoord_5.xyzw = ModelViewProj[3].xyzw;
    r0.zw = r0.zw * 8.13802108e-005;
    OUT.texcoord_6.xy = IN.texcoord_0;
    OUT.texcoord_6.zw = (const_12.xyxy * r0) + const_12.xyzx;

// approximately 25 instruction slots used
