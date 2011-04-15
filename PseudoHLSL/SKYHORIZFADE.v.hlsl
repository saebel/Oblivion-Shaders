//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYHORIZFADE.vso /Fcshaderdump19/SKYHORIZFADE.vso.dis
//
//
// Parameters:
//
float4 BlendColor[3];
float3 EyePosition;
row_major float4x4 Model;
row_major float4x4 ModelViewProj;
//
//
// Registers:
//
//   Name          Reg   Size
//   ------------- ----- ----
//   ModelViewProj[0] const_0        1
//   ModelViewProj[1] const_1        1
//   ModelViewProj[2] const_2        1
//   ModelViewProj[3] const_3        1
//   BlendColor[0]    const_4        1
//   BlendColor[1]    const_5        1
//   BlendColor[2]    const_6        1
//   EyePosition   const_7       1
//   Model[0]         const_8        1
//   Model[1]         const_9        1
//   Model[2]         const_10        1
//


// Structures:

struct VS_INPUT {
    float4 position : POSITION;
    float4 texcoord_0 : TEXCOORD0;
    float4 color_0 : COLOR0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float texcoord_2 : TEXCOORD2;
    float4 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float3 r0;

    r0.xyz = (IN.color_0.r * BlendColor[0].rgb) + (BlendColor[1].rgb * IN.color_0.g);
    OUT.color_0.a = BlendColor[0].a * IN.color_0.a;
    OUT.color_0.rgb = (IN.color_0.b * BlendColor[2].rgb) + r0.xyz;
    r0.xy = mul(float2x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw), IN.position.xyzw);
    r0.z = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyzw = r0.xyzz;
    OUT.texcoord_0.xy = IN.texcoord_0.xy;
    OUT.texcoord_2.x = saturate((dot(Model[2].xyzw, IN.position.xyzw) - EyePosition.z) / 7);

    return OUT;
};

// approximately 12 instruction slots used
