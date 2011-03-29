//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/GRASS2003.pso /Fcshaderdump19/GRASS2003.pso.dis
//
//
// Parameters:

float4 AlphaTestRef;
sampler2D AttMap;
sampler2D DiffuseMap;
float4 PointLightColor;


// Registers:
//
//   Name            Reg   Size
//   --------------- ----- ----
//   PointLightColor const_2       1
//   AlphaTestRef    const_3       1
//   DiffuseMap      texture_0       1
//   AttMap          texture_1       1
//



// Structures:

struct VS_OUTPUT {
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_4 : TEXCOORD4_centroid;			// partial precision
    float4 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float4 texcoord_1 : TEXCOORD1;			// partial precision
    float4 color_0 : COLOR0;
};

struct PS_OUTPUT {
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0, 1, 0.4, 0};

    r0.x = IN.texcoord_1.z;			// partial precision
    r0.y = IN.texcoord_1.w;			// partial precision
    r0.xyzw = tex2D(DiffuseMap, IN.texcoord_0);			// partial precision
    r0.w = AlphaTestRef.x - r0.w;			// partial precision
    r0.w = (r0.w >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w * IN.texcoord_5.w;			// partial precision
    r1.xyzw = tex2D(AttMap, r0);			// partial precision
    r1.y = 0.4;
    r2.xyzw = tex2D(AttMap, IN.texcoord_1);			// partial precision
    r1.w = 1 - r2.x;			// partial precision
    r1.w = saturate(r1.w - r1.x);			// partial precision
    r1.xyz = r1.y * PointLightColor.rgb;			// partial precision
    r2.xyz = IN.texcoord_5;			// partial precision
    r2.xyz = r2.xyz + IN.texcoord_4;			// partial precision
    r1.xyz = (r1.w * r1.xyz) + r2.xyz;			// partial precision
    r2.xyz = (-r0 * r1) + IN.color_0;			// partial precision
    r2.xyz = r2.xyz * IN.color_0.a;			// partial precision
    r0.xyz = (r0.xyz * r1.xyz) + r2.xyz;			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 19 instruction slots used (3 texture, 16 arithmetic)
