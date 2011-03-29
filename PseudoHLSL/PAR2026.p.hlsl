//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2026.pso /Fcshaderdump19/PAR2026.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
float4 Toggles;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   Toggles        const_7       1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_5       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;			// partial precision
    float3 color_0 : COLOR0;
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.04, -0.02, -0.5, 0.2};
    const int4 const_4 = {0, 1, 0, 0};

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.w = (r0.w * 0.04) + -0.02;			// partial precision
    r0.x = dot(IN.texcoord_6.xyz, IN.texcoord_6.xyz);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_6;			// partial precision
    r0.xy = (r0.w * r0) + IN.texcoord_0;
    r0.xyzw = tex2D(BaseMap, r0);			// partial precision
    r1.xyzw = tex2D(NormalMap, r0);			// partial precision
    r1.xyz = r1.xyz + -0.5;
    r2.x = IN.texcoord_5.z;			// partial precision
    r2.y = IN.texcoord_5.w;			// partial precision
    r2.xyzw = tex2D(AttenuationMap, r2);			// partial precision
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_5);			// partial precision
    r4.xyz = r1.xyz + r1.xyz;			// partial precision
    r1.xyz = normalize(r4);			// partial precision
    r4.xyz = normalize(IN.texcoord_4);			// partial precision
    r4.x = saturate(dot(r1.xyz, r4.xyz));			// partial precision
    r0.w = pow(abs(r4.x), Toggles.z);			// partial precision
    r3.w = r1.w * r0.w;			// partial precision
    r4.xyz = normalize(IN.texcoord_2);			// partial precision
    r4.x = dot(r1.xyz, r4.xyz);			// partial precision
    r2.w = r4.x - -0.5;			// partial precision
    r0.w = max(r2.w, 0);			// partial precision
    r2.w = r3.w * r0.w;			// partial precision
    r0.w = 0.2 - r4.x;			// partial precision
    r0.w = (r0.w >= 0.0 ? r3.w : r2.w);			// partial precision
    r2.w = 1 - r3.x;			// partial precision
    r2.w = saturate(r2.w - r2.x);			// partial precision
    r3.xyz = normalize(IN.texcoord_3);			// partial precision
    r2.x = saturate(dot(r1.xyz, r3.xyz));			// partial precision
    r3.x = dot(r1.xyz, IN.texcoord_1.xyz);			// partial precision
    r1.xyz = r0.w * PSLightColor[1].rgb;			// partial precision
    r0.w = 0.2 - r3.x;			// partial precision
    r3.w = pow(abs(r2.x), Toggles.z);			// partial precision
    r2.xyz = saturate(r2.w * r1);			// partial precision
    r3.w = r1.w * r3.w;			// partial precision
    r4.w = r3.x - -0.5;			// partial precision
    r1.w = max(r4.w, 0);			// partial precision
    r1.w = r3.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r3.w : r1.w);			// partial precision
    r1.xyz = saturate(r0.w * PSLightColor[0]);			// partial precision
    r0.w = saturate(r4.x);			// partial precision
    r2.xyz = r2.xyz + r1.xyz;			// partial precision
    r1.xyz = r0.xyz * IN.color_0;			// partial precision
    r0.xyz = r0.w * PSLightColor[1].rgb;			// partial precision
    r0.w = saturate(r3.x);			// partial precision
    r0.xyz = r2.w * r0.xyz;			// partial precision
    r0.xyz = (r0.w * PSLightColor[0].rgb) + r0.xyz;			// partial precision
    r0.w = AmbientColor.a;			// partial precision
    r3.xyz = r0.xyz + AmbientColor.rgb;			// partial precision
    r0.xyz = max(r3.xyz, 0);			// partial precision
    r1.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r0.xyz = (r1.xyz * r0.xyz) + r2.xyz;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision
    r1.xyz = lerp(IN.color_1, r0, IN.color_1.a);			// partial precision

    return OUT;
};

// approximately 69 instruction slots used (5 texture, 64 arithmetic)
