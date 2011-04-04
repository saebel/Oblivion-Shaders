//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/WATER001.vso /Fcshaderdump19/WATER001.vso.dis
//
//
// Parameters:

float4 DepthOffset;
row_major float4x4 ModelViewProj;
float4 QPosAdjust;
float Tile;
row_major float4x4 WorldMat;


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

#define	PI	3.14159274
#define	D3DSINCOSCONST1	-1.55009923e-006, -2.17013894e-005, 0.00260416674, 0.00026041668
#define	D3DSINCOSCONST2	-0.020833334, -0.125, 1, 0.5

    const float4 const_11 = {0.5, 8.13802108e-005, (3.0 / 4096), 0};
    const int4 const_12 = {1, -1, 0, 0};

    float4 r0;

    r0.x.zw = 0.5 * ModelViewProj[3].xy;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_2.xyzw = (0.5 * ModelViewProj[0].xyzw) + r0.xyzw;
    OUT.texcoord_3.xyzw = (0.5 * ModelViewProj[1].xyzw) + r0.xyzw;
    OUT.texcoord_4.xyzw = (0.5 * ModelViewProj[2].xyzw) + r0.xyzw;
    r0.x = dot(WorldMat[0].xyzw, IN.position.xyzw);
    r0.y = dot(WorldMat[1].xyzw, IN.position.xyzw);
    OUT.texcoord_1.z = dot(WorldMat[2].xyzw, IN.position.xyzw);
    OUT.texcoord_1.w = dot(WorldMat[3].xyzw, IN.position.xyzw);
    OUT.texcoord_7.xy = (1.0 / Tile.x) * IN.texcoord_0.xy;
    OUT.texcoord_7.zw = (r0.xy + QPosAdjust.xy) * (3.0 / 4096);
    OUT.texcoord_0.xyzw = IN.position.xyzw;
    OUT.texcoord_1.xy = r0.xy;
    OUT.texcoord_5.xyzw = ModelViewProj[3].xyzw;
    OUT.texcoord_6.xy = IN.texcoord_0.xy;
    OUT.texcoord_6.zw = (const_12.xyxy * (((r0.xy - DepthOffset.zw) + QPosAdjust.xy) * 8.13802108e-005)) + const_12.xyzx;

    return OUT;
};

// approximately 25 instruction slots used
