//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/PAR2025.pso /Fcshaderdump19/PAR2025.pso.dis
//
//
// Parameters:

sampler2D AttenuationMap;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
float4 Toggles;


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSLightColor[0]   const_2        1
//   Toggles        const_7       1
//   NormalMap      texture_0       1
//   BaseMap        texture_1       1
//   AttenuationMap texture_3       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5;			// partial precision
    float3 texcoord_7 : TEXCOORD7_centroid;			// partial precision
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.04, -0.02, -0.5, 1};
    const float4 const_1 = {0.2, 0, 0, 0};

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.w = (r0.w * 0.04) + -0.02;			// partial precision
    r0.x = dot(IN.texcoord_7.xyz, IN.texcoord_7.xyz);			// partial precision
    r1.w = 1.0 / sqrt(r0.x);			// partial precision
    r0.xy = r1.w * IN.texcoord_7;			// partial precision
    r0.x = IN.texcoord_5.z;			// partial precision
    r0.y = IN.texcoord_5.w;			// partial precision
    r1.xy = (r0.w * r0) + IN.texcoord_0;			// partial precision
    r0.xyzw = tex2D(AttenuationMap, r0);			// partial precision
    r1.xyzw = tex2D(AttenuationMap, IN.texcoord_5);			// partial precision
    r2.xyzw = tex2D(NormalMap, r1);			// partial precision
    r2.xyz = r2.xyz + -0.5;
    r3.xyz = r2.xyz + r2.xyz;			// partial precision
    r2.xyz = normalize(r3);			// partial precision
    r3.xyz = normalize(IN.texcoord_3);			// partial precision
    r3.x = saturate(dot(r2.xyz, r3.xyz));			// partial precision
    r0.w = pow(abs(r3.x), Toggles.z);			// partial precision
    r2.w = r2.w * r0.w;			// partial precision
    r3.xyz = normalize(IN.texcoord_1);			// partial precision
    r2.x = dot(r2.xyz, r3.xyz);			// partial precision
    r0.w = 0.2 - r2.x;			// partial precision
    r3.w = r2.x - -0.5;			// partial precision
    r1.w = max(r3.w, 0);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r1.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r0.w = 1 - r1.x;			// partial precision
    r0.w = saturate(r0.w - r0.x);			// partial precision
    r0.xyz = saturate(r1);			// partial precision
    r1.xyz = r1.w * PSLightColor[0].rgb;			// partial precision
    r1.xyz = r1.xyz * r0.w;			// partial precision
    r0.w = dot(r1.xyz, 1.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (4 texture, 36 arithmetic)
