//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2047.vso /Fcshaderdump19/SLS2047.vso.dis
//
//
// Parameters:

float4 LightPosition[3];
row_major float4x4 ModelViewProj;


// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   LightPosition[0] const_16       1
//   LightPosition[1] const_17       1
//   LightPosition[2] const_18       1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
    float4 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;


    OUT.color_0.rgba = IN.texcoord_1;
    OUT.color_1.rgba = IN.texcoord_2;
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0;
    OUT.texcoord_1.xyz = IN.color_0;
    OUT.texcoord_2.w = LightPosition[0].w;
    OUT.texcoord_3.w = LightPosition[1].w;
    OUT.texcoord_4.w = LightPosition[2].w;
    r0.xyz = LightPosition[0].xyz - IN.position;
    OUT.texcoord_2.x = dot(IN.tangent.xyz, r0.xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, r0.xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, r0.xyz);
    r0.xyz = LightPosition[1].xyz - IN.position;
    OUT.texcoord_3.x = dot(IN.tangent.xyz, r0.xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, r0.xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, r0.xyz);
    r0.xyz = LightPosition[2].xyz - IN.position;
    OUT.texcoord_4.x = dot(IN.tangent.xyz, r0.xyz);
    OUT.texcoord_4.y = dot(IN.binormal.xyz, r0.xyz);
    OUT.texcoord_4.z = dot(IN.normal.xyz, r0.xyz);

    return OUT;
};

// approximately 23 instruction slots used
