//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1020.vso /Fcshaderdump19/SLS1020.vso.dis
//
//
// Parameters:
//
float3 LightDirection[3];
row_major float4x4 ModelViewProj;
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
//   LightDirection[0] const_13       1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float3 normal : NORMAL;
    float4 texcoord_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float3 color_0 : COLOR0;
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    OUT.color_0.rgb = shades(LightDirection[0].xyz, IN.normal.xyz);
    OUT.position.xyzw = mul(ModelViewProj, IN.position.xyzw);
    OUT.texcoord_0.xy = IN.texcoord_0.xy;

    return OUT;
};

// approximately 8 instruction slots used
