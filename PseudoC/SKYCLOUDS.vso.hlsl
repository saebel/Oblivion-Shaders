//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKYCLOUDS.vso /Fcshaderdump19/SKYCLOUDS.vso.dis
//
//
// Parameters:
//
//   float4 BlendColor[3];
//   row_major float4x4 ModelViewProj;
//   float TexCoordYOff;
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
//   TexCoordYOff  const_12      1
//

    float4 IN.position : POSITION;
    float4 IN.texcoord_0 : TEXCOORD0;
    float4 IN.color_0 : COLOR0;
    float4 OUT.position : POSITION;
    float2 OUT.texcoord_0 : TEXCOORD0;
    float2 OUT.texcoord_1 : TEXCOORD1;
    float2 OUT.texcoord_2 : TEXCOORD2;
    float2 OUT.texcoord_3 : TEXCOORD3;
    float4 OUT.color_0 : COLOR0;
    r0.xyz = BlendColor[1].rgb * IN.color_0.g;
    r0.xyz = (IN.color_0.r * BlendColor[0].rgb) + r0.xyz;
    OUT.color_0.rgb = (IN.color_0.b * BlendColor[2].rgb) + r0.xyz;
    r0.x = dot(ModelViewProj[0].xyzw, IN.position.xyzw);
    r0.y = dot(ModelViewProj[1].xyzw, IN.position.xyzw);
    r0.z = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.color_0.a = BlendColor[0].a * IN.color_0.a;
    OUT.position.xyzw = r0.xyzz;
    r0.y = TexCoordYOff.x + IN.texcoord_0.y;
    r0.x = IN.texcoord_0.x;
    OUT.texcoord_0.xy = r0.xy;
    OUT.texcoord_1.xy = r0.xy;
    OUT.texcoord_2.xy = r0.xy;
    OUT.texcoord_3.xy = r0.xy;

// approximately 14 instruction slots used
