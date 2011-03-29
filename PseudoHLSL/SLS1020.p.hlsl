//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1020.pso /Fcshaderdump19/SLS1020.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
sampler2D FaceGenMap;
sampler2D FaceGenMap2;
sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   FaceGenMap   texture_2       1
//   FaceGenMap2  texture_3       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float2 texcoord_2 : TEXCOORD2;
    float2 texcoord_3 : TEXCOORD3;
    float3 color_1 : COLOR1;
    float4 color_0 : COLOR0;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 2, 0, 0};

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);
    r0.w = r0.w * AmbientColor.a;
    r1.xyzw = tex2D(FaceGenMap, IN.texcoord_2);
    r1.xyz = r1.xyz + -0.5;
    r0.xyz = (2 * r1.xyz) + r0.xyz;
    r1.xyz = (-r0 * r3) + IN.color_0;
    r1.xyz = r1.xyz * IN.color_0.a;
    r2.xyzw = tex2D(FaceGenMap2, IN.texcoord_3);
    r2.xyz = r2.xyz + r2.xyz;
    r0.xyz = r2.xyz * r0.xyz;
    r0.xyz = r0.xyz + r0.xyz;
    r3.xyzw = tex2D(NormalMap, IN.texcoord_1);
    r3.xyz = r3.xyz + -0.5;
    r3.xyz = r3.xyz + r3.xyz;
    r4.xyz = IN.color_1 + -0.5;
    r4.xyz = r4.xyz + r4.xyz;
    r4.x = saturate(dot(r3.xyz, r4.xyz));
    r3.xyz = AmbientColor.rgb;
    r3.xyz = saturate((r4.x * PSLightColor[0]) + r3);
    r0.xyz = (r0.xyz * r3.xyz) + r1.xyz;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 21 instruction slots used (4 texture, 17 arithmetic)
