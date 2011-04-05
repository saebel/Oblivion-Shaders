//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS2080.pso /Fcshaderdump19/SLS2080.pso.dis
//
//
// Parameters:

float4 PSLightColor[4];
sampler2D ShadowMap;


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   ShadowMap    texture_6       1
//



// Structures:

struct VS_OUTPUT {
    float3 texcoord_6 : TEXCOORD6_centroid;
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3;			// partial precision
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

    const float4 const_0 = {0.5, 1, 15, 0};
    const float4 const_1 = {-0.000195312503, 0.01, 0.02, -0.01};
    const float4 const_3 = {1, -1, (1.0 / 7), 0.6};
    const float4 const_4 = {-0.02, 0.02, 0, 0};
    const float4 const_5 = {-0.01, 0.01, 0, 0};
    const int4 const_6 = {0, 1, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;
    float4 r4;
    float4 r5;
    float4 r6;
    float4 r7;
    float4 r8;
    float4 r9;

    r9.w = saturate((length(IN.texcoord_6.xyz - IN.texcoord_2.xyz) / 1.0) / (IN.texcoord_2.w * 0.5));
    r1.w = sqrt(r9.w);
    r0.w = 1.0 / ((r1.w <= 0.0 ? (1 - r1.w) : 1) * 15);			// partial precision
    r0.xy = (0.5 * (IN.texcoord_1.xy / IN.texcoord_1.w)) + 0.5;	// [-1,+1] to [0,1]
    r8.x = saturate(r0.x >= 0.0 ? 0 : r0.x);
    r8.y = saturate((1 - r0.y) >= 0.0 ? 0 : (1 - r0.y));
    r0.xy = (const_3.xy * r0.xy) + const_6.xy;
    r1.xyzw = tex2D(ShadowMap, saturate((r0.w * -0.01) + r0.xy));
    r2.xyzw = tex2D(ShadowMap, saturate((r0.w * -const_4) + r0.xy));
    r3.xyzw = tex2D(ShadowMap, saturate((r0.w * -const_5) + r0.xy));
    r4.xyzw = tex2D(ShadowMap, saturate((r0.w * const_4) + r0.xy));
    r5.xyzw = tex2D(ShadowMap, saturate((r0.w * const_5) + r0.xy));
    r6.xyzw = tex2D(ShadowMap, saturate((r0.w * 0.02) + r0.xy));
    r7.xyzw = tex2D(ShadowMap, saturate((r0.w * 0.01) + r0.xy));
    r0.xyzw = tex2D(ShadowMap, saturate((r0.w * -0.02) + r0.xy));
    r1.w = 1.0 / IN.texcoord_2.w;
    r8.xyzw = tex2D(ShadowMap, r8.xy);
    r0.w = ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r8.x)) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r7.x)) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r6.x)) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r5.x)) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r4.x)) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r3.x)) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r2.x)) >= 0.0 ? 1 : 0);			// partial precision
    r2.w = (IN.texcoord_1.z * -r1.w) + r1.x;
    r0.w = r0.w + ((-0.000195312503 - r2.w) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = r0.w + ((-0.000195312503 - ((IN.texcoord_1.z * -r1.w) + r0.x)) >= 0.0 ? 1 : 0);			// partial precision
    r0.w = (PSLightColor[0].a * (saturate(r0.w / 7) - 1)) + 1;			// partial precision
    r1.w = 1 - r0.w;			// partial precision
    r0.w = (r0.w <= 0.0 ? r1.w : 1);			// partial precision
    r0.xyz = lerp(1, lerp(1, (((r1.w * 0.6) * -PSLightColor[0].rgb) + 1), r9.w * r9.w), IN.texcoord_3.w);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

    return OUT;
};

// approximately 90 instruction slots used (9 texture, 81 arithmetic)
