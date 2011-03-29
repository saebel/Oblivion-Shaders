//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2014.pso /Fcshaderdump19/SLS2014.pso.dis
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
float4 Toggles;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   EmittanceColor const_6       1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   GlowMap        texture_4       1
//   AttenuationMap texture_5       1
//   ShadowMap      texture_6       1
//   ShadowMaskMap  texture_7       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 texcoord_4 : TEXCOORD4;			// partial precision
    float4 texcoord_7 : TEXCOORD7;			// partial precision
    float2 color_0 : COLOR0;
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0.5, -1, 1};
    const int4 const_4 = {0, 0, 0, 0};

    r0.x = IN.texcoord_7.z;			// partial precision
    r0.y = IN.texcoord_7.w;			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r1.x = IN.texcoord_4.z;			// partial precision
    r1.y = IN.texcoord_4.w;			// partial precision
    r1.xyzw = tex2D(GlowMap, IN.texcoord_0);			// partial precision
    r1.xyz = (-r0 * r2) + IN.color_1;			// partial precision
    r2.xyzw = tex2D(ShadowMaskMap, r0);			// partial precision
    r3.xyzw = tex2D(ShadowMap, IN.texcoord_7);			// partial precision
    r3.xyz = r3.xyz + -1;			// partial precision
    r3.xyz = (r2.x * r3) + 1;			// partial precision
    r5.xyzw = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r2.w = 1 - r5.x;			// partial precision
    r6.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r6.xyz = r6.xyz + -0.5;
    r7.xyz = r6.xyz + r6.xyz;			// partial precision
    r6.xyz = normalize(r7);			// partial precision
    r5.x = saturate(dot(r6.xyz, IN.texcoord_1.xyz));			// partial precision
    r2.xyz = r5.x * PSLightColor[0].rgb;			// partial precision
    r4.xyzw = tex2D(AttenuationMap, r1);			// partial precision
    r2.w = saturate(r2.w - r4.x);			// partial precision
    r7.xyz = normalize(IN.texcoord_2);			// partial precision
    r7.x = saturate(dot(r6.xyz, r7.xyz));			// partial precision
    r4.xyz = r7.x * PSLightColor[1].rgb;			// partial precision
    r4.xyz = r2.w * r4.xyz;			// partial precision
    r2.w = -0.5;
    r2.xyz = (r3.xyz * r2.xyz) + r4.xyz;			// partial precision
    r3.xyz = r2.xyz + AmbientColor.rgb;			// partial precision
    r2.xyz = max(r3.xyz, 0);			// partial precision
    r3.xyz = r2.w + EmittanceColor.rgb;
    r3.xyz = (IN.color_0.g * r3) + 0.5;
    r4.xyz = r3.xyz + r3.xyz;			// partial precision
    r3.xyz = lerp(r1, r0, r1.w);			// partial precision
    r0.xyz = r4.xyz * r3.xyz;			// partial precision
    r0.xyz = r2.xyz * r0.xyz;			// partial precision
    r1.xyz = (IN.color_1.a * r1.xyz) + r0.xyz;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 44 instruction slots used (7 texture, 37 arithmetic)
