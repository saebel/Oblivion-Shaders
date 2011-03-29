

// Structures:

struct VS_INPUT {
    float2 texcoord_0 : TEXCOORD0;
    float3 texcoord_1 : TEXCOORD1;
    float3 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float3 texcoord_4 : TEXCOORD4;
    float3 texcoord_5 : TEXCOORD5;
    float3 texcoord_6 : TEXCOORD6;
    float3 texcoord_7 : TEXCOORD7;
};

struct VS_OUTPUT {
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_0 = {8, 0, 1, 2};
    const int4 const_1 = {7, 0, 0, 0};
    const int4 const_2 = {3, 4, 5, 6};

    r0.xy = saturate(IN.texcoord_2);			// partial precision
    r1.xy = saturate(IN.texcoord_3);			// partial precision
    r9.w = 8;
    r2.w = min(const_14.x, r9.w);
    r9.w = frac(r2.w);
    r11.w = r2.w - r9.w;
    r2.w = (r2.w >= 0.0 ? 1 : 0);			// partial precision
    r9.w = (r9.w <= 0.0 ? 1 : 0);			// partial precision
    r9.w = (r2.w * r9.w) + r11.w;
    r2.w = 1 - r9.w;
    r7.xyzw = tex2D(texture_1, r5);			// partial precision
    r8.xyzw = tex2D(texture_1, r6);			// partial precision
    r10.w = r8.w * IN.texcoord_2.z;			// partial precision
    r5.x = (const_18.y * r1.x) + const_18.x;			// partial precision
    r5.y = (const_18.w * r1.y) + const_18.z;			// partial precision
    r1.xy = saturate(IN.texcoord_4);			// partial precision
    r4.x = (const_19.y * r1.x) + const_19.x;			// partial precision
    r4.y = (const_19.w * r1.y) + const_19.z;			// partial precision
    r1.xy = saturate(IN.texcoord_5);			// partial precision
    r3.x = (const_20.y * r1.x) + const_20.x;			// partial precision
    r3.y = (const_20.w * r1.y) + const_20.z;			// partial precision
    r1.xy = saturate(IN.texcoord_6);			// partial precision
    r2.x = (const_21.y * r1.x) + const_21.x;			// partial precision
    r2.y = (const_21.w * r1.y) + const_21.z;			// partial precision
    r1.xy = saturate(IN.texcoord_7);			// partial precision
    r1.x = (const_22.y * r1.x) + const_22.x;			// partial precision
    r1.y = (const_22.w * r1.y) + const_22.z;			// partial precision
    r1.xyzw = tex2D(texture_0, IN.texcoord_0);			// partial precision
    r2.xyz = lerp(r8, r0, r10.w);			// partial precision
    r3.xyzw = tex2D(texture_1, r1);			// partial precision
    r4.xyzw = tex2D(texture_1, r2);			// partial precision
    r5.xyzw = tex2D(texture_1, r3);			// partial precision
    r6.x = (const_17.y * r0.x) + const_17.x;			// partial precision
    r6.y = (const_17.w * r0.y) + const_17.z;			// partial precision
    r0.xy = saturate(IN.texcoord_1);			// partial precision
    r0.x = (const_16.y * r0.x) + const_16.x;			// partial precision
    r0.y = (const_16.w * r0.y) + const_16.z;			// partial precision
    r0.xyzw = tex2D(texture_1, r0);			// partial precision
    r0.w = r0.w * IN.texcoord_1.z;			// partial precision
    r0.xyz = r0.xyz * r0.w;			// partial precision
    r0.xyzw = (r2.w >= 0.0 ? r0 : 0);			// partial precision
    r2.w = (r8.w * IN.texcoord_2.z) + r0.w;			// partial precision
    r6.xyzw = tex2D(texture_1, r4);			// partial precision
    r8.w = 2 - r9.w;
    r0.xyzw = (r8.w >= 0.0 ? r2 : r0);			// partial precision
    r2.w = (r7.w * IN.texcoord_3.z) + r0.w;			// partial precision
    r8.w = r7.w * IN.texcoord_3.z;			// partial precision
    r7.w = 3 - r9.w;
    r0.xyzw = (r7.w >= 0.0 ? r2 : r0);			// partial precision
    r2.w = (r6.w * IN.texcoord_4.z) + r0.w;			// partial precision
    r7.w = r6.w * IN.texcoord_4.z;			// partial precision
    r6.w = 4 - r9.w;
    r0.xyzw = (r6.w >= 0.0 ? r2 : r0);			// partial precision
    r2.w = (r5.w * IN.texcoord_5.z) + r0.w;			// partial precision
    r6.w = r5.w * IN.texcoord_5.z;			// partial precision
    r5.w = 5 - r9.w;
    r0.xyzw = (r5.w >= 0.0 ? r2 : r0);			// partial precision
    r2.w = (r4.w * IN.texcoord_6.z) + r0.w;			// partial precision
    r5.w = 6 - r9.w;
    r0.xyzw = (r5.w >= 0.0 ? r2 : r0);			// partial precision
    r2.w = (r3.w * IN.texcoord_7.z) + r0.w;			// partial precision
    r2.xyz = lerp(r7, r0, r8.w);			// partial precision
    r2.xyz = lerp(r6, r0, r7.w);			// partial precision
    r2.xyz = lerp(r5, r0, r6.w);			// partial precision
    r5.w = r3.w * IN.texcoord_7.z;			// partial precision
    r6.w = r4.w * IN.texcoord_6.z;			// partial precision
    r4.w = 7 - r9.w;
    r0.xyzw = (r4.w >= 0.0 ? r2 : r0);			// partial precision
    r0.w = saturate(r0.w);			// partial precision
    OUT.color_0.rgba = r0.xyzw;			// partial precision
    r2.xyz = lerp(r4, r0, r6.w);			// partial precision
    r2.xyz = lerp(r3, r0, r5.w);			// partial precision

    return OUT;
};

// approximately 78 instruction slots used (8 texture, 70 arithmetic)
