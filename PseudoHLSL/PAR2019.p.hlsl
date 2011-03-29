//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2019.pso /Fcshaderdump19/PAR2019.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
float4 EmittanceColor;
sampler2D GlowMap;
sampler2D NormalMap;
float4 PSLightColor[4];
sampler2D ShadowMap;
sampler2D ShadowMaskMap;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   EmittanceColor const_6       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_3       1
//   AttenuationMap texture_4       1
//   ShadowMap      texture_5       1
//   ShadowMaskMap  texture_6       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float3 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float3 texcoord_7 : TEXCOORD7_centroid;
    float4 texcoord_6 : TEXCOORD6;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.04, -0.02, -0.5, -1};

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.w = (r0.w * 0.04) + -0.02;			// partial precision
    r0.x = dot(IN.texcoord_7.xyz, IN.texcoord_7.xyz);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_7;			// partial precision
    r0.x = IN.texcoord_5.z;
    r0.y = IN.texcoord_5.w;
    r1.x = IN.texcoord_6.z;
    r1.y = IN.texcoord_6.w;
    r1.xyzw = tex2D(AttenuationMap, r0);			// partial precision
    r2.xy = (r0.w * r0) + IN.texcoord_0;
    r0.xyzw = tex2D(GlowMap, IN.texcoord_0);
    r2.xyzw = tex2D(AttenuationMap, IN.texcoord_5);			// partial precision
    r3.x = IN.texcoord_4.z;
    r3.y = IN.texcoord_4.w;
    r3.xyzw = tex2D(ShadowMaskMap, r1);			// partial precision
    r4.xyzw = tex2D(ShadowMap, IN.texcoord_6);			// partial precision
    r4.xyz = r4.xyz + -1;			// partial precision
    r4.xyz = (r3.x * r4) - -1;			// partial precision
    r5.xyzw = tex2D(AttenuationMap, r3);			// partial precision
    r6.xyzw = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r0.w = -(r6.x + -1);			// partial precision
    r0.w = saturate(r0.w - r5.x);			// partial precision
    r7.xyzw = tex2D(NormalMap, r2);			// partial precision
    r7.xyz = r7.xyz + -0.5;
    r8.xyz = r7.xyz + r7.xyz;			// partial precision
    r7.xyz = normalize(r8);			// partial precision
    r3.x = saturate(dot(r7.xyz, IN.texcoord_1.xyz));			// partial precision
    r3.xyz = r3.x * PSLightColor[0].rgb;			// partial precision
    r8.xyz = normalize(IN.texcoord_2);			// partial precision
    r6.x = saturate(dot(r7.xyz, r8.xyz));			// partial precision
    r5.xyz = r6.x * PSLightColor[1].rgb;			// partial precision
    r5.xyz = r0.w * r5.xyz;			// partial precision
    r0.w = -(r2.x + -1);			// partial precision
    r0.w = saturate(r0.w - r1.x);			// partial precision
    r3.xyz = (r4.xyz * r3.xyz) + r5.xyz;			// partial precision
    r4.xyz = normalize(IN.texcoord_3);			// partial precision
    r2.x = saturate(dot(r7.xyz, r4.xyz));			// partial precision
    r1.xyz = r2.x * PSLightColor[2].rgb;			// partial precision
    r2.xyz = EmittanceColor.rgb;
    r0.xyz = (r0.xyz * r2.xyz) + AmbientColor.rgb;			// partial precision
    r1.xyz = (r0.w * r1.xyz) + r3.xyz;			// partial precision
    r0.w = --1;
    r0.xyz = r1.xyz + r0.xyz;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 51 instruction slots used (9 texture, 42 arithmetic)
