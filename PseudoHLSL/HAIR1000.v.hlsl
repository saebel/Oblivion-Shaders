//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/HAIR1000.vso /Fcshaderdump19/HAIR1000.vso.dis
//
//
// Parameters:

float4 EyePosition;
float3 LightDirection[3];
row_major float4x4 ModelViewProj;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//   EyePosition    const_25      1
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

    float3 r0;
    float3 r1;
    float3 r2;

    r0.xyz = normalize(EyePosition.xyz - IN.position.xyz) + LightDirection[0].xyz;
    r2.xyz = r0.xyz * (1.0 / length(r0.xyz));
    r0.x = dot(IN.tangent.xyz, r2.xyz);
    r0.y = dot(IN.binormal.xyz, r2.xyz);
    r0.z = dot(IN.normal.xyz, r2.xyz);
    r1.x = dot(IN.tangent.xyz, LightDirection[0].xyz);
    r1.y = dot(IN.binormal.xyz, LightDirection[0].xyz);
    r1.z = dot(IN.normal.xyz, LightDirection[0].xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_2.xyz = r1.xyz * (1.0 / length(r1.xyz));
    OUT.texcoord_3.xyz = r0.xyz * (1.0 / length(r0.xyz));
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = const_4.xxxy;
    OUT.color_1.rgba = IN.color_0.rgba;

    return OUT;
};

// approximately 27 instruction slots used
