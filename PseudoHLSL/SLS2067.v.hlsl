//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2067.vso /Fcshaderdump19/SLS2067.vso.dis
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
    float4 color_0 : COLOR0;
    float4 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 const_4 = {0.5, 1, 0, 0};

    float4 r0;
    float3 r1;

    r0.xyz = LightPosition[0].xyz - IN.position.xyz;
    r0.w = 1.0 / length(r0.xyz);
    r0.xyz = r0.xyz * r0.w;
    r1.x = dot(IN.tangent.xyz, r0.xyz);
    r1.y = dot(IN.binormal.xyz, r0.xyz);
    r1.z = dot(IN.normal.xyz, r0.xyz);
    r0.xyz = normalize(r1.xyz);
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.texcoord_3.xyz = (0.5 * r0.xyz) + 0.5;	// [-1,+1] to [0,1]
    r0.x = saturate(((1.0 / r0.w) / -LightPosition[0].w) + 1);
    OUT.texcoord_2.xyz = r0.x * IN.color_0.rgb;
    OUT.texcoord_2.w = r0.x;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_1.xy = IN.texcoord_0.xy;
    OUT.color_0.rgba = IN.texcoord_1.xyzw;
    OUT.color_1.rgba = IN.texcoord_2.xyzw;

    return OUT;
};

// approximately 26 instruction slots used
