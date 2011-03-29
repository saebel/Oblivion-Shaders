//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS1013.pso /Fcshaderdump19/SLS1013.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
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
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float3 texcoord_3 : TEXCOORD3;
    float3 color_0 : COLOR0;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0, 0, 0};

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);
    r0.xyz = r0.xyz * IN.color_0;
    r1.xyzw = tex2D(NormalMap, IN.texcoord_1);
    r1.xyz = r1.xyz + -0.5;
    r1.xyz = r1.xyz + r1.xyz;
    r2.xyz = IN.texcoord_3 + -0.5;
    r2.xyz = r2.xyz + r2.xyz;
    r2.x = saturate(dot(r1.xyz, r2.xyz));
    r1.xyz = PSLightColor[0].rgb;
    r1.xyz = saturate((r2.x * r1) + AmbientColor);
    r0.xyz = r1.xyz * r0.xyz;
    OUT.color_0.rgba = r0.xyzw;

    return OUT;
};

// approximately 12 instruction slots used (2 texture, 10 arithmetic)
