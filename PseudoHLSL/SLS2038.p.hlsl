//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2038.pso /Fcshaderdump19/SLS2038.pso.dis
//
//
// Parameters:

sampler2D NormalMap;
float4 PSLightColor[4];


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   NormalMap    texture_0       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0.5, 1, 0.7};
    const float4 const_1 = {30, 0.2, 0, 0};
    const float4 const_3 = {0, 0, 1, 0.5};

    r0.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r0.w = r0.w * 0.7;			// partial precision
    r0.xyz = r0.xyz + -0.5;
    r1.xyz = r0.xyz + r0.xyz;			// partial precision
    r0.xyz = normalize(r1);			// partial precision
    r1.xyz = (0.5 * r0.xyz) + const_3.xyz;			// partial precision
    r2.w = (r0.z * 0.5) + 1;			// partial precision
    r2.xy = r0.xy * 0.5;			// partial precision
    r1.w = r2.x * r1.x;
    r1.w = (r2.y * r1.y) + r1.w;
    r1.w = (r2.w * r1.z) + r1.w;			// partial precision
    r1.w = 1.0 / sqrt(r1.w);			// partial precision
    r2.xyz = r1.xyz * r1.w;			// partial precision
    r1.xyz = normalize(IN.texcoord_3);			// partial precision
    r3.x = dot(r2.xyz, r1.xyz);			// partial precision
    r1.xyz = normalize(IN.texcoord_1);			// partial precision
    r0.x = dot(r0.xyz, r1.xyz);			// partial precision
    r2.x = dot(r2.xyz, r1.xyz);			// partial precision
    r1.w = r2.x - r3.x;			// partial precision
    r1.w = saturate(abs(r1.w));			// partial precision
    r2.w = 1 - r1.w;			// partial precision
    r1.w = pow(abs(r2.w), 30);			// partial precision
    r2.w = r0.w * r1.w;			// partial precision
    r0.w = 0.2 - r0.x;			// partial precision
    r3.w = r0.x + 0.5;			// partial precision
    r0.xyz = saturate(r1);			// partial precision
    r1.w = max(r3.w, 0);			// partial precision
    r1.w = r2.w * r1.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? r2.w : r1.w);			// partial precision
    r1.xyz = r0.w * PSLightColor[0].rgb;			// partial precision
    r0.w = dot(r1.xyz, 1.xyz);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 40 instruction slots used (1 texture, 39 arithmetic)
