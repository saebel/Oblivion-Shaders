//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2018.vso /Fcshaderdump19/SKIN2018.vso.dis
//
//
// Parameters:

float4 EyePosition;
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
//   EyePosition   const_25      1
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
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float4 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 0, 0, 0};

    float3 r0;
    float3 r1;

    r0.xyz = normalize(EyePosition.xyz - IN.position.xyz);
    r1.x = dot(IN.tangent.xyz, r0.xyz);
    r1.y = dot(IN.binormal.xyz, r0.xyz);
    r1.z = dot(IN.normal.xyz, r0.xyz);
    r0.xyz = LightPosition[0].xyz - IN.position.xyz;
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_7.xyz = normalize(r1.xyz);
    r1.xyz = normalize(r0.xyz);
    OUT.texcoord_1.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_1.y = dot(IN.binormal.xyz, r1.xyz);
    OUT.texcoord_1.z = dot(IN.normal.xyz, r1.xyz);
    OUT.texcoord_4.xyz = (0.5 * (r0.xyz / LightPosition[0].w)) + 0.5;	// [-1,+1] to [0,1]
    r0.xyz = LightPosition[1].xyz - IN.position.xyz;
    r1.xyz = normalize(r0.xyz);
    OUT.texcoord_2.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_2.y = dot(IN.binormal.xyz, r1.xyz);
    OUT.texcoord_2.z = dot(IN.normal.xyz, r1.xyz);
    OUT.texcoord_5.xyz = (0.5 * (r0.xyz / LightPosition[1].w)) + 0.5;	// [-1,+1] to [0,1]
    r0.xyz = LightPosition[2].xyz - IN.position.xyz;
    r1.xyz = normalize(r0.xyz);
    OUT.texcoord_3.x = dot(IN.tangent.xyz, r1.xyz);
    OUT.texcoord_3.y = dot(IN.binormal.xyz, r1.xyz);
    OUT.texcoord_3.z = dot(IN.normal.xyz, r1.xyz);
    OUT.texcoord_6.xyz = (0.5 * (r0.xyz / LightPosition[2].w)) + 0.5;	// [-1,+1] to [0,1]
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_4.w = 0.5;
    OUT.texcoord_5.w = 0.5;
    OUT.texcoord_6.w = 0.5;

    return OUT;
};

// approximately 48 instruction slots used
