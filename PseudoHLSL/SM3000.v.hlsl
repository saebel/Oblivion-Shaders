//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SM3000.vso /Fcshaderdump19/SM3000.vso.dis
//
//
// Parameters:

float4 FogColor;
float4 FogParam;
row_major float4x4 ModelViewProj;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   FogParam      const_15      1
//   FogColor      const_16      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_4 = {1, 0, 0, 0};

    float3 r0;

    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyz = r0.xyz;
    OUT.texcoord_7.w = (1 - saturate((FogParam.x - length(r0.xyz)) / FogParam.y)) * FogParam.z;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = 1;
    OUT.texcoord_3.xyz = IN.tangent.xyz;
    OUT.texcoord_4.xyz = IN.binormal.xyz;
    OUT.texcoord_5.xyz = IN.normal.xyz;
    OUT.texcoord_6.xyz = IN.position.xyz;
    OUT.texcoord_7.xyz = FogColor.rgb;

    return OUT;
};

// approximately 20 instruction slots used
