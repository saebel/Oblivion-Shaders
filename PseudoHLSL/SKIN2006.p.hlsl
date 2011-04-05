//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2006.pso /Fcshaderdump19/SKIN2006.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   AmbientColor   const_1       1
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   PSLightColor[2]   const_4        1
//   BaseMap        texture_0       1
//   NormalMap      texture_1       1
//   AttenuationMap texture_4       1
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
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0, 1, 0.5};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float3 r6;

    r0.x = IN.texcoord_5.z;
    r0.y = IN.texcoord_5.w;
    r1.x = IN.texcoord_4.z;
    r1.y = IN.texcoord_4.w;
    r3.xyzw = tex2D(AttenuationMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(AttenuationMap, r0.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r5.xyzw = tex2D(NormalMap, IN.texcoord_0.xy);			// partial precision
    r5.xyz = normalize(2 * (r5.xyz - 0.5));			// partial precision	// [0,1] to [-1,+1]
    r1.w = 1 - max(dot(r5.xyz, normalize(IN.texcoord_7.xyz)), 0);			// partial precision
    r2.xyzw = tex2D(AttenuationMap, IN.texcoord_5.xy);			// partial precision
    r2.w = r1.w * (r1.w * r1.w);			// partial precision
    r4.xyzw = tex2D(AttenuationMap, IN.texcoord_4.xy);			// partial precision
    r6.xyz = (max(dot(r5.xyz, normalize(IN.texcoord_2.xyz)), 0) * PSLightColor[1].rgb) + ((r2.w * PSLightColor[1].rgb) * 0.5);			// partial precision
    r3.xyz = (saturate((1 - r4.x) - r3.x) * r6.xyz) + ((max(dot(r5.xyz, IN.texcoord_1.xyz), 0) * PSLightColor[0].rgb) + ((r2.w * PSLightColor[0].rgb) * 0.5));			// partial precision
    r0.xyz = (saturate((1 - r2.x) - r1.x) * ((max(dot(r5.xyz, normalize(IN.texcoord_3.xyz)), 0) * PSLightColor[2].rgb) + ((r2.w * PSLightColor[2].rgb) * 0.5))) + r3.xyz;			// partial precision
    r0.xyz = r0.xyz + AmbientColor.rgb;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 52 instruction slots used (6 texture, 46 arithmetic)
