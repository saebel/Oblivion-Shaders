//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2001.pso /Fcshaderdump19/SLS2001.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
float4 Toggles;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   AmbientColor const_1       1
//   PSLightColor[0] const_2        1
//   Toggles      const_7       1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//   ShadowMap    texture_6       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float texcoord_7 : TEXCOORD7_centroid;			// partial precision
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.1, -0.5, 0, 20};

    float4 r0;
    float4 r1;
    float4 r2;
    float3 r3;

    r0.xyzw = 0.1 - IN.texcoord_7.x;
    clip(r0.xyzw);
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r2.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r3.xyz = (saturate(dot(normalize(2 * (r2.xyz - 0.5)), IN.texcoord_1.xyz)) * PSLightColor[0].rgb) + AmbientColor.rgb;			// partial precision	// [0,1] to [-1,+1]
    r0.xyz = r0.xyz * max(r3.xyz, 0);			// partial precision
    r1.xyzw = tex2D(ShadowMap, IN.texcoord_0.xy * 20);
    r1.w = (r1.x * 0.5) - -0.5;
    r1.xyz = (-r1.w * r0.xyz) + IN.color_1.rgb;			// partial precision
    r0.xyz = r0.xyz * r1.w;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? ((IN.color_1.a * r1.xyz) + r0.xyz) : r0.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 24 instruction slots used (4 texture, 20 arithmetic)
