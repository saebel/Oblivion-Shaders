//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYHORIZFADE.vso /Fcshaderdump19/SKYHORIZFADE.vso.dis
//
//
// Parameters:
//
//   float4 BlendColor[3];
//   float3 EyePosition;
//   row_major float4x4 Model;
//   row_major float4x4 ModelViewProj;
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

    const float4 ModelViewProj[2] = {(1.0 / 7), 0, 0, 0};
    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float4 OUT.position : POSITION;
    float2 OUT.texcoord_0 : TEXCOORD0;
    float OUT.texcoord_2 : TEXCOORD2;
    float4 OUT.color_0 : COLOR0;
    r0.xyz = BlendColor[1] * IN.color_0.g;
    r0.xyz = (IN.color_0.r * BlendColor[0]) + r0;
    OUT.color_0.rgb = (IN.color_0.b * BlendColor[2]) + r0;
    r0.w = dot(Model[2], IN.position);
    OUT.color_0.a = BlendColor[0].a * IN.color_0.a;
    r0.w = r0.w - EyePosition.z;
    OUT.texcoord_2.x = saturate(r0.w * (1.0 / 7));
    r0.x = dot(ModelViewProj[0], IN.position);
    r0.y = dot(ModelViewProj[1], IN.position);
    r0.z = dot(ModelViewProj[3], IN.position);
    OUT.position = r0.xyzz;
    OUT.texcoord_0.xy = IN.texcoord_0;

// approximately 12 instruction slots used
