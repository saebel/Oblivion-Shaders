//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR1005.vso /Fcshaderdump19/HAIR1005.vso.dis
//
//
// Parameters:

float4 EyePosition;
float3 LightColor[3];
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
//   LightColor[0]    const_19       1
//   LightColor[1]    const_20       1
//   EyePosition   const_25      1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
};

struct VS_OUTPUT {
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_4 = {0, 1, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;

    r0.xyz = LightPosition[0].xyz - IN.position.xyz;
    r0.w = 1.0 / length(r0.xyz);
    r2.xyz = r0.xyz * r0.w;
    r0.w = 1 - saturate((1.0 / r0.w) / LightPosition[0].w);
    r0.x = dot(IN.tangent.xyz, r2.xyz);
    r0.y = dot(IN.binormal.xyz, r2.xyz);
    r0.z = dot(IN.normal.xyz, r2.xyz);
    r1.xyz = normalize(normalize(EyePosition.xyz - IN.position.xyz) + r2.xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_2.xyz = normalize(r0.xyz);
    r0.x = dot(IN.tangent.xyz, r1.xyz);
    r0.y = dot(IN.binormal.xyz, r1.xyz);
    r0.z = dot(IN.normal.xyz, r1.xyz);
    OUT.texcoord_3.xyz = normalize(r0.xyz);
    r0.xyz = LightPosition[2].xyz - IN.position.xyz;
    OUT.color_0.a = r0.w * r0.w;
    r0.w = 1.0 / length(r0.xyz);
    r1.w = max(dot(IN.normal.xyz, r0.xyz * r0.w), 0);
    r0.w = 1 - saturate((1.0 / r0.w) / LightPosition[2].w);
    r0.xyz = LightPosition[1].xyz - IN.position.xyz;
    r1.xyz = (min(r1.w, 1) * LightColor[1].rgb) * (r0.w * r0.w);
    r2.w = 1.0 / length(r0.xyz);
    r0.w = 1 - saturate((1.0 / r2.w) / LightPosition[1].w);
    OUT.color_0.rgb = ((r0.w * r0.w) * (saturate(dot(IN.normal.xyz, r0.xyz * r2.w)) * LightColor[1].rgb)) + r1.xyz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;
    OUT.color_1.rgba = IN.color_0.rgba;

    return OUT;
};

// approximately 69 instruction slots used
