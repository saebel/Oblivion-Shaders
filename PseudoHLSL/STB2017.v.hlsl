//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/STB2017.vso /Fcshaderdump19/STB2017.vso.dis
//
//
// Parameters:
//
float4 FogParam;
float4 LightPosition[3];
row_major float4x4 ModelViewProj;
row_major float4x4 ObjToCubeSpace;
float4 WindMatrices[16];
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
//   ObjToCubeSpace[0] const_8        1
//   ObjToCubeSpace[1] const_9        1
//   ObjToCubeSpace[2] const_10        1
//   ObjToCubeSpace[3] const_11        1
//   LightPosition[0]  const_16       1
//   FogParam       const_23      1
//   WindMatrices[0]   const_38      4
//   WindMatrices[1]   const_39      4
//   WindMatrices[2]   const_40      4
//   WindMatrices[3]   const_41      4
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float4 blendindices : BLENDINDICES;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float4 texcoord_3 : TEXCOORD3;
    float3 texcoord_6 : TEXCOORD6;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float3 mdl7;
    float1 q0;
    float4 q2;
    float4 r0;

    q0.x = IN.blendindices.y;
    q2.xyzw = mul(float4x4(WindMatrices[0 + q0.x].xyzw, WindMatrices[1 + q0.x].xyzw, WindMatrices[2 + q0.x].xyzw, WindMatrices[3 + q0.x].xyzw), IN.position.xyzw);
    r0.xyzw = (IN.blendindices.x * (q2.xyzw - IN.position.xyzw)) + IN.position.xyzw;
    mdl7.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), r0.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, r0.xyzw);
    OUT.position.xyz = mdl7.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xyzw = mul(ObjToCubeSpace, r0.xyzw);
    OUT.texcoord_2.xyzw = LightPosition[0].xyzw;
    OUT.texcoord_3.w = 1 - saturate((FogParam.x - length(mdl7.xyz)) / FogParam.y);
    OUT.texcoord_3.xyz = 0;
    OUT.texcoord_6.xyz = r0.xyz;

    return OUT;
};

// approximately 32 instruction slots used