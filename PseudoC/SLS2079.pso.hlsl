//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   psa shaderdump19/SLS2079.pso /Fcshaderdump19/SLS2079.pso.dis
//
//
// Parameters:
//
//   sampler2D BaseMap;
//   float4 PSLightColor[4];
//   sampler2D ShadowMap;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   BaseMap      texture_0       1
//   ShadowMap    texture_6       1
//

    const float4 const_0 = {0.5, 1, 15, 0};
    const float4 const_1 = {-0.000195312503, 0.01, -0.01, 0.25};
    const float4 const_3 = {1, -1, 0.6, 0};
    const float4 const_4 = {-0.01, 0.01, 0, 0};
    const int4 const_5 = {0, 1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float3 texcoord_6 : TEXCOORD6_centroid;
    float4 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3;			// partial precision
    sampler2D BaseMap;
    sampler2D ShadowMap;
    r0.w = 1.0 / IN.texcoord_1.w;			// partial precision
    r0.xy = r0.w * IN.texcoord_1.xy;
    r0.xy = (0.5 * r0.xy) + 0.5;
    r1.xyz = IN.texcoord_2.xyz;
    r1.xyz = IN.texcoord_6.xyz - r1.xyz;
    r0.w = 1 - r0.y;
    r1.x = dot(r1.xyz, r1.xyz);	// normalize + length
    r1.w = 1.0 / sqrt(r1.x);
    r1.w = 1.0 / r1.w;
    r2.w = IN.texcoord_2.w * 0.5;
    r2.w = 1.0 / r2.w;
    r6.w = saturate(r1.w * r2.w);
    r1.w = 1.0 / sqrt(r6.w);
    r1.w = 1.0 / r1.w;
    r2.w = 1 - r1.w;
    r0.z = 1 - r0.y;
    r1.w = (r1.w <= 0.0 ? 1 : r2.w);
    r4.x = saturate((r0.x >= 0.0 ? r0.x : 0));
    r4.y = saturate((r0.z >= 0.0 ? r0.w : 0));
    r0.w = r1.w * 15;			// partial precision
    r1.xy = const_3.xy;
    r0.xy = (r1.xy * r0.xy) + const_5.xy;
    r0.w = 1.0 / r0.w;			// partial precision
    r3.xy = saturate((r0.w * 0.01) + r0.xy);
    r2.xy = saturate((r0.w * const_4.xy) + r0.xy);
    r1.xy = saturate((r0.w * -const_4.xy) + r0.xy);
    r0.xy = saturate((r0.w * -0.01) + r0.xy);
    r5.xyzw = tex2D(ShadowMap, r4.xy);
    r4.xyzw = tex2D(ShadowMap, r3.xy);
    r3.xyzw = tex2D(ShadowMap, r2.xy);
    r2.xyzw = tex2D(ShadowMap, r1.xy);
    r1.xyzw = tex2D(ShadowMap, r0.xy);
    r0.xyzw = tex2D(BaseMap, IN.texcoord_0.xy);			// partial precision
    r2.w = 1.0 / IN.texcoord_2.w;
    r1.w = (IN.texcoord_1.z * -r2.w) + r5.x;
    r1.w = -0.000195312503 - r1.w;
    r1.w = (r1.w >= 0.0 ? 0 : 1);			// partial precision
    r3.w = (IN.texcoord_1.z * -r2.w) + r4.x;
    r3.w = -0.000195312503 - r3.w;
    r3.w = (r3.w >= 0.0 ? 0 : 1);			// partial precision
    r1.w = r1.w + r3.w;			// partial precision
    r3.w = (IN.texcoord_1.z * -r2.w) + r3.x;
    r3.w = -0.000195312503 - r3.w;
    r3.w = (r3.w >= 0.0 ? 0 : 1);			// partial precision
    r1.w = r1.w + r3.w;			// partial precision
    r3.w = (IN.texcoord_1.z * -r2.w) + r2.x;
    r3.w = -0.000195312503 - r3.w;
    r3.w = (r3.w >= 0.0 ? 0 : 1);			// partial precision
    r1.w = r1.w + r3.w;			// partial precision
    r2.w = (IN.texcoord_1.z * -r2.w) + r1.x;
    r2.w = -0.000195312503 - r2.w;
    r2.w = (r2.w >= 0.0 ? 0 : 1);			// partial precision
    r1.w = r1.w + r2.w;			// partial precision
    r1.w = saturate(r1.w * 0.25);			// partial precision
    r1.w = r1.w - 1;			// partial precision
    r0.z = 1;
    r1.w = (PSLightColor[0].a * r1.w) + r0.z;			// partial precision
    r2.w = 1 - r1.w;			// partial precision
    r1.w = r2.w * 0.6;			// partial precision
    r3.w = r6.w * r6.w;
    r0.xyz = (r1.w * -PSLightColor[0].rgb) + r0.z;			// partial precision
    r1.xyz = lerp(r0.xyz, 1, r3.w);			// partial precision
    r1.w = min(r0.w, 1);			// partial precision
    r0.xyz = lerp(r1.xyz, 1, IN.texcoord_3.w);			// partial precision
    r0.w = min(r1.w, r2.w);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision

// approximately 68 instruction slots used (6 texture, 62 arithmetic)
