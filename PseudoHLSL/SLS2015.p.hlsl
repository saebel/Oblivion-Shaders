//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2015.pso /Fcshaderdump19/SLS2015.pso.dis
//
//
// Parameters:

float4 AmbientColor;
sampler2D BaseMap;
sampler2D NormalMap;
float4 PSLightColor[4];
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
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float3 color_0 : COLOR0;
    float4 color_1 : COLOR1;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {-0.5, 0.2, 0.5, 0};

    r0.xyzw = tex2D(BaseMap, IN.texcoord_0);			// partial precision
    r0.w = r0.w * AmbientColor.a;			// partial precision
    r1.xyzw = tex2D(NormalMap, IN.texcoord_0);			// partial precision
    r1.xyz = r1.xyz + -0.5;
    r2.xyz = normalize(IN.texcoord_3);			// partial precision
    r3.xyz = r1.xyz + r1.xyz;			// partial precision
    r1.xyz = normalize(r3);			// partial precision
    r3.x = saturate(dot(r1.xyz, r2.xyz));			// partial precision
    r2.w = pow(abs(r3.x), Toggles.z);			// partial precision
    r3.w = r1.w * r2.w;			// partial precision
    r3.x = dot(r1.xyz, IN.texcoord_1.xyz);			// partial precision
    r1.xyz = r0.xyz * IN.color_0;			// partial precision
    r0.xyz = PSLightColor[0].rgb;
    r1.xyz = (Toggles.x <= 0.0 ? r1 : r0);			// partial precision
    r2.w = r3.x + 0.5;			// partial precision
    r1.w = max(r2.w, 0);			// partial precision
    r2.w = r3.w * r1.w;			// partial precision
    r1.w = 0.2 - r3.x;			// partial precision
    r1.w = (r1.w >= 0.0 ? r3.w : r2.w);			// partial precision
    r2.xyz = saturate(r1.w * PSLightColor[0]);			// partial precision
    r1.w = saturate(r3.x);			// partial precision
    r3.xyz = (r1.w * r0.xyz) + AmbientColor.rgb;			// partial precision
    r0.xyz = max(r3.xyz, 0);			// partial precision
    r0.xyz = (r1.xyz * r0.xyz) + r2.xyz;			// partial precision
    r0.xyz = (Toggles.y <= 0.0 ? r1 : r0);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision
    r1.xyz = lerp(IN.color_1, r0, IN.color_1.a);			// partial precision

    return OUT;
};

// approximately 34 instruction slots used (2 texture, 32 arithmetic)
