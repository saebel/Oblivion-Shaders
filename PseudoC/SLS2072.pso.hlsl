    const int4 const_0 = {2, -1, 0, 0};
    float2 texcoord_0 : TEXCOORD0;			// partial precision
    float2 texcoord_1 : TEXCOORD1;			// partial precision
    float3 texcoord_2 : TEXCOORD2_centroid;			// partial precision
    float3 texcoord_3 : TEXCOORD3_centroid;			// partial precision
    float4 IN.color_0 : COLOR0;
    float4 IN.color_1 : COLOR1;
    sampler2D texture_0;
    sampler2D texture_1;
    r0 = tex2D(texture_1, IN.texcoord_1);			// partial precision
    r1 = tex2D(texture_0, IN.texcoord_0);			// partial precision
    r0.xyz = (const_0.x * r0) + const_0.y;			// partial precision
    r2.xyz = normalize(r0);			// partial precision
    r0.xyz = (IN.texcoord_3 * const_0.x) + const_0.y;			// partial precision
    r0.x = saturate(dot(r0, r2));			// partial precision
    r0.xyz = r0.x * const_2;			// partial precision
    r0.xyz = r1 * r0;			// partial precision
    r0.xyz = r0 * IN.texcoord_2;			// partial precision
    r1.x = dot(const_3, IN.color_0);			// partial precision
    r1.y = dot(const_4, IN.color_1);			// partial precision
    r1.x = r1.x + r1.y;			// partial precision
    r1.x = (r1.x * const_0.x) + r1.w;			// partial precision
    r0.w = saturate(r1.x + const_0.y);			// partial precision
    OUT.color_0 = r0;			// partial precision

// approximately 17 instruction slots used (2 texture, 15 arithmetic)
