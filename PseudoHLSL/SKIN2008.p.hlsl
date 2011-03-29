//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SKIN2008.pso /Fcshaderdump19/SKIN2008.pso.dis
//
//
// Parameters:

sampler2D AttenuationMap;
sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   PSLightColor[0]   const_2        1
//   PSLightColor[1]   const_3        1
//   NormalMap      texture_0       1
//   AttenuationMap texture_3       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1_centroid;
    float3 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_4 : TEXCOORD4;
    float4 texcoord_5 : TEXCOORD5;
    float3 texcoord_7 : TEXCOORD7_centroid;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 1, 0, 0.5};

    r0.x = IN.texcoord_4.z;
    r0.y = IN.texcoord_4.w;
    r0.xyzw = tex2D(AttenuationMap, r0);			// partial precision
    r2.xyzw = tex2D(AttenuationMap, r1);			// partial precision
    r3.xyzw = tex2D(AttenuationMap, IN.texcoord_5);			// partial precision
    r4.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r4.xyz = r4.xyz + -0.5;
    r4.xyz = r4.xyz + r4.xyz;			// partial precision
    r5.xyz = normalize(r4);			// partial precision
    r6.xyz = normalize(IN.texcoord_7);			// partial precision
    r4.x = dot(r5.xyz, r6.xyz);			// partial precision
    r0.w = max(r4.x, 0);			// partial precision
    r0.w = 1 - r0.w;			// partial precision
    r1.x = IN.texcoord_5.z;
    r1.y = IN.texcoord_5.w;
    r1.xyzw = tex2D(AttenuationMap, IN.texcoord_4);			// partial precision
    r1.w = r0.w * r0.w;			// partial precision
    r0.w = r0.w * r1.w;			// partial precision
    r7.xyz = normalize(IN.texcoord_2);			// partial precision
    r7.x = dot(r5.xyz, r7.xyz);			// partial precision
    r1.w = max(r7.x, 0);			// partial precision
    r4.xyz = r0.w * PSLightColor[0].rgb;			// partial precision
    r6.xyz = r0.w * PSLightColor[1].rgb;			// partial precision
    r0.w = 1 - r3.x;			// partial precision
    r0.w = saturate(r0.w - r2.x);			// partial precision
    r3.xyz = r6.xyz * 0.5;			// partial precision
    r2.xyz = (r1.w * PSLightColor[1].rgb) + r3.xyz;			// partial precision
    r3.xyz = normalize(IN.texcoord_1);			// partial precision
    r3.x = dot(r5.xyz, r3.xyz);			// partial precision
    r1.w = max(r3.x, 0);			// partial precision
    r2.xyz = r0.w * r2.xyz;			// partial precision
    r0.w = 1 - r1.x;			// partial precision
    r0.w = saturate(r0.w - r0.x);			// partial precision
    r1.xyz = r4.xyz * 0.5;			// partial precision
    r0.xyz = (r1.w * PSLightColor[0].rgb) + r1.xyz;			// partial precision
    r0.xyz = (r0.w * r0.xyz) + r2.xyz;			// partial precision
    r0.w = 1;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 46 instruction slots used (5 texture, 41 arithmetic)
