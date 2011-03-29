//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYCLOUDSFADE.vso /Fcshaderdump19/SKYCLOUDSFADE.vso.dis
//
//
// Parameters:

float4 BlendColor[3];
float3 EyePosition;
row_major float4x4 Model;
row_major float4x4 ModelViewProj;
float TexCoordYOff;


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
//   TexCoordYOff  const_12      1
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
    float2 texcoord_1 : TEXCOORD1;
    float texcoord_2 : TEXCOORD2;
    float4 color_0 : COLOR0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const float4 ModelViewProj[2] = {(1.0 / 7), 0, 0, 0};

    OUT.color_0.a = BlendColor[0].a * IN.color_0.a;
    r0.w = dot(Model[2].xyzw, IN.position.xyzw);
    r0.w = r0.w - EyePosition.z;
    OUT.texcoord_2.x = saturate(r0.w * (1.0 / 7));
    r0.xyz = BlendColor[1].rgb * IN.color_0.g;
    r0.xyz = (IN.color_0.r * BlendColor[0].rgb) + r0.xyz;
    OUT.color_0.rgb = (IN.color_0.b * BlendColor[2].rgb) + r0.xyz;
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.position.xyzw = r0.xyzz;
    r0.x = IN.texcoord_0.x;
    r0.y = TexCoordYOff.x + IN.texcoord_0.y;
    OUT.texcoord_0.xy = r0.xy;
    OUT.texcoord_1.xy = r0.xy;

    return OUT;
};

// approximately 15 instruction slots used
