//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1022.vso /Fcshaderdump19/SLS1022.vso.dis
//
//
// Parameters:

float3 LightDirection[3];
float4 LightPosition[3];
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
//   LightPosition[0]  const_16       1
//   LightPosition[1]  const_17       1
//



// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float3 color_0 : COLOR0;
    float3 color_1 : COLOR1;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_4 = {0, 1, 0, 0};

    float4 r0;
    float4 r1;

    r0.xyz = LightPosition[1].xyz - IN.position.xyz;
    r1.w = 1.0 / length(r0.xyz);
    r0.w = saturate((1.0 / LightPosition[1].w) / (r1.w));
    OUT.position.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    OUT.position.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    OUT.position.z = dot(ModelViewProj[2].xyzw, IN.position.xyzw);
    OUT.position.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.color_0.rgb = saturate(dot(LightDirection[0].xyz, IN.normal.xyz));
    OUT.color_1.rgb = (1.0 - (r0.w * r0.w)) * dot(r0.xyz * r1.w, IN.normal.xyz);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 20 instruction slots used
