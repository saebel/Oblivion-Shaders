//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATER000.vso /Fcshaderdump19/WATER000.vso.dis
//
//
// Parameters:
//
float4 DepthOffset : register(c10);
row_major float4x4 ModelViewProj : register(c0);
float4 QPosAdjust : register(c9);
float Tile : register(c8);
row_major float4x4 WorldMat : register(c4);
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


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_12 = {1, -1, 0, 0};

    float2 m5;
    float4 mdl0;

    m5.xy = mul(float2x4(WorldMat[0].xyzw, WorldMat[1].xyzw), IN.position.xyzw);
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    OUT.texcoord_0.xyzw = IN.position.xyzw;
    OUT.texcoord_1.xy = m5.xy;
    OUT.texcoord_1.zw = mul(float2x4(WorldMat[2].xyzw, WorldMat[3].xyzw), IN.position.xyzw);
    mdl0.xyzw = 0.5 * ModelViewProj[3].xyzw;
    OUT.texcoord_2.xyzw = (0.5 * ModelViewProj[0].xyzw) + mdl0.xyzw;
    OUT.texcoord_3.xyzw = (0.5 * ModelViewProj[1].xyzw) + mdl0.xyzw;
    OUT.texcoord_4.xyzw = (0.5 * ModelViewProj[2].xyzw) + mdl0.xyzw;
    OUT.texcoord_5.xyzw = ModelViewProj[3].xyzw;
    OUT.texcoord_6.xy = IN.texcoord_0.xy;
    OUT.texcoord_6.zw = (const_12.xy * (((IN.texcoord_0.xy / Tile.x) + DepthOffset.yx) / 3)) + const_12.zx;
    OUT.texcoord_7.xy = IN.texcoord_0.xy / Tile.x;
    OUT.texcoord_7.zw = (m5.xy + QPosAdjust.xy) * (3.0 / 4096);

    return OUT;
};

// approximately 25 instruction slots used
