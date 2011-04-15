//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/GRASS2008.pso /Fcshaderdump19/GRASS2008.pso.dis
//
//
// Parameters:
//
float4 AlphaTestRef;
sampler2D DiffuseMap;
float4 LightData;
float4 PSLightColor;
sampler2D ShadowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor const_2        1
//   AlphaTestRef const_3       1
//   LightData    const_4       1
//   DiffuseMap   texture_0       1
//   ShadowMap    texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 DiffuseUV : TEXCOORD0;			// partial precision
    float4 texcoord_5 : TEXCOORD5_centroid;			// partial precision
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float4 color_0 : COLOR0;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	weight(v)		dot(v, 1)
#define	sqr(v)			((v) * (v))

    const float4 const_0 = {0, 1, 0.5, 0.001};
    const float4 const_1 = {0.5 + 0.01, 0.01, 0, 0};
    const float4 const_10 = {0.5, 0.5 + 0.01, 0, 0};
    const float4 const_11 = {0.5, 0.5 - 0.01, 0, 0};
    const float4 const_12 = {0.5 - 0.01, 0, 0, 0};
    const int4 const_13 = {1, 1, 1, 0};
    const float4 const_5 = {0.5 + 0.01, -0.01, 0, 0};
    const float4 const_6 = {0.5, -0.5, -0.00136718748, 0.5 + 0.01};
    const float4 const_7 = {0, 0.5, 0.125, 0.6};
    const float4 const_8 = {0.5 - 0.01, 0.01, 0, 0};
    const float4 const_9 = {0.5 - 0.01, -0.01, 0, 0};

    float1 l4;
    float1 q0;
    float1 q57;
    float1 q58;
    float3 q6;
    float4 r0;
    float4 r1;
    float2 r10;
    float4 r2;
    float3 r3;
    float3 r4;
    float3 r5;
    float3 r6;
    float3 r7;
    float3 r8;
    float3 r9;

    r10.xy = IN.texcoord_1.xy / IN.texcoord_1.w;			// partial precision
    r9.xyz = tex2D(ShadowMap, saturate(0.5 + (const_6.xy * r10.xy)));			// partial precision
    q0.x = 1 - (IN.texcoord_1.y / IN.texcoord_1.w);			// partial precision
    r0.xy = (const_6.xy * r10.xy) + const_7.xy;			// partial precision
    r5.xyz = tex2D(ShadowMap, saturate(r0.xy + const_9.xy));			// partial precision
    r7.xyz = tex2D(ShadowMap, saturate(r0.xy + const_8.xy));			// partial precision
    r6.xyz = tex2D(ShadowMap, saturate(r0.xy + const_5.xy));			// partial precision
    r8.xyz = tex2D(ShadowMap, saturate(r0.xy + const_1.xy));			// partial precision
    r1.y = saturate(r0.y >= 0.0 ? r0.y : 0);			// partial precision
    r1.x = saturate((r0.x + 0.5 + 0.01) >= 0.0 ? (r0.x + 0.5 + 0.01) : 0);			// partial precision
    r0.xyz = tex2D(ShadowMap, saturate(r0.xy + const_12.xy));			// partial precision
    r3.xyz = tex2D(ShadowMap, saturate(const_11.xy + (const_6.xy * r10.xy)));			// partial precision
    r4.xyz = tex2D(ShadowMap, saturate(const_10.xy + (const_6.xy * r10.xy)));			// partial precision
    r2.xyz = tex2D(ShadowMap, r1.xy);			// partial precision
    r1.xyzw = tex2D(DiffuseMap, IN.DiffuseUV.xy);			// partial precision
    r2.yz = const_0.yz;
    l4.x = saturate(length(IN.texcoord_2.xyz - LightData.xyz) / (r2.z * LightData.w));			// partial precision
    q57.x = ((compress(r10.x) >= 0.0 ? 1 : 0) * (1 >= compress(r10.x) ? 1 : 0)) * (q0.x >= 0.0 ? 1 : 0);
    q58.x = (q57.x * ((1 - (q0.x * 0.5)) >= 0.0 ? 1 : 0)) * (IN.texcoord_1.z >= 0.0 ? 1 : 0);
    r2.w = ((-0.00136718748 - (r8.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = ((-0.00136718748 - (r9.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1) + r2.w;			// partial precision
    r0.w = r0.w + ((-0.00136718748 - (r7.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = r0.w + ((-0.00136718748 - (r6.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = r0.w + ((-0.00136718748 - (r5.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = r0.w + ((-0.00136718748 - (r4.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = r0.w + ((-0.00136718748 - (r3.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = r0.w + ((-0.00136718748 - (r2.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.w = r0.w + ((-0.00136718748 - (r0.x - (IN.texcoord_1.z * 0.001))) >= 0.0 ? 0 : 1);			// partial precision
    r0.xyz = (PSLightColor.a * (saturate(r0.w * 0.125) - 1)) + r2.y;			// partial precision
    r0.w = 1;			// partial precision
    r0.xyzw = (q58.x <= 0.0 ? const_13.xyzw : r0.xyzw);			// partial precision
    q6.xyz = lerp(1, lerp(1, r2.y - (((1 - r0.x) * 0.6) * PSLightColor.rgb), sqr(l4.x)), IN.color_0.a);			// partial precision
    r2.w = (AlphaTestRef.x >= r1.w ? 0 : IN.texcoord_5.w);			// partial precision
    r1.w = min(min(r1.w, r0.w), 1 - r0.x);			// partial precision
    r1.xyz = (r2.w * (q6.xyz - 1)) + 1;			// partial precision
    r1.xyzw = (q58.x <= 0.0 ? r0.xyzw : r1.xyzw);			// partial precision
    OUT.color_0.a = min(r1.w, r2.w);			// partial precision
    OUT.color_0.rgb = r1.xyz;			// partial precision

    return OUT;
};

// approximately 106 instruction slots used (10 texture, 96 arithmetic)
